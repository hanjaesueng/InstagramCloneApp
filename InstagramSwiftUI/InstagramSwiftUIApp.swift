//
//  InstagramSwiftUIApp.swift
//  InstagramSwiftUI
//
//  Created by jaeseung han on 2022/03/13.
//

import SwiftUI
import Firebase

@main
struct InstagramSwiftUIApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            // MVVM 패턴에서 viewModel 객체를 생성
            // @EnvironmentObject를 사용하여 shared 되는 single tone pattern의 객체, 처음 environmentObject 메서드로 생성해줌 View를 생성하면서
            ContentView().environmentObject(AuthViewModel.shared)
           
           
        }
    }
}
