//
//  CharacterDetailsRepositoryImpl.swift
//  MarvelCharacters
//
//  Created by Ketan Parmar on 21/10/22.
//

import Foundation

class CharacterDetailsRepositoryImpl: CharacterDetailsRepository {
    let dataSource: CharacterDetailsDataSourceProtocol
    
    init(dataSource: CharacterDetailsDataSourceProtocol = CharacterDetailsDataSource()) {
        self.dataSource = dataSource
    }
    
    func getCharacterDetails(parameters: CharacterDetailsRequestModel) async throws -> CharacterDetailsModel? {
        let queryParameters = QueryParameters.getCommonQueryParameters()
        let request = try RequestBuilder(baseURL: APIConfiguration.baseURL)
            .build(path: APIConfiguration.Paths.characterDetails(characterId: parameters.characterId), method: .get, body: nil, extraHeaders: nil, queryParams: queryParameters)
        return try await dataSource.getCharacterDetails(request: request)
    }
}

