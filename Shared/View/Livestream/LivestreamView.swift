//
//  LivestreamView.swift
//  Rilabs Event
//
//  Created by Ari Supriatna on 12/10/20.
//

import SwiftUI
import StreamChatClient

struct LivestreamView: View {
  let channel = Client.shared.channel(type: .messaging, id: "general")
  let liveStreamUrl = "https://stream.mux.com/tqe4KzdxU6GLc8oowshXgm019ibzhEX3k.m3u8"
  
  @State
  var text: String = ""
  @State
  var messages: [Message] = []
  
  var body: some View {
    VStack {
      VideoPlayerView(url: liveStreamUrl)
        .frame(height: 280)
      
      List(messages.reversed(), id: \.self) {
        MessageView(message: $0)
          .scaleEffect(x: 1, y: -1, anchor: .center)
      }
      .scaleEffect(x: 1, y: -1, anchor: .center)
      .offset(x: 0, y: 2)
      
      HStack {
        TextField("Type a message", text: $text)
        Button(action: self.send) {
          Text("Send")
        }
      }.padding()
    }
    .navigationBarTitle("General")
    .onAppear(perform: onAppear)
  }
}

extension LivestreamView {
  func send() {
    channel.send(message: .init(text: text)) {
      switch $0 {
      case .success(let response):
        print(response)
        self.text = ""
      case .failure(let error):
        print(error)
      }
    }
  }
  
  func onAppear() {
    channel.watch(options: [.all]) {
      switch $0 {
      case .success(let response):
        self.messages += response.messages
      case .failure(let error):
        print("error => \(error.localizedDescription)")
        break
      }
    }
    
    channel.subscribe(forEvents: [.messageNew]) {
      switch $0 {
      case .messageNew(let message, _, _, _, _):
        self.messages += [message]
      default:
        break
      }
    }
  }
}

extension LivestreamView {
  struct MessageView: View {
    @State var message: Message
    
    var background: some View {
      if (message.user.isCurrent) {
        return Color.blue.opacity(0.25)
      } else {
        return Color.gray.opacity(0.25)
      }
    }
    
    @ViewBuilder
    var title: some View {
      if message.user.isCurrent {
        Text("")
      } else {
        Text(message.user.id).font(.footnote)
      }
    }
    
    var body: some View {
      HStack {
        if message.user.isCurrent { Spacer() }
        VStack(alignment: .leading) {
          title
          Text(message.text)
            .padding(8)
            .background(background)
            .cornerRadius(24)
        }
        if !message.user.isCurrent { Spacer() }
      }
      .frame(maxWidth: .infinity)
    }
  }
}

struct LivestreamView_Previews: PreviewProvider {
  static var previews: some View {
    LivestreamView()
  }
}
