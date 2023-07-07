//
//  OpenAIModel.swift
//  Recipes
//
//  Created by Natalie Alvarez on 6/21/23.
//

// SwiftUI x OpenAIApi Package:
// https://github.com/MacPaw/OpenAI

import Foundation
import OpenAI

let openAI = OpenAI(apiToken: "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")

func getRecipePrompt(userPrompt: String) -> String {
    let recipePrompt = """
    You are an AI-powered recipe book. The user is going to ask you for a recipe.
    You are going to reply with a JSON (decodable) dictionary (in SwiftUI) with the following variables, and NOTHING ELSE:
    - id: UUID (a valid UUID)
    - name: String (the name of the recipe)
    - instructions: String (a detailed step-by-step, numbered description of the instructions the user must take to cook the recipe)
    - ingredients: [String] (an array of ingredients)

    Your answer MUST be a JSON decodable "Recipe":
    struct Recipe: Codable, Identifiable {
        let id: UUID
        let name: String
        let instructions: String
        let ingredients: [String]
    }

    Here is the user's recipe:
    \(userPrompt)
    """
    return recipePrompt
}

func askChatGPT(prompt: String) async throws -> Recipe {
    let recipePrompt = getRecipePrompt(userPrompt: prompt)

    let query = ChatQuery(model: .gpt3_5Turbo, messages: [.init(role: .user, content: recipePrompt)])

    do {
        let result = try await openAI.chats(query: query)
        let recipe = getChatGPTResponse(result: result)

        print("askChatGPT(): recipe:\n\(recipe)")
        return recipe
    } catch {
        print("askChatGPT(): An error occurred:\n\(error)")
        throw error
    }
}

func getChatGPTResponse(result: ChatResult) -> Recipe {
    guard let firstChoice = result.choices.first else {
        fatalError("Failed to get first choice from result:\n\(result)")
    }

    guard let message = firstChoice.message.content else {
        fatalError("Failed to get message from first choice:\n\(firstChoice)")
    }

    let recipe: Recipe = Bundle.main.decode(message)
    return recipe
}
/*===================================================*/

//struct ChatQuery: Codable {
//     /// ID of the model to use. Currently, only gpt-3.5-turbo and gpt-3.5-turbo-0301 are supported.
//     public let model: Model
//     /// The messages to generate chat completions for
//     public let messages: [Chat]
//     /// A list of functions the model may generate JSON inputs for.
//     public let functions: [ChatFunctionDeclaration]?
//     /// What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and  We generally recommend altering this or top_p but not both.
//     public let temperature: Double? = 0
//     /// An alternative to sampling with temperature, called nucleus sampling, where the model considers the results of the tokens with top_p probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered.
//     public let topP: Double? = 1
//     /// How many chat completion choices to generate for each input message.
//     public let n: Int? = 0
//     /// Up to 4 sequences where the API will stop generating further tokens. The returned text will not contain the stop sequence.
//     public let stop: [String]? = ["\\n"]
//     /// The maximum number of tokens to generate in the completion.
//     public let maxTokens: Int?
//     /// Number between -2.0 and 2.0. Positive values penalize new tokens based on whether they appear in the text so far, increasing the model's likelihood to talk about new topics.
//     public let presencePenalty: Double?
//     /// Number between -2.0 and 2.0. Positive values penalize new tokens based on their existing frequency in the text so far, decreasing the model's likelihood to repeat the same line verbatim.
//     public let frequencyPenalty: Double?
//     ///Modify the likelihood of specified tokens appearing in the completion.
//     public let logitBias: [String:Int]?
//     /// A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse.
//     public let user: String?
//}

//struct ChatResult: Codable, Equatable {
//    public struct Choice: Codable, Equatable {
//        public let index: Int
//        public let message: Chat
//        public let finishReason: String
//    }
//
//    public struct Usage: Codable, Equatable {
//        public let promptTokens: Int
//        public let completionTokens: Int
//        public let totalTokens: Int
//    }
//
//    public let id: String
//    public let object: String
//    public let created: TimeInterval
//    public let model: Model
//    public let choices: [Choice]
//    public let usage: Usage
//}
