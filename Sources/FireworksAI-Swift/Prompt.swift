//
//  FireworksAIPrompt.swift
//  CapitalTracker
//
//  Created by Joshua Levine on 2/3/25.
//

public enum Prompt: Codable {
    case string(String)
    case strings([String])
    case tokenArray([Int])
    case tokenArrays([[Int]])
    
    // The keys used for encoding/decoding.
    public enum CodingKeys: String, CodingKey {
        case type
        case value
    }
    
    // A helper enum to represent the type of the case.
    public enum PromptType: String, Codable {
        case string
        case strings
        case tokenArray
        case tokenArrays
    }
    
    // Encoding the enum into a keyed container.
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .string(let value):
            try container.encode(PromptType.string, forKey: .type)
            try container.encode(value, forKey: .value)
        case .strings(let values):
            try container.encode(PromptType.strings, forKey: .type)
            try container.encode(values, forKey: .value)
        case .tokenArray(let tokens):
            try container.encode(PromptType.tokenArray, forKey: .type)
            try container.encode(tokens, forKey: .value)
        case .tokenArrays(let tokensArray):
            try container.encode(PromptType.tokenArrays, forKey: .type)
            try container.encode(tokensArray, forKey: .value)
        }
    }
    
    // Decoding the enum from a keyed container.
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(PromptType.self, forKey: .type)
        switch type {
        case .string:
            let value = try container.decode(String.self, forKey: .value)
            self = .string(value)
        case .strings:
            let values = try container.decode([String].self, forKey: .value)
            self = .strings(values)
        case .tokenArray:
            let tokens = try container.decode([Int].self, forKey: .value)
            self = .tokenArray(tokens)
        case .tokenArrays:
            let tokensArray = try container.decode([[Int]].self, forKey: .value)
            self = .tokenArrays(tokensArray)
        }
    }
}
