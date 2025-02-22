//
//  ImagePicker.swift
//  Photo
//
//  Created by Hiroki Urabe on 2025/02/22.
//

import SwiftUI

// カメラまたはフォトライブラリを表示するビュー
struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage? // 撮影、または選択した画像
    var sourceType: UIImagePickerController.SourceType
    @Environment(\.presentationMode) var presentationMode
    
    // フォトアルバムまたはカメラの画面の生成
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = context.coordinator
        return picker
    }
    
    // 画面に更新があったとき
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    // コーディネーターを自分(ImagePicker)に設定
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    // コーディネータークラスを定義
    // UIImagePickerControllerとUINavigationControllerの機能を使うために用意するクラス
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePicker
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        // 画像の選択が終了したときに呼ばれる関数
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.image = image
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
        
        // 画像の選択がキャンセルされた時に呼ばれる関数
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
