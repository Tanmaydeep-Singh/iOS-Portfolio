//
//  JournalView.swift
//  iOSPortfolio
//
//  Created by tanmaydeep on 28/01/26.
//

import SwiftUI

struct JournalListView: View {
    private var journalEntries: [JournalModel] = journalData
    
    var body: some View {
        VStack {
            if journalEntries.isEmpty {
                Spacer()
                Text("No Entries")
                    .font(.largeTitle)
                    .foregroundColor(.secondary)
                    .padding()
                Spacer()
            } else {
                List(journalEntries) { entry in
                   
                    NavigationLink(destination: Text("Detail for \(entry.title)")) {
                        VStack(alignment: .leading) {
                            Text(entry.title)
                                .font(.headline)
                            Text(entry.body)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .lineLimit(1)
                        }
                    }
                }
            }
        }
        .navigationTitle("Journal")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            NavigationLink(destination: Text("New Entry")) {
                Image(systemName: "plus")
            }
        }
    }
}

private let journalData: [JournalModel] = [
    JournalModel(
        id: 1,
        title: "First Entry",
        body: "This is the first entry in my journal. I'm excited to start writing more.",
        date: Date()
    ),
    JournalModel(
        id: 2,
        title: "Second Entry",
        body: "This is the second entry in my journal. Working on the UI today.",
        date: Date()
    )
]

#Preview {
    NavigationStack { // Added NavigationStack so the title shows up in Preview
        JournalListView()
    }
}
