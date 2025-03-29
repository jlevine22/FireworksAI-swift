//
//  FAIUsage.swift
//  CapitalTracker
//
//  Created by Joshua Levine on 2/3/25.
//

public struct Usage: Codable, Sendable {
    public var completion_tokens: Int
    public var prompt_tokens: Int
    public var total_tokens: Int
}
