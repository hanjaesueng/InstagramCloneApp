//
//  UploadPostView.swift
//  InstagramSwiftUI
//
//  Created by jaeseung han on 2022/03/13.
//

import SwiftUI

// @State 와 @Binding을 연결해서 delegate pattern 처럼 쓸수있다, Binding 된 iamge를 변경하면 State의 image도 변경된다
struct UploadPostView: View {
    @State private var selectedImage : UIImage?
    @State var postImage : Image?
    @State var captionText = ""
    @State var imagePickerPresented = false
    
    var body: some View {
        VStack {
            if postImage == nil {
                Button(action: {imagePickerPresented.toggle()}) {
                    Image(systemName:"photo.on.rectangle")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFit()
                        .frame(width: 180, height: 180)
                        .clipped()
                        .padding(.top,56)
                        .foregroundColor(.black)
                }.sheet(isPresented: $imagePickerPresented, onDismiss: loadImage) {
                    ImagePicker(image: $selectedImage)
                }
            } else if let image = postImage {
                HStack(alignment: .top) {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 96, height: 96)
                        .clipped()
                    
                    TextField("Enter your caption..",text: $captionText)
                }.padding()
                Button(action: {}) {
                    Text("Share")
                        .font(.system(size: 16,weight: .semibold))
                        .frame(width: 360, height: 50)
                        .background(Color.blue)
                        .cornerRadius(5)
                        .foregroundColor(.white)
                }.padding()
            }
            
            Spacer()
        }
    }
}

extension UploadPostView {
    func loadImage() {
        guard let selectedImage = selectedImage else {return}
        postImage = Image(uiImage: selectedImage)
    }
}
struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView()
    }
}
