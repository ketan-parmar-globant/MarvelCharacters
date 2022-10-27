//
//  CharacterListRepository.swift
//  MarvelCharacters
//
//  Created by Ketan Parmar on 18/10/22.
//

import Foundation

protocol CharacterListRepository {
    func getCharacterList() async throws -> CharacterListModel?
}
