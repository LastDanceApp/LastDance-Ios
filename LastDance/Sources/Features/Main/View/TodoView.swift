//
//  TodoView.swift
//  LastDance
//
//  Created by 이지원 on 2/10/26.
//

import SwiftUI

struct TodoCardView : View {
    let title : String
    let leftDays: Int
    let status : TodoStatus
    let limitDays : Int
    let watchersNum : Int
    
    var body: some View {
        VStack(spacing: LDSpacing.s12){
            HStack{
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)
                Spacer()
            }
            HStack{
                Text("• " + status.text)
                    .foregroundColor(status.color)
                    .font(.system(size: 13, weight: .bold, design:.monospaced))
                Text("\(leftDays)일 경과")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Spacer()
                Image("eye")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
            }
            ProgressBar(value: Double(leftDays) / Double(limitDays),color: status.color)
        }
        .padding(LDSpacing.s16)
        .background(LDColor.Background.surface)
        .clipShape(RoundedRectangle(cornerRadius: LDRadius.card, style: .continuous))
        .shadow(color: Color.black.opacity(0.06), radius: 8, x: 0, y: 2)
    }
}

#Preview {
    TodoCardView(title: "할일 하기", leftDays: 10, status: TodoStatus.critical, limitDays: 30, watchersNum: 10)
}
