//
//  RequestCommonQueryParameters.swift
//  MarvelCharacters
//
//  Created by Ketan Parmar on 18/10/22.
//

import Foundation

struct QueryParameters {
    static func getCommonQueryParameters() -> [String : String] {
        let ts = CryptographyManager.timeStamp
        let publicKey = CryptographyManager.publicKey
        let privateKey = CryptographyManager.privateKey
        return ["apikey": publicKey, "ts": ts, "hash": CryptographyManager.md5(string: ts + privateKey + publicKey )]
    }
}
