//
//  CharacterListUseCase.swift
//  MarvelCharacters
//
//  Created by Ketan Parmar on 20/10/22.
//

import Foundation

struct CharacterListUseCase: UseCase {
    var repository: CharacterListRepository = CharacterListRepositoryImpl()
    
    func run(parameters: Void) async throws -> CharacterListModel? {
        return try await repository.getCharacterList()
    }
}
