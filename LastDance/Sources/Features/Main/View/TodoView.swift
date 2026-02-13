//
//  TodoView.swift
//  LastDance
//
//  Created by 이지원 on 2/10/26.
//

import SwiftUI

struct TodoCardView : View {
    let memberName: String?
    let title : String
    let leftDays: Int
    let status : TodoStatus
    let limitDays : Int
    let watchersNum : Int
    
    // 모든 필드 받는 생성자
    init(
        memberName: String?,
        title: String,
        leftDays: Int,
        status: TodoStatus,
        limitDays: Int,
        watchersNum: Int
    ) {
        self.memberName = memberName
        self.title = title
        self.leftDays = leftDays
        self.status = status
        self.limitDays = limitDays
        self.watchersNum = watchersNum
    }

    // memberName 없이 사용하는 생성자
    init(
        title: String,
        leftDays: Int,
        status: TodoStatus,
        limitDays: Int,
        watchersNum: Int
    ) {
        self.memberName = nil
        self.title = title
        self.leftDays = leftDays
        self.status = status
        self.limitDays = limitDays
        self.watchersNum = watchersNum
    }
    
    var body: some View {
        VStack(spacing: LDSpacing.s12){
            if let memberName {
                HStack {
                    Image("person")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 10, height: 10)
                    Text(memberName)
                        .font(.system(size: LDTypography.footnote.size))
                        .foregroundStyle(LDColor.Text.secondary)
                    Spacer()
                }
            }

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
                Text(String(watchersNum))
                    .foregroundColor(Color.blue)
                    .font(.system(size: 14, weight: .light, design:.monospaced))
            }
            ProgressBar(value: Double(leftDays) / Double(limitDays),color: status.color)
            HStack{
                Text("0일")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Spacer()
                Text(String(limitDays) + "일 제한")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding(LDSpacing.s16)
        .background(LDColor.Background.surface)
        .clipShape(RoundedRectangle(cornerRadius: LDRadius.card, style: .continuous))
        .shadow(color: Color.black.opacity(0.06), radius: 8, x: 0, y: 2)
    }
}

#Preview {
    TodoCardView(memberName:"김철수", title: "할일 하기", leftDays: 10, status: TodoStatus.critical, limitDays: 30, watchersNum: 10)
}

