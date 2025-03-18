//
//  ToastView.swift
//  DesignLibrary
//
//  Created by ialbuquerque on 18/03/2025.
//

import SwiftUI

public struct ToastView: View {
    let model: ToastModel
    
    public init(model: ToastModel) {
        self.model = model
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            HStack {
                model.style.icon
                    .renderingMode(.template)
                    .foregroundStyle(model.style.color)
                    .padding(.horizontal, .xSmall)
                
                VStack(alignment: .leading, spacing: .xxxSmall) {
                    if let title = model.style.title {
                        Text(title)
                            .font(.headline)
                            .foregroundStyle(Color(.text))
                    }
                    
                    Text(model.style.message)
                        .font(.body)
                        .foregroundStyle(Color(.text))
                }
                
                Spacer()
                
                Button {
                    model.shouldDismiss()
                     } label: {
                       Image(systemName: "xmark")
                             .foregroundColor(model.style.color)
                     }
            }
            .padding()
            .background(model.style.color.opacity(0.3))
            .frame(maxWidth: .infinity)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(lineWidth: 1)
                    .foregroundStyle(model.style.color)
                    .shadow(color: Color(.shadow).opacity(0.25), radius: 2, x: 1, y: 1)
            )
            .padding(.all, .medium)
            .background(.background)
        }
        .task {
            model.setDismissTimer()
        }
    }
}

#Preview {
    VStack {
        
    }
    .sheet(isPresented: .constant(true)) {
        VStack {
            ToastView(model: .init(style: .success(title: "title", message: "message"), shouldDismiss: { }))
            
            ToastView(model: .init(style: .info(title: "title", message: "message"), shouldDismiss: { }))
            
            ToastView(model: .init(style: .warning(title: "title", message: "message"), shouldDismiss: { }))
            
            ToastView(model: .init(style: .error(title: "title", message: "message"), shouldDismiss: { }))
        }
    }
}
