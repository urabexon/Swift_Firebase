//
//  CreatePostView.swift
//  Photo
//
//  Created by Hiroki Urabe on 2025/02/22.
//

import SwiftUI

struct CreatePostView: View {
    @Environment(\.dismiss) private var dismiss // 投稿したら前の画面に戻る用
    @ObservedObject var viewModel: TimelineViewModel
    let userInfoHeight = ScreenInfo.width * 0.2
    let postWidth = ScreenInfo.width * 0.9
    @State var postImage: UIImage?
    @State var postText = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        // オレンジのVStack
        VStack {
            // 青のHStack
            HStack {
                Image(uiImage: viewModel.user.iconImage)
                    .resizable()
                    .scaledToFit()
                    .clipShape(.rect(cornerRadius: 5))
                    .frame(width: userInfoHeight, height: userInfoHeight)
                
                Text(viewModel.user.name)
                    .font(.headline)
                Spacer()
            }
            .frame(maxWidth: postWidth ,maxHeight: userInfoHeight)
            ImageCaptureView(capturedImage: $postImage)
                .padding(.vertical ,30)
            TextField("投稿する内容を入力してください", text: $postText)
                .textFieldStyle(.roundedBorder)
            // 投稿ボタン
            Button {
                if postText.isEmpty {
                    showAlert = true
                } else {
                    DispatchQueue.main.async {
                        // postでFirebaseRealtimeDBに投稿する処理
                        viewModel.sendPost(
                            postImage: postImage ?? UIImage(named: "noimage")!,
                            postText: postText)
                        dismiss()
                    }
                }
            } label: {
                Text("投稿")
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .frame(maxWidth: postWidth)
        .alert("投稿の本文を入力してください", isPresented: $showAlert) {
            Text("OK")
        }
    }
}

#Preview {
    @Previewable @StateObject var viewModel = TimelineViewModel()
    CreatePostView(viewModel: viewModel)
}
