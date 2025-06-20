//
//  LottieView.swift
//
//
//  Created by ialbuquerque on 22/05/23.
//

import SwiftUI
import Lottie

public enum DesignAnimations {
    //loading
    case jumpLoading
    case skipLoading
    case pigeonLoading
    case fountain
    case standardLoading
    
    var animationName: String {
        switch self {
        case .jumpLoading:
            return "jumpLoading"
        case .skipLoading:
            return UITraitCollection.current.userInterfaceStyle == .light ? "skippingLoadingLight" : "skippingLoadingDark"
        case .pigeonLoading:
            return UITraitCollection.current.userInterfaceStyle == .light ? "pigeonLoadingLight" : "pigeonLoadingDark"
        case .fountain:
            return UITraitCollection.current.userInterfaceStyle == .light ? "fountainAnimationLight" : "fountainAnimationDark"
        case .standardLoading:
            return UITraitCollection.current.userInterfaceStyle == .light ? "standardLoading" : "standardLoadingDark"
            
        }
    }
}
 
public struct LottieView: UIViewRepresentable {
    let lottieFile: DesignAnimations
    let loopMode: LottieLoopMode
    
    let animationView = LottieAnimationView()
    
    public init(lottieFile: DesignAnimations, loopMode: LottieLoopMode = .loop) {
        self.lottieFile = lottieFile
        self.loopMode = loopMode
    }
    
    public func makeUIView(context: Context) -> some UIView {
        let view = UIView(frame: .zero)
 
        animationView.animation = LottieAnimation.named(lottieFile.animationName, bundle: .module)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.play()
 
        view.addSubview(animationView)
 
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        animationView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
 
        return view
    }
 
    public func updateUIView(_ uiView: UIViewType, context: Context) {
 
    }
}
