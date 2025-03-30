//
//  ListModelsRequest.swift
//  FireworksAI
//
//  Created by Joshua Levine on 3/29/25.
//

import Foundation

public struct ListModelsRequest: Codable, FireworksApiRequest {
    public var accountId: String
    public var pageSize: Int?
    public var pageToken: String?
    public var filter: String?
    public var orderBy: String?
    
    public var path: String {
        return "v1/accounts/\(accountId)/models"
    }
    
    public var queryItems: [URLQueryItem] {
        var items = [URLQueryItem]()
        if let pageSize = pageSize {
            items.append(URLQueryItem(name: "pageSize", value: String(pageSize)))
        }
        if let pageToken = pageToken {
            items.append(URLQueryItem(name: "pageToken", value: pageToken))
        }
        if let filter = filter {
            items.append(URLQueryItem(name: "filter", value: filter))
        }
        if let orderBy = orderBy {
            items.append(URLQueryItem(name: "orderBy", value: orderBy))
        }
        return items
    }
    
    public var method: String { "GET" }
    
    public init(accountId: String, pageSize: Int? = nil, pageToken: String? = nil, filter: String? = nil, orderBy: String? = nil) {
        self.accountId = accountId
        self.pageSize = pageSize
        self.pageToken = pageToken
        self.filter = filter
        self.orderBy = orderBy
    }
}

extension ListModelsRequest {
    public struct Response: Codable, Sendable {
        public var models: [Model]
        public var nextPageToken: String?
        public var totalSize: Int
        
        public struct Model: Codable, Sendable {
            public var name: String
            public var displayName: String
            public var description: String
            public var createTime: String
            public var createdBy: String
            public var state: String
            public var status: Status
            public var kind: String
            public var githubUrl: String
            public var huggingFaceUrl: String
            public var baseModelDetails: BaseModelDetails?
            public var peftDetails: PeftDetails?
            public var teftDetails: [String: String]?
            public var `public`: Bool
            public var conversationConfig: ConversationConfig?
            public var contextLength: Int
            public var supportsImageInput: Bool
            public var supportsTools: Bool
            public var importedFrom: String
            public var fineTuningJob: String
            public var defaultDraftModel: String
            public var defaultDraftTokenCount: Int
            public var precisions: [String]
            public var deployedModelRefs: [DeployedModelRef]
            public var cluster: String
            public var deprecationDate: DeprecationDate?
            public var calibrated: Bool
            public var tunable: Bool
            public var supportsLora: Bool
            public var useHfApplyChatTemplate: Bool
        }
        
        public struct Status: Codable, Sendable {
            public var code: String
            public var message: String
        }
        
        public struct BaseModelDetails: Codable, Sendable {
            public var worldSize: Int
            public var checkpointFormat: String
            public var parameterCount: String
            public var moe: Bool
            public var tunable: Bool
            public var modelType: String
        }
        
        public struct PeftDetails: Codable, Sendable {
            public var baseModel: String
            public var r: Int
            public var targetModules: [String]
            public var baseModelType: String
            public var mergeAddonModelName: String
        }
        
        public struct ConversationConfig: Codable, Sendable {
            public var style: String
            public var system: String
            public var template: String
        }
        
        public struct DeployedModelRef: Codable, Sendable {
            public var name: String
            public var deployment: String
            public var state: String
            public var `default`: Bool
            public var `public`: Bool
        }
        
        public struct DeprecationDate: Codable, Sendable {
            public var year: Int
            public var month: Int
            public var day: Int
        }
    }
}
