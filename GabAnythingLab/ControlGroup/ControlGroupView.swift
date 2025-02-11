//
//  ControlGroupView.swift
//  GabAnythingLab
//
//  Created by Gab on 12/26/24.
//

import SwiftUI

struct ControlGroupView: View {
    var body: some View {
        VStack {
//            Menu {
//                
                ControlGroup {
                    Button {
                        print("반갑소")
                    } label: {
                        Label("Button 1", systemImage: "pencil.tip.crop.circle.badge.plus")
                    }
                    
                    Button {
                        print("반갑소")
                    } label: {
                        Label("Button 2", systemImage: "doc")
                    }
                }
//
//                
//            } label: {
//                Label("dd", systemImage: "ellipsis.circle")
//            }
            
        }
    }
}

#Preview {
    ControlGroupView()
}
