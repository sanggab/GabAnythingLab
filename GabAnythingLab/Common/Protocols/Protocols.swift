//
//  Protocols.swift
//  GabAnythingLab
//
//  Created by Gab on 10/24/24.
//

import SwiftUI

//public protocol GabReducer: ObservableObject {
//    associatedtype State: Equatable
//    associatedtype Action: Equatable
//    
//    func callAsFunction<V: Equatable>(_ keyPath: KeyPath<State, V>) -> V
//    
//    func action(_ action: Action)
//}

class SampleReducer: GabReducer {
    struct State: Equatable {
        
    }
    
    enum Action: Equatable {
        
    }
    
    @Published var state: State = .init()
    
    func callAsFunction<V>(_ keyPath: KeyPath<State, V>) -> V where V : Equatable {
        return state[keyPath: keyPath]
    }
    
    func action(_ action: Action) {
        
    }
}
//
//
//class GabLab: KaPPaFeature {
//    
//    var option: GabZoneOption
//    
//    init(option: GabZoneOption) {
//        self.option = option
//    }
//    
//    
//    func getReducer() -> some GabReducer {
//        switch option {
//        case .one:
//            return LoadingAnimationViewModel()
//        default:
//            return SampleReducer()
//        }
//    }
//}

protocol Crop {
    associatedtype FeedType: AnimalFeed where FeedType.CropType == Self
    func harvest() -> FeedType
}

protocol AnimalFeed {
    associatedtype CropType: Crop where CropType.FeedType == Self
    static func grow() -> CropType
}

struct Rice: Crop {
    typealias FeedType = Hay
    
    func harvest() -> Hay {
        return Hay()
    }
}

struct Hay: AnimalFeed {
    typealias CropType = Rice
    
    static func grow() -> Rice {
        return Rice()
    }
}

struct Cow: Animal {
    typealias Feed = Hay
    
    func eat(_ food: Feed) {
        
    }
}

protocol Animal {
    associatedtype Feed: AnimalFeed
    func eat(_ food: Feed)
}

struct Farm {
    func feed(_ animal: some Animal) {
        let crop = type(of: animal).Feed.grow().harvest()
        animal.eat(crop)
    }
    
    func feedAll(_ animals: [any Animal]) {
        for animal in animals {
            feed(animal)
        }
    }
}

// Animal은 먹이를 먹음 -> eat
// Animal은 각자 정해진 먹이들이 있음 AnimalFeed
// 먹이는 자라고 수확을 하는 과정을 지님
// 그런 과정을 거쳐 Animal이 먹는다


// 그럼 나의 ViewModel 주입 방법에서는 어떻게 할까
// 각각의 Feature마다 정해진 Reducer들이 있음
// 이 Reducer는 만들어지는 과정이 있음
// 그런 만들어진 과정을 거쳐 Feature로 정해진다.


// 만들고자 하는 최종 목표는 쓰고 싶은 곳은 @EnvironmentObject 선언해서 사용, 주입하고자 하는 곳은 어떠한 Class에서 Generic을 사용해서 고유한 Reducer를 뽑아 내지만 실존 타입은 모르는 형태
// 근데 environmentObject로 주입시킬 때 중요한 점은 Reducer가 some 타입이여야 하는 것
// 그러면 결국엔 any 배열에서 실존 타입을 뽑아내서 줘야 한다.


class GabCenter {
    
    static let shared = GabCenter()
    
    func makeReduer(option: GabZoneType) -> any GabReducer {
        switch option {
        case .one:
            return GabStore()
        case .sample:
            return SampleStore()
        case .gab:
            return GabStore()
        case .kappa:
            return KaPPaStore()
        }
    }
}

struct GabInputModifier: ViewModifier {
    var zones: [GabZoneType] = []
    private var anyReducer: [any GabReducer] = []
    
    init(zones: [GabZoneType]) {
        self.zones = zones
        
        for zone in zones {
            anyReducer.append(GabCenter.shared.makeReduer(option: zone))
        }
        
        print("상갑 logEvent \(#function) anyReducer: \(anyReducer)")
    }
    
    func body(content: Content) -> some View {
        ForEach(zones, id: \.self) { zone in
//            content.modifier(<#T##modifier: T##T#>)
        }
    }
    
    func getReducer(content: Content, reducers: [any GabReducer]) {
//        ForEach(reducers, id: \.self) { reducer in
//            
//        }
    }
}
