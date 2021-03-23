//
//  ViewRouter.swift
//  CornerFoldingMenu
//
//  Created by Brigette Valdez on 3/22/21.
//

import Foundation
import Combine

class ViewRouter: ObservableObject {
    
    @Published var currentTabIndex: Int
    
    init() {
        currentTabIndex = 0
    }
}

