//
//  Tool.swift
//  FireworksAI
//
//  Created by Joshua Levine on 3/29/25.
//

// MARK: - Tool

public struct Tool: Codable {
    /// The name of the tool/function.
    public var name: String
    /// A description of what the tool does.
    public var description: String?
    /// The parameters schema for the tool, represented as arbitrary JSON.
    public var parameters: [String: JSONValue]? = nil
}
