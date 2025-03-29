//
//  FireworksApiClientEnvironmentValue.swift
//  FireworksAI
//
//  Created by Joshua Levine on 3/29/25.
//

#if canImport(SwiftUI)
import SwiftUI

public struct ClientKey: EnvironmentKey {
    public static let defaultValue: FireworksApiClient = .init(apiKey: nil)
}

extension EnvironmentValues {
    public var fireworksApiClient: FireworksApiClient {
        get { self[ClientKey.self] }
        set { self[ClientKey.self] = newValue }
    }
}
#endif
