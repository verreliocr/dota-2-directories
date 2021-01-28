//
//  HandleError.swift
//  Dota 2 Directories
//
//  Created by Verrelio C. Rizky on 28/01/21.
//

import Foundation

enum ErrorType {
    case noConnection
    case serverError(Data?)
}

struct HandleError: LocalizedError, CustomStringConvertible {
    let desc: String
    
    var errorDescription: String? {
        return desc
    }

    var description: String {
        let format = NSLocalizedString(desc, comment: "")
        return String.localizedStringWithFormat(format, desc)
    }

    var failureReason: String? {
        return desc
    }
    
    var helpAnchor: String? = ""
}
