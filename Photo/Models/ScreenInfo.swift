//
//  ScreenInfo.swift
//  Photo
//
//  Created by Hiroki Urabe on 2025/02/22.
//

import Foundation
import SwiftUI

struct ScreenInfo {
    private static var window: UIWindowScene? {
        return UIApplication.shared.connectedScenes.first as? UIWindowScene
    }
    
    static var bounds: CGRect {
        return window?.screen.bounds ?? .zero
    }
    
    static var width: CGFloat {
        return bounds.width
    }
    
    static var height: CGFloat {
        return bounds.height
    }
}
