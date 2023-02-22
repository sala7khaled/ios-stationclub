//
//  Console.swift
//  stationclub
//
//  Created by Salah Khaled on 30/07/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

import Foundation

open class Console {
    
    static func logAPI(_ url: String, _ headers: [String:String], _ body: Any, _ statusCode: Int, _ response: String, _ error: Error?) {
        log("\n-------------------- API Calling Start", "--------------------")
        log("\n🌐 Url", url)
        log("\n🧩 Headers", headers)
        log("\n📦 Body", body)
        log("\n#️⃣ Status code", statusCode)
        log("\n📥 Response", response)
        switch statusCode {
        case 200...299:
            log("\n🏁 State: \(url.replacingOccurrences(of: API.baseUrl, with: ""))", "✅ Success")
            break
        default:
            log("\n🚩 State: \(url.replacingOccurrences(of: API.baseUrl, with: ""))", "❌ Error: \(String(describing: error)) ⏹")
            break
        }
        log("\n--------------------- API Calling End", "---------------------\n")
    }

    static func logError(_ type: APIErrorType) {
        Console.log("❌ Error", "\(type)")
    }
    
    static func log(_ tag: String, _ text: Any) {
        #if DEBUG
        print("\(tag): \(text)")
        #endif
    }
}

