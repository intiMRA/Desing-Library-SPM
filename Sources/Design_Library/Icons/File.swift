//
//  File.swift
//  
//
//  Created by ialbuquerque on 4/06/23.
//

import Foundation
import SwiftUI

public enum IconNames: String {
    case search, list, bag
}

public struct Icon: View {
    let iconName: IconNames
    let size: IconSize
    let color: Color
    
    var body: some View {
        Image(iconName.rawValue)
            .icon(size: IconSize, color: color)
    }
}
