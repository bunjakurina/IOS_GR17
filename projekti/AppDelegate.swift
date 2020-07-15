//
//  AppDelegate.swift
//  projekti
//
//  Created by pc on 4/19/1399 AP.
//  Copyright © 1399 pc. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    func applicationWillResignActive(_ application: UIApplication) {
      // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
      // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
      // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
      // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
      // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
      // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
      // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
      // Saves changes in the application's managed object context before the application terminates.
      self.saveContext()
    }

    // MARK: - Core Data stack
    
    /*
     https://developer.apple.com/documentation/coredata/nspersistentcontainer
     NSPersistentContainer
     A container that encapsulates the Core Data stack in your application.
     
     NSPersistentContainer simplifies the creation and management of the Core Data stack by handling the creation of the managed object model (NSManagedObjectModel), persistent store coordinator (NSPersistentStoreCoordinator), and the managed object context (NSManagedObjectContext).
     
     Core Data Stack :
     The Core Data stack is a collection of framework objects that are accessed as part of the initialization of Core Data and that mediate between the objects in your application and external data stores. The Core Data stack handles all of the interactions with the external data stores so that your application can focus on its business logic. The stack consists of four primary objects: the managed object context (NSManagedObjectContext), the persistent store coordinator (NSPersistentStoreCoordinator), the managed object model (NSManagedObjectModel), and the persistent container (NSPersistentContainer).
     
     */
//    lazy var persistentContainer: NSPersistentContainer = {
//      /*
//
//
//       https://developer.apple.com/documentation/coredata/nspersistentcontainer
//       The persistent container for the application. This implementation
//       creates and returns a container, having loaded the store for the
//       application to it. This property is optional since there are legitimate
//       error conditions that could cause the creation of the store to fail.
//       */
//
//      /*init(name: String)
//       Initializes a persistent container with the given name.
//
//       Parameters - name - The name of the NSPersistentContainer object.
//       Return Value - A persistent container initialized with the given name.
//       Discussion - By default, the provided name value is used to name the persistent store and is used to look up the name of the NSManagedObjectModel object to be used with the NSPersistentContainer object.
//
//       https://developer.apple.com/documentation/coredata/nspersistentcontainer/1640557-init
//       */
//      let container = NSPersistentContainer(name: "PersonData")
//
//      /*
//
//       Instructs the persistent container to load the persistent stores.
//       loadPersistentStores(completionHandler:)
//       Instructs the persistent container to load the persistent stores.
//
//       Discussion
//       Once the persistent container has been initialized, you need to execute loadPersistentStores(completionHandler:) to instruct the container to load the persistent stores and complete the creation of the Core Data stack.
//       Once the completion handler has fired, the stack is fully initialized and is ready for use. The completion handler will be called once for each persistent store that is created.
//       If there is an error in the loading of the persistent stores, the NSError value will be populated.
//
//       */
//      container.loadPersistentStores(completionHandler: { (storeDescription, error) in
//
//        /*
//         https://developer.apple.com/documentation/coredata/nspersistentstoredescription
//         storeDescription - > As the name of the class suggests, the NSPersistentStoreDescription class encapsulates the information and configuration to add a persistent store to the persistent store coordinator. In other words, it describes a persistent store.
//         */
//
//
//        if let error = error as NSError? {
//          fatalError("Unresolved error \(error), \(error.userInfo)")
//        }
//      })
//      return container
//    }()
//
//    // MARK: - Core Data Saving support
//
//    func saveContext () {
//        let context = persistentContainer.viewContext
//        if context.hasChanges {
//            do {
//                try context.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nserror = error as NSError
//                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
//            }
//
//
//        }
//    }
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "PersonData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                print("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container;
    }()
    func saveContext() {
        let context = persistentContainer.viewContext;
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Failure to save context: \(error)")
            }
        }
    }



}

