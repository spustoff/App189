//
//  App189App.swift
//  App189
//
//  Created by IGOR on 09/09/2023.
//

import SwiftUI
import FirebaseCore
import ApphudSDK
import Amplitude

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Apphud.start(apiKey: "app_8gpEtn9nMdx7farAEB7hUJU1TauXjp")
        Amplitude.instance().initializeApiKey("59cfe1d7b10122ede47e2a7ee7f8fe93")

        FirebaseApp.configure()
        
        return true
    }
}

@main
struct App189App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        
        WindowGroup {
            
            NavigationView(content: {
                
                ContentView()
            })
        }
    }
}
