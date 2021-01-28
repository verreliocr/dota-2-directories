//
//  EndPoint.swift
//  Dota 2 Directories
//
//  Created by Verrelio C. Rizky on 28/01/21.
//

import Foundation

private let baseURL = "https://api.opendota.com"

enum EndPoint {
    case getListHeroes
    
    var method: HTTPMethod {
        switch self {
        default:
            return .GET
        }
    }
    
    var url: String {
        var path = ""
        switch self {
        case .getListHeroes:
            path = "/api/herostats"
        }
        print(baseURL + path)
        return baseURL + path
    }
}
