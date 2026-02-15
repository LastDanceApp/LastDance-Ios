//
//  TodoMainView.swift
//  LastDance
//
//  Created by 이지원 on 2/10/26.
//
import SwiftUI

let sampleTodos: [TodoResponseDTO] = [
    .init(id: 1, name: "김철수", title: "매일 아침 글쓰기", leftDays: 2, status: .critical, limitDays: 14, watchersNum: 2, isChecked: true),
    .init(id: 2, name: "이영희", title: "영어 단어 50개", leftDays: 3, status: .warning, limitDays: 7, watchersNum: 0, isChecked: false),
    .init(id: 3, name: "박민수", title: "러닝 3km", leftDays: 0, status: .safe, limitDays: 3, watchersNum: 1, isChecked: false),
    .init(id: 4, name: "정수진", title: "러닝 3km", leftDays: 0, status: .safe, limitDays: 4, watchersNum: 1, isChecked: false),
    .init(id: 5, name: "오지훈", title: "러닝 3km", leftDays: 0, status: .safe, limitDays: 3, watchersNum: 1, isChecked: false),
]

struct TodoMainView: View {
    @State private var showModal: Bool = false
    @State private var showDetailModal: Bool = false
    @State private var selectedTodo: TodoResponseDTO?
    @State private var isSideMenuOpen: Bool = false
    @State private var selectedTabIndex: Int = 0

    
    var body: some View {
        ZStack(alignment: .trailing) {
            mainContent
            
            if isSideMenuOpen {
                AlarmSideViewContent(isPresented: $isSideMenuOpen, widthRatio: 0.9) {
                      AlarmMainView(isPresented: $isSideMenuOpen)
                          .background(Color.white)
                          .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                  }
            }
        }
    }
    
    private var mainContent: some View {
        VStack(spacing: 0) {
            Header(title: "습관 증인", isSideMenuOpen: $isSideMenuOpen)
            TabBar(content1: "내 약속", content2: "내가 지켜보는 약속", selectedIndex: $selectedTabIndex)
            ZStack(alignment: .bottomTrailing) {
                TodoListView(
                    todos: sampleTodos,
                    showMemberName: selectedTabIndex == 1
                ) { todo in
                    selectedTodo = todo
                    showDetailModal = true
                }
                FloatingCreateButton(isEnabled: true) {
                    showModal = true
                }
                .sheet(isPresented: $showModal) {
                    TodoCreateModal()
                }
                .padding(.trailing, 20)
                .padding(.bottom, 24)
            }
            .padding(.trailing,20)
            .padding(.bottom,24)
            
        }
        .sheet(isPresented: $showDetailModal, onDismiss: {
            selectedTodo = nil
        }) {
            if let selectedTodo {
                if selectedTabIndex == 0 {
                    DetailModal(dto: selectedTodo, members: WitnessMemberDTO.dummyList)
                } else {
                    DetailMessageModal(dto: selectedTodo, members: WitnessMemberDTO.dummyList)
                }
            }
        }
    }
}

#Preview {
    TodoMainView()
}
