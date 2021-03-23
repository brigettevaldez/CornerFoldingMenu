//
//  CornerMenu.swift
//  CornerFoldingMenu
//
//  Created by Brigette Valdez on 3/22/21.
//

import SwiftUI

struct CornerMenu: View {
    
    @Binding var activeTabIndex: Int
    @State var open: Bool = false
    
    
    var btnVMs: [MenuButtonViewModel]
    
    
    private let iconWidth: CGFloat = 55
    private let angleInset: Double = 2
    private let menuIconWidth: CGFloat = 30
    private let innerCircleWidth: CGFloat = 150
    private let outerBoundaryClosed: CGFloat = 400
    private let outerBoundaryOpen: CGFloat = 800
    
    
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
            //for each MenuButtonViewModel provided by parent class
            ForEach(btnVMs) { viewModel in
                VStack {
                    MenuButton(viewModel: viewModel, activeTabIndex: $activeTabIndex, open: $open)
                        .rotationEffect(Angle(degrees: getAngle(vm: viewModel)), anchor: .center) //rotate button clockwise so it will be aligned vertically
                        .animation(.easeOut)
                    Spacer()
                }.frame(width: iconWidth, height: open ? outerBoundaryClosed : outerBoundaryOpen)
                .rotationEffect(Angle(degrees: getAngle(vm: viewModel) * -1), anchor: .center)
                .animation(.easeOut)
            }.rotationEffect(open ? Angle(degrees: 0) : Angle(degrees: -90))
            .animation(.easeOut)
        }
    }
    
    
    /// middle circle button with hamburger icon
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
        let angleStride = (90.0 - (2 * angleInset)) / Double(btnVMs.count)
        let A = 90.0 - angleInset - (Double(vm.btnIndex) * angleStride)
        return A
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
