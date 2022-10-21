//
//  CharacterListViewModelType.swift
//  MarvelCharacters
//
//  Created by Ketan Parmar on 20/10/22.
//

protocol CharacterListViewModelType {
    var viewDelegate: CharacterListViewModelViewDelegate? { get set }
    @MainActor func start()
}

protocol CharacterListViewModelCoordinatorDelegate: AnyObject {
    func loadCharacterDetailsScreen(characterId: Int, characterName: String)
}

protocol CharacterListViewModelViewDelegate: AnyObject {
    func setInitialState()
    func setIndicatorTo(show: Bool)
    func showAlertViewFor(title: String, subtitle: String?)
    func reloadData()
}

