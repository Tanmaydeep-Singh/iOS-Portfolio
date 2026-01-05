//
//  ProjectDetailView.swift
//  iOSPortfolio
//
//  Created by tanmaydeep on 26/01/26.
//

import SwiftUI
struct ProjectDetailView: View {

    let project: Project

    var body: some View {
        switch project.type {

        case .jokeGenerator:
            JokeView()

        }
    }
}
