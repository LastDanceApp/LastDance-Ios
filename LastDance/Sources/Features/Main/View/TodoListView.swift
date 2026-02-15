//
//  TodoListView.swift
//  LastDance
//
//  Created by 이지원 on 2/10/26.
//
import SwiftUI

struct TodoListView: View {
    let todos: [TodoResponseDTO]
    let showMemberName: Bool
    let onTap: (TodoResponseDTO) -> Void
    
    var body: some View {
        List(todos,id: \.title) { todo in
            Button {
                onTap(todo)
            } label: {
                TodoCardView(
                    memberName: showMemberName ? todo.name : nil,
                    title: todo.title,
                    leftDays: todo.leftDays,
                    status: todo.status,
                    limitDays: todo.limitDays,
                    watchersNum: todo.watchersNum
                )
                .blur(radius: todo.isChecked ? 0.6 : 0.0)
                .overlay(
                    todo.isChecked ? Color.black.opacity(0.08) : Color.clear // 살짝 어둡게
                )
            }
            .buttonStyle(.plain)
            .listRowSeparator(.hidden)
            .listRowBackground(LDColor.Background.surface)

        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .background(LDColor.Background.app)
    }
}

#Preview {
    let sample: [TodoResponseDTO] = [
        .init(id: 1, name: "김철수", title: "매일 아침 글쓰기", leftDays: 12, status: .critical, limitDays: 14, watchersNum: 2, isChecked: true),
        .init(id: 2, name: "이영희", title: "영어 단어 50개", leftDays: 3, status: .warning, limitDays: 7, watchersNum: 0, isChecked: true),
        .init(id: 3, name: "박민수", title: "러닝 3km", leftDays: 0, status: .safe, limitDays: 3, watchersNum: 1, isChecked: false),
    ]
    return TodoListView(todos: sample, showMemberName: true, onTap: { _ in })

}
