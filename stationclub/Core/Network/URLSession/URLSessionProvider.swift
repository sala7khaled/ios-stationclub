//
//  URLSessionProvider.swift
//  stationclub
//
//  Created by Salah Khaled on 01/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import UIKit
import SystemConfiguration

let NETWORK = URLSessionProvider.shared

class URLSessionProvider: URLSessionProviderProtocol {
    
    static var shared = URLSessionProvider()
    
    var session: URLSessionProtocol
    let REQUEST_TIME = 80.00
    var online = false
    let imageCache = NSCache<NSString, UIImage>()
    
    // MARK: Initialization
    
    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    // MARK: URL Cache Policy
    
    func urlCachePolicy(_ isCache: Bool) -> URLRequest.CachePolicy {
        online = ReachabilityManager.isOnline()
        return isCache ? (online ? .reloadIgnoringCacheData : .returnCacheDataDontLoad) : .reloadIgnoringCacheData
    }
    
    // MARK: General Function For Request
    
    func request<T>(type: T.Type?, service: ServiceProtocol, completion: @escaping (APIResponse<T>) -> ()) where T: Decodable {
        let request = URLRequest(service: service, cachePolicy: urlCachePolicy(service.method == .GET ? true : false), timeoutInterval: REQUEST_TIME)
        
        var task: URLSessionDataTask? = nil
        task = session.dataTask(request: request, completionHandler: { data, response, error in
            let httpResponse = response as? HTTPURLResponse
            
            #if DEBUG
            self.info(task!, request.httpBody, data, response, error)
            #endif
            
            self.handleResponse(data: data, response: httpResponse, error: error, completion: completion)
        })
        task?.resume()
    }
    
    // MARK: Image Loading
    
    func loadImage(from url: String?, completion: @escaping (UIImage?) -> ()) {
        guard let url = url else {
            completion(UIImage(named: Images.placeHolder))
            return
        }
        let cacheKey = NSString(string: url)
        if let image = imageCache.object(forKey: cacheKey) {
            completion(image)
        } else {
            guard let url = URL(string: url) else {
                completion(UIImage(named: Images.placeHolder))
                return
            }
            let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                guard let self = self,
                      error == nil,
                      let data = data,
                      let response = response as? HTTPURLResponse,
                      (200...299).contains(response.statusCode),
                      let image = UIImage(data: data) else {
                    completion(UIImage(named: Images.placeHolderError))
                    return
                }
                
                self.imageCache.setObject(image, forKey: cacheKey)
                completion(image)
            }
            task.resume()
        }
    }
    
    // MARK: General Function To Handle The Response
    
    func handleResponse<T: Decodable>(data: Data?, response: HTTPURLResponse?, error: Error?, completion: (APIResponse<T>) -> ()) {
        guard error == nil else {
            let apiError = APIError(type: online ? .server : .network, message: online ? "server_error".l() : "no_internet_connection".l())
            Console.logError(apiError.type)
            return completion(.onFailure(apiError))
        }
        
        guard let response = response, let apiData = data else {
            let apiError = APIError(type: .noData, message: "no_response_found".l())
            Console.logError(apiError.type)
            return completion(.onFailure(apiError))
        }
        
        switch response.statusCode {
        case 200...299:
            guard let result = try? JSONDecoder().decode(T.self, from: apiData) else {
                let apiError = APIError(type: .parsing, message: "parsing_error".l())
                Console.logError(apiError.type)
                return completion(.onFailure(apiError))
            }
            completion(.onSuccess(result))
        case 401:
            unauthenticate()
            let apiError = APIError(type: .known, code: response.statusCode, message: "session_expired".l())
            Console.logError(apiError.type)
            completion(.onFailure(apiError))
        default:
            guard let fail = try? JSONDecoder().decode(Fail.self, from: apiData) else {
                let apiError = APIError(type: .known, code: response.statusCode, message: "something_went_worng".l())
                Console.logError(apiError.type)
                return completion(.onFailure(apiError))
            }
            let apiError = APIError(type: .known, code: response.statusCode, message: fail.message)
            Console.logError(apiError.type)
            completion(.onFailure(apiError))
        }
    }
    
    // MARK: General Function To Log API Info
    
    func info(_ task: URLSessionDataTask, _ body: Any?, _ data: Data?, _ response: URLResponse?, _ error: Error?) {
        let url: String = task.originalRequest?.url?.absoluteString ?? ""
        let headers: [String: String] = task.originalRequest?.allHTTPHeaderFields ?? [:]
        let statusCode: Int = (task.response as? HTTPURLResponse)?.statusCode ?? 0
        let response: String = String(data: data ?? Data(), encoding: .utf8) ?? ""
        Console.logAPI(url, headers, body as Any, statusCode, response, error)
    }
    
    // MARK: Unauthenticate User
    
    func unauthenticate() {
        DispatchQueue.main.async {
            UsersRepo().logOut()
            RootRouter.resetApp()
        }
    }
    
}

