//
//  CharacterDetailsModel.swift
//  MarvelCharacters
//
//  Created by Ketan Parmar on 21/10/22.
//

import Foundation

struct CharacterDetailsModel: Equatable {
    let id: Int?
    let name, characterDescription: String?
    let thumbnail: ThumbnailModel?
    let urls: [URLModel]?
}

struct URLModel: Equatable {
    let type: String?
    let url: String?
}
