//
//  CharacterDetailsRepositoryTests.swift
//  MarvelCharactersTests
//
//  Created by Ketan Parmar on 22/10/22.
//

import XCTest
@testable import MarvelCharacters

class CharacterDetailsRepositoryTests: XCTestCase {
    func testGetCharacterDetails_WhenCorrectResultProvided_ShouldReturnModel() async throws {
        let dataSource = MockCharacterDetailsDataSource(result: CharacterDetailsModel(id: 0, name: "", characterDescription: "", thumbnail: nil, urls: []))
        let sut = CharacterDetailsRepositoryImpl(dataSource: dataSource)
        let result = try await sut.getCharacterDetails(parameters: CharacterDetailsRequestModel(characterId: ""))
        XCTAssertNotNil(result)
    }
    
    func testGetCharacterDetails_WhenIncorrectResultProvided_ShouldThrowError() async throws {
        let dataSource = MockCharacterDetailsDataSource(result: nil)
        let sut = CharacterDetailsRepositoryImpl(dataSource: dataSource)
        do {
            let result = try await sut.getCharacterDetails(parameters: CharacterDetailsRequestModel(characterId: ""))
            XCTAssertNil(result)
        } catch let error {
            XCTAssertNotNil(error)
            XCTAssertEqual(error as! ErrorResult, ErrorResult.custom(string: "error"))
        }
    }
}

