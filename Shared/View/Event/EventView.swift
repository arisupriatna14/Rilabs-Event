//
//  EventView.swift
//  Rilabs Event
//
//  Created by Ari Supriatna on 10/10/20.
//

import SwiftUI

struct EventView: View {
  let columns: [GridItem] = [GridItem(.adaptive(minimum: 160), spacing: 16)]
  var screenSize = UIScreen.main.bounds
  #if APPCLIP
  let dataLocalEvents: [Event] = localEventsOffline
  #else
  let dataLocalEvents: [Event] = localEventsOnline
  #endif
  
  var body: some View {
    ScrollView {
      #if !APPCLIP
      VStack(alignment: .leading) {
        HStack(alignment: .top) {
          Text("Top Global Events")
            .font(.system(size: 20, weight: .semibold, design: .rounded))
            .fontWeight(.semibold)
          
          Spacer()
          
          Text("See All")
            .foregroundColor(.gray)
        }
        .padding(.top, 24)
        .padding([.horizontal, .bottom])
        
        ScrollView(.horizontal) {
          LazyHStack(spacing: 8) {
            ForEach(dataEvent) { item in
              NavigationLink(destination: EventDetailView(event: item)) {
                GridEventItem.Horizontal(event: item)
                  .frame(width: screenSize.width - 32, height: 180)
              }
            }
          }
          .padding([.horizontal, .bottom])
        }
      }
      #endif
      
      VStack(alignment: .leading) {
        #if !APPCLIP
        HStack(alignment: .top) {
          Text("Local Events")
            .font(.system(size: 20, weight: .semibold, design: .rounded))
            .fontWeight(.semibold)
          
          Spacer()
          
          Text("See All")
            .foregroundColor(.gray)
        }
        .padding(.horizontal)
        #endif
        
        LazyVStack(spacing: 0) {
          LazyVGrid(columns: columns, alignment: .leading, spacing: 16) {
            ForEach(dataLocalEvents) { item in
              NavigationLink(destination: EventDetailView(event: item)) {
                GridEventItem(event: item)
                  .frame(width: 185)
              }
            }
          }
        }
        .padding(.all)
      }
      
      #if !APPCLIP
      LazyVStack(alignment: .leading, spacing: 0) {
        Text("Upcoming Events")
          .font(.system(size: 20, weight: .semibold, design: .rounded))
          .fontWeight(.semibold)
          .padding(.top, 24)
        
        ForEach(upcomingEvents) { item in
          EventItem(event: item)
            .padding(.vertical)
        }
      }
      .padding()
      #endif
    }
    .navigationTitle("Event")
  }
}

struct EventView_Previews: PreviewProvider {
  static var previews: some View {
    EventView()
  }
}
