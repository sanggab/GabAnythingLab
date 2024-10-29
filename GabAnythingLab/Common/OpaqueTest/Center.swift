//
//  Center.swift
//  GabAnythingLab
//
//  Created by Gab on 10/29/24.
//

import SwiftUI

class ReducerManager {
    static let `default` = ReducerManager()
    
    private init() { }
    
    func makeReducers(types: [ReducerType]) -> [any GabReducer] {
        var reducer: [any GabReducer] = []
        
        for type in types {
            switch type {
            case .main:
                reducer.append(MainViewModel.makeReducer())
            case .history:
                reducer.append(HistoryViewModel.makeReducer())
            case .message:
                reducer.append(MessageViewModel.makeReducer())
            case .mypage:
                reducer.append(MypageViewModel.makeReducer())
            }
        }
        
        return reducer
    }
    
    func makeFeatures(types: [ReducerType]) -> [any ReducerFeature] {
        var reducer: [any ReducerFeature] = []
        
        for type in types {
            switch type {
            case .main:
                reducer.append(MainViewModel())
            case .history:
                reducer.append(HistoryViewModel())
            case .message:
                reducer.append(MessageViewModel())
            case .mypage:
                reducer.append(MypageViewModel())
            }
        }
        
        return reducer
    }
}

extension ReducerManager {
//    func makingMainReducer() -> {
//        
//    }
}

private extension ReducerManager {
    

}
