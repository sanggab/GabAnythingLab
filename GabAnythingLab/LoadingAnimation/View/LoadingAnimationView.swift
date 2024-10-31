//
//  LoadingAnimationView.swift
//  GabAnythingLab
//
//  Created by Gab on 10/23/24.
//

import SwiftUI
import Combine

struct LoadingAnimationView: View {
    @State var timer = Timer.publish(every: 1, on: .current, in: .default, options: nil)
    
    @State private var cancellables: Set<AnyCancellable> = []
    
    @State private var condition: Bool = true
    
    @State private var count: Int = .zero
    
    @State private var testCancellable: Cancellable?
    
    @EnvironmentObject private var viewModel: LoadingAnimationViewModel
    
    init() {
        print("상갑 logEvent \(#function)")
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear {
                let cancellable = timer
                    .sink { _ in
                        
                    }
                
                cancellables.insert(cancellable)
                
                testCancellable = timer.connect()
            }
            .onReceive(timer) { output in
                print("상갑 logEvent \(#function) output: \(output)")
                count += 1
                if count == 10 {
                    print("상갑")
                    testCancellable?.cancel()
                }
            }
            .onChange(of: cancellables) { oldValue, newValue in
                print("상갑 logEvent \(#function) : \(newValue)")
            }
        
        Rectangle()
            .fill(.mint)
            .frame(width: 30, height: 30)
            .onTapGesture {
                timer = Timer.publish(every: 1, on: .current, in: .default, options: nil)
                count = .zero
                testCancellable = timer.connect()
            }
    }
}

//#Preview {
//    LoadingAnimationView()
//}

#Preview(traits: .loadingAnimation) {
    LoadingAnimationView()
}
