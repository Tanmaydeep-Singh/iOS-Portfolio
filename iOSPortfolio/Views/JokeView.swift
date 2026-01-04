//
//  JokeView.swift
//  iOSPortfolio
//
//  Created by tanmaydeep on 26/01/26.
//

import SwiftUI

struct JokeView: View {
    @StateObject private var viewModel = JokeViewModel()

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {

                if viewModel.isLoading {
                    ProgressView("Fetching Joke...")
                }

                if let joke = viewModel.joke {
                    VStack(spacing: 12) {
                        Text(joke.setup)
                            .font(.title3)
                            .multilineTextAlignment(.center)

                        Text(joke.punchline)
                            .font(.headline)
                            .foregroundColor(.secondary)
                    }
                }

                if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                }

                Button("Get Random Joke 😂") {
                    Task {
                        await viewModel.fetchJoke()
                    }
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
            .navigationTitle("Joke Generator")
        }
    }
}


#Preview {
    JokeView()
}

