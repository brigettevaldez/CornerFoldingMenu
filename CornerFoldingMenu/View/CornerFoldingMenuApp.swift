//
//  CornerFoldingMenuApp.swift
//  CornerFoldingMenu
//
//  Created by Brigette Valdez on 3/22/21.
//

import SwiftUI

@main
struct CornerFoldingMenuApp: App {
    
    @ObservedObject var viewRouter: ViewRouter
    
    init() {
        self.viewRouter = ViewRouter()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewRouter)
        }
    }
}
