//
//  CryptographyManager.swift
//  MarvelCharacters
//
//  Created by Ketan Parmar on 19/10/22.
//

import Foundation
import CryptoKit

struct CryptographyManager {
    static func md5(string: String) -> String {
        let digest = Insecure.MD5.hash(data: string.data(using: .utf8) ?? Data())
        return digest.map {
            String(format: "%02hhx", $0)
        }.joined()
    }
    
    static var timeStamp: String {
        return String(Date().timeIntervalSince1970)
    }
    
    
    static var privateKey: String {
        return String(bytes: ApiKeys.obfuscatedPrivateKey.deobfuscated,
                      encoding: .utf8)!
    }
    
    static var publicKey: String {
        return String(bytes: ApiKeys.obfuscatedPublicKey.deobfuscated,
                      encoding: .utf8)!
    }
}

extension Array where Element == UInt8 {
    var deobfuscated: [UInt8] {
        let a = prefix(count / 2)
        let b = suffix(count / 2)
        return zip(a, b).map(^)
    }
}
