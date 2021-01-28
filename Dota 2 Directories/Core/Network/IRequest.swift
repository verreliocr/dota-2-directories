//
//  IRequest.swift
//  Dota 2 Directories
//
//  Created by Verrelio C. Rizky on 28/01/21.
//

import Foundation

protocol IRequest {
    func call(_ endPoint: EndPoint, bodyParams: [String: Any], completion: @escaping (Data?, ErrorType?) -> Void)
}
