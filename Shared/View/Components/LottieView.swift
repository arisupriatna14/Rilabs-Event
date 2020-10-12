//
//  LottieView.swift
//  Rilabs Event
//
//  Created by Ari Supriatna on 11/10/20.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
  let animationView = AnimationView()
  var filename: String
  
  func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
    let view = UIView()
    
    let animation = Animation.named(filename)
    animationView.animation = animation
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
  
  func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {}
}
