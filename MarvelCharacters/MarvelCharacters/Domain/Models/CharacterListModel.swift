//
//  CharacterListModel.swift
//  MarvelCharacters
//
//  Created by Ketan Parmar on 17/10/22.
//

import Foundation

struct CharacterListModel {
    let results: [ResultModel]?
}

struct ResultModel {
    let id: Int?
    let name, characterDescription: String?
    let thumbnail: ThumbnailModel?
}

struct ThumbnailModel {
    let path: String?
}
