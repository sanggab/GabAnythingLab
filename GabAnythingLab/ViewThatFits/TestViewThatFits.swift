//
//  TestViewThatFits.swift
//  GabAnythingLab
//
//  Created by Gab on 12/18/24.
//

import SwiftUI

struct TestViewThatFits: View {
    var uploadProgress: Double = 0.0
    
    var body: some View {
        VStack {
            UploadProgressView(uploadProgress: 0.75)
                .frame(maxWidth: 200)
                .background(.mint)
            UploadProgressView(uploadProgress: 0.75)
                .frame(maxWidth: 100)
                .background(.mint)
            UploadProgressView(uploadProgress: 0.75)
                .frame(maxWidth: 50)
                .background(.mint)
        }
    }
    
    @ViewBuilder
    func UploadProgressView(uploadProgress: Double) -> some View {
        ViewThatFits(in: .horizontal) {
            HStack {
                Text("\(uploadProgress.formatted(.percent))")
                ProgressView(value: uploadProgress)
                    .frame(width: 100)
            }
            ProgressView(value: uploadProgress)
                .frame(width: 100)
            Text("\(uploadProgress.formatted(.percent))")
        }
    }
}

#Preview {
    TestViewThatFits()
}
