//
//  CharacterDetailsDTO.swift
//  MarvelCharacters
//
//  Created by Ketan Parmar on 21/10/22.
//

import Foundation

struct CharacterDetailsDTO: Codable {
    let code: Int?
    let status, copyright, attributionText, attributionHTML: String?
    let etag: String?
    let data: CharacterData?
}

extension CharacterDetailsDTO: DomainModelable {
    func toDomainModel() -> CharacterDetailsModel? {
        guard let results = self.data?.results, results.count > 0 else {
            return nil
        }
        let result = results[0]
        var fullPath: String? = nil
        if let path = result.thumbnail?.path, let thumbnailExtension = result.thumbnail?.thumbnailExtension {
            fullPath = path + "." + thumbnailExtension
        }
        let thumbnailModel = ThumbnailModel(path: fullPath)
        let urls = result.urls?.map { urlResult -> URLModel in
            return URLModel(type: urlResult.type, url: urlResult.url)
        }
        
        return CharacterDetailsModel(id: result.id, name: result.name, characterDescription: result.resultDescription, thumbnail: thumbnailModel, urls: urls)
    }
}
