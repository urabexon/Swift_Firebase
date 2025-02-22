//
//  LoginView.swift
//  Photo
//
//  Created by Hiroki Urabe on 2025/02/22.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @State private var isNextViewPresented = false // 次の画面の表示制御用
    @ObservedObject var viewModel: TimelineViewModel
    var body: some View {
        NavigationStack {
            Button {
                // Login Button
                login()
            } label: {
                Text("匿名ログイン")
                    .font(.title)
            }
            .buttonStyle(.borderedProminent)
            
            // 画面遷移先と、その画面の表示を制御する変数を設定
            .navigationDestination(isPresented: $isNextViewPresented) {
                InputUserInfoView(viewModel: viewModel)
            }
        }
    }
    
    // Login
    func login() {
        // Firebase Authの匿名ログインの処理
        Auth.auth().signInAnonymously() { authResult, error in
            let user = authResult?.user
            print("LOGIN USER: ", user ?? "NIL")
            isNextViewPresented = true // 匿名ログインができたら画面遷移
        }
    }
}
