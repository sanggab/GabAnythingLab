//
//  EquatableTest.swift
//  GabAnythingLab
//
//  Created by Gab on 1/8/25.
//

import SwiftUI

import Combine

class EquatableViewModel: Equatable, ObservableObject {
    static func == (lhs: EquatableViewModel, rhs: EquatableViewModel) -> Bool {
        print("상갑 logEvent \(#function) EquatableViewModel")
//        return lhs.testState == rhs.testState
        return lhs.testState == rhs.testState
    }
    
    struct State: Equatable {
        static func == (lhs: State, rhs: State) -> Bool {
            print("상갑 logEvent \(#function) State")
//            return lhs.test == rhs.test
            return true
        }
        
        var test: Bool = false
    }
    
    public var testName: String = "화긴"
    
    @Published public var name: String = "노노"
    
    @Published public var testState: State = .init()
    
    func test() {
        testState.test.toggle()
        
        print("상갑 logEvent \(#function) testState.test: \(testState.test)")
    }
}

struct EquatableTest: Equatable, View {
    static func == (lhs: EquatableTest, rhs: EquatableTest) -> Bool {
        print("상갑 logEvent \(#function) EquatableTest")
//        return lhs.viewModel == rhs.viewModel
        return false
    }
    
    @State private var text: String = "정답"
    
    private var subject: PassthroughSubject<Bool, Never> = .init()
    
    @ObservedObject private var viewModel: EquatableViewModel = .init()
    
    var body: some View {
        Text(text)
            .onTapGesture {
                subject.send(text == "오답")
            }
            .onReceive(subject) { output in
                print("상갑 logEvent \(#function) output: \(output)")
                if output {
                    viewModel.name.append("hi")
//                    viewModel.test()
                    text = "정답"
                } else {
                    viewModel.testName.append("hi")
//                    viewModel.test()
                    text = "오답"
                }
            }
        
        EquatableSubView(id: text)
            .environmentObject(viewModel)
        
        Text(viewModel.name)
            .background(.blue)
        
        Text(viewModel.testName)
            .background(.blue)
    }
}

struct EquatableSubView: View {
//    static func == (lhs: EquatableSubView, rhs: EquatableSubView) -> Bool {
//        print("상갑 logEvent \(#function) EquatableSubView")
//        return lhs.id == rhs.id
//    }
    
    @EnvironmentObject private var viewModel: EquatableViewModel
    
    @StateObject private var viewModdel2: EquatableViewModel = .init()
    
    let id: String
    
    init(id: String) {
        print("상갑 logEvent \(#function) EquatableSubView init")
        self.id = id
    }
    
    
    var body: some View {
        Text(id)
            .background(.mint)
            .onTapGesture {
                viewModel.test()
                viewModdel2.test()
            }
        
        Text("\(viewModel.testState.test)")
            .background(.orange)
        
        Text("\(viewModdel2.testState.test)")
            .background(.brown)
    }
}

#Preview {
    EquatableTest()
}
