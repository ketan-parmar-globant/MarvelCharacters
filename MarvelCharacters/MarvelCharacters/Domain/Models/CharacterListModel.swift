//
//  CharacterListModel.swift
//  MarvelCharacters
//
//  Created by Ketan Parmar on 17/10/22.
//

import Foundation

struct CharacterListModel: Equatable {
    let results: [ResultModel]?
}

struct ResultModel: Equatable {
    let id: Int?
    let name, characterDescription: String?
    let thumbnail: ThumbnailModel?
}

struct ThumbnailModel: Equatable {
    let path: String?
}
