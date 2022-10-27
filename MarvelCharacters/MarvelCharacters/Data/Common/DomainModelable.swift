//
//  DomainModelable.swift
//  MarvelCharacters
//
//  Created by Ketan Parmar on 18/10/22.
//

protocol DomainModelable {
    associatedtype DomainModel
    func toDomainModel() -> DomainModel
}
