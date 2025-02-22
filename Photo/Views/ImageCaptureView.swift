//
//  ImageCaptureView.swift
//  Photo
//
//  Created by Hiroki Urabe on 2025/02/22.
//

import SwiftUI

struct ImageCaptureView: View {
    @State private var showAlert = false
    @State private var showImagePicker = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    @Binding var capturedImage: UIImage? // ImagePickerで取得した画像を入れる変数

    var body: some View {
        // ifでどっちのImageが出てきても.onTapGesture以下のモディファイアが使えるようにGruop化
        Group {
            // capturedImageのnilチェック
            if let capturedImage {
                Image(uiImage: capturedImage)
                    .resizable()
                    .scaledToFit()
                    .clipShape(.rect(cornerRadius: 10))
            } else {
                Image("noimage")
                    .resizable()
                    .scaledToFit()
                    .clipShape(.rect(cornerRadius: 10))
            }
        }
        .onTapGesture {
            // アラートを表示するための処理
            showAlert = true
        }
        
        // 画像の取得先を決めるアラート(カメラ、フォトライブラリ)
        .alert("アイコン画像の選択", isPresented: $showAlert) {
            Button("カメラ") {
                sourceType = .camera
                showImagePicker = true
            }
            Button("フォトライブラリ") {
                sourceType = .photoLibrary
                showImagePicker = true
            }
            Button("キャンセル") {}
        }
        // ImagePicker(カメラやフォトライブラリ)を表示するシート
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(image: $capturedImage, sourceType: sourceType)
        }
    }
}
