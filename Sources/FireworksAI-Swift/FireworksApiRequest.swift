//
//  FireworksApiRequest.swift
//  FireworksAI
//
//  Created by Joshua Levine on 3/29/25.
//

import Foundation

public protocol FireworksApiRequest: Codable {
    associatedtype Response: Codable, Sendable
    
    var path: String { get }
    var method: String { get }
    var queryItems: [URLQueryItem]? { get }
}

extension FireworksApiRequest {
    public var queryItems: [URLQueryItem]? {
        return nil
    }
}
