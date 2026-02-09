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
    @State private var leftDays = 0
    @Environment(\.dismiss) private var dismiss
    
    let maxTitle = 20
    let maxDescription = 120
    let maxDays = 30
    
    var isValid: Bool {
        !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        title.count <= maxTitle &&
        description.count <= maxDescription &&
        leftDays > 0 &&
        leftDays <= maxDays
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack{
                Text("새로운 약속")
                    .bold()
                    .foregroundColor(LDColor.Text.primary)
                Spacer()
            }
            HStack{
                Text("약속 이름")
                    .font(.system(size: 15, weight: .medium))
                TextField("예: 매일 아침 글쓰기", text: $title)
                    .ldTextFieldStyle()
                    .overlay(
                        HStack {
                            Spacer()
                            Text("\(title.count)/\(maxTitle)")
                                .font(.caption)
                                .foregroundColor(LDColor.Text.secondary)
                                .padding(.trailing, 12)
                        }
                    )
                Spacer()
            }
            Text("설명")
                .font(.system(size: 15, weight: .medium))
            TextField("약속에 대한 설명을 입력하세요",text: $description)
                .ldTextFieldStyle()
                .overlay(
                    HStack {
                        Spacer()
                        Text("\(description.count)/\(maxDescription)")
                            .font(.caption)
                            .foregroundColor(LDColor.Text.secondary)
                            .padding(.trailing, 12)
                    }
                )
            Text("임계일(며칠까지 안 해도 되나요?)")
                .font(.system(size: 15, weight: .medium))
            TextField("7", value : $leftDays, format: .number)
                .keyboardType(.numberPad)
                .ldTextFieldStyle()
                .overlay(
                    HStack {
                        Spacer()
                        Text("\(description.count)/\(maxDays)")
                            .font(.caption)
                            .foregroundColor(LDColor.Text.secondary)
                            .padding(.trailing, 12)
                    }
                )
            HStack {
                ActionButton(title: "취소", action: {
                    dismiss()
                })
                .modifier(SecondaryButtonStyle())
                ActionButton(title: "생성", action: {})
            }
            
        }
    }
    
}
