//
//  TimelineViewModel.swift
//  Photo
//
//  Created by Hiroki Urabe on 2025/02/22.
//

import SwiftUI
import FirebaseDatabase
import FirebaseStorage

class TimelineViewModel: ObservableObject {
    @Published var posts : [Post] = [] // 投稿一覧を入れておく変数
    @Published var user: User = User(name: "", iconImage: UIImage(named: "noimage")!) // ユーザー情報を入れる変数
    let consts = Constants()
    private var storageURLStr = ""
    private var dbRef: DatabaseReference // RealtimeDatabaseの参照
    private var timelineRef: DatabaseReference // RealtimeDatabaseの参照
    private var storageRef: StorageReference // Storageの参照
    
    init() {
        storageURLStr = consts.storageUrl // StorageのURLを入れる
        dbRef = Database.database().reference().child("timeline") // RealtimeDBの"timeline"という名前のところを参照
        timelineRef = dbRef.childByAutoId() // dbRefの子要素に自動でIDを割り振り、その部分の参照
        storageRef = Storage.storage().reference(forURL: storageURLStr) // storageURLStrで指定したURLのストレージバケットを参照
    }
    
    // 現在日時をString型で返す
    func generateDateString() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.string(from: date)
    }
    
    // 投稿を送信する関数
    func sendPost(postImage: UIImage, postText: String) {
        timelineRef = dbRef.childByAutoId() // 自動で割り振られるIDを変えるために再度代入
        // ユーザーアイコン画像送信用
        guard let userKey = timelineRef.child("Users").childByAutoId().key else { return } // アンラップ
        let userIconRef = storageRef.child("Users").child("\(userKey).jpg") //ストレージの中のUsersディレクトリの中に(userKeyの値).jpgという場所を作り、参照
        let userIconData = user.iconImage.jpegData(compressionQuality: 0.01) // 画像を圧縮してDataに
        // 投稿画像送信の準備
        guard let postKey = timelineRef.child("Posts").childByAutoId().key else { return } // アンラップ
        let postImageRef = storageRef.child("Posts").child("\(postKey).jpg")//ストレージの中のPostsディレクトリの中に(postKeyの値).jpgという場所を作り、参照
        let postImageData = postImage.jpegData(compressionQuality: 0.01) // 画像を圧縮してDataに
        
        guard let userIconData, let postImageData else  { return } // 画像のDataが2つともあるか確認
        var userIconUrlStr = ""
        var postImageUrlStr = ""
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
    }
}

