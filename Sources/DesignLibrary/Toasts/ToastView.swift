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
            HStack(alignment: .center) {
                    model.style.icon
                        .renderingMode(.template)
                        .foregroundStyle(model.style.color)
                        .padding(.horizontal, .xSmall)
                    
                    VStack(alignment: .leading, spacing: .xxxSmall) {
                        if let title = model.style.title {
                            Text(title)
                                .font(.headline)
                                .foregroundStyle(Color(.text))
                                .lineLimit(nil)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        
                        Text(model.style.message)
                            .font(.body)
                            .foregroundStyle(Color(.text))
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
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
                .conditionalGlass(legacyColor: model.style.color.opacity(0.5))
                .frame(maxWidth: .infinity)
                .clipShape(RoundedRectangle(cornerRadius: .greatestFiniteMagnitude))
                .background(
                    RoundedRectangle(cornerRadius: .greatestFiniteMagnitude)
                        .stroke(lineWidth: 2)
                        .foregroundStyle(model.style.color)
                        .shadow(color: Color(.shadow).opacity(0.25), radius: 2, x: 1, y: 1)
                )
                .background(.clear)
                .padding(.all, .large)

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
        if #available(iOS 16.4, *) {
            VStack {
                ToastView(model: .init(style: .success(title: "title", message: "message"), shouldDismiss: { }))
                
                ToastView(model: .init(style: .info(title: "title", message: "message"), shouldDismiss: { }))
                
                ToastView(model: .init(style: .warning(title: "title", message: "message"), shouldDismiss: { }))
                
                ToastView(model: .init(style: .error(title: "title", message: "message"), shouldDismiss: { }))
            }
            .background(Color.clear)
            .presentationBackground(Color.clear)
        } else {
            // Fallback on earlier versions
        }
    }
}
