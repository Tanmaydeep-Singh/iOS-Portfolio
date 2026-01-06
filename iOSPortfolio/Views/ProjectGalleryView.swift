//
//  ProjectGalleryView.swift
//  iOSPortfolio
//
//  Created by tanmaydeep on 24/01/26.
//
import SwiftUI

struct ProjectGalleryView: View {

    @Binding var path: NavigationPath

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(projects) { project in
                    ProjectCardView(project: project)
                        .onTapGesture {
                            path.append(Route.project(project))

                        }
                }
            }
            .padding()
        }
        .navigationTitle("Projects")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    path.append(Route.settings)
                } label: {
                    Image(systemName: "gear")
                }
            }
        }
    }
}


#Preview {
    ProjectGalleryView(path: .constant(NavigationPath()))
}
let projects: [Project] = [
    Project(
        title: "Joke Generator",
        subtitle: "Async API based app",
        imageName: "face.smiling",
        type: .jokeGenerator
    ),
    Project(
        title: "Stop Watch",
        subtitle: "A simple stopwatch",
        imageName: "watch",
        type: .stopwatch
    )
]
