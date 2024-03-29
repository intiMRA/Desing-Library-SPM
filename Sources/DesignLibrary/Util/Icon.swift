//
//  Icon.swift
//  
//
//  Created by ialbuquerque on 4/06/23.
//

import Foundation
import SwiftUI

public enum IconNames: String {
    case list, bag, chevron, tick
}

public struct Icon: View {
    let iconName: IconNames
    let size: IconSize
    let color: Color
    
    public init(
        iconName: IconNames,
        size: IconSize = .standard,
        color: Color =  UITraitCollection.current.userInterfaceStyle == .light ? .black : .white) {
            self.iconName = iconName
            self.size = size
            self.color = color
    }
    public var body: some View {
        Image(iconName.rawValue, bundle: .module)
            .icon(size: size, color: color)
    }
}
