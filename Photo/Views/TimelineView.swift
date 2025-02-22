//
//  TimelineView.swift
//  Photo
//
//  Created by Hiroki Urabeon 2025/02/22.
//

import SwiftUI

struct TimelineView: View {
    @ObservedObject var viewModel: TimelineViewModel
    var body: some View {
        NavigationStack {
            // 投稿一覧を表示するリスト
            List {
                ForEach(viewModel.posts) { post in
                    PostView()
                }
            }
            // 投稿一覧画面表示後にFirebaseから情報一覧取得
            .onAppear {
                DispatchQueue.main.async {
                    viewModel.fetchPosts()
                }
            }
            // 投稿作成画面へのリンク
            NavigationLink {
                CreatePostView(viewModel: viewModel)
                    .navigationTitle("新規投稿作成")
            } label: {
                Image(systemName: "rectangle.and.pencil.and.ellipsis")
                    .font(.title)
            }
            .navigationTitle("投稿一覧")
        }
    }
}
