//
//  AppDelegate.swift
//  Informatur2
//
//  Created by Arturo Sanhueza on 22-01-15.
//  Copyright (c) 2015 Arturo Sanhueza. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
              self.idioma()
        NSThread.sleepForTimeInterval(3.0)
        
        return true
    }
    func idioma(){
    
        var defolto = NSUserDefaults.standardUserDefaults()
        var pre = NSLocale.preferredLanguages()[0] as NSString
        
        if pre.containsString("en"){
        
            defolto.setObject("en", forKey: "idioma")
        }
        else if pre.containsString("es"){
        
            defolto.setObject("es", forKey: "idioma")
            
        }
        else if pre.containsString("pt"){
        
            defolto.setObject("pt", forKey: "idioma")
            
        }
        else{
            defolto.setObject("en", forKey: "idioma")
            
        }
        defolto.synchronize()

        println(pre)
    }
    
      func applicationWillTerminate(application: UIApplication) {
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var applicationDocumentsDirectory: NSURL = {
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count-1] as NSURL
    }()

    lazy var managedObjectModel: NSManagedObjectModel = {
        let modelURL = NSBundle.mainBundle().URLForResource("Informatur2", withExtension: "momd")!
        return NSManagedObjectModel(contentsOfURL: modelURL)!
    }()
    
    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator? = {
      
        var coordinator: NSPersistentStoreCoordinator? = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent("Informatur2.sqlite")
    
        
        if(!NSFileManager.defaultManager().fileExistsAtPath(url.path!)){
           
            var preloadUrl = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("Informatur2", ofType: "sqlite")!)
            
            
            var err: NSError? = nil
            
            if(!NSFileManager.defaultManager().copyItemAtURL(preloadUrl!, toURL: url, error: &err)){

                println("Buta la huea")

            }
        }
        
        var error: NSError? = nil
        var failureReason = "There was an error creating or loading the application's saved data."
        if coordinator!.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: nil, error: &error) == nil {
            coordinator = nil
            let dict = NSMutableDictionary()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data"
            dict[NSLocalizedFailureReasonErrorKey] = failureReason
            dict[NSUnderlyingErrorKey] = error
            error = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            // Replace this with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog("Unresolved error \(error), \(error!.userInfo)")
            abort()
        }
        
        return coordinator
    }()

    lazy var managedObjectContext: NSManagedObjectContext? = {
        let coordinator = self.persistentStoreCoordinator
        if coordinator == nil {
            return nil
        }
        var managedObjectContext = NSManagedObjectContext()
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        if let moc = self.managedObjectContext {
            var error: NSError? = nil
            if moc.hasChanges && !moc.save(&error) {
                NSLog("Unresolved error \(error), \(error!.userInfo)")
                abort()
            }
        }
    }

}

