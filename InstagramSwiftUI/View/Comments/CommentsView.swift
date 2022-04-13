//
//  CommentsView.swift
//  InstagramSwiftUI
//
//  Created by jaeseung han on 2022/04/05.
//

import SwiftUI

struct CommentsView: View {
    @State var commentText = ""
    @ObservedObject var viewModel : CommentViewModel

    init(post : Post) {
        self.viewModel = CommentViewModel(post: post)
    }
    
    var body: some View {
        VStack{
            // comment List
            ScrollView {
                LazyVStack(alignment:.leading,spacing: 24) {
                    ForEach(viewModel.commnets) { comment in
                        CommentCell(comment: comment)
                    }
                }
            }.padding(.top)
            
            //inputView
            CustomInputView(inputText: $commentText, action: uploadComment)
        }
    }
    
    func uploadComment(){
        viewModel.uploadCommnet(commentText: commentText)
        commentText = ""
    }
}

