//
//  EmbeddingsRequest.swift
//  FireworksAI
//
//  Created by Joshua Levine on 3/29/25.
//

import Foundation

public struct EmbeddingsRequest: Codable, FireworksApiRequest {
    public var path: String { "infercnece/v1/embeddings" }
    public var method: String { "POST" }
    
    public var input: String
    public var model: String
    public var dimensions: Int
    
    public init(input: String, model: String, dimensions: Int) {
        self.input = input
        self.model = model
        self.dimensions = dimensions
    }
}

extension EmbeddingsRequest {
    public struct Response: Codable, Sendable {
        public var data: [Embedding]
        public var model: String
        public var object: String
        public var usage: Usage
    }
    
    public struct Embedding: Codable, Sendable {
        public var index: Int
        public var embedding: [Double]
        public var object: String
    }
    
    public struct Usage: Codable, Sendable {
        public var prompt_tokens: Int
        public var total_tokens: Int
    }
}
