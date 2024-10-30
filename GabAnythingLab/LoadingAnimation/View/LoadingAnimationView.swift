//
//  LoadingAnimationView.swift
//  GabAnythingLab
//
//  Created by Gab on 10/23/24.
//

import SwiftUI
import Combine

struct LoadingAnimationView: View {
    let timer = Timer.publish(every: 0.01, on: .current, in: .default, options: nil)
    
    @State private var cancel: Set<AnyCancellable> = []
    
    @State private var condition: Bool = true
    
    @EnvironmentObject private var viewModel: LoadingAnimationViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear {
//                print("상갑 logEvent \(#function) hi: \(viewModel(\.hi))")
            }
            .onReceive(timer) { output in
                print("상갑 logEvent \(#function) output: \(output)")
            }
//            .modifier(GabInputModifier(zones: [.gab, .kappa]))
    }
}

#Preview {
    LoadingAnimationView()
}

//#Preview(traits: .gabZone) {
//    LoadingAnimationView()
//}
