//
//  LivestreamLoginView.swift
//  Rilabs Event
//
//  Created by Ari Supriatna on 12/10/20.
//

import SwiftUI
import StreamChatClient

struct LivestreamLoginView: View {
  @State private var username: String = ""
  @State private var joinCode: String = ""
  @State private var success: Bool?
  let passcode = "2 6 4 8 2 4"
  
  var body: some View {
    VStack {
      VStack {
        TextField("Type username", text: $username)
          .padding()
        
        Divider()
        
        TextField("Type passcode", text: $joinCode)
          .padding()
      }
      .padding()
      
      NavigationLink(destination: LivestreamView(), tag: true, selection: $success) {
        EmptyView()
      }
      
      Button(action: logIn) {
        Text("Login")
      }
    }
    .frame(maxHeight: .infinity, alignment: .top)
    .navigationBarTitle("Login", displayMode: .inline)
  }
}

extension LivestreamLoginView {
  func logIn() {
    Client.shared.set(user: User(id: username), token: .development) { result in
      switch result {
      case .success:
        self.success = true
      case .failure:
        self.success = false
      }
    }
  }
}

struct LivestreamLoginView_Previews: PreviewProvider {
  static var previews: some View {
    LivestreamLoginView()
  }
}
