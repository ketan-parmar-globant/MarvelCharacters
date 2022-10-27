//
//  CharacterListDataSource.swift
//  MarvelCharacters
//
//  Created by Ketan Parmar on 18/10/22.
//

import Foundation

protocol CharacterListDataSourceProtocol {
    func getCharacterList(request: URLRequest) async throws -> CharacterListModel?
}

class CharacterListDataSource: CharacterListDataSourceProtocol {
    let client: APIClient
    
    init(client: APIClient = APIClientImpl()) {
        self.client = client
    }
    
    func getCharacterList(request: URLRequest) async throws -> CharacterListModel? {
        let (data, error) = try await client.execute(request: request, responseType: CharacterListDTO.self)
        if let error = error {
            throw error
        }
        return data?.toDomainModel()
    }
}
