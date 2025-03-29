//
//  FAIResponseFormat.swift
//  CapitalTracker
//
//  Created by Joshua Levine on 2/3/25.
//

public struct ResponseFormat: Codable {
    /// For example: "json_object"
    public var type: String
    /// Optional JSON schema provided as a dictionary.
    public var schema: [String: JSONValue]? = nil
}
