//
//  InputUserInfoView.swift
//  Photo
//
//  Created by Hiroki Urabe on 2025/02/22.
//

import SwiftUI

struct InputUserInfoView: View {
    @State private var name = "" // テキストフィールドに入力された名前を受け取る
    @State private var showAlert = false  // アラートの表示・非表示を制御する変数
    var body: some View {
        NavigationStack {
            // この画面の説明文を表示
            Text("ユーザー画像の設定と名前の入力をしてください")
                .font(.subheadline)
                .padding(.horizontal, 30)
            
            // ユーザーのアイコン画像になるもの
            Image("noimage")
                .resizable()
                .scaledToFit()
                .clipShape(.rect(cornerRadius: 10))
                .padding(30)
            
            // 名前入力欄と登録ボタンを横並びにするためにでHStackを使用
            HStack {
                // ユーザー名を入力するテキストフィールド
                TextField("名前を入力してください", text: $name)
                    .textFieldStyle(.roundedBorder)
                // ユーザー名とユーザーのアイコン画像を登録するボタン
                Button {
                    // ボタンが押されたら実行: 登録の処理
                    submitUserInfo()
                } label: {
                    Text("登録")
                }
                .buttonStyle(.borderedProminent)
            }
            .padding(.horizontal, 30)
            
            // ユーザー名未入力時アラート
            .alert("名前を入力してください", isPresented: $showAlert) {
                Text("OK")
            }
        }
    }
    // ユーザー情報を登録する処理
    func submitUserInfo() {
        if name.isEmpty {
            showAlert = true
            return
        }
    }
}

#Preview {
    InputUserInfoView()
}
