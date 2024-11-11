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
        get {
            var list: [Double] = []
            for i in 0..<wingCount {
                list.append(viewModel(\.wingState.angle) * Double(i))
            }
            
            return list
        }
    }
    

    var body: some View {
        ZStack {
            ForEach(0..<wingCount, id: \.self) { index in
                IndicatorWingShape(degress: getDegress(index: index))
                    .stroke(style: StrokeStyle(lineWidth: 2,
                                               lineCap: .round,
                                               lineJoin: .round))
                    .frame(width: 50, height: 50)
//                    .animation(.easeInOut(duration: 0.5).repeatForever(), value: viewModel(\.wingState.angle))
                    .opacity(getOpacity(index: index))
                    .onAppear {
                        print("상갑 logEvent \(#function) index: \(index)")
                        print("상갑 logEvent \(#function) degress: \(viewModel(\.wingState.angle) * Double(index) + viewModel(\.wingState.rotateAngle))")
                        print("상갑 logEvent \(#function) opacity: \(getOpacity(index: index))")
                    }
//                    .rotationEffect(.degrees(360))
            }
        }
        .onReceive(viewModel(\.timerState).timer) { output in
            var currentAngle = viewModel(\.wingState.rotateAngle)
            if currentAngle == 360.0 {
                currentAngle = viewModel(\.wingState.angle)
            } else {
                currentAngle += viewModel(\.wingState.angle)
            }
            
            viewModel.action(.wing(.setRotateAngle(currentAngle)))
        }
        .onAppear {
            print("상갑 logEvent \(#function) onAppear")
            viewModel.action(.wing(.setAngle(12)))
        }
        
        Button {
//            viewModel.action(.wing(.setAngle(Double.random(in: 0...360))))
//            withAnimation {
//                viewModel.action(.wing(.setAngle(15)))
//            }
            print(listCount)
            if viewModel(\.timerState).existCancellables() {
                viewModel.action(.timer(.stopTimer))
            } else {
                viewModel.action(.timer(.setSpeed(0.07)))
                viewModel.action(.timer(.setTimer))
            }
            
//            withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
//                viewModel.action(.wing(.setAngle(30)))
//            }
        } label: {
            Text("바꿔")
        }
        .padding(.top, 20)

    }
    
    func getDegress(index: Int) -> Double {
        let currentAngle = (viewModel(\.wingState.angle) * Double(index))
        let rotateAngle = viewModel(\.wingState.rotateAngle)
        
        return currentAngle + rotateAngle - 135
    }
    
    func getOpacity(index: Int) -> Double {
        if index == .zero {
            return 1.0
        } else {
            if index > 0 && index <= (listCount.count / 2) {
                return 0.25
            } else {
                let sliceOpacity = 1 / Double(listCount.count)
                
                return sliceOpacity * Double(index)
            }
        }
    }
}

#Preview(traits: .lingShape) {
    IndicatorView()
}
