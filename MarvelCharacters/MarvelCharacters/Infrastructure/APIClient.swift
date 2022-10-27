//
//  APIClient.swift
//  MarvelCharacters
//
//  Created by Ketan Parmar on 16/10/22.
//

import Foundation

protocol APIClient {
    func execute(request: URLRequest) async throws -> (Data, URLResponse)
    func execute<Response: Decodable>(request: URLRequest, responseType: Response.Type) async throws -> (Response?, ErrorResult?)
    func exexute(request: URLRequest, completion: @escaping (Data?, Error?) -> Void)
}

final class APIClientImpl: APIClient {
    private let urlSession: URLSession
    private let jsonDecoder: JSONDecoder
    
    init(delegate: URLSessionDelegate? = nil, jsonDecoder: JSONDecoder = JSONDecoder()) {
        let configuration = URLSessionConfiguration.default
        urlSession = URLSession(configuration: configuration, delegate: delegate, delegateQueue: nil)
        self.jsonDecoder = jsonDecoder
    }
    
    func execute(request: URLRequest) async throws -> (Data, URLResponse) {
        return try await urlSession.data(for: request)
    }
    
    func execute<Response: Decodable>(request: URLRequest, responseType: Response.Type) async throws -> (Response?, ErrorResult?) {
        let (data, response) = try await execute(request: request)
        let httpUrlResponse = response as? HTTPURLResponse
        
        if httpUrlResponse?.statusCode == 200 {
            let result = try jsonDecoder.decode(responseType, from: data)
            return (result, nil)
        } else {
            guard let commonErrorData = try? jsonDecoder.decode(CommonErrorResponse.self, from: data) else {
                return (nil, .parser(string: "Unable to parse data"))
            }
            return (nil, .parser(string: commonErrorData.message ?? "Something went wrong. Please try again later!"))
        }
    }
    
    func exexute(request: URLRequest, completion: @escaping (Data?, Error?) -> Void) {
        urlSession.dataTask(with: request) { data, response, error in
            completion(data, error)
        }.resume()
    }
}
