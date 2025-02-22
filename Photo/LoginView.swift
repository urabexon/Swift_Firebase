//
//  LoginView.swift
//  Photo
//
//  Created by Hiroki Urabe on 2025/02/22.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    var body: some View {
        Button {
            // Login Button
            login()
        } label: {
            Text("匿名ログイン")
                .font(.title)
        }
        .buttonStyle(.borderedProminent)
    }
    
    // Login
    func login() {
        // Firebase Auth の匿名ログインの処理
        Auth.auth().signInAnonymously() { authResult, error in
            let user = authResult?.user
            print("LOGIN USER: ", user ?? "NIL")
        }
    }
}

#Preview {
    LoginView()
}
