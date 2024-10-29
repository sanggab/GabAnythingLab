//
//  ReadMe.swift
//  GabAnythingLab
//
//  Created by Gab on 10/29/24.
//

import SwiftUI

// 현재 각 Feature마다 ViewModel이 존재한다.
// 근데 다른 Module의 ViewModel이나 두 개의 Feature가 합쳐진 그런 페이지들은 ViewModel을 많이 가질 수 밖에 없음.
// 그럴 때 마다 environmentObject로 주입을 시켜줘야함

// 그래서 원하는 ViewModel을 주입할 수 있는 기능이 있으면 내가 원하는 것들만 선택해서 environmentObject로 주입하고, 쓰고자 하는 곳 에선 그냥 쓰기만 하면 되는 구조가 필요하다
