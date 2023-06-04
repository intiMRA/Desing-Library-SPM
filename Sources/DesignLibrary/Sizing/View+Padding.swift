//
//  View+Padding.swift
//  
//
//  Created by ialbuquerque on 22/05/23.
//

import Foundation
import SwiftUI

public enum CommonPadding: CGFloat {
    case empty = 0
    case xxxSmall = 2
    case xxSmall = 4
    case xSmall = 8
    case small = 12
    case medium = 16
    case large = 20
    case xLarge = 24
    case xxLarge = 28
    case xxxLarge = 40
}

public enum CommonSizes: CGFloat {
    case small = 50
    case medium = 100
    case large = 200
    case xLarge = 300
}

public enum IconSize {
    case small
    case large
    case standard
    case custom(size: CGFloat)
    
    public func value() -> CGFloat {
        switch self {
        case .small:
            return 16
        case .standard:
            return 24
        case .large:
            return 32
        case .custom(let size):
            return size
        }
    }
}

public extension Image {
    func icon(size: IconSize = .standard, color: Color = .black, alignment: Alignment = .center) -> some View {
        self
            .renderingMode(.template)
            .resizable()
            .frame(width: size.value(), height: size.value(), alignment: alignment)
            .foregroundColor(color)
    }
    
    func icon(width: IconSize, height: IconSize, color: Color = .black, alignment: Alignment = .center) -> some View {
        self
            .renderingMode(.template)
            .resizable()
            .frame(width: width.value(), height: height.value(), alignment: alignment)
            .foregroundColor(color)
    }
    
    func sized(size: IconSize) -> some View {
        self
            .sized(width: size, height: size)
    }
    
    func sized(width: IconSize, height: IconSize) -> some View {
        self
            .resizable()
            .frame(width: width.value(), height: height.value())
    }
}

public extension View {
    func squareFrame(size: CGFloat, alignment: Alignment = .center) -> some View {
        self
            .frame(width: size, height: size, alignment: alignment)
    }
    
    func squareFrame(size: CommonSizes, alignment: Alignment = .center) -> some View {
        self
            .squareFrame(size: size.rawValue, alignment: alignment)
    }
    
    func padding(_ edges: Edge.Set = .all, _ size: CommonPadding) -> some View {
        self.padding(edges, size.rawValue)
    }
    
    func padding(leading: CommonPadding = .empty, trailing: CommonPadding = .empty, top: CommonPadding = .empty, bottom: CommonPadding = .empty) -> some View {
        self
            .padding(.leading, leading.rawValue)
            .padding(.trailing, trailing.rawValue)
            .padding(.top, top.rawValue)
            .padding(.bottom, bottom.rawValue)
    }
}

public extension VStack {
    init(alignment: HorizontalAlignment = .center, spacing: CommonPadding, @ViewBuilder content: () -> Content) {
        self.init(alignment: alignment, spacing: spacing.rawValue, content: content)
    }
}

public extension HStack {
    init(alignment: VerticalAlignment = .center, spacing: CommonPadding, @ViewBuilder content: () -> Content) {
        self.init(alignment: alignment, spacing: spacing.rawValue, content: content)
    }
}

public extension LazyVStack {
    init(alignment: HorizontalAlignment = .center, spacing: CommonPadding, pinnedViews: PinnedScrollableViews = .init(), @ViewBuilder content: () -> Content) {
        self.init(alignment: alignment, spacing: spacing.rawValue, pinnedViews: pinnedViews, content: content)
    }
}

public extension LazyHStack {
    init(alignment: VerticalAlignment = .center, spacing: CommonPadding, pinnedViews: PinnedScrollableViews = .init(), @ViewBuilder content: () -> Content) {
        self.init(alignment: alignment, spacing: spacing.rawValue, pinnedViews: pinnedViews, content: content)
    }
}

