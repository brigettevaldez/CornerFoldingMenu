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
        
        ///create MenuButtonViewModel's for each menu button you want to render and add them to btnViewModels
        //-----------------------------------------------------------------------
        let one = MenuButtonViewModel(id: UUID(), btnIndex: 0, colorSet: colorSet, icon: Image("one"))
        let two = MenuButtonViewModel(id: UUID(), btnIndex: 1, colorSet: colorSet, icon: Image("two"))
        let three = MenuButtonViewModel(id: UUID(), btnIndex: 2, colorSet: colorSet, icon: Image("three"))
        let four = MenuButtonViewModel(id: UUID(), btnIndex: 3, colorSet: colorSet, icon: Image("four"))

        btnViewModels = [one, two, three, four]
        //-----------------------------------------------------------------------
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                //this switch monitors the viewRouter.currentTabIndex and re render's the screen when it is changed. A case is needed for each button in the menu
                switch viewRouter.currentTabIndex {
                case 0:
                    PageZero()
                case 1:
                    PageOne()
                case 2:
                    PageTwo()
                case 3:
                    PageThree()
                default:
                    DefaultPage()
                }
                
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
