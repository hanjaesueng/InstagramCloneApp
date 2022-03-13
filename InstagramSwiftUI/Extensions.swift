//
//  Extensions.swift
//  InstagramSwiftUI
//
//  Created by jaeseung han on 2022/03/13.
//

import UIKit

extension UIApplication {
    func endEditing() {
        // 현재 editing 중인 view를 resign
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
