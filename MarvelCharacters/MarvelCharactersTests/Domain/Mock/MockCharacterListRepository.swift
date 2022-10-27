//
//  MockCharacterListRepository.swift
//  MarvelCharactersTests
//
//  Created by Ketan Parmar on 22/10/22.
//

import Foundation
@testable import MarvelCharacters

struct MockCharacterListRepository: CharacterListRepository {
    var result: CharacterListModel?
    
    init(result: CharacterListModel?) {
        self.result = result
    }
    
    func getCharacterList() async throws -> CharacterListModel? {
        guard let result = result else {
            throw ErrorResult.custom(string: "error")
        }
        return result
    }
}
