//
//  AppleButtonLogin.swift
//  Rilabs Event
//
//  Created by Ari Supriatna on 11/10/20.
//

import SwiftUI
import AuthenticationServices

struct AppleButtonLogin: View {
  @Environment(\.colorScheme) var colorScheme
  @AppStorage("email") var email: String = ""
  @AppStorage("token") var token: String = ""
  @AppStorage("fullName") var fullName: String = ""
  
  var body: some View {
    VStack {
      SignInWithAppleButton(
        .signIn,
        onRequest: { request in
          request.requestedScopes = [.fullName, .email]
        },
        onCompletion: { result in
          switch result {
          case .success(let authorization):
            if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
              let authCode = appleIDCredential.authorizationCode
              let email = appleIDCredential.email
              
              if let authCode = authCode {
                if let token = String(bytes: authCode, encoding: .utf8) {
                  self.token = token
                  print("identityToken => \(String(token))")
                }
              }
              
              if let email = email {
                self.email = email
              }
            }
          case .failure(let error):
            print("Authorization failed: " + error.localizedDescription)
          }
        }
      ).signInWithAppleButtonStyle(colorScheme == .dark ? .white : .black)
    }
    .frame(height: 56)
    .padding(24)
  }
}

struct AppleButtonLogin_Previews: PreviewProvider {
  static var previews: some View {
    AppleButtonLogin()
  }
}
