//
//  PostGridView.swift
//  InstagramSwiftUI
//
//  Created by jaeseung han on 2022/03/13.
//

import SwiftUI
import Kingfisher

struct PostGridView: View {
    // 폰에 맞게 interface를 맞춰준다 gridItem이
    private let items = [GridItem(),GridItem(),GridItem()]
    private let width = UIScreen.main.bounds.width / 3
    
    let config : PostGridConfiguration
    @ObservedObject var viewModel : PostGridViewModel
    
    init(config : PostGridConfiguration) {
        self.config = config
        self.viewModel = PostGridViewModel(config: config)
    }
    
    var body: some View {
        LazyVGrid(columns: items,spacing: 2) {
            ForEach(viewModel.posts) { post in
                NavigationLink {
                    FeedView()
                } label: {
                    KFImage(URL(string: post.imageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: width, height: width)
                        .clipped()
                }

            }
            
        }
    }
}

