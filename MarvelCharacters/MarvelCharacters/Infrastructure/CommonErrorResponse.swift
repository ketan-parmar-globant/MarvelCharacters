//
//  CommonErrorResponse.swift
//  MarvelCharacters
//
//  Created by Ketan Parmar on 16/10/22.
//

import Foundation

struct CommonErrorResponse: Codable {
    let code, message: String?
}

enum ErrorResult: Error, Equatable {
    case network(string: String)
    case parser(string: String)
    case requestBuilder(string: String)
    case custom(string: String)
    
    func getErrorMessage() -> String {
        switch self {
        case .network(string: let string):
            return string
        case .parser(string: let string):
            return string
        case .requestBuilder(string: let string):
            return string
        case .custom(string: let string):
            return string
        }
    }
}

extension ErrorResult: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .network(string: let string):
            return NSLocalizedString(string, comment: "ErrorResult")
        case .parser(string: let string):
            return NSLocalizedString(string, comment: "ErrorResult")
        case .requestBuilder(string: let string):
            return NSLocalizedString(string, comment: "ErrorResult")
        case .custom(string: let string):
            return NSLocalizedString(string, comment: "ErrorResult")
        }
    }
}
