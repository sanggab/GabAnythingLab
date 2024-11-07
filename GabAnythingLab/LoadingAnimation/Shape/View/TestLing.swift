//
//  TestLing.swift
//  GabAnythingLab
//
//  Created by Gab on 11/5/24.
//

import SwiftUI

struct TestLing: View {
    @EnvironmentObject private var viewModel: LingShapeViewModel
    
    var body: some View {
        RefreshShape()
            .trim(from: viewModel(\.animation).trim.from, to: viewModel(\.animation).trim.to)
//            .stroke(.mint, lineWidth: 5)
            .stroke(.mint, style: StrokeStyle(lineWidth: 5, lineCap: .round))
            .animation(.easeInOut(duration: viewModel(\.timerState).speed), value: viewModel(\.animation))
            .frame(width: 50, height: 50)
            .onReceive(viewModel(\.timerState).timer) { output in
                let animation = viewModel(\.animation)
                
                switch animation {
                case .initial:
                    viewModel.action(.animation(.fill))
                case .fill:
                    viewModel.action(.animation(.empty))
                case .empty:
                    viewModel.action(.animation(.initial))
                }
            }
            .onAppear {
                viewModel.action(.timer(.setTimer))
            }
            .background(.orange)
        
        Button {
            viewModel.action(.timer(.stopTimer))
        } label: {
            Text("멈춰")
        }
        .padding(.top, 20)

    }
}

#Preview(traits: .lingShape) {
    TestLing()
}
