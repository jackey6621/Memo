//
//  AppDelegate.swift
//  Memo
//
//  Created by Jingyuan Yang on 3/20/23.
//

import UIKit
import Parse
import ParseSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let configuration = ParseClientConfiguration {
            $0.applicationId = "vMcEtS3P7wOzr17Am8gazdB7aYd4IXIYb0nz2bLy"
            $0.clientKey = "NlN9mwRT0ulbcIwKpVqspJsmtr8aQHgbVGPzNXEM"
            $0.server = "https://parseapi.back4app.com"
        }
        Parse.initialize(with: configuration)
        
        ParseSwift.initialize(applicationId: "vMcEtS3P7wOzr17Am8gazdB7aYd4IXIYb0nz2bLy",
                              clientKey: "NlN9mwRT0ulbcIwKpVqspJsmtr8aQHgbVGPzNXEM",
                              serverURL: URL(string: "https://parseapi.back4app.com")!)

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


}

