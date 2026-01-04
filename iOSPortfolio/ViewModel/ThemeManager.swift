//
//  ThemeManager.swift
//  iOSPortfolio
//
//  Created by tanmaydeep on 25/01/26.

//
import SwiftUI
import Combine
import SwiftUI

@MainActor
final class ThemeManager: ObservableObject {
    @AppStorage("isDarkMode") var isDarkMode: Bool = true {
        willSet {
            objectWillChange.send()
        }
    }
}
