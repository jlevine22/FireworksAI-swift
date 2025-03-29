//
//  FAIChatCompletionRequest.swift
//  CapitalTracker
//
//  Created by Joshua Levine on 2/3/25.
//

// MARK: - ChatCompletionRequest
import Foundation

public struct ChatCompletionRequest: Codable, FireworksApiRequest {
    // FireworksApiRequest protocol requirements
    public var path: String { "chat/completions" }
    public var method: String { "POST" }
    
    // Public initializer
    public init(
        messages: [FireworksAIMessage],
        model: String,
        context_length_exceeded_behavior: ContextLengthExceededBehavior = .error,
        frequency_penalty: Double? = nil,
        presence_penalty: Double? = 0,
        repetition_penalty: Double? = 1,
        ignore_eos: Bool? = false,
        max_tokens: Int? = 2000,
        mirostat_lr: Double? = 0.1,
        mirostat_target: Double? = 1.5,
        n: Int? = 1,
        prompt_truncate_len: Int? = 1500,
        temperature: Double? = 1,
        top_k: Int? = nil,
        top_p: Double? = 1,
        response_format: ResponseFormat? = nil,
        stop: [String]? = nil,
        stream: Bool? = false,
        tools: [Tool]? = nil,
        user: String? = nil
    ) {
        self.messages = messages
        self.model = model
        self.context_length_exceeded_behavior = context_length_exceeded_behavior
        self.frequency_penalty = frequency_penalty
        self.presence_penalty = presence_penalty
        self.repetition_penalty = repetition_penalty
        self.ignore_eos = ignore_eos
        self.max_tokens = max_tokens
        self.mirostat_lr = mirostat_lr
        self.mirostat_target = mirostat_target
        self.n = n
        self.prompt_truncate_len = prompt_truncate_len
        self.temperature = temperature
        self.top_k = top_k
        self.top_p = top_p
        self.response_format = response_format
        self.stop = stop
        self.stream = stream
        self.tools = tools
        self.user = user
    }
    
    // Required fields
    public var messages: [FireworksAIMessage]
    public var model: String
    
    // Context behavior
    public var context_length_exceeded_behavior: ContextLengthExceededBehavior = .error
    
    // Optional penalties & modifiers
    public var frequency_penalty: Double? = nil
    public var presence_penalty: Double? = 0
    public var repetition_penalty: Double? = 1
    
    // Generation controls
    public var ignore_eos: Bool? = false
    public var max_tokens: Int? = 2000
    public var mirostat_lr: Double? = 0.1
    public var mirostat_target: Double? = 1.5
    public var n: Int? = 1
    public var prompt_truncate_len: Int? = 1500
    public var temperature: Double? = 1
    public var top_k: Int? = nil
    public var top_p: Double? = 1
    
    // Formatting
    public var response_format: ResponseFormat? = nil
    
    // Stop sequences – up to 4 sequences that stop further generation
    public var stop: [String]? = nil
    
    // Streaming flag
    public var stream: Bool? = false
    
    // Optional tools (currently only functions are supported)
    public var tools: [Tool]? = nil
    
    // End-user identifier (for abuse monitoring)
    public var user: String? = nil
}

// MARK: - Message

public struct FireworksAIMessage: Codable, Sendable {
    public var content: String?
    public var role: FireworksAIRole
    public var name: String?
    
    public init(content: String? = nil, role: FireworksAIRole, name: String? = nil) {
        self.content = content
        self.role = role
        self.name = name
    }
}

public enum FireworksAIRole: String, Codable, Sendable {
    case system, user, assistant
}

// MARK: - Tool

public struct Tool: Codable {
    /// The name of the tool/function.
    public var name: String
    /// A description of what the tool does.
    public var description: String?
    /// The parameters schema for the tool, represented as arbitrary JSON.
    public var parameters: [String: JSONValue]? = nil
}

extension ChatCompletionRequest {
    public struct Response: Codable, Sendable {
        public var choices: [Choice]
        public var created: Int
        public var id: String
        public var model: String
        public var object: String
        public var usage: Usage
    }
    
    public struct Choice: Codable, Sendable {
        public var finish_reason: FinishReason
        public var index: Int
        public var message: FireworksAIMessage
    }
}
