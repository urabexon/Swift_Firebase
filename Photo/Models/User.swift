//
//  User.swift
//  Photo
//
//  Created by Hiroki Urabeon 2025/02/22.
//

import Foundation
import SwiftUI

struct User {
    var name: String
    var iconImage: UIImage
}

struct Post: Identifiable {
    let id = UUID()
    let userName: String
    let userIconUrlStr: String
    let postImageUrlStr: String
    let postText: String
    let postDate: String
}
