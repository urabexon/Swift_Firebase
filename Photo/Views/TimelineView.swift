//
//  TimelineView.swift
//  Photo
//
//  Created by Hiroki Urabeon 2025/02/22.
//

import SwiftUI

struct TimelineView: View {
    var body: some View {
        NavigationStack {
            // 投稿一覧を表示するリスト
            List {
                ForEach(0...3, id: \.self) { _ in
                    PostView()
                }
            }
            // 投稿作成画面へのリンク
            NavigationLink {
                CreatePostView()
                    .navigationTitle("新規投稿作成")
            } label: {
                Image(systemName: "rectangle.and.pencil.and.ellipsis")
                    .font(.title)
            }
            .navigationTitle("投稿一覧")
        }
    }
}

#Preview {
    TimelineView()
}
