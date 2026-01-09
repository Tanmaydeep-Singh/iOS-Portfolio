//
//  ContentView.swift
//  iOSPortfolio
//
//  Created by tanmaydeep on 24/01/26.
//

import SwiftUI

struct ContentView: View {
    @State private var path = NavigationPath()
    @StateObject private var themeManager = ThemeManager()

    

    var body: some View {
        NavigationStack(path: $path) {
            HomeView(path: $path)
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .projectGallery:
                        ProjectGalleryView(path: $path)
                    case .settings:
                        SettingsView()
                    case .details:
                        SettingsView()
                    case .project(let project):
                            ProjectDetailView(project: project)
                    case .addJournal:
                            AddJournalView()
                    }
                    
                }
        } .environmentObject(themeManager)
            .preferredColorScheme(
                themeManager.isDarkMode ? .dark : .light
            )
    }
}
#Preview {
    ContentView()
        .environmentObject(ThemeManager())
}
