//
//  CharacterDetailsRequestModelTests.swift
//  MarvelCharactersTests
//
//  Created by Ketan Parmar on 25/10/22.
//

import XCTest
@testable import MarvelCharacters

class CharacterDetailsRequestModelTests: XCTestCase {
    func testCharacterDetailsRequestModel_WhenSameDataProvided_BothModelShouldBeEqual() throws {
        let characterDetailsRequestModel = gettCharacterDetailsRequestModel()
        let anotherCharacterDetailsRequestModel = gettCharacterDetailsRequestModel()
        XCTAssertEqual(characterDetailsRequestModel, anotherCharacterDetailsRequestModel)
    }
    
    func testCharacterDetailsRequestModel_WhenDifferentDataProvided_BothModelShouldNotBeEqual() throws {
        let characterDetailsRequestModel = gettCharacterDetailsRequestModel()
        let anotherCharacterDetailsRequestModel = gettCharacterDetailsRequestModel(characterId: "23456")
        XCTAssertNotEqual(characterDetailsRequestModel, anotherCharacterDetailsRequestModel)
    }
    
    private func gettCharacterDetailsRequestModel(characterId: String = "12345") -> CharacterDetailsRequestModel {
        return CharacterDetailsRequestModel(characterId: characterId)
    }
}
