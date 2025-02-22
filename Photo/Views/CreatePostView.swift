//
//  CreatePostView.swift
//  Photo
//
//  Created by Hiroki Urabe on 2025/02/22.
//

import SwiftUI

struct CreatePostView: View {
    let userInfoHeight = ScreenInfo.width * 0.2
    let postWidth = ScreenInfo.width * 0.9
    
    // テスト表示
    let userName = "User Name"
    let userIconName = "noimage"
    
    @State var postImage: UIImage?
    @State var postText = ""
    
    var body: some View {
        // オレンジのVStack
        VStack {
            // 青のHStack
            HStack {
                Image(userIconName)
                    .resizable()
                    .scaledToFit()
                    .clipShape(.rect(cornerRadius: 5))
                    .frame(width: userInfoHeight, height: userInfoHeight)
                
                Text(userName)
                    .font(.headline)
                Spacer()
            }
            .frame(maxWidth: postWidth ,maxHeight: userInfoHeight)
            .background(.blue)
            
            ImageCaptureView(capturedImage: $postImage)
                .padding(.vertical ,30)
            TextField("投稿する内容を入力してください", text: $postText)
                .textFieldStyle(.roundedBorder)
            // 投稿ボタン
            Button {
                // 投稿処理
            } label: {
                Text("投稿")
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .frame(maxWidth: postWidth)
        .background(.orange)
    }
}

#Preview {
    CreatePostView()
}
