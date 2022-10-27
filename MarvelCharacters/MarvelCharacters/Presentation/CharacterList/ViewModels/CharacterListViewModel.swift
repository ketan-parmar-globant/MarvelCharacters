//
//  CharacterListViewModel.swift
//  MarvelCharacters
//
//  Created by Ketan Parmar on 20/10/22.
//

import Foundation

final class CharacterListViewModel {
    weak var coordinatorDelegate: CharacterListViewModelCoordinatorDelegate?
    weak var viewDelegate: CharacterListViewModelViewDelegate?
    
    private let useCase: CharacterListUseCase
    private(set) var characterList: [ResultModel]? = nil
    var completion: ((Bool) -> Void)? = nil
    
    init(useCase: CharacterListUseCase) {
        self.useCase = useCase
    }
}

extension CharacterListViewModel: CharacterListViewModelType {
    func start() {
        getCharacterList()
    }
    
    @MainActor
    func getCharacterList()  {
        Task {
            viewDelegate?.setIndicatorTo(show: true)
            do {
                let characters = try await useCase.run(parameters: ())
                self.characterList = characters?.results
                completion?(true)
                viewDelegate?.reloadData()
            } catch let error {
                print("catch: \(error.localizedDescription)")
                completion?(false)
                viewDelegate?.showAlertViewFor(title: "Error occured!", subtitle: error.localizedDescription)
            }
            viewDelegate?.setIndicatorTo(show: false)
        }
    }
    
    @discardableResult
    func loadCharacterDetailsScreen(index: Int) -> Bool {
        if let character = characterList?[index], let characterId = character.id, let characterName = character.name {
            coordinatorDelegate?.loadCharacterDetailsScreen(characterId: characterId, characterName: characterName)
            return true
        }
        return false
    }
}
