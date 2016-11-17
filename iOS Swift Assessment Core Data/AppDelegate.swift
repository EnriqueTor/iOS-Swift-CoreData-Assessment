//
//  AppDelegate.swift
//  iOS Swift Assessment Core Data
//
//  Created by Ian Rahman on 11/17/16.
//  Copyright © 2016 FlatironSchool. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let stack = CoreDataStack.sharedInstance

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        /////////////////////////////////////////
        ///
        /// Fetch data from your stack and
        /// dump your library to the console
        ///
        /////////////////////////////////////////
        
        stack.fetchData()
        
        for book in stack.books {
            print("\(book.title!) by \(book.author!.name!)")
        }
        
        return true
    }

}

