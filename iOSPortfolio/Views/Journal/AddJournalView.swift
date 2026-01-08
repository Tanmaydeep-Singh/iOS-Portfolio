//
//  AddJournalView.swift
//  iOSPortfolio
//
//  Created by tanmaydeep on 28/01/26.
//

import SwiftUI

struct AddJournalView: View {
    @State private var fullText: String = "Enter you journal..."
    var body: some View {
        VStack(){
            TextEditor(text: $fullText)
            .scrollContentBackground(.hidden)
            .padding()
            .frame(minHeight: 200)

                        
            Text("Character count: \(fullText.count)")
            .font(.caption)
                            
        }
        
            .navigationTitle("New Journal")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                    } label: {
                        Image(systemName: "Save")
                    }
                }
            }
    }
}

#Preview {
    AddJournalView()
}
