//
//  TodoMainView.swift
//  LastDance
//
//  Created by 이지원 on 2/10/26.
//
import SwiftUI

let sampleTodos: [TodoResponseDTO] = [
    .init(id: 1,title: "매일 아침 글쓰기", leftDays: 2, status: .critical, limitDays: 14, watchersNum: 2,isChecked: true),
    .init(id: 2, title: "영어 단어 50개", leftDays: 3, status: .warning, limitDays: 7, watchersNum: 0, isChecked: false),
    .init(id: 3, title: "러닝 3km", leftDays: 0, status: .safe, limitDays: 3, watchersNum: 1, isChecked: false),
    .init(id: 4, title: "러닝 3km", leftDays: 0, status: .safe, limitDays: 4, watchersNum: 1, isChecked: false),
    .init(id: 5, title: "러닝 3km", leftDays: 0, status: .safe, limitDays: 3, watchersNum: 1, isChecked: false),
]
struct TodoMainView: View {
    @State private var showModal: Bool = false
    @State private var isSideMenuOpen: Bool = false
    
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
            TabBar(content1: "내 약속", content2: "내가 지켜보는 약속")
            ZStack(alignment: .bottomTrailing) {
                TodoListView(todos: sampleTodos)
                FloatingCreateButton(isEnabled: true) {
                    showModal = true
                }
                .sheet(isPresented: $showModal) {
                    TodoCreateModal()
                }
                .padding(.trailing, 20)
                .padding(.bottom, 24)
            }
        }
    }
}

#Preview {
    TodoMainView()
}
