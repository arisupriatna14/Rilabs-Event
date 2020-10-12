//
//  VideoPlayerView.swift
//  Rilabs Event
//
//  Created by Ari Supriatna on 12/10/20.
//

import SwiftUI
import AVKit

struct VideoPlayerView: UIViewControllerRepresentable {
  var url: String
  
  func makeUIViewController(context: Context) -> AVPlayerViewController {
    let controller = AVPlayerViewController()
    let player = AVPlayer(url: URL(string: url)!)
    controller.player = player
    controller.videoGravity = .resize
    return controller
  }
  
  func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {}
}
