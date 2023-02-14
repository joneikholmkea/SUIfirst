//
//  SUIfirstApp.swift
//  SUIfirst
//
//  Created by Jon Eikholm on 01/12/2022.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}


@main
struct SUIfirstApp: App {
    
    // register app delegate for Firebase setup
      @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
//        WindowGroup(content: () -> {
//            DeleteMeView()
//        })
        
        
        return WindowGroup(content: { () in
            return ListDemo()
        })
    }
    
    
}
