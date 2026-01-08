//
//  Journal.swift
//  iOSPortfolio
//
//  Created by tanmaydeep on 28/01/26.
//

import Foundation

struct JournalModel: Codable, Identifiable {
   let id: Int
   let title: String
   let body: String
   let date: Date
}
