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
        LingShape()
            .stroke(.mint, lineWidth: 5)
            .frame(width: 100, height: 100)
            .onReceive(viewModel(\.timerState).timer) { output in
                print(output)
            }
            .onAppear {
                viewModel.action(.timer(.setTimer))
//                print(viewModel(\.timerState).existCancellables())
            }

    }
}

#Preview(traits: .lingShape) {
    TestLing()
}
