//
//  SearchView.swift
//  InstagramSwiftUI
//
//  Created by jaeseung han on 2022/03/13.
//

import SwiftUI

struct SearchView: View {
    // State가 바뀌면 view를 다시 그림
    @State var searchText = ""
    @State var inSearchMode = false
    var body: some View {
        ScrollView {
            // search bar
            SearchBar(text: $searchText, isEditing : $inSearchMode)
                .padding()
            //grid view /user list view
            ZStack {
                if inSearchMode {
                    UserListView()
                } else {
                    PostGridView()
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
