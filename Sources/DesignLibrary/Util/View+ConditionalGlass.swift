//
//  SwiftUIView.swift
//  DesignLibrary
//
//  Created by Inti Albuquerque on 19/09/2025.
//
import SwiftUI

extension View {
    @ViewBuilder
    func conditionalGlass(titnt: Color? = nil) -> some View {
        if #available(iOS 26.0, *) {
            if let titnt {
                self
                    .glassEffect(.regular.tint(titnt))
            }
            else {
                self
                    .glassEffect()
            }
        } else {
            self
                .background(titnt)
        }
    }
}
