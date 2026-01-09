//
//  AddJournalView.swift
//  iOSPortfolio
//
//  Created by tanmaydeep on 28/01/26.
//
import SwiftUI

struct AddJournalView: View {

    @StateObject private var vm = AddJournalViewModel()
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 12) {

            TextField("Title", text: $vm.title)
                .font(.headline)
                .padding(.horizontal)

            TextEditor(text: $vm.body)
                .scrollContentBackground(.hidden)
                .padding()
                .frame(minHeight: 200)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.secondary.opacity(0.3))
                )

            Text("Character count: \(vm.body.count)")
                .font(.caption)
                .foregroundStyle(.secondary)

            Spacer()
        }
        .padding(.top)
        .navigationTitle("New Journal")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    vm.saveJournal()
                }
                .disabled(vm.body.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }
        }
    }
}


#Preview {
    AddJournalView()
}
