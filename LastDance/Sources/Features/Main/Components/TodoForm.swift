//
//  TodoForm.swift
//  LastDance
//
//  Created by 이지원 on 2/12/26.
//
import SwiftUI

struct TodoForm: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var viewContext
    
    @State private var title: String = ""
    @State private var isCompleted: Bool = false
    
    var body: some View {
        Form {
            Section(header: Text("약속 내용")) {
                
            }
        }
    }
}

#Preview {
    TodoForm()
}
