//
//  Response.swift
//  stationclub
//
//  Created by Salah Khaled on 01/08/2022.
//  Copyright © 2022 Salah Khaled. All rights reserved.
//

enum APIResponse<T> {

    case onSuccess(T)
    case onFailure(APIError)
}
