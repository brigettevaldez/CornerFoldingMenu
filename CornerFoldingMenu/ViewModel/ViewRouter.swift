//
//  ViewRouter.swift
//  CornerFoldingMenu
//
//  Created by Brigette Valdez on 3/22/21.
//

import Foundation
import Combine


/// this class is created along with the App and controls the active page of the app throughout the lifecycle
class ViewRouter: ObservableObject {
    
    ///a pointer to this var is passed doown to the button's in the menu
    @Published var currentTabIndex: Int
    
    init() {
        currentTabIndex = 0
    }
}

