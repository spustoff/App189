//
//  MainViewModel.swift
//  App189
//
//  Created by IGOR on 09/09/2023.
//

import SwiftUI
import CoreData

final class MainViewModel: ObservableObject {

    @Published var operations: [String] = ["Expenses", "Income"]
    @Published var current_option = "Expenses"
    
    @Published var currencies: [String] = ["EURUSD", "EURJPY", "USDTRY"]
    @Published var current_cur = "EURUSD"
    
    @Published var amount: String = ""
    @AppStorage("sum") var sum: String = ""
    @AppStorage("income") var income: Int = 0
    @AppStorage("expenses") var expenses: Int = 0

    
    @Published var things: [MainModel] = [
    
        MainModel(title: "Food", color: Color.red),
        MainModel(title: "Home", color: Color.white),
        MainModel(title: "Family", color: Color.blue),
        MainModel(title: "Sport", color: Color.black),
        MainModel(title: "Transportation", color: Color.yellow),
        MainModel(title: "Gifts", color: Color.green),
        MainModel(title: "Education", color: Color.gray),
        MainModel(title: "Health", color: Color.purple)
        
    ]
    
    @Published var current_thing: MainModel?
    @AppStorage("limit") var limit = ""
    
    @Published var isLimit: Bool = false
    @Published var isChange: Bool = false

    
    func addToHistory(completion: @escaping () -> (Void)) {
                
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let rent = NSEntityDescription.insertNewObject(forEntityName: "HistoryModel", into: context) as! HistoryModel
        
        rent.amount = Int16(amount) ?? 0
        rent.category = current_thing?.title ?? ""
        rent.date = Date()
        rent.pair = current_cur

        CoreDataStack.shared.saveContext()
        
        completion()
    }
}

