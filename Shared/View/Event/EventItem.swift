//
//  EventItem.swift
//  Rilabs Event
//
//  Created by Ari Supriatna on 10/10/20.
//

import SwiftUI

struct EventItem: View {
  var event: Event = dataEvent[0]
  
  var body: some View {
    VStack(alignment: .leading) {
      VStack(alignment: .leading) {
        Image(event.image)
          .resizable()
          .scaledToFit()
      }
      
      HStack {
        VStack(alignment: .leading, spacing: 16) {
          Text(event.name)
            .font(.system(size: 18.0, weight: .semibold, design: .rounded))
          
          Label("Oct. 12, 2020", systemImage: "calendar")
            .foregroundColor(Color("black"))
            .font(.caption)
        }
        .padding(.leading, 8)
        
        Spacer()
        
        Text(event.price)
          .foregroundColor(.white)
          .padding(8.0)
          .frame(width: 80)
          .background(Color(#colorLiteral(red: 0.9882352941, green: 0.4431372549, blue: 0.5450980392, alpha: 1)))
          .cornerRadius(20)
      }
      .padding()
    }
    .background(Color("cardColor2"))
    .cornerRadius(30)
    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 10)
  }
}

struct EventItem_Previews: PreviewProvider {
  static var previews: some View {
    EventItem(event: dataEvent[1])
  }
}
