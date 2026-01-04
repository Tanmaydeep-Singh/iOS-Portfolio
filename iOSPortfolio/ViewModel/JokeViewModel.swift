//
//  JokeViewModel.swift
//  iOSPortfolio
//
//  Created by tanmaydeep on 26/01/26.
//

import SwiftUI
import Combine

@MainActor
class JokeViewModel: ObservableObject {

    @Published var joke: Joke?
    @Published var isLoading = false
    @Published var errorMessage: String?

    func fetchJoke() async {
        isLoading = true
        errorMessage = nil

        let urlString = "https://official-joke-api.appspot.com/random_joke"

        guard let url = URL(string: urlString) else {
            errorMessage = "Invalid URL"
            isLoading = false
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedJoke = try JSONDecoder().decode(Joke.self, from: data)
            joke = decodedJoke
        } catch {
            errorMessage = "Failed to load joke"
        }

        isLoading = false
    }
}
