//
//  MenuButton.swift
//  CornerFoldingMenu
//
//  Created by Brigette Valdez on 3/22/21.
//

import SwiftUI

struct MenuButton: View {
    
    var viewModel: MenuButtonViewModel
    @Binding var activeTabIndex: Int
    @Binding var open: Bool
    
    var body: some View {
        Button(action: {
            open = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                activeTabIndex = viewModel.btnIndex
            }
        }, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(activeTabIndex == viewModel.btnIndex ? viewModel.colorSet.selectedBckColor : .clear)
                viewModel.icon
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(activeTabIndex == viewModel.btnIndex ? viewModel.colorSet.selectedForegroundColor : viewModel.colorSet.foregroundColor)
                    .padding(.all, 10)
            }
        }).aspectRatio(1, contentMode: .fit)
       
    }
}

struct MenuButton_Previews: PreviewProvider {
    static var previews: some View {
        MenuButton(viewModel: MenuButtonViewModel(id: UUID(), btnIndex: 2, colorSet: MenuColorSet(), icon: Image("three")), activeTabIndex: .constant(1), open: .constant(true))
    }
}
