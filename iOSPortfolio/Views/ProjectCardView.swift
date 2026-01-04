//
//  ProjectCardView.swift
//  iOSPortfolio
//
//  Created by tanmaydeep on 25/01/26.
//
import SwiftUI

struct ProjectCardView: View {

    let project: Project

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {

            Image(systemName: project.imageName)
                .font(.largeTitle)
                .frame(maxWidth: .infinity, minHeight: 100)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 12))

            Text(project.title)
                .font(.headline)

            Text(project.subtitle)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding()
        .background(.background)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(radius: 4)
    }
}

