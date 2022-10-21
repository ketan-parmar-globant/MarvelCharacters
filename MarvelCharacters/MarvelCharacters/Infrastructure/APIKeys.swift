//
//  APIKeys.swift
//  MarvelCharacters
//
//  Created by Ketan Parmar on 19/10/22.
//

import Foundation
import UIKit
import CryptoKit

struct ApiKeys {
    static let obfuscatedPublicKey: [UInt8] = RenderKeyFromConfiguration.get(key: "ApiPublicKey")
    
    static let obfuscatedPrivateKey: [UInt8] = RenderKeyFromConfiguration.get(key: "ApiPrivateKey")
}

fileprivate struct RenderKeyFromConfiguration {
    static func get(key: String) -> [UInt8] {
        guard var apiKey = Bundle.main.object(forInfoDictionaryKey: key) as? String else {
            fatalError("ApiKey must not be empty in plist")
        }
        apiKey.removeFirst()
        apiKey.removeLast()
        let array = apiKey.components(separatedBy: ", ")
        let result: [UInt8] = array.map { value in
            return UInt8(Int(value) ?? 0)
        }
        return result
    }
}
