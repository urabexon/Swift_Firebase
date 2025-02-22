//
//  PostView.swift
//  Photo
//
//  Created by Hiroki Urabeon 2025/02/22.
//

import SwiftUI
import Kingfisher // URLから画像を取得するライブラリ

struct PostView: View {
    var post: Post
    let imageName = "noimage"
    let userInfoHeight = ScreenInfo.width * 0.2 // ユーザー情報の表示の高さ
    let postWidth = ScreenInfo.width * 0.9      // 投稿の横幅
    var body: some View {
        // 緑のVStack
        VStack {
            // 青のHStack
            HStack {
                // UserIconImage
                Group {
                    // IconImageURL
                    if let userIconURL = URL(string: post.userIconUrlStr) {
                        KFImage(userIconURL)
                            .resizable()
                            .scaledToFit()
                    } else {
                        Image(imageName)
                            .resizable()
                            .scaledToFit()
                    }
                }
                .clipShape(.rect(cornerRadius: 5))
                .frame(width: userInfoHeight, height: userInfoHeight)
                .padding(.horizontal, userInfoHeight * 0.1)
                
                // ピンクのVStack
                VStack(alignment: .leading, spacing: 10) {
                    Text(post.userName)
                        .font(.headline)
                    Text(post.postDate)
                        .font(.subheadline)
                }
                Spacer()
            }
            .frame(maxWidth: postWidth , maxHeight: userInfoHeight)
            
            // 投稿画像
            Group {
                if let postImageURL = URL(string: post.postImageUrlStr) {
                    KFImage(postImageURL)
                        .resizable()
                        .scaledToFit()
                } else {
                    Image("noimage")
                        .resizable()
                        .scaledToFit()
                }
            }
            .clipShape(.rect(cornerRadius: 10))
            .frame(maxWidth: postWidth)
            .padding(.vertical, 10)
            
            Text(post.postText)
                .frame(maxWidth: postWidth, alignment: .leading)
        }
    }
}
