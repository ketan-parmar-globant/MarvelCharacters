//
//  CharacterDetailsDataSource.swift
//  MarvelCharacters
//
//  Created by Ketan Parmar on 21/10/22.
//

import Foundation

protocol CharacterDetailsDataSourceProtocol {
    func getCharacterDetails(request: URLRequest) async throws -> CharacterDetailsModel?
}

class CharacterDetailsDataSource: CharacterDetailsDataSourceProtocol {
    let client: APIClient
    
    init(client: APIClient = APIClientImpl()) {
        self.client = client
    }
    
    func getCharacterDetails(request: URLRequest) async throws -> CharacterDetailsModel? {
        let (data, error) = try await client.execute(request: request, responseType: CharacterDetailsDTO.self)
        if let error = error {
            throw error
        }
        return data?.toDomainModel()
    }
}

