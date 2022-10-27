//
//  CharacterListModelTests.swift
//  MarvelCharactersTests
//
//  Created by Ketan Parmar on 25/10/22.
//

import XCTest
@testable import MarvelCharacters

class CharacterListModelTests: XCTestCase {
    func testCharacterListModel_WhenSameDataProvided_BothModelShouldBeEqual() throws {
        let characterListResponseModel = MockCharacterListResponse.dto.toDomainModel()
        let anotherCharacterListResponseModel = MockCharacterListResponse.model
        XCTAssertEqual(characterListResponseModel, anotherCharacterListResponseModel)
    }
    
    func testCharacterListModel_WhenDifferentDataProvided_BothModelShouldNotBeEqual() throws {
        let characterListResponseModel = MockCharacterListResponse.model
        let anotherCharacterListResponseModel = CharacterListModel(results: nil)
        XCTAssertNotEqual(characterListResponseModel, anotherCharacterListResponseModel)
    }
}
