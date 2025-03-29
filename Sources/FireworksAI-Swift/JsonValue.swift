//
//  FAIJsonValue.swift
//  CapitalTracker
//
//  Created by Joshua Levine on 2/3/25.
//

// MARK: - JSONValue
///
/// A simple representation of arbitrary JSON values.
public enum JSONValue: Codable {
    case string(String)
    case number(Double)
    case object([String: JSONValue])
    case array([JSONValue])
    case bool(Bool)
    case null
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if container.decodeNil() {
            self = .null
        } else if let boolValue = try? container.decode(Bool.self) {
            self = .bool(boolValue)
        } else if let doubleValue = try? container.decode(Double.self) {
            self = .number(doubleValue)
        } else if let stringValue = try? container.decode(String.self) {
            self = .string(stringValue)
        } else if let arrayValue = try? container.decode([JSONValue].self) {
            self = .array(arrayValue)
        } else if let objectValue = try? container.decode([String: JSONValue].self) {
            self = .object(objectValue)
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Unable to decode JSONValue"
            )
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .null:
            try container.encodeNil()
        case .bool(let boolValue):
            try container.encode(boolValue)
        case .number(let doubleValue):
            try container.encode(doubleValue)
        case .string(let stringValue):
            try container.encode(stringValue)
        case .array(let arrayValue):
            try container.encode(arrayValue)
        case .object(let objectValue):
            try container.encode(objectValue)
        }
    }
}
