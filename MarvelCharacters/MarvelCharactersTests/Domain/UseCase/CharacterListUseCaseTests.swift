//
//  CharacterListUseCaseTests.swift
//  MarvelCharactersTests
//
//  Created by Ketan Parmar on 22/10/22.
//

import XCTest
@testable import MarvelCharacters

class CharacterListUseCaseTests: XCTestCase {
    func testUseCaseRun_WhenCorrectResultProvided_ShouldReturnModel() async throws {
        let repository = MockCharacterListRepository(result: CharacterListModel(results: []))
        let sut = CharacterListUseCase(repository: repository)
        let result = try await sut.run(parameters: ())
        XCTAssertNotNil(result)
        XCTAssertEqual(result?.results?.count, 0)
    }

    func testUseCaseRun_WhenIncorrectResultProvided_ShouldThrowError() async throws {
        let repository = MockCharacterListRepository(result: nil)
        let sut = CharacterListUseCase(repository: repository)
        do {
            let result = try await sut.run(parameters: ())
            XCTAssertNil(result)
        } catch let error {
            XCTAssertNotNil(error)
            XCTAssertEqual(error as! ErrorResult, ErrorResult.custom(string: "error"))
        }
    }
}
