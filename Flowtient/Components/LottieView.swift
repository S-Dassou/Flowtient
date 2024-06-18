//
//  LottieShieldView.swift
//  Flowtient
//
//  Created by shafique dassu on 18/06/2024.
//

import Foundation
import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    var filename: String
    
        func makeUIView(context: Context) -> UIView {
            let view = UIView(frame: .zero)
            let animationView = LottieAnimationView(name: filename)
            animationView.contentMode = .scaleAspectFit
            animationView.loopMode = .loop
            animationView.play()

            animationView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(animationView)

            NSLayoutConstraint.activate([
                animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
                animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
            ])

            return view
        }

        func updateUIView(_ uiView: UIView, context: Context) {}
}


