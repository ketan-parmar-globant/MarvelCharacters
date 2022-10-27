//
//  UseCase.swift
//  MarvelCharacters
//
//  Created by Ketan Parmar on 20/10/22.
//

import Foundation

protocol UseCase {
    associatedtype Input
    associatedtype Output
    func run(parameters: Input) async throws -> Output
}
