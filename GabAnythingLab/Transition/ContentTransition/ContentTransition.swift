//
//  ContentTransition.swift
//  GabAnythingLab
//
//  Created by Gab on 12/17/24.
//

import SwiftUI

struct ContentTransition: View {
    private let words: [String] = [
        "가나다",
        "아무말 아무말 아무말",
        "바하라아마자",
        "퇴근하고싶다 퇴근",
        "남은 연차 2개",
        "퇴근 시켜줘",
        "contentTransition Test",
        "transition 차이점"
    ]
    
    private let fontWeights: [Font.Weight] = [
        .bold,
        .black,
        .heavy,
        .light,
        .medium,
        .semibold,
        .regular,
        .thin,
        .ultraLight
    ]
    
    @State private var text: String = "안뇽"
    @State private var text2: String = "안뇽"
    
    @State private var font: Font.Weight = .bold
    @State private var font2: Font.Weight = .bold
    
    @State private var flag: Bool = false
    
    var body: some View {
        Text(text)
            .font(.headline)
            .fontWeight(font)
            .contentTransition(.identity)
        
        Rectangle()
            .fill(.mint)
            .frame(width: 30, height: 30)
            .onTapGesture {
                withAnimation {
                    text = words.randomElement() ?? ""
                }
            }
        
        Text(text2)
            .font(.headline)
            .fontWeight(font2)
        
        Rectangle()
            .fill(.pink)
            .frame(width: 30, height: 30)
            .onTapGesture {
                withAnimation {
                    text2 = words.randomElement() ?? ""
                }
            }
        
        Text("보간을테스트해보자")
            .font(.headline)
            .fontWeight(flag ? .bold : .regular)
            .foregroundStyle(flag ? .mint : .pink)
            .contentTransition(.interpolate)
        
        Text("보간을테스트해보자")
            .font(.headline)
            .fontWeight(flag ? .bold : .regular)
            .foregroundStyle(flag ? .mint : .pink)
        
        Text(verbatim: "1000")
                        .fontWeight(flag ? .black : .light)
                        .foregroundColor(flag ? .yellow : .red)
        
        Rectangle()
            .fill(.pink)
            .frame(width: 30, height: 30)
            .onTapGesture {
                withAnimation {
                    flag.toggle()
                }
            }
    }
}

#Preview {
    ContentTransition()
}
