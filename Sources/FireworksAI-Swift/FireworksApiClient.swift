//
//  FireworksApiClient.swift
//  CapitalTracker
//
//  Created by Joshua Levine on 2/3/25.
//

import Foundation
import SwiftUI

private let BASE_URL = URL(string: "https://api.fireworks.ai/inference/v1/")!

public struct FireworksApiClient: Sendable {
    private let apiKey: String?
    private let urlSession: URLSession
    
    public init(apiKey: String?, urlSession: URLSession = .shared) {
        self.apiKey = apiKey
        self.urlSession = urlSession
    }
    
    public func request<T: FireworksApiRequest>(_ request: T) async throws -> T.Response {
        guard let apiKey else {
            throw FireworksApiClientError.missingApiKey
        }
        let url = BASE_URL.appendingPathComponent(request.path)
        var urlRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData)
        urlRequest.httpMethod = request.method
        urlRequest.allHTTPHeaderFields = [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(apiKey)"
        ]
        urlRequest.httpBody = try JSONEncoder().encode(request)
        let (data, _) = try await urlSession.data(for: urlRequest)
        return try JSONDecoder().decode(T.Response.self, from: data)
    }
}
