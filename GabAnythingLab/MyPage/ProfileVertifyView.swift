//
//  ProfileVertifyView.swift
//  GabAnythingLab
//
//  Created by Gab on 2/4/25.
//

import SwiftUI

struct ProfileVertifyView: View {
    var body: some View {
        HStack {
            Text("Profile Vertification")
            
            Spacer()
            
            HStack {
                Image(systemName: "checkmark.circle")
                
                Text("Verified")
            }
            .padding(.horizontal)
            .padding(.vertical, 4)
            .background {
                RoundedRectangle(cornerRadius: 12)
                    .fill(.gray)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    ProfileVertifyView()
}
