//
//  ItemAreaView.swift
//  GabAnythingLab
//
//  Created by Gab on 2/5/25.
//

import SwiftUI

struct ItemAreaView: View {
    var body: some View {
        HStack {
            Group {
                
                RoundedRectangle(cornerRadius: 12)
                    .fill(.white)
                    .overlay {
                        VStack {
                            Image(systemName: "balloon.2.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .background(.pink)
                                .clipShape(Circle())
                            
                            Text("30 Amber")
                                .foregroundStyle(.yellow)
                        }
                    }
                
                RoundedRectangle(cornerRadius: 12)
                    .fill(.white)
                    .overlay {
                        VStack {
                            Image(systemName: "wallet.bifold")
                                .resizable()
                                .frame(width: 50, height: 50)
                            
                            Text("30 Amber")
                                .foregroundStyle(.yellow)
                        }
                    }
            }
        }
    }
}

#Preview {
    ItemAreaView()
}
