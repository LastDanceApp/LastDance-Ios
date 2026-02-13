//
//  TodoCreateModal.swift
//  LastDance
//
//  Created by 이지원 on 2/10/26.
//
import SwiftUI

struct TodoCreateModal: View {
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var leftDays : Int? = nil
    @Environment(\.dismiss) private var dismiss
    
    let maxTitle = 20
    let maxDescription = 120
    let maxDays = 30
    
    var isValid: Bool {
        guard let days = leftDays else { return false }
        return !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
            title.count <= maxTitle &&
            description.count <= maxDescription &&
            days > 0 &&
            days <= maxDays
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack{
                Text("새로운 약속")
                    .bold()
                    .foregroundColor(LDColor.Text.primary)
                Spacer()
                Button(){
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(LDColor.Text.secondary)
                }
            }
            .padding(.bottom, 30)
            HStack{
                Text("약속 이름")
                    .font(.system(size: 15, weight: .medium))
                Spacer()
                Text("\(title.count)/\(maxTitle)")
                    .font(.caption)
                    .foregroundColor(LDColor.Text.secondary)
                    .padding(.trailing, 12)
            }
            // 약속 제목
            TextInput(exText: "약속 이름을 입력하세요", text: $title, maxText: maxTitle, height: 1)
            // 약속 설명
            HStack{
                Text("설명")
                    .font(.system(size: 15, weight: .medium))
                Spacer()
                Text("\(description.count)/\(maxDescription)")
                    .font(.caption)
                    .foregroundColor(LDColor.Text.secondary)
                    .padding(.trailing, 12)
            }
            TextInput(exText: "약속 설명을 입력하세요", text: $description,maxText: maxDescription, height: 3)
            // 임계일
            HStack{
                Text("임계일(며칠까지 안 해도 되나요?)")
                    .font(.system(size: 15, weight: .medium))
                Spacer()
            }
            NumInput(exText: "임계일을 입력하세요", value: $leftDays, maxValue: 30, height: 1)
                .padding(.bottom, 20)
            // 버튼 섹션
            HStack {
                ActionButton(title: "취소", action: {
                    dismiss()
                })
                .padding(12)
                .modifier(SecondaryButtonStyle())
                ActionButton(title: "생성", action: {})
                    .modifier(PrimaryButtonStyle())
            }
            
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 20)
    }
    
}

#Preview {
    TodoCreateModal()
}
