//
//  SettingsView.swift
//  iOSPortfolio
//
//  Created by tanmaydeep on 24/01/26.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var themeManager: ThemeManager

    var body: some View {
        
        VStack(){
            Form {
                       Toggle("Dark Mode", isOn: $themeManager.isDarkMode)
                   }
        }            .navigationTitle("Settings")

    }
}

#Preview {
    SettingsView()
        .environmentObject(ThemeManager())

}
