//
//  Message.swift
//  FireworksAI
//
//  Created by Joshua Levine on 3/29/25.
//

// MARK: - Message

public struct Message: Codable, Sendable {
    public var content: String?
    public var role: Role
    public var name: String?
    
    public init(content: String? = nil, role: Role, name: String? = nil) {
        self.content = content
        self.role = role
        self.name = name
    }
}
