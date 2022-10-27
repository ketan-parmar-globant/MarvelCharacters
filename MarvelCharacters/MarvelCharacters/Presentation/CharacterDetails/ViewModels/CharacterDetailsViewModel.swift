//
//  CharacterDetailsViewModel.swift
//  MarvelCharacters
//
//  Created by Ketan Parmar on 21/10/22.
//

import Foundation

class CharacterDetailsViewModel {
    weak var coordinatorDelegate: CharacterDetailsViewModelCoordinatorDelegate?
    weak var viewDelegate: CharacterDetailsViewModelViewDelegate?
    
    let characterName: String
    private let useCase: CharacterDetailsUseCase
    private let characterId: Int
    private(set) var characterDetails: CharacterDetailsModel?
    private(set) var characterImageUrl: String?
    private(set) var characterDescription: String = ""
    private(set) var urls: [URLModel]? = []
    var completion: ((Bool) -> Void)? = nil
    
    init(useCase: CharacterDetailsUseCase, characterId: Int, characterName: String) {
        self.useCase = useCase
        self.characterId = characterId
        self.characterName = characterName
    }
}

extension CharacterDetailsViewModel: CharacterDetailsViewModelType {
    func start() {
        getCharacterDetails()
    }
    
    @MainActor
    func getCharacterDetails() {
        Task {
            viewDelegate?.setIndicatorTo(show: true)
            do {
                let characterDetails = try await useCase.run(parameters: CharacterDetailsRequestModel(characterId: String(characterId)))
                setData(characterDetails: characterDetails)
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
    
    func setData(characterDetails: CharacterDetailsModel?) {
        self.characterDetails = characterDetails
        self.characterImageUrl = characterDetails?.thumbnail?.path
        if let characterDescription = characterDetails?.characterDescription, characterDescription != "" {
            self.characterDescription = characterDescription
        } else {
            self.characterDescription = "No description available"
        }
        urls = characterDetails?.urls
    }
}
