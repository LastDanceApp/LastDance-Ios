//
//  AlarmMainView.swift
//  LastDance
//
//  Created by 이지원 on 2/14/26.
//
import SwiftUI

struct AlarmMainView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack(spacing: 20){
            HStack{
                Text("알림")
                    .ldStyle(LDTypography.title2)
                Spacer()
                Button(){
                    isPresented = false
                } label: {
                    Image(systemName: "xmark")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(LDColor.Text.secondary)
                }
            }
            .padding(20)
            AlarmListView(AlarmDTO: alarm12)
            AlarmListView(AlarmDTO: alarm22)
        }
    }
}

var alarm12 = AlarmDTO(
    id: 2,
    title: "약속이 시작됐어요",
    dateTime: Date().addingTimeInterval(-60 * 60 * 2)
)
var alarm22 = AlarmDTO(
    id: 1,
    title: "약속이 시작됐어요1",
    dateTime: Date().addingTimeInterval(-60 * 60 * 2)
)

