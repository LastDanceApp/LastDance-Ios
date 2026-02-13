//
//  TodoMainView.swift
//  LastDance
//
//  Created by 이지원 on 2/10/26.
//
import SwiftUI

let sampleTodos: [TodoResponseDTO] = [
    .init(title: "매일 아침 글쓰기", leftDays: 2, status: .critical, limitDays: 14, watchersNum: 2,isChecked: true),
    .init(title: "영어 단어 50개", leftDays: 3, status: .warning, limitDays: 7, watchersNum: 0, isChecked: false),
    .init(title: "러닝 3km", leftDays: 0, status: .safe, limitDays: 3, watchersNum: 1, isChecked: false),
]
struct TodoMainView: View {
 //   @State private var showCreate: Bool = true
    @State private var showModal: Bool = false
    @State private var showDetailModal: Bool = false
    @State private var selectedTodo: TodoResponseDTO?
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            Header(title: "습관 증인")
            TodoListView(todos: sampleTodos) { todo in
                selectedTodo = todo
                showDetailModal = true
            }
            FloatingCreateButton(isEnabled: true){
                showModal = true
            }
            .sheet(isPresented: $showModal){
                TodoCreateModal()
            }
            .padding(.trailing,20)
            .padding(.bottom,24)
            
        }
        .sheet(isPresented: $showDetailModal, onDismiss: {
            selectedTodo = nil
        }) {
            if let selectedTodo {
                DetailModal(dto: selectedTodo, members: WitnessMemberDTO.dummyList)
            }
        }
    }
}

#Preview {
    TodoMainView()
}
