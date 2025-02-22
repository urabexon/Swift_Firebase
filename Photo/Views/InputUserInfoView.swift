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
    @State var iconImage: UIImage?
    @State var isPresentedNextView: Bool = false
    @ObservedObject var viewModel: TimelineViewModel

    var body: some View {
        NavigationStack {
            // この画面の説明文を表示
            Text("ユーザー画像の設定と名前の入力をしてください")
                .font(.subheadline)
                .padding(.horizontal, 30)
            
            // ユーザーのアイコン画像になるもの
            ImageCaptureView(capturedImage: $iconImage)
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
            
            // 画面遷移先指定
            .navigationDestination(isPresented: $isPresentedNextView) {
                TimelineView(viewModel: viewModel)
            }
        }
    }
    // ユーザー情報を登録する処理
    func submitUserInfo() {
        if name.isEmpty {
            showAlert = true
            return
        }
        var selectedImg = UIImage(named: Constants().noImage)!
        // アイコン画像有無チェック
        if let iconImage {
            selectedImg = iconImage
        }
        let newUser = User(name: name, iconImage: selectedImg)
        viewModel.user = newUser
        isPresentedNextView = true
    }
}
