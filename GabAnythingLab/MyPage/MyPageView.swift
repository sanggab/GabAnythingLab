//
//  MyPageView.swift
//  GabAnythingLab
//
//  Created by Gab on 2/4/25.
//

import SwiftUI

struct MyPageView: View {
    @State private var percentage: CGFloat = 0
    @State private var progressAniState: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Mypage")
                
                Spacer()
                
                Image(systemName: "pencil.line")
                
                Image(systemName: "gearshape")
            }
            .frame(height: 50)
            .padding(.horizontal)
            
            ScrollView(showsIndicators: false) {
                ZStack {
                    LazyVStack(spacing: 0) {
                        ProfileAreaView(percentage: percentage)
                        
                        Spacer().frame(height: 20)
                        
                        ProfileVertifyView()
                            .frame(height: 50)
                            .background(.white)
                            .cornerRadius(12)
                            .padding(.horizontal)
                        
                        Spacer().frame(height: 16)
                        
                        InfinityScrollView()
                        
                        Spacer().frame(height: 16)
                        
                        ItemAreaView()
                            .frame(height: 150)
                            .padding(.horizontal)
                    }
                }
            }
            .ignoresSafeArea()
            .background(.mint)
            .onAppear {
                percentage = 63
            }
            .onTapGesture {
                percentage = [30, 40, 50, 65, 24, 87, 100, 97].randomElement() ?? 95
            }
        }
    }
}

#Preview {
    MyPageView()
}

struct MypagePercentageAnimatedView: View, Animatable {
    var progress: Double
    
    var animatableData: Double {
        get { progress }
        set {
            progress = newValue
        }
    }
    
    var body: some View {
        Text("\(Int(progress))%")
            .foregroundStyle(.white)
            .monospacedDigit()
            .padding(.top, 5)
            .padding(.horizontal, 13)
            .padding(.bottom, 6)
            .background(.black)
            .clipShape(RoundedRectangle(cornerRadius: 40))
            .overlay {
                RoundedRectangle(cornerRadius: 40)
                    .stroke(.yellow, lineWidth: 2)
            }
    }
}
