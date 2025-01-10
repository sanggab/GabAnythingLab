//
//  ContentView.swift
//  GabAnythingLab
//
//  Created by Gab on 10/23/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isOn: Bool = false
    
    var body: some View {
//        LoadingAnimationView()
        ContentTransition()
    }
}

#Preview {
    ContentView()
}
