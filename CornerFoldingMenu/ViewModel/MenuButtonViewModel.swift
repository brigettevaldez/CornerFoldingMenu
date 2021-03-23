//
//  MenuButtonViewModel.swift
//  CornerFoldingMenu
//
//  Created by Brigette Valdez on 3/22/21.
//

import Foundation
import SwiftUI

struct MenuButtonViewModel: Identifiable {
    var id: UUID
    var btnIndex: Int
    var colorSet: MenuColorSet
    var icon: Image
}

struct MenuColorSet {
    let selectedBckColor: Color = .blue
    let selectedForegroundColor: Color = .white
    let foregroundColor: Color = .gray
}


