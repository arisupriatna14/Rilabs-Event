//
//  TicketDetailView.swift
//  Rilabs Event
//
//  Created by Ari Supriatna on 11/10/20.
//

import SwiftUI
import MobileCoreServices
import CoreImage.CIFilterBuiltins

struct TicketDetailView: View {
  var ticket: Ticket = tickets[1]
  @State var passcode = "2 6 4 8 2 4"
  @AppStorage("email") var email: String = ""
  
  let screenSize = UIScreen.main.bounds
  let context = CIContext()
  let filter = CIFilter.qrCodeGenerator()
  
  var body: some View {
    ScrollView {
      VStack {
        Image(ticket.image)
          .resizable()
          .scaledToFit()
        
        ticketInformation
        Divider()
        eventCodeAccess
      }
      .background(Color("cardColor2"))
      .cornerRadius(25)
      .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 10)
      .padding()
      
      buttonJoinEventOnline
    }
    .navigationTitle("My ticket")
  }
  
  @ViewBuilder
  var eventCodeAccess: some View {
    if ticket.eventType == "Online" {
      VStack(spacing: 16) {
        Text("Passcode")
          .font(.caption)
          .foregroundColor(.gray)
        
        Text(passcode)
          .font(.system(size: 20, weight: .semibold, design: .rounded))
          .contextMenu {
            Button(action: {
              UIPasteboard.general.string = self.passcode
            }) {
              Text("Copy to clipboard")
              Image(systemName: "doc.on.doc")
            }
          }
      }
      .padding(.all, 24)
    } else {
      Image(uiImage: generateQRCode(from: "\(email)\n\(passcode)"))
          .interpolation(.none)
          .resizable()
          .scaledToFit()
          .frame(width: 200, height: 200)
          .padding(.all, 24)
    }
  }
  
  @ViewBuilder
  var buttonJoinEventOnline: some View {
    #if !APPCLIP
    if ticket.eventType == "Online" {
      VStack {
        NavigationLink(destination: LivestreamLoginView()) {
          Text("Join Event")
            .foregroundColor(.white)
        }
      }
      .frame(width: screenSize.width - 128, height: 50)
      .background(Color.pink)
      .cornerRadius(30)
      .padding(.all, 24)
    }
    #endif
  }
  
  var ticketInformation: some View {
    VStack(alignment: .leading, spacing: 16) {
      Text(ticket.name)
        .font(.system(size: 24.0, weight: .semibold, design: .rounded))
      
      HStack {
        VStack(alignment: .leading, spacing: 8) {
          Text("Date")
            .font(.caption)
            .foregroundColor(.gray)
          
          Text("Oct. 12, 2020")
        }
        
        Spacer()
        
        VStack(alignment: .leading, spacing: 8) {
          Text("Time")
            .font(.caption)
            .foregroundColor(.gray)
          
          Text("07.30 PM")
        }
        
        Spacer()
      }
      
      VStack(alignment: .leading, spacing: 8) {
        Text("Place")
          .font(.caption)
          .foregroundColor(.gray)
        
        Text(ticket.location)
      }
    }
    .padding([.horizontal, .bottom], 24)
    .padding(.top, 8)
  }
}

extension TicketDetailView {
  func generateQRCode(from string: String) -> UIImage {
    let data = Data(string.utf8)
    filter.setValue(data, forKey: "inputMessage")
    
    if let outputImage = filter.outputImage {
      if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
        return UIImage(cgImage: cgimg)
      }
    }
    
    return UIImage(systemName: "xmark.circle") ?? UIImage()
  }
}

struct TicketDetailView_Previews: PreviewProvider {
  static var previews: some View {
    TicketDetailView()
  }
}
