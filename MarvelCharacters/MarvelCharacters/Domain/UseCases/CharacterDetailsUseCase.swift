//
//  CharacterDetailsUseCase.swift
//  MarvelCharacters
//
//  Created by Ketan Parmar on 21/10/22.
//

import Foundation

struct CharacterDetailsUseCase: UseCase {
    var repository: CharacterDetailsRepository = CharacterDetailsRepositoryImpl()
    
    func run(parameters: CharacterDetailsRequestModel) async throws -> CharacterDetailsModel? {
        return try await repository.getCharacterDetails(parameters: parameters)
    }
}
