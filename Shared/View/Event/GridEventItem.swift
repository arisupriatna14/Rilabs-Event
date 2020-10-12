//
//  GridItemEvent.swift
//  Rilabs Event
//
//  Created by Ari Supriatna on 10/10/20.
//

import SwiftUI

struct GridEventItem: View {
  var event: Event = dataEvent[0]
  var screenSize = UIScreen.main.bounds
  
  struct Horizontal: View {
    var event: Event = dataEvent[0]
    
    var body: some View {
      HStack {
        Image(event.image)
          .resizable()
          .scaledToFit()
          .cornerRadius(16)
        
        VStack(alignment: .leading, spacing: 8) {
          Text(event.eventType)
            .font(.caption)
            .foregroundColor(.gray)

          Text(event.name)
            .font(.system(size: 16, weight: .semibold, design: .rounded))
            .foregroundColor(Color("black"))
            .lineLimit(2)
          
          Label("Oct. 12, 2020", systemImage: "calendar")
            .foregroundColor(Color("black"))
            .font(.caption)

          Label(event.price, systemImage: "ticket")
            .font(.footnote)
            .foregroundColor(Color("black"))
        }
        .padding(.leading, 8)
      }
      .padding(.all, 8)
      .background(Color("cardColor2"))
      .cornerRadius(20.0)
      .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
    }
  }
  
  var body: some View {
    VStack(alignment: .leading) {
      Image(event.image)
        .resizable()
        .scaledToFit()
        .cornerRadius(20)
      
      VStack(alignment: .leading, spacing: 8) {
        Text(event.eventType)
          .font(.caption)
          .foregroundColor(.gray)

        Text(event.name)
          .font(.system(size: 16, weight: .semibold, design: .rounded))
          .foregroundColor(Color("black"))
          .lineLimit(2)
        
        Label("Oct. 12, 2020", systemImage: "calendar")
          .foregroundColor(Color("black"))
          .font(.caption)

        Label(event.price, systemImage: "ticket")
          .font(.footnote)
          .foregroundColor(Color("black"))
      }
      .padding(.all, 8)
    }
    .padding(.all, 8)
    .background(Color("cardColor2"))
    .cornerRadius(20.0)
    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 10)
  }
}

struct GridEventItem_Previews: PreviewProvider {
  static var previews: some View {
    GridEventItem()
  }
}
