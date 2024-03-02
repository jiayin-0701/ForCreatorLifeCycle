//
//  ForCreatorLifeCycleApp.swift
//  ForCreatorLifeCycle
//
//  Created by Cute Puppy on 2024/2/21.
//

import SwiftUI

@main
struct ForCreatorLifeCycleApp: App {
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: scenePhase) { newScenePhase in
            switch newScenePhase {
            case .active:
                print("Foreground Active")
            case .inactive:
                print("Foreground Inactive")
            case .background:
                print("Background")
            @unknown default:
                print("Error")
            }
        }
    }
}
