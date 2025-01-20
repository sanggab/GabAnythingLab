//
//  HoneyAlignment.swift
//  GabAnythingLab
//
//  Created by Gab on 1/14/25.
//

import SwiftUI

struct HoneyAlignment: View {
    @State private var isOn: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            HStack(spacing: 0) {
                Circle()
                    .fill(.mint)
                    .frame(width: 68, height: 68)
                
//                Circle()
//                    .fill(.blue)
//                    .frame(width: 76, height: 76)
//                    .padding(.horizontal, 8)
//                    .onTapGesture {
//                        isOn.toggle()
//                    }
                
                Circle()
                    .fill(.yellow)
                    .frame(width: 68, height: 68)
            }
            .frame(maxWidth: .infinity)
            .background(.pink)
            .overlay {
                Circle()
                    .fill(.gray.opacity(0.5))
                    .frame(width: 68, height: 68)
//                    .padding(.trailing, 152 + 8 + 136)
                    .padding(.trailing, 68 * 3 + 8)
            }
            .padding(.bottom, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .background(.mint)
    }
}

#Preview {
    HoneyAlignment()
}
