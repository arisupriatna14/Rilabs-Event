//
//  FavoriteView.swift
//  Rilabs Event
//
//  Created by Ari Supriatna on 10/10/20.
//

import SwiftUI

struct FavoriteView: View {
  var body: some View {
    ScrollView {
      emptyView
    }
    .navigationTitle("Favorites")
  }
  
  var emptyView: some View {
    VStack {
      LottieView(filename: "nodata")
        .frame(height: 300)
      
      Text("Favorite is empty")
        .font(.title3)
        .foregroundColor(.gray)
    }
  }
}

struct FavoriteView_Previews: PreviewProvider {
  static var previews: some View {
    FavoriteView()
  }
}
