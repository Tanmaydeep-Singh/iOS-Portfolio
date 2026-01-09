//
//  SwiftUIView.swift
//  iOSPortfolio
//
//  Created by tanmaydeep on 28/01/26.
//

import CoreData
import Foundation
class JournalService {
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext = CoreDataManager.shared.container.viewContext) {
        self.context = context
    }
    
    func createJournal(title: String, body: String) {
        let newJournal = Journal(context: context)
        newJournal.id = UUID()
        newJournal.title = title
        newJournal.body = body
        newJournal.date = Date()
        
        save()
    }

    func fetchJournals() -> [Journal] {
        let request: NSFetchRequest<Journal> = Journal.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Journal.date, ascending: false)]
        
        do {
            return try context.fetch(request)
        } catch {
            print("Failed to fetch journals: \(error.localizedDescription)")
            return []
        }
    }
    
    func fetchJournal(withId id: UUID) -> Journal? {
        let request: NSFetchRequest<Journal> = Journal.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        
        do {
            return try context.fetch(request).first
        } catch {
            print("Failed to fetch journal: \(error.localizedDescription)")
            return nil
        }
    }
    
    // Delete
        func deleteJournal(journal: Journal) {
            context.delete(journal)
            save()
        }

    private func save() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Save failed: \(error.localizedDescription)")
            }
        }
    }
}
