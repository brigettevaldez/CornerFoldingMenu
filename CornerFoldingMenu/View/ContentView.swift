//
//  ContentView.swift
//  CornerFoldingMenu
//
//  Created by Brigette Valdez on 3/22/21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    private var btnViewModels: [MenuButtonViewModel]
    
    init() {
        let colorSet = MenuColorSet()
        let one = MenuButtonViewModel(id: UUID(), btnIndex: 0, colorSet: colorSet, icon: Image("one"))
        let two = MenuButtonViewModel(id: UUID(), btnIndex: 1, colorSet: colorSet, icon: Image("two"))
        let three = MenuButtonViewModel(id: UUID(), btnIndex: 2, colorSet: colorSet, icon: Image("three"))
        let four = MenuButtonViewModel(id: UUID(), btnIndex: 3, colorSet: colorSet, icon: Image("four"))

        btnViewModels = [one, two, three, four]
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                CornerMenu(activeTabIndex: $viewRouter.currentTabIndex, btnViewModels: btnViewModels)
                   
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewRouter())
    }
}
