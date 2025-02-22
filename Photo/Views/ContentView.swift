//
//  ContentView.swift
//  Photo
//
//  Created by Hiroki Urabe on 2025/02/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = TimelineViewModel()
    var body: some View {
        LoginView(viewModel: viewModel)
    }
}

#Preview {
    ContentView()
}
