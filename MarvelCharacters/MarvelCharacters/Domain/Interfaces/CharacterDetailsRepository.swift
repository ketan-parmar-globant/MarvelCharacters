//
//  CharacterDetailsRepository.swift
//  MarvelCharacters
//
//  Created by Ketan Parmar on 21/10/22.
//

import Foundation

protocol CharacterDetailsRepository {
    func getCharacterDetails(parameters: CharacterDetailsRequestModel) async throws -> CharacterDetailsModel?
}
