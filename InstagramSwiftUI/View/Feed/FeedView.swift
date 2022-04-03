//
//  FeedView.swift
//  InstagramSwiftUI
//
//  Created by jaeseung han on 2022/03/13.
//

import SwiftUI

struct FeedView: View {
    @ObservedObject var viewModel = FeedViewModel()
    var body: some View {
        ScrollView {
            // 필요할때 rendering 함, netwrok에 적합하다
            LazyVStack(spacing:32) {
                ForEach(viewModel.posts) { post in
                    FeedCell(post: post)
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
