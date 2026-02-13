//
//  AlarmListView.swift
//  LastDance
//
//  Created by 이지원 on 2/14/26.
//
import SwiftUI

struct AlarmListView: View {
    var AlarmDTO: AlarmDTO?
    private var relativeTimeText: String {
        // 없으면 빈 문자열 반환
        guard let date = AlarmDTO?.dateTime else { return "" }
        let hours = max(0, Calendar.current.dateComponents([.hour], from: date, to: Date()).hour ?? 0)
        return "\(hours)시간 전"
    }
    
    var body: some View {
        VStack(spacing: 20){
            HStack{
                Text(AlarmDTO?.title ?? "Loading...")
                    .ldStyle(LDTextStyle(size: 16, weight: .medium, lineHeight: 10.0))
                    .foregroundColor(.black)
                Spacer()
            }
            HStack{
                Text(relativeTimeText)
                    .ldStyle(LDTextStyle(size: 12, weight: .medium, lineHeight: 10.0))
                    .foregroundColor(LDColor.Text.disabled)
                Spacer()
            }
        }
        .padding(20)
        .overlay(alignment: .bottom) {
            Rectangle()
                .frame(height: 1.2)
                .foregroundColor(LDColor.Text.secondary.opacity(0.5))
        }

    }
}

let alarm1 = AlarmDTO(id: 1, title: "1시간 전 알람", dateTime: Date().addingTimeInterval(-3600))
#Preview {
    AlarmListView(AlarmDTO: alarm1)
}
