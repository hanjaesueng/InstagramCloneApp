//
//  FeedView.swift
//  InstagramSwiftUI
//
//  Created by jaeseung han on 2022/03/13.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView {
            // 필요할때 rendering 함, netwrok에 적합하다
            LazyVStack(spacing:32) {
                ForEach(0..<10) { _ in
                    FeedCell()
                }
            }.padding(.top)
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
