//
//  CharacterListRepositoryImpl.swift
//  MarvelCharacters
//
//  Created by Ketan Parmar on 18/10/22.
//

import Foundation

class CharacterListRepositoryImpl: CharacterListRepository {
    let dataSource: CharacterListDataSourceProtocol
    
    init(dataSource: CharacterListDataSourceProtocol = CharacterListDataSource()) {
        self.dataSource = dataSource
    }
    
    func getCharacterList() async throws -> CharacterListModel? {
        let queryParameters = QueryParameters.getCommonQueryParameters()
        let request = try RequestBuilder(baseURL: APIConfiguration.baseURL)
            .build(path: APIConfiguration.Paths.characterList, method: .get, body: nil, extraHeaders: nil, queryParams: queryParameters)
        return try await dataSource.getCharacterList(request: request)
    }
}
