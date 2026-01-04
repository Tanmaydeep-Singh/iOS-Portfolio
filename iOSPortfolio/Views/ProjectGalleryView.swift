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
                ForEach(sampleProjects) { project in
                    ProjectCardView(project: project)
                        .onTapGesture {
                    
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

let sampleProjects: [Project] = [
    Project(title: "Storyloom",
            subtitle: "Story reading platform",
            imageName: "book.fill"),

    Project(title: "AppGuard",
            subtitle: "App blocking tool",
            imageName: "lock.fill"),

    Project(title: "Portfolio",
            subtitle: "SwiftUI portfolio app",
            imageName: "person.crop.square")
]
