//
//  ToastModel.swift
//  DesignLibrary
//
//  Created by ialbuquerque on 18/03/2025.
//
import Foundation
import SwiftUI

public enum ToastStyle {
    
    var color: Color {
        switch self {
        case .warning:
            return Color(.toastWarning)
        case .info:
            return Color(.toastInfo)
        case .error:
            return Color(.toastError)
        case .success:
            return Color(.toastSuccess)
        }
    }
    
    var icon: Image {
        switch self {
        case .info:
            return Image(systemName: "info.circle.fill")
        case .warning:
            return Image(systemName: "exclamationmark.triangle.fill")
        case .success:
            return Image(systemName: "checkmark.circle.fill")
        case .error:
            return Image(systemName: "xmark.circle.fill")
        }
    }
    
    var title: String? {
        switch self {
        case .warning(let title, _):
            return title
        case .info(let title, _):
            return title
        case .error(let title, _):
            return title
        case .success(let title, _):
            return title
        }
    }
    
    var message: String {
        switch self {
        case .warning(_, let message):
            return message
        case .info(_, let message):
            return message
        case .error(_, let message):
            return message
        case .success(_, let message):
            return message
        }
    }
    
    case warning(title: String? = nil, message: String)
    case info(title: String? = nil, message: String)
    case error(title: String? = nil, message: String)
    case success(title: String? = nil, message: String)
}

@MainActor
public class ToastModel {
    private let timeToDismiss = 10
    let style: ToastStyle
    let shouldDismiss: () -> Void
    
    public init(style: ToastStyle, shouldDismiss: @escaping () -> Void) {
        self.style = style
        self.shouldDismiss = shouldDismiss
    }
    
    func setDismissTimer() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(timeToDismiss)) { [weak self] in
            self?.shouldDismiss()
        }
    }
}
