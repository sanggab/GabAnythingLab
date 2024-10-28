//
//  lablab.swift
//  GabAnythingLab
//
//  Created by Gab on 10/28/24.
//

import SwiftUI

public protocol GabReducer: ObservableObject {
    associatedtype State: Equatable
    associatedtype Action: Equatable

    func callAsFunction<V: Equatable>(_ keyPath: KeyPath<State, V>) -> V

    func action(_ action: Action)
}

// 각 ViewModel의 Interface = GabReducer
// GabReducer 뽑아낼 수 있는 Interface가 존재해야됨 = ExtractReducer

protocol ExtractReducer {
    associatedtype Reducer: GabReducer
    
    func getReducer() -> Reducer
}

protocol TestProtocol {
    associatedtype Test: ExtractReducer
}


// 이제 이 Reducer을 모아놓은 Manager가 필요하다 = ViewModelManager
// 이 Manager에선 내가 원하는 Reducer를 뽑아내는걸 원한다.
class ViewModelManager {
    static let shared = ViewModelManager()
    
    
//    func getReducer(option: GabZoneOption) -> any GabReducer {
//        switch option {
//        case .one:
//            return KappaViewModel()
//        case .sample:
//            return KappaViewModel()
//        case .gab:
//            return KappaViewModel()
//        case .kappa:
//            return KappaViewModel()
//        default:
//            return KappaViewModel()
//        }
//    }
}


// 여기서 문제는 저 any GabReducer가 문제 -> 결국엔 some View면 some Reducer여야 하는데 AnyView로 감싸면 문제될 건 없지만 어케해야할까
// 일단 ViewModifier로 내가 원하는 옵션들에 대한 뷰모델을을 EnvironmentObject 주입시켜서 사용가능하게 만들어보자

struct ViewModelViewModifier: ViewModifier {
    
    var anyReducer: [any TestProtocol]
    
    init() {
        anyReducer = [
            
//            KappaViewModel()
            
        ]
    }
    
    func body(content: Content) -> some View {
        
    }
    
    func testView(content: Content) {
        let reducer = anyReducer.first!
        
    }
}

// Crop
// AnimalFeed

// 동물 먹이는 AnimalFeed = 근데 동물마다 먹이가 다르니까 FeedType을 정한다.
// 농작물을 수확하는 애가 필요함 = protocol Crop -> harvest
// 농작물 harvest하면 동물먹이가 나옴 = FeedType

// Reducer 종류
enum ReducerType {
    case main
    case history
    case message
    case mypage
}

class ReducerManager {
    var reducers: [any ReducerInterface]
    
    init() {
        self.reducers = [
            MainReducer(),
            HistoryReducer(),
            MessageReducer(),
            MyPageReducer()
        ]
    }
    
    func test() {
        for reduce in reducers {
            test2(reduce)
        }
    }
    
    func test2(_ hi: some ReducerInterface) {
        
    }
    
}
