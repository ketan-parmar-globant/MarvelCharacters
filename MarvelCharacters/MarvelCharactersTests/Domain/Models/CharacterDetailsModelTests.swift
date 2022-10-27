//
//  CharacterDetailsModelTests.swift
//  MarvelCharactersTests
//
//  Created by Ketan Parmar on 25/10/22.
//

import XCTest
@testable import MarvelCharacters

class CharacterDetailsModelTests: XCTestCase {
    func testCharacterDetailsModel_WhenSameDataProvided_BothModelShouldBeEqual() throws {
        let characterDetailsResponseModel = MockCharacterDetailsResponse.dto.toDomainModel()
        let anotherCharacterDetailsResponseModel = MockCharacterDetailsResponse.model
        XCTAssertEqual(characterDetailsResponseModel, anotherCharacterDetailsResponseModel)
    }
    
    func testCharacterDetailsModel_WhenDifferentDataProvided_BothModelShouldNotBeEqual() throws {
        let CharacterDetailsResponseModel = MockCharacterDetailsResponse.model
        let anotherCharacterDetailsResponseModel = CharacterDetailsModel(id: 0, name: "", characterDescription: "", thumbnail: nil, urls: [])
        XCTAssertNotEqual(CharacterDetailsResponseModel, anotherCharacterDetailsResponseModel)
    }
}
