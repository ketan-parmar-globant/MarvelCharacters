//
//  CharacterListRepositoryTests.swift
//  MarvelCharactersTests
//
//  Created by Ketan Parmar on 22/10/22.
//

import XCTest
@testable import MarvelCharacters

class CharacterListRepositoryTests: XCTestCase {
    func testGetCharacterList_WhenCorrectResultProvided_ShouldReturnModel() async throws {
        let dataSource = MockCharacterListDataSource(result: CharacterListModel(results: []))
        let sut = CharacterListRepositoryImpl(dataSource: dataSource)
        let result = try await sut.getCharacterList()
        XCTAssertNotNil(result)
    }
    
    func testGetCharacterList_WhenIncorrectResultProvided_ShouldThrowError() async throws {
        let dataSource = MockCharacterListDataSource(result: nil)
        let sut = CharacterListRepositoryImpl(dataSource: dataSource)
        do {
            let result = try await sut.getCharacterList()
            XCTAssertNil(result)
        } catch let error {
            XCTAssertNotNil(error)
            XCTAssertEqual(error as! ErrorResult, ErrorResult.custom(string: "error"))
        }
    }
}
