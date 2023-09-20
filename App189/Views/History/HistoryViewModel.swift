//
//  HistoryViewModel.swift
//  App189
//
//  Created by IGOR on 12/09/2023.
//

import SwiftUI
import CoreData

final class HistoryViewModel: ObservableObject {
    
    @Published var history: [HistoryModel] = []
    
    @Published var filter_category: String = ""
    @Published var currency: String = ""
    @Published var amount: String = ""
    
    func fetchHistory() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<HistoryModel>(entityName: "HistoryModel")

        do {
            
            let persons = try context.fetch(fetchRequest)
            
            self.history = persons
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.history = []
        }
    }
}
    
