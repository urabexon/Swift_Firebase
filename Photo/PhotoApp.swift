//
//  PhotoApp.swift
//  Photo
//
//  Created by Hiroki Urabe on 2025/02/22.
//

import SwiftUI
import FirebaseCore

class AppDelete: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct PhotoApp: App {
    @UIApplicationDelegateAdaptor(AppDelete.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
