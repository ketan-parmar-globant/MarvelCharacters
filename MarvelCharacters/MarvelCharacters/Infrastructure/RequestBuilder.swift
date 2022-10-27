//
//  RequestBuilder.swift
//  MarvelCharacters
//
//  Created by Ketan Parmar on 18/10/22.
//

import Foundation

protocol RequestBuilderProtocol {
    func build(path: String, method: String, body: Data?, extraHeaders: [String: String]?, queryParams: [String: String?]?) throws -> URLRequest
    func build(path: String, method: HTTPMethod, body: Data?, extraHeaders: [String: String]?, queryParams: [String: String?]?) throws -> URLRequest
}

extension RequestBuilderProtocol {
    func build(path: String, method: String = "GET", body: Data? = nil, extraHeaders: [String: String]? = nil, queryParams: [String: String?]? = nil) throws -> URLRequest {
        try build(path: path, method: method, body: body, extraHeaders: extraHeaders, queryParams: queryParams)
    }
    
    func build(path: String, method: HTTPMethod, body: Data? = nil, extraHeaders: [String: String]? = nil, queryParams: [String: String?]? = nil) throws -> URLRequest {
        try build(path: path, method: method.rawValue, body: body, extraHeaders: extraHeaders, queryParams: queryParams)
    }
}

final class RequestBuilder: RequestBuilderProtocol {
    let baseURL: URL
    
    init(baseURL: URL) {
        self.baseURL = baseURL
    }
    
    func build(path: String, method: String, body: Data?, extraHeaders: [String : String]?, queryParams: [String : String?]?) throws -> URLRequest {
        var urlComponents = URLComponents(url: baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = queryParams?.map { key, value in
            URLQueryItem(name: key, value: value)
        }
        guard let url = urlComponents?.url else { throw ErrorResult.requestBuilder(string: "Error while building request") }
        var request = URLRequest(url: url)
        request.httpBody = body
        request.httpMethod = method
        request.allHTTPHeaderFields = extraHeaders
        return request
    }
    
    func build(path: String, method: HTTPMethod, body: Data?, extraHeaders: [String : String]?, queryParams: [String : String?]?) throws -> URLRequest {
        try build(path: path, method: method.rawValue, body: body, extraHeaders: extraHeaders, queryParams: queryParams)
    }
}
