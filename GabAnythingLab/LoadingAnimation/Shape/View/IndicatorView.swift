//
//  IndicatorView.swift
//  GabAnythingLab
//
//  Created by Gab on 11/8/24.
//

import SwiftUI

struct IndicatorView: View {
    @EnvironmentObject private var viewModel: LingShapeViewModel
    
    var wingCount: Int {
        Int(abs(360 / viewModel(\.wingState.angle)))
    }
    
    var listCount: [Double] {
        var list: [Double] = []
        for i in 0..<wingCount {
            list.append(viewModel(\.wingState.angle) * Double(i))
        }
        
        return list
    }
    
    var body: some View {
        ZStack {
            ForEach(0..<wingCount, id: \.self) { index in
                IndicatorWingShape(degress: viewModel(\.wingState.angle) * Double(index))
                    .stroke(style: StrokeStyle(lineWidth: 2,
                                               lineCap: .round,
                                               lineJoin: .round))
                    .frame(width: 50, height: 50)
//                    .animation(.easeInOut(duration: 0.5).repeatForever(), value: viewModel(\.wingState.angle))
                    .opacity(1 / Double(index))
//                    .rotationEffect(.degrees(360))
            }
        }
        .onReceive(viewModel(\.timerState).timer) { output in
            
        }
        
        Button {
//            viewModel.action(.wing(.setAngle(Double.random(in: 0...360))))
//            withAnimation {
//                viewModel.action(.wing(.setAngle(15)))
//            }
            
            viewModel.action(.timer(.setSpeed(1)))
            viewModel.action(.timer(.setTimer))
            
//            withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
//                viewModel.action(.wing(.setAngle(30)))
//            }
        } label: {
            Text("바꿔")
        }
        .padding(.top, 20)

    }
}

#Preview(traits: .lingShape) {
    IndicatorView()
}
