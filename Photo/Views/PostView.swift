//
//  PostView.swift
//  Photo
//
//  Created by Hiroki Urabeon 2025/02/22.
//

import SwiftUI

struct PostView: View {
    let imageName = "noimage"
    let userInfoHeight = ScreenInfo.width * 0.2 // ユーザー情報の表示の高さ
    let postWidth = ScreenInfo.width * 0.9      // 投稿の横幅
    
    // 暫定表示(ユーザー名、日付、本文)
    var userName: String = "User Name"
    var date: String = "yyyy-MM-dd"
    var postBody: String =
        """
        Post Body: Lorem ipsum dolor sit amet, consectetur adipisci elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. 
        Ut enim ad minim veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam,
        nisi ut aliquid ex ea commodi consequatur.
        Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
        Excepteur sint obcaecat cupiditat non proiden
        """

    var body: some View {
        // 緑のVStack
        VStack {
            // 青のHStack
            HStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .clipShape(.rect(cornerRadius: 5))
                    .frame(width: userInfoHeight, height: userInfoHeight)
                    .padding(.horizontal, userInfoHeight * 0.1)
                
                // ピンクのVStack
                VStack(alignment: .leading, spacing: 10) {
                    Text(userName)
                        .font(.headline)
                    Text(date)
                        .font(.subheadline)
                }
                .background(.pink)
                Spacer()
            }
            .frame(maxWidth: postWidth , maxHeight: userInfoHeight)
            .background(.blue)
            
            // 投稿画像
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(.rect(cornerRadius: 10))
                .frame(maxWidth: postWidth)
                .padding(.vertical, 10)
            
            Text(postBody)
                .frame(maxWidth: postWidth, alignment: .leading)
        }
        .background(.green)
    }
}

#Preview {
    PostView()
}
