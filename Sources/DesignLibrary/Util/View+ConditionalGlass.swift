//
//  SwiftUIView.swift
//  DesignLibrary
//
//  Created by Inti Albuquerque on 19/09/2025.
//
import SwiftUI

extension View {
    @ViewBuilder
    func conditionalGlass(tint: Color? = nil, legacyColor: Color? = nil) -> some View {
        if #available(iOS 26.0, *) {
            if let tint {
                self
                    .glassEffect(.regular.tint(tint))
            }
            else {
                self
                    .glassEffect()
            }
        } else {
            if let legacyColor {
                self
                    .background(legacyColor)
            }
            else {
                self
            }
        }
    }
}
