//
//  ListAndNavigationApp.swift
//  ListAndNavigation
//
//  Created by Umang Kedan on 03/05/24.
//

import SwiftUI

@main
struct ListAndNavigationApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(modelData)
        }
    }
}
