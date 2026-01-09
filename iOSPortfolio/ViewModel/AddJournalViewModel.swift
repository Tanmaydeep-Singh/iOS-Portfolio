//
//  AddJournalViewModel.swift
//  iOSPortfolio
//
//  Created by tanmaydeep on 28/01/26.
//
import Foundation
import Combine

@MainActor
final class AddJournalViewModel: ObservableObject {

    @Published var title: String = ""
    @Published var body: String = ""

    private let service: JournalService

    init(service: JournalService = JournalService()) {
        self.service = service
    }

    func saveJournal() {
        guard !body.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return
        }

        let finalTitle = title.isEmpty ? "Untitled Entry" : title

        service.createJournal(
            title: finalTitle,
            body: body
        )
    }
}
