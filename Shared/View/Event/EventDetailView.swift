//
//  EventDetail.swift
//  Rilabs Event
//
//  Created by Ari Supriatna on 10/10/20.
//

import SwiftUI

struct EventDetailView: View {
  var event: Event = dataEvent[1]
  @State private var showModalPresenting = false
  
  var bottomBar: some View {
    VStack(spacing: 0) {
      Divider()
      PaymentButton(action: {})
        .padding(.horizontal, 40)
        .padding(.vertical, 16)
        .onTapGesture {
          self.showModalPresenting.toggle()
        }
    }
    .background(VisualEffectBlur().edgesIgnoringSafeArea(.all))
  }
  
  var body: some View {
    ScrollView {
      LazyVStack {
        Image(event.image)
          .resizable()
          .scaledToFit()
          .cornerRadius(30)
          .padding(.all)
        
        contentDescription
          .padding(.bottom, 100)
      }
    }
    .overlay(bottomBar, alignment: .bottom)
    .sheet(isPresented: $showModalPresenting) {
      modalPaymentSuccess
    }
    .navigationTitle(event.name)
  }
  
  var modalPaymentSuccess: some View {
    Group {
      #if !APPCLIP
      VStack {
        LottieView(filename: "success")
          .frame(height: 300)
        
        Text("Your payment was successful")
          .font(.system(size: 20, weight: .semibold, design: .rounded))
          .padding(.top, 24)
      }
      #else
      VStack {
        Image("asset_success")
          .resizable()
          .scaledToFit()
          .frame(width: 250)
        
        Text("Your payment was successful")
          .font(.system(size: 20, weight: .semibold, design: .rounded))
          .padding(.top, 24)
      }
      #endif
    }
  }
  
  var contentDescription: some View {
    VStack(alignment: .leading, spacing: 8) {
      Text(event.eventType)
        .foregroundColor(.white)
        .font(.caption)
        .frame(width: 60, height: 25)
        .background(Color.blue)
        .cornerRadius(4)
      
      VStack(alignment: .leading, spacing: 8) {
        Text(event.name)
          .font(.system(size: 18.0, weight: .semibold, design: .rounded))
        
        Label("Oct. 12, 2020", systemImage: "calendar")
          .font(.footnote)
        
        Label("3.30 PM - 10.00 PM", systemImage: "clock")
          .font(.footnote)
        
        Label(event.location, systemImage: "mappin.circle")
          .font(.footnote)
      }
      
      VStack(alignment: .leading, spacing: 8) {
        Text("Description")
          .font(.system(size: 16.0, weight: .semibold, design: .rounded))
        
        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
      }
      .padding(.vertical)
      
      VStack(alignment: .leading, spacing: 16) {
        Text("What You Should Know")
          .font(.system(size: 16.0, weight: .semibold, design: .rounded))
        
        HStack {
          Text("Ticket Exchange")
          
          Spacer()
          
          Button(action: {}) {
            Text("Detail")
          }
        }
        Divider()
        HStack {
          Text("Terms & Conditions")
          
          Spacer()
          
          Button(action: {}) {
            Text("Detail")
          }
        }
        Divider()
        HStack {
          Text("Other Information")
          
          Spacer()
          
          Button(action: {}) {
            Text("Detail")
          }
        }
        Divider()
      }
    }
    .padding([.horizontal], 16)
  }
}

struct EventDetailView_Previews: PreviewProvider {
  static var previews: some View {
    EventDetailView()
  }
}
