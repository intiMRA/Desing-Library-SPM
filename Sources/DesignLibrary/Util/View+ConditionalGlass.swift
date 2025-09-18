//
//  SwiftUIView.swift
//  DesignLibrary
//
//  Created by Inti Albuquerque on 19/09/2025.
//
import SwiftUI

extension View {
    @ViewBuilder
    func conditionalGlass() -> some View {
        if #available(iOS 26.0, *) {
            self
                .glassEffect()
        } else {
            self
        }
    }
}
