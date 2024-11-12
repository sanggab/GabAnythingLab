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
                    .stroke(style: StrokeStyle(lineWidth: 5,
                                               lineCap: .round,
                                               lineJoin: .round))
                    .frame(width: 40, height: 40)
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
            viewModel.action(.wing(.setAngle(30)))
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
                viewModel.action(.timer(.setSpeed(0.05)))
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
    
    /// 현재 wing의 degress를 결정짓는 요소
    /// refresh Indicator 느낌을 줄려면
    func getDegress(index: Int) -> Double {
        /// 원래대로 그린다면 정해지는 Angle
        let currentAngle = (viewModel(\.wingState.angle) * Double(index))
        /// Timer에 의해 currentAngle에서 돌릴 Angle
        let rotateAngle = viewModel(\.wingState.rotateAngle)
        /// Swift에서 Path를 이용해 각도를 계산하거나 addArc등 그릴 경우에, 0도는 3시방향이라 이것을 12시 방향으로 돌리기 위한 각도
        let moveAngle = 90 + viewModel(\.wingState.angle)
        
        return currentAngle + rotateAngle - moveAngle
    }
    
    /// Opacity를 구하는 method
    /// d
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
        .foregroundStyle(.red)
}
