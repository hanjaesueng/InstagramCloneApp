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
    @Binding var tabIndex : Int
    @ObservedObject var viewModel = UploadPostViewModel()
    
    var body: some View {
        VStack {
            if postImage == nil {
                Button(action: {imagePickerPresented.toggle()}) {
                    LoadImageIcon()
                        .frame(width: 180, height: 180)
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
                    

                    TextArea(text: $captionText, placeholder: "Enter your caption..")
                        .frame(height : 200)
                }.padding()
                HStack(spacing:16) {
                    Button(action: {
                        captionText = ""
                        postImage = nil
                    }) {
                        Text("Cancel")
                            .font(.system(size: 16,weight: .semibold))
                            .frame(width: 172, height: 50)
                            .background(Color.red)
                            .cornerRadius(5)
                            .foregroundColor(.white)
                    }
                    
                    Button(action: {
                        if let image = selectedImage {
                            viewModel.uploadPost(caption: captionText, image: image) { _ in
                                captionText = ""
                                postImage = nil
                                tabIndex = 0
                            }
                        }
                    }) {
                        Text("Share")
                            .font(.system(size: 16,weight: .semibold))
                            .frame(width: 172, height: 50)
                            .background(Color.blue)
                            .cornerRadius(5)
                            .foregroundColor(.white)
                    }
                }.padding()
            }
            
            Spacer()
        }
    }
}

struct PlusPhotoView : View {
    var body:some View {
        ZStack {
            Circle()
                .stroke(style: StrokeStyle(lineWidth:5))
            VStack(spacing:20) {
                ZStack {
                    Rectangle()
                        .frame(width: 5, height: 30)
                    Rectangle()
                        .frame(width: 30, height: 5)
                }
                Text("Photo")
                    .font(.system(size: 30, weight: .semibold))
            }
        }
    }
}

extension UploadPostView {
    func loadImage() {
        guard let selectedImage = selectedImage else {return}
        postImage = Image(uiImage: selectedImage)
    }
}


struct LoadImageIcon : View {
    var body: some View {
        ZStack {
            Circle()
                .stroke(style: StrokeStyle(lineWidth:5))
            VStack() {
                ZStack{
                    Rectangle()
                    
                        .frame(width:5,height: 50)
                    Rectangle()
                        .frame(width:50,height: 5)
                }
                Text("Photo")
                    .font(.system(size:30,weight: .semibold))
            }
            
            
            
            
        }
    }
}

//struct UploadPostView_Previews: PreviewProvider {
//    static var previews: some View {
//        UploadPostView()
//    }
//}
//
