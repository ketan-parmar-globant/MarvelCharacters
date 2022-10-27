//
//  MockCharacterDetailsRepository.swift
//  MarvelCharactersTests
//
//  Created by Ketan Parmar on 23/10/22.
//

import Foundation
@testable import MarvelCharacters

struct MockCharacterDetailsRepository: CharacterDetailsRepository {
    var result: CharacterDetailsModel?
    
    init(result: CharacterDetailsModel?) {
        self.result = result
    }
    
    func getCharacterDetails(parameters: CharacterDetailsRequestModel) async throws -> CharacterDetailsModel? {
        guard let result = result else {
            throw ErrorResult.custom(string: "error")
        }
        return result
    }
}
