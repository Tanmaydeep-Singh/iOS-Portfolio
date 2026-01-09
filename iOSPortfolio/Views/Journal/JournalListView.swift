//
//  JournalView.swift
//  iOSPortfolio
//
//  Created by tanmaydeep on 28/01/26.
//
import SwiftUI

struct JournalListView: View {

    @StateObject private var vm = JournalListViewModel()

    var body: some View {
        VStack {
            if vm.journals.isEmpty {
                Spacer()
                ContentUnavailableView(
                    "No Journals",
                    systemImage: "book.pages",
                    description: Text("Tap the + button to start your first entry.")
                )
                Spacer()
            } else {
                List(vm.journals) { journal in
                    NavigationLink(
                        destination: Text("Detail for \(journal.title ?? "")")
                    ) {
                        VStack(alignment: .leading) {
                            Text(journal.title ?? "")
                                .font(.headline)

                            Text(journal.body ?? "")
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
            NavigationLink(value: Route.addJournal) {
                   Image(systemName: "plus")
               }
        }
        .onAppear {
            vm.fetchJournals()
        }
    }
}


private let journalData: [JournalModel] = [
//    JournalModel(
//        id: 1,
//        title: "First Entry",
//        body: "This is the first entry in my journal. I'm excited to start writing more.",
//        date: Date()
//    ),
//    JournalModel(
//        id: 2,
//        title: "Second Entry",
//        body: "This is the second entry in my journal. Working on the UI today.",
//        date: Date()
//    )
]

#Preview {
    JournalListView()
}
