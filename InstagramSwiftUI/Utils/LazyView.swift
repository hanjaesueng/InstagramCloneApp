//
//  LazyView.swift
//  InstagramSwiftUI
//
//  Created by jaeseung han on 2022/04/14.
//

import SwiftUI

// 
struct LazyView<Content : View>: View {
    let build: () -> Content
    // @autoclosure expression..을 뭐라하더라 하튼 그것을 그냥 closure 형태로 변경시켜주는 역활  https://jusung.github.io/AutoClosure/
    init(_ build : @autoclosure @escaping() -> Content) {
        self.build = build
    }
    
    var body : Content {
        build()
    }
}
