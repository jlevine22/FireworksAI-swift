//
//  CompletionRequest.swift
//  CapitalTracker
//
//  Created by Joshua Levine on 2/3/25.
//

import Foundation

public struct CompletionRequest: Codable, FireworksApiRequest {
    public var path: String { "inference/v1/completions" }
    public var method: String { "POST" }
    
    public var model: String
    public var prompt: Prompt
    public var context_length_exceeded_behavior: ContextLengthExceededBehavior = .error
    public var echo: Bool?
    public var frequency_penalty: Double?
    public var ignore_eos: Bool?
    public var images: [String] = []
    public var logprobs: Int?
    public var max_tokens: Int?
    public var mirostat_lr: Double?
    public var mirostat_target: Double?
    public var n: Int?
    public var presence_penalty: Double?
    public var repetition_penalty: Double?
    public var response_format: ResponseFormat?
    public var stop: String?
    public var stream: Bool?
    public var temperature: Double?
    public var top_k: Int?
    public var top_p: Double?
    public var user: String?
    
    public init(
        model: String,
        prompt: Prompt,
        context_length_exceeded_behavior: ContextLengthExceededBehavior = .error,
        echo: Bool? = nil,
        frequency_penalty: Double? = nil,
        ignore_eos: Bool? = nil,
        images: [String] = [],
        logprobs: Int? = nil,
        max_tokens: Int? = nil,
        mirostat_lr: Double? = nil,
        mirostat_target: Double? = nil,
        n: Int? = nil,
        presence_penalty: Double? = nil,
        repetition_penalty: Double? = nil,
        response_format: ResponseFormat? = nil,
        stop: String? = nil,
        stream: Bool? = nil,
        temperature: Double? = nil,
        top_k: Int? = nil,
        top_p: Double? = nil,
        user: String? = nil
    ) {
        self.model = model
        self.prompt = prompt
        self.context_length_exceeded_behavior = context_length_exceeded_behavior
        self.echo = echo
        self.frequency_penalty = frequency_penalty
        self.ignore_eos = ignore_eos
        self.images = images
        self.logprobs = logprobs
        self.max_tokens = max_tokens
        self.mirostat_lr = mirostat_lr
        self.mirostat_target = mirostat_target
        self.n = n
        self.presence_penalty = presence_penalty
        self.repetition_penalty = repetition_penalty
        self.response_format = response_format
        self.stop = stop
        self.stream = stream
        self.temperature = temperature
        self.top_k = top_k
        self.top_p = top_p
        self.user = user
    }
}

extension CompletionRequest {
    public struct Response: Codable, Sendable {
        public var choices: [Choice]
        public var logprobs: LogProb?
        public var created: Int
        public var id: String
        public var model: String
        public var object: String
        public var usage: LLMUsage
    }
    
    public struct Choice: Codable, Sendable {
        public var finish_reason: FinishReason
        public var index: Int
        public var text: String
    }
    
    public struct LogProb: Codable, Sendable {
        public var text_offset: [Int]
        public var token_logprobs: [Double]
        public var tokens: [String]
        //var top_logprobs: [String: Any]
    }
}
