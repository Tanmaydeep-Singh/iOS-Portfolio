//
//  Joke.swift
//  iOSPortfolio
//
//  Created by tanmaydeep on 26/01/26.
//

import Foundation

struct Joke: Codable, Identifiable {
    let id: Int
    let setup: String
    let punchline: String
}
