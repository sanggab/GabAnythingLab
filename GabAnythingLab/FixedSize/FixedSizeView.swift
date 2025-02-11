//
//  FixedSizeView.swift
//  GabAnythingLab
//
//  Created by Gab on 2/11/25.
//

import SwiftUI

struct FixedSizeView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                Group {
                    firstView
                    
                    secondView
                    
                    thirdView
                    
                    fourthView
                    
                    fifthView
                }
                .background(.mint)
                .lineLimit(2)
                .foregroundStyle(.pink)
                .multilineTextAlignment(.center)
                .lineSpacing(0)
                .padding(.vertical, 12)
                .frame(width: 100)
                .background(.white)
                .cornerRadius(8)
            }
            .fixedSize()
            .padding([.top, .horizontal], 12)
        }
        .background(.gray)
    }
    
    @ViewBuilder
    private var firstView: some View {
        Button {
            
        } label: {
            VStack(spacing: .zero) {
                Image(uiImage: UIImage(named: "9")!)
                    .resizable()
                    .frame(width: 36, height: 36)
                
                Text("Super message")
                    .frame(maxHeight: .infinity)
                    .padding(.horizontal, 12)
            }
        }

    }
    
    @ViewBuilder
    private var secondView: some View {
        Button {
            
        } label: {
            VStack(spacing: .zero) {
                Image(uiImage: UIImage(named: "17")!)
                    .resizable()
                    .frame(width: 36, height: 36)
                
                Text("Megaphone message")
                    .frame(maxHeight: .infinity)
                    .padding(.horizontal, 12)
            }
        }
    }
    
    @ViewBuilder
    private var thirdView: some View {
        Button {
            
        } label: {
            VStack(spacing: .zero) {
                Image(uiImage: UIImage(named: "23")!)
                    .resizable()
                    .frame(width: 36, height: 36)
                
                Text("Special Like")
                    .frame(maxHeight: .infinity)
                    .padding(.horizontal, 12)
            }
        }
    }
    
    @ViewBuilder
    private var fourthView: some View {
        Button {
            
        } label: {
            VStack(spacing: .zero) {
                Image(uiImage: UIImage(named: "25")!)
                    .resizable()
                    .frame(width: 36, height: 36)
                
                Text("Boost")
                    .frame(maxHeight: .infinity)
                    .padding(.horizontal, 12)
            }
        }
    }
    
    @ViewBuilder
    private var fifthView: some View {
        Button {
            
        } label: {
            VStack(spacing: .zero) {
                Image(uiImage: UIImage(named: "40")!)
                    .resizable()
                    .frame(width: 36, height: 36)
                
                Text("Etc")
                    .frame(maxHeight: .infinity)
                    .padding(.horizontal, 12)
            }
        }
    }
}

#Preview {
    FixedSizeView()
}
