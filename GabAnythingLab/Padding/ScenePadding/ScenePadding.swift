//
//  ScenePadding.swift
//  GabAnythingLab
//
//  Created by Gab on 12/18/24.
//

import SwiftUI
/// WatchOs에서만 되는듯
struct ScenePadding: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Scene padding")
                .scenePadding(.horizontal)
//                .padding(.horizontal)
                .border(.red) // Border added for reference.
            Text("Scene padding")
//                .scenePadding(.horizontal)
                .padding(.horizontal)
                .border(.red) // Border added for reference.
            Text("Regular padding")
                .padding(.horizontal)
                .border(.green)
            Text("Text with no padding")
                .border(.blue)
            Button("Button") { }
        }
        .navigationTitle("Hello World")
    }
}

#Preview {
    ScenePadding()
}
