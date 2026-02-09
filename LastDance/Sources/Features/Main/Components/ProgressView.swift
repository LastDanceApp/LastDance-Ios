//
//  ProgressView.swift
//  LastDance
//
//  Created by 이지원 on 2/10/26.
//
import SwiftUI

struct ProgressBar: View {
    let value: Double
    let color: Color
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading){
                Capsule()
                    .fill(LDColor.Text.disabled)
                Capsule()
                    .fill(color)
                    .frame(width: geo.size.width * min(max(value,0),1))
            }
        }
        .frame(height: 6)
    }
}

let status = TodoStatus.critical
#Preview {
    ProgressBar(value: 10.00 / 100, color: status.color)
}
