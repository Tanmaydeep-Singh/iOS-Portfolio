//
//  Project.swift
//  iOSPortfolio
//
//  Created by tanmaydeep on 25/01/26.
//
import Foundation

enum ProjectType: String, Codable, Hashable {
    case jokeGenerator
    case stopwatch
    case journal

}

struct Project: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let subtitle: String
    let imageName: String
    let type: ProjectType

}
