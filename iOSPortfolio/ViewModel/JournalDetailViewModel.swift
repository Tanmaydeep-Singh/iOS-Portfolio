//
//  JournalDetailViewModel.swift
//  iOSPortfolio
//
//  Created by tanmaydeep on 28/01/26.
//
import Foundation
import SwiftUI
import Combine

class JournalDetailViewModel: ObservableObject {
    @Published var title: String
    @Published var bodyText: String
    private let journal: Journal
    private let service: JournalService

    init(journal: Journal, service: JournalService = JournalService()) {
        self.journal = journal
        self.service = service
        self.title = journal.title ?? ""
        self.bodyText = journal.body ?? ""
    }

    func updateJournal() {
        journal.title = title
        journal.body = bodyText
        service.saveContext()
    }

    func deleteJournal(completion: @escaping () -> Void) {
        service.deleteJournal(journal: journal)
        completion()
    }
}
