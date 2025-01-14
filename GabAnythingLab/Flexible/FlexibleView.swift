//
//  FlexibleView.swift
//  GabAnythingLab
//
//  Created by Gab on 1/14/25.
//

import SwiftUI

struct FlexibleView: View {
    var body: some View {
        HStack(spacing: 8) {
            Circle()
                .fill(.mint)
                .frame(width: 32, height: 32)
            
            Text("안녕 반갑다")
        }
        .padding(.horizontal, 8)
        .padding(.leading, 16)
        .padding(.trailing, 24)
        .background(.pink)
    }
}

#Preview {
    FlexibleView()
}
