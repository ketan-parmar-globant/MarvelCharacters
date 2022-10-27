//
//  AppConfiguration.swift
//  MarvelCharacters
//
//  Created by Ketan Parmar on 20/10/22.
//

import Foundation

struct APIConfiguration {
    private static let buildEnvironment: DevelopmentEnvironment = {
#if DEBUG
        return .staging
#else
        return .production
#endif
    }()
    
    private static var baseURLString: String {
        get {
            switch APIConfiguration.buildEnvironment {
            case .production:
                return "https://gateway.marvel.com:443/v1/public"
            case .staging:
                return "https://gateway.marvel.com:443/v1/public"
            }
        }
    }
    
    static var baseURL = URL(string: baseURLString)!
    
    private init() {
        
    }
}

extension APIConfiguration {
    struct Paths {
        static let characterList = "/characters"
        static func characterDetails(characterId: String) -> String {
            return "/characters/" + characterId
        }
    }
}

enum DevelopmentEnvironment: String {
    case production = "Production"
    case staging = "Staging"
}
