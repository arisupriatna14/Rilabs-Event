//
//  OnboardingView.swift
//  Rilabs Event
//
//  Created by Ari Supriatna on 11/10/20.
//

import SwiftUI

struct OnboardingView: View {
  var screenSize: CGSize = UIScreen.main.bounds.size
  
  var bottom: some View {
    VStack {
      Divider()
      AppleButtonLogin()
    }
    .background(VisualEffectBlur(blurStyle: .systemThickMaterial).edgesIgnoringSafeArea(.all))
  }
  
  var body: some View {
    TabView {
      VStack {
        LottieView(filename: "music")
          .frame(height: 300)
        
        Text("Welcome to Rilabs Event")
          .font(.system(size: 20, weight: .semibold, design: .rounded))
          .padding(.top, 24)
      }
      .offset(y: -100)
      
      VStack {
        LottieView(filename: "violin-music-with-note")
          .frame(height: 300)
        
        Text("Welcome to Rilabs Event")
          .font(.system(size: 20, weight: .semibold, design: .rounded))
          .padding(.top, 24)
      }
      .offset(y: -100)
      
      VStack {
        LottieView(filename: "calendar-booking")
          .frame(height: 300)
        
        Text("Welcome to Rilabs Event")
          .font(.system(size: 20, weight: .semibold, design: .rounded))
          .padding(.top, 24)
      }
      .offset(y: -100)
    }
    .tabViewStyle(PageTabViewStyle())
    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    .overlay(bottom, alignment: .bottom)
  }
}

struct OnboardingView_Previews: PreviewProvider {
  static var previews: some View {
    OnboardingView()
  }
}
