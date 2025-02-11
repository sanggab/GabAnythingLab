//
//  LabView.swift
//  GabAnythingLab
//
//  Created by Gab on 2/11/25.
//

import SwiftUI

struct LabView: View {
    var body: some View {
        Text("A single line of text, too long to fit in a box.of text")
            .border(.green)
            .fixedSize(horizontal: false, vertical: true)
            .frame(width: 200, height: 200)
            .border(Color.gray)
        
//        LazyVStack {
//            Rectangle()
//                .fill(.blue)
//        }
        
//        ScrollView {
//            Rectangle()
//                .fill(.blue)
//        }
    }
}

#Preview {
    LabView()
}
