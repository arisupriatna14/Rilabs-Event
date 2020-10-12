//
//  Rilabs_EventApp.swift
//  Rilabs Event
//
//  Created by Ari Supriatna on 10/10/20.
//

import SwiftUI
import StreamChatClient

@main
struct Rilabs_EventApp: App {
  @AppStorage("token") var token: String = "zasdfsa"
  
  init() {
    Client.configureShared(.init(apiKey: "aetrvtyepenj", logOptions: .info))
  }

  var body: some Scene {
    WindowGroup {
      if token.isEmpty {
        OnboardingView()
      } else {
        ContentView()
      }
    }
  }
}
