# FireworksAI Swift

An API client for [Fireworks.ai](https://fireworks.ai) written in Swift.

## Basic Usage

```swift
import FireworksAI

let client = FireworksApiClient(apiKey: "your_api_key")

let request = FireworksAI.ChatCompletionRequest(
    messages: [
        .init(content: "This is the prompt for the model", role: .user)
    ],
    model: "accounts/fireworks/models/llama-v3p3-70b-instruct"
)
let result = try await fireworksClient.request(request)
```
