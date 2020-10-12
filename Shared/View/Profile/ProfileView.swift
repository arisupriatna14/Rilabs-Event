//
//  ProfileView.swift
//  Rilabs Event
//
//  Created by Ari Supriatna on 10/10/20.
//

import SwiftUI

struct ProfileView: View {
  @AppStorage("token") var token: String = ""
  
  var body: some View {
    ScrollView {
      VStack {
        Image("ari")
          .resizable()
          .scaledToFit()
          .clipShape(Circle())
          .frame(width: 100, height: 100)
        
        Text("Ari Supriatna")
          .font(.title2)
          .fontWeight(.medium)
        
        Text("ari.supriatna@rilabs.com")
          .font(.callout)
          .padding(.bottom)
      }
      .padding([.horizontal, .top])
      
      VStack(alignment: .leading, spacing: 24) {
        Divider()
        NavigationLink(destination: Text("Personal Details")) {
          HStack {
            Label("Personal Details", systemImage: "person.circle")
              .foregroundColor(Color("black"))
            Spacer()
            Image(systemName: "chevron.right")
              .foregroundColor(Color("black"))
          }
        }
        
        NavigationLink(destination: Text("Notification page")) {
          HStack {
            Label("Notification Centre", systemImage: "bell.badge")
              .foregroundColor(Color("black"))
            Spacer()
            Image(systemName: "chevron.right")
              .foregroundColor(Color("black"))
          }
        }
        
        NavigationLink(destination: Text("Privacy & Security")) {
          HStack {
            Label("Privacy & Security", systemImage: "lock.circle")
              .foregroundColor(Color("black"))
            Spacer()
            Image(systemName: "chevron.right")
              .foregroundColor(Color("black"))
          }
        }
        
        NavigationLink(destination: Text("Help Centre")) {
          HStack {
            Label("Help Centre", systemImage: "exclamationmark.bubble")
              .foregroundColor(Color("black"))
            Spacer()
            Image(systemName: "chevron.right")
              .foregroundColor(Color("black"))
          }
        }
        
        Divider()
        
        HStack {
          Text("Logout")
            .foregroundColor(Color("black"))
          Spacer()
          Image(systemName: "chevron.right")
            .foregroundColor(Color("black"))
        }
        .onTapGesture {
          self.token = ""
        }
      }
      .padding(.all)
    }
    .navigationTitle("Profile")
  }
}

struct ProfileView_Previews: PreviewProvider {
  static var previews: some View {
    ProfileView()
  }
}
