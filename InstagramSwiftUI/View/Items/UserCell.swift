//
//  UserCell.swift
//  InstagramSwiftUI
//
//  Created by jaeseung han on 2022/03/13.
//

import SwiftUI
import Kingfisher
import UIKit

struct UserCell: View {
    let user : User
    @State var downloadedImage : UIImage?
    
    var body: some View {
        HStack{
            // image
             KFImage(URL(string:user.profileImageUrl))
//            Image(uiImage: downloadedImage == nil ? UIImage() : downloadedImage!)
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
                .onAppear {
                    self.loadImage(url: URL(string: user.profileImageUrl)!)
                }
            // VStack -> Username,fullname, align은 leading, trailing, center설정 가능
            VStack(alignment:.leading){
                Text(user.username)
                    .font(.system(size: 14,weight: .semibold))
                Text(user.fullname)
                    .font(.system(size: 14))
            }
            // 빈공간을 만들어줌
            Spacer()
        }
        
    }
    
    func loadImage(url : URL) {
  
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {return}
            downloadedImage = UIImage(data: data)
        }.resume()
    }
}


