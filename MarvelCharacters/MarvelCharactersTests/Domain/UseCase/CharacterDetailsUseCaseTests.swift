//
//  CharacterDetailsUseCaseTests.swift
//  MarvelCharactersTests
//
//  Created by Ketan Parmar on 23/10/22.
//

import XCTest
@testable import MarvelCharacters

class CharacterDetailsUseCaseTests: XCTestCase {
    func testUseCaseRun_WhenCorrectResultProvided_ShouldReturnModel() async throws {
        let repository = MockCharacterDetailsRepository(result: CharacterDetailsModel(id: 0, name: "test", characterDescription: "", thumbnail: nil, urls: nil))
        let sut = CharacterDetailsUseCase(repository: repository)
        let result = try await sut.run(parameters: CharacterDetailsRequestModel(characterId: ""))
        XCTAssertNotNil(result)
        XCTAssertEqual(result?.name, "test")
    }

    func testUseCaseRun_WhenIncorrectResultProvided_ShouldThrowError() async throws {
        let repository = MockCharacterDetailsRepository(result: nil)
        let sut = CharacterDetailsUseCase(repository: repository)
        do {
            let result = try await sut.run(parameters: CharacterDetailsRequestModel(characterId: ""))
            XCTAssertNil(result)
        } catch let error {
            XCTAssertNotNil(error)
            XCTAssertEqual(error as! ErrorResult, ErrorResult.custom(string: "error"))
        }
    }
}

