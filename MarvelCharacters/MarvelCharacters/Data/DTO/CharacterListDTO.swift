//
//  CharacterListDTO.swift
//  MarvelCharacters
//
//  Created by Ketan Parmar on 17/10/22.
//

import Foundation

struct CharacterListDTO: Codable {
    let code: Int?
    let status, copyright, attributionText, attributionHTML: String?
    let etag: String?
    let data: CharacterData?
}

struct CharacterData: Codable {
    let offset, limit, total, count: Int?
    let results: [Result]?
}

struct Result: Codable {
    let id: Int?
    let name, resultDescription: String?
    let modified: String?
    let thumbnail: Thumbnail?
    let resourceURI: String?
    let comics, series: Comics?
    let stories: Stories?
    let events: Comics?
    let urls: [URLElement]?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case resultDescription = "description"
        case modified, thumbnail, resourceURI, comics, series, stories, events, urls
    }
}

struct Comics: Codable {
    let available: Int?
    let collectionURI: String?
    let items: [ComicsItem]?
    let returned: Int?
}

struct ComicsItem: Codable {
    let resourceURI: String?
    let name: String?
}

struct Stories: Codable {
    let available: Int?
    let collectionURI: String?
    let items: [StoriesItem]?
    let returned: Int?
}

struct StoriesItem: Codable {
    let resourceURI: String?
    let name: String?
    let type: String?
}

struct Thumbnail: Codable {
    let path: String?
    let thumbnailExtension: String?
    
    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

struct URLElement: Codable {
    let type: String?
    let url: String?
}

extension CharacterListDTO: DomainModelable {
    func toDomainModel() -> CharacterListModel? {
        let results = self.data?.results?.map { characterResult -> ResultModel in
            var fullPath: String? = nil
            if let path = characterResult.thumbnail?.path, let thumbnailExtension = characterResult.thumbnail?.thumbnailExtension {
                fullPath = path + "." + thumbnailExtension
            }
            let thumbnailModel = ThumbnailModel(path: fullPath)
            return ResultModel(id: characterResult.id, name: characterResult.name, characterDescription: characterResult.resultDescription, thumbnail: thumbnailModel)
        }
        return CharacterListModel(results: results)
    }
}
