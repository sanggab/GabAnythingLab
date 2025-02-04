//
//  InfinityScrollView.swift
//  GabAnythingLab
//
//  Created by Gab on 2/4/25.
//

import SwiftUI

struct InfinityScrollView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                Group {
                    Image(uiImage: UIImage(named: "17")!)
                        .resizable()
                        .frame(width: 100, height: 100)
                    
                    Image(uiImage: UIImage(named: "23")!)
                        .resizable()
                        .frame(width: 100, height: 100)
                    
                    Image(uiImage: UIImage(named: "25")!)
                        .resizable()
                        .frame(width: 100, height: 100)
                    
                    Image(uiImage: UIImage(named: "40")!)
                        .resizable()
                        .frame(width: 100, height: 100)
                }
                .cornerRadius(12)
                .shadow(color: .black, radius: 2, x: 1, y: 1)
                .padding(.vertical, 10)
            }
            .padding(.horizontal)
        }
        .background(.white)
    }
}

#Preview {
    InfinityScrollView()
}
