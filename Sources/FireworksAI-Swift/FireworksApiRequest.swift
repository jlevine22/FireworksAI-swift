//
//  FireworksApiRequest.swift
//  FireworksAI
//
//  Created by Joshua Levine on 3/29/25.
//

public protocol FireworksApiRequest: Codable {
    associatedtype Response: Codable, Sendable
    
    var path: String { get }
    var method: String { get }
}
