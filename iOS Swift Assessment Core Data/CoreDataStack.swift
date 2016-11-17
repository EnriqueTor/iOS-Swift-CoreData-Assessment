//
//  CoreDataStack.swift
//  iOS Swift Assessment Core Data
//
//  Created by Ian Rahman on 11/17/16.
//  Copyright © 2016 FlatironSchool. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    
    static let sharedInstance = CoreDataStack()
    
    var books: [Book] = []
    
    private init() {}
    
    func generateTestData() {
        
        let context = persistentContainer.viewContext
        
        let author1 = Author(context: context)
        author1.name = "Apple Inc."
        
        let author2 = Author(context: context)
        author2.name = "Paul Hudson"
        
        let author3 = Author(context: context)
        author3.name = "Chris Eidhof"
        
        let book1 = Book(context: context)
        book1.title = "The Swift Programming Language"
        
        let book2 = Book(context: context)
        book2.title = "Hacking with Swift"

        let book3 = Book(context: context)
        book3.title = "Pro Swift"

        let book4 = Book(context: context)
        book4.title = "Advanced Swift"
        
        author1.addToBook(book1)
        author2.addToBook(book2)
        author2.addToBook(book3)
        author3.addToBook(book4)
        
        saveContext()
        fetchData()
    }
    
    func fetchData() {
        
        let context = persistentContainer.viewContext
        
        let bookRequest = NSFetchRequest<Book>(entityName: "Book")
        
        do {
            books = try context.fetch(bookRequest)
        } catch {
            print(error)
        }
        
        if books.count == 0 {
            generateTestData()
        }
    }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "iOS_Swift_Assessment_Core_Data")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
