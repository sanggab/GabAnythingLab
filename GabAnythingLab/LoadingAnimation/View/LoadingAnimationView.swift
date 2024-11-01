//
//  LoadingAnimationView.swift
//  GabAnythingLab
//
//  Created by Gab on 10/23/24.
//

import SwiftUI
import Combine

struct LoadingAnimationView: View {
    @State var timer = Timer.publish(every: 1.5, on: .current, in: .default, options: nil)
    
    @State private var cancellables: Set<AnyCancellable> = []
    
    @State private var condition: Bool = true
    
    @State private var count: CGFloat = .zero
    @State private var count2: CGFloat = .zero
    
    @State private var degree = 0.0
    
    @State private var testCancellable: Cancellable?
    
    @EnvironmentObject private var viewModel: LoadingAnimationViewModel
    
    init() {
        print("상갑 logEvent \(#function)")
    }
    
    var body: some View {
        main2
    }
    
    
    @ViewBuilder
    var main1: some View {
        path
            .onAppear {
//                setTimer()
            }
            .onReceive(timer) { _ in
                if count >= 1 {
                    count = .zero
                    testCancellable?.cancel()
                    return
                }
                
                count += 0.1
            }
            .onChange(of: count) { newValue in
                print("상갑 logEvent \(#function) count: \(newValue)")
            }
    }
    
    @ViewBuilder
    var main2: some View {
        path2
    }
    
    @ViewBuilder
    var path: some View {
        Path { path in
            path.addArc(center: CGPoint(x: 100, y: 100),
                        radius: 30,
                        startAngle: .degrees(0),
                        endAngle: .degrees(360),
                        clockwise: true)
            
        }
        .trim(from: 0, to: count)
        .stroke(.mint, lineWidth: 2)
        .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
    }
    
    @ViewBuilder
    var path2: some View {
        Path { path in
            
            path.addArc(center: CGPoint(x: 150, y: 150),
                        radius: 30,
                        startAngle: .degrees(0),
                        endAngle: .degrees(360),
                        clockwise: true)
        }
        .trim(from: count, to: count2)
        .stroke(Color.mint, lineWidth: 5)
//        .rotationEffect(.degrees(360))
        .animation(.easeInOut(duration: 1.5))
        .onAppear {
            setTimer()
        }
        .onReceive(timer) { output in
            if count2 == .zero {
                count2 = 1
            } else {
                count = 1
            }
        }
    }
    
    private func setTimer() {
        if testCancellable == nil {
            testCancellable = self.timer.connect()
        } else {
            self.timer = Timer.publish(every: 1, on: .current, in: .default, options: nil)
            testCancellable = self.timer.connect()
        }
    }
}

//#Preview {
//    LoadingAnimationView()
//}

#Preview(traits: .loadingAnimation) {
    LoadingAnimationView()
}
