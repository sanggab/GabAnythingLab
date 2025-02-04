//
//  ProfileAreaView.swift
//  GabAnythingLab
//
//  Created by Gab on 2/4/25.
//

import SwiftUI

struct ProfileAreaView: View {
    var percentage: CGFloat
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(uiImage: UIImage(named: "9")!)
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .overlay {
                    Group {
                        Circle()
                            .stroke(lineWidth: 4)
                            .fill(.pink)
                        
                        Circle()
                            .trim(from: 0, to: percentage / 100)
                            .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
                            .animation(.easeInOut, value: percentage)
                            .rotationEffect(.degrees(90))
                    }
                }
            
            Text("\(Int(percentage))% completed")
                .contentTransition(.numericText(value: percentage))
                .foregroundStyle(.white)
                .monospacedDigit()
                .padding(.top, 5)
                .padding(.horizontal, 13)
                .padding(.bottom, 6)
                .background(.black)
                .cornerRadius(40)
                .offset(y: 14)
                .animation(.easeInOut, value: percentage)
        }
    }
}

#Preview {
    ProfileAreaView(percentage: 45)
}
