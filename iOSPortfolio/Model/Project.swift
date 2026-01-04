//
//  Project.swift
//  iOSPortfolio
//
//  Created by tanmaydeep on 25/01/26.
//
import Foundation

struct Project: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let subtitle: String
    let imageName: String
}
