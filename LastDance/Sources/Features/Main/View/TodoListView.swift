//
//  TodoListView.swift
//  LastDance
//
//  Created by 이지원 on 2/10/26.
//
import SwiftUI

struct TodoListView: View {
    let todos: [TodoResponseDTO]
    
    var body: some View {
        List(todos,id: \.title) { todo in
            TodoCardView(
                title: todo.title,
                leftDays: todo.leftDays,
                status: todo.status,
                limitDays: todo.limitDays,
                watchersNum: todo.watchersNum
            )
            .listRowSeparator(.hidden)
            .listRowBackground(LDColor.Background.surface)
            .blur(radius: todo.isChecked ? 0.6 : 0.0)
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .background(LDColor.Background.app)
    }
}

#Preview {
    let sample: [TodoResponseDTO] = [
        .init(title: "매일 아침 글쓰기", leftDays: 12, status: .critical, limitDays: 14, watchersNum: 2, isChecked: true),
        .init(title: "영어 단어 50개", leftDays: 3, status: .warning, limitDays: 7, watchersNum: 0,isChecked: true),
        .init(title: "러닝 3km", leftDays: 0, status: .safe, limitDays: 3, watchersNum: 1,isChecked: false),
    ]

    return TodoListView(todos: sample)
}
