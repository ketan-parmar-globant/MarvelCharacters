//
//  MockCharacterDetailsDataSource.swift
//  MarvelCharactersTests
//
//  Created by Ketan Parmar on 22/10/22.
//

import Foundation
@testable import MarvelCharacters

struct MockCharacterDetailsDataSource: CharacterDetailsDataSourceProtocol {
    var result: CharacterDetailsModel?
    
    init(result: CharacterDetailsModel?) {
        self.result = result
    }
    
    func getCharacterDetails(request: URLRequest) async throws -> CharacterDetailsModel? {
        guard let result = result else {
            throw ErrorResult.custom(string: "error")
        }
        return result
    }
}

