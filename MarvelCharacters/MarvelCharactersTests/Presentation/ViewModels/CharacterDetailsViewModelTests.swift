//
//  CharacterDetailsViewModelTests.swift
//  MarvelCharactersTests
//
//  Created by Ketan Parmar on 25/10/22.
//

import XCTest
@testable import MarvelCharacters

class CharacterDetailsViewModelTests: XCTestCase {
    @MainActor
    func testGetCharacterDetails_WhenCorrectDataProvided_ShouldReturnSuccess() {
        let useCase = CharacterDetailsUseCase(repository: MockCharacterDetailsRepository(result: MockCharacterDetailsResponse.model))
        let sut = CharacterDetailsViewModel(useCase: useCase, characterId: 0, characterName: "")
        sut.getCharacterDetails()
        let expectation = self.expectation(description: "")
        sut.completion = { isSuccess in
            expectation.fulfill()
            XCTAssertTrue(isSuccess)
        }
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    @MainActor
    func testGetCharacterDetails_WhenIncorrectDataProvided_ShouldReturnFailure() {
        let useCase = CharacterDetailsUseCase(repository: MockCharacterDetailsRepository(result: nil))
        let sut = CharacterDetailsViewModel(useCase: useCase, characterId: 0, characterName: "")
        sut.getCharacterDetails()
        let expectation = self.expectation(description: "")
        sut.completion = { isSuccess in
            expectation.fulfill()
            XCTAssertFalse(isSuccess)
        }
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testSetData_WhenCorrectDataProvided_ShouldSetData() {
        let useCase = CharacterDetailsUseCase(repository: MockCharacterDetailsRepository(result: nil))
        let sut = CharacterDetailsViewModel(useCase: useCase, characterId: 0, characterName: "")
        sut.setData(characterDetails: MockCharacterDetailsResponse.model)
        XCTAssertEqual(sut.characterDetails, MockCharacterDetailsResponse.model)
        XCTAssertEqual(sut.characterDescription, "test")
        XCTAssertEqual(sut.characterImageUrl, MockCharacterDetailsResponse.model?.thumbnail?.path)
        XCTAssertEqual(sut.urls, MockCharacterDetailsResponse.model?.urls)
    }
}
