//
//  CornerMenu.swift
//  CornerFoldingMenu
//
//  Created by Brigette Valdez on 3/22/21.
//

import SwiftUI

struct CornerMenu: View {
    
    @Binding var activeTabIndex: Int
    @State var open: Bool = true
    
    var btnVMs: [MenuButtonViewModel]
    
    
    var iconWidth: CGFloat = 55
    var angleInset: Double = 2
    var menuIconWidth: CGFloat = 30
    var innerCircleWidth: CGFloat = 150
    var outerBoundaryClosed: CGFloat = 400
    var outerBoundaryOpen: CGFloat = 800
    
    init(activeTabIndex: Binding<Int>, btnViewModels: [MenuButtonViewModel]) {
        self._activeTabIndex = activeTabIndex
        btnVMs = btnViewModels
    }
    
    var body: some View {
        GeometryReader { geo in
            menuUI
                .offset(x: geo.size.width - (innerCircleWidth / 2), y: geo.size.height - (open ? outerBoundaryClosed / 2 : outerBoundaryOpen / 2))
        }
    }
    
    var menuUI: some View {
        ZStack {
            openCloseButton
            ForEach(btnVMs) { viewModel in
                VStack {
                    MenuButton(viewModel: viewModel, activeTabIndex: $activeTabIndex)
                        .rotationEffect(Angle(degrees: getAngle(vm: viewModel)), anchor: .center)
                        .animation(.easeOut)
                    Spacer()
                }.frame(width: iconWidth, height: open ? outerBoundaryClosed : outerBoundaryOpen)
                .rotationEffect(Angle(degrees: getAngle(vm: viewModel) * -1), anchor: .center)
                .animation(.easeOut)
            }.rotationEffect(open ? Angle(degrees: 0) : Angle(degrees: -90))
            .animation(.easeOut)
        }
    }
    
    var openCloseButton: some View {
        Button(action: {
            open.toggle()
        }, label: {
            ZStack {
                Circle()
                    .foregroundColor(.black)
                    .frame(width: innerCircleWidth, height: innerCircleWidth, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Image("hamburger")
                    .renderingMode(.template)
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: menuIconWidth, height: menuIconWidth, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .offset(x: -menuIconWidth, y: -menuIconWidth)
            }
        })
    }
    
    func getAngle(vm: MenuButtonViewModel) -> Double {
        let a = (90.0 - (2 * angleInset)) / Double(btnVMs.count)
        let b = 90.0 - angleInset - (Double(vm.btnIndex) * a)
        return b
    }
    
}


struct CornerMenu_Previews: PreviewProvider {
    static var previews: some View {
        CornerMenu(activeTabIndex: .constant(1), btnViewModels: [
            MenuButtonViewModel(id: UUID(), btnIndex: 0, colorSet: MenuColorSet(), icon: Image("one")),
            MenuButtonViewModel(id: UUID(), btnIndex: 1, colorSet: MenuColorSet(), icon: Image("two")),
            MenuButtonViewModel(id: UUID(), btnIndex: 2, colorSet: MenuColorSet(), icon: Image("three"))
        ])
    }
}
