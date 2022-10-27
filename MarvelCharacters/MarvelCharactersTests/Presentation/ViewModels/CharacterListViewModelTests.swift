//
//  CharacterListViewModelTests.swift
//  MarvelCharactersTests
//
//  Created by Ketan Parmar on 25/10/22.
//

import XCTest
@testable import MarvelCharacters

class CharacterListViewModelTests: XCTestCase {
    @MainActor
    func testGetCharacterList_WhenCorrectDataProvided_ShouldReturnSuccess() {
        let useCase = CharacterListUseCase(repository: MockCharacterListRepository(result: MockCharacterListResponse.model))
        let sut = CharacterListViewModel(useCase: useCase)
        sut.getCharacterList()
        let expectation = self.expectation(description: "")
        sut.completion = { isSuccess in
            expectation.fulfill()
            XCTAssertTrue(isSuccess)
        }
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    @MainActor
    func testGetCharacterList_WhenIncorrectDataProvided_ShouldReturnFailure() {
        let useCase = CharacterListUseCase(repository: MockCharacterListRepository(result: nil))
        let sut = CharacterListViewModel(useCase: useCase)
        sut.getCharacterList()
        let expectation = self.expectation(description: "")
        sut.completion = { isSuccess in
            expectation.fulfill()
            XCTAssertFalse(isSuccess)
        }
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    @MainActor
    func testLoadCharacterDetailsScreen_WhenCorrectDataProvided_ShouldReturnTrue() {
        let useCase = CharacterListUseCase(repository: MockCharacterListRepository(result: MockCharacterListResponse.model))
        let sut = CharacterListViewModel(useCase: useCase)
        sut.getCharacterList()
        let expectation = self.expectation(description: "")
        sut.completion = { isSuccess in
            expectation.fulfill()
            let result = sut.loadCharacterDetailsScreen(index: 0)
            XCTAssertTrue(result)
        }
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    @MainActor
    func testLoadCharacterDetailsScreen_WhenIncorrectDataProvided_ShouldReturnFalse() {
        let useCase = CharacterListUseCase(repository: MockCharacterListRepository(result: nil))
        let sut = CharacterListViewModel(useCase: useCase)
        sut.getCharacterList()
        let expectation = self.expectation(description: "")
        sut.completion = { isSuccess in
            expectation.fulfill()
            let result = sut.loadCharacterDetailsScreen(index: 0)
            XCTAssertFalse(result)
        }
        waitForExpectations(timeout: 1, handler: nil)
    }
}
