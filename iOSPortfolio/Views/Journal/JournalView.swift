//
//  JournalView.swift
//  iOSPortfolio
//
//  Created by tanmaydeep on 28/01/26.
//
import SwiftUI

struct JournalView: View {
    let id: UUID
    private let service = JournalService()
    
    @State private var journal: Journal?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                if let journal = journal {
                    Text(journal.title ?? "Untitled")
                        .font(.largeTitle)
                        .bold()
                    
                    Text(journal.date?.formatted(date: .long, time: .shortened) ?? "")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    Divider()
                    
                    Text(journal.body ?? "")
                        .font(.body)
                } else {
                    ProgressView("Fetching journal...")
                }
            }
            .padding()
        }
        .navigationTitle("Journal Entry")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            self.journal = service.fetchJournal(withId: id)
        }
    }
}
