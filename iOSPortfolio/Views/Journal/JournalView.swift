//
//  JournalView.swift
//  iOSPortfolio
//
//  Created by tanmaydeep on 28/01/26.
//

import SwiftUI
struct JournalView: View {
    @StateObject var viewModel: JournalDetailViewModel
    @Environment(\.dismiss) var dismiss
    @State private var isEditing = false

    var body: some View {
        Form {
            Section(header: Text("Title")) {
                if isEditing {
                    TextField("Enter Title", text: $viewModel.title)
                } else {
                    Text(viewModel.title).font(.headline)
                }
            }

            Section(header: Text("Content")) {
                if isEditing {
                    TextEditor(text: $viewModel.bodyText)
                        .frame(minHeight: 200)
                } else {
                    Text(viewModel.bodyText)
                }
            }
        }
        .navigationTitle("Entry Details")
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button(role: .destructive) {
                    viewModel.deleteJournal {
                        dismiss()
                    }
                } label: {
                    Image(systemName: "trash")
                }

                Button(isEditing ? "Save" : "Edit") {
                    if isEditing {
                        viewModel.updateJournal()
                    }
                    isEditing.toggle()
                }
            }
        }
    }
}


