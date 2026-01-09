//
//  JournalListViewModel.swift
//  iOSPortfolio
//
//  Created by tanmaydeep on 28/01/26.
//

import Foundation
import CoreData
import Combine

@MainActor
final class JournalListViewModel: ObservableObject {

    @Published var journals: [Journal] = []

    private let service: JournalService

    init(service: JournalService = JournalService()) {
        self.service = service
    }

    func fetchJournals() {
        journals = service.fetchJournals()
    }
}
