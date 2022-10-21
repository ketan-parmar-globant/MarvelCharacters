//
//  CharacterDetailsViewModelType.swift
//  MarvelCharacters
//
//  Created by Ketan Parmar on 21/10/22.
//

import Foundation

protocol CharacterDetailsViewModelType {
    var viewDelegate: CharacterDetailsViewModelViewDelegate? { get set }
    @MainActor func start()
}

protocol CharacterDetailsViewModelCoordinatorDelegate: AnyObject {
}

protocol CharacterDetailsViewModelViewDelegate: AnyObject {
    func setInitialState()
    func setIndicatorTo(show: Bool)
    func showAlertViewFor(title: String, subtitle: String?)
    func reloadData()
}

