//
//  TicketItem.swift
//  Rilabs Event
//
//  Created by Ari Supriatna on 11/10/20.
//

import SwiftUI

struct TicketItem: View {
  var ticket: Ticket = tickets[0]
  
  var body: some View {
    HStack {
      Image(ticket.image)
        .resizable()
        .scaledToFit()
        .cornerRadius(8)
        .frame(width: 130)
      
      VStack(alignment: .leading, spacing: 8) {
        Text(ticket.name)
          .font(.system(size: 16, weight: .semibold, design: .rounded))
          .foregroundColor(Color("black"))
          .lineLimit(2)
        
        HStack {
          VStack(alignment: .leading, spacing: 8) {
            Text("Date")
              .font(.caption)
              .foregroundColor(.gray)
            
            Text("Oct. 12, 2020")
          }
          
          VStack(alignment: .leading, spacing: 8) {
            Text("Time")
              .font(.caption)
              .foregroundColor(.gray)
            
            Text("07.30 PM")
          }
        }
      }
      .padding(.leading, 8)
      
      Spacer()
    }
  }
}

struct TicketItem_Previews: PreviewProvider {
  static var previews: some View {
    TicketItem()
  }
}
