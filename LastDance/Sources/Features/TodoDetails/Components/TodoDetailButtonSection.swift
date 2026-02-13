
import SwiftUI

struct TodoDetailButtonSection: View{
    
    let button1: TodoDetailButton
    let button2: TodoDetailButton
    
    var body: some View{
        HStack(spacing: LDSpacing.s12) {
            button1
            button2
            
        }
        .padding(.horizontal, LDSpacing.s16)
        .padding(.bottom, LDSpacing.s20)
    }
}

extension TodoDetailButtonSection {

    static var doButton: TodoDetailButtonSection {
        TodoDetailButtonSection(
            button1: TodoDetailButton(
                title: "오늘 했어요",
                imageName: "checkmark",
                backgroundColor: .green,
                action: {}
            ),
            button2: TodoDetailButton(
                title: "안 할래요",
                imageName: "xmark",
                backgroundColor: .red,
                action: {}
            )
        )
    }
    
    static var messageButton: TodoDetailButtonSection {
        TodoDetailButtonSection(
            button1: TodoDetailButton(
                title: "메시지 보내기",
                imageName: "message",
                backgroundColor: LDColor.Brand.primary,
                action: {}
            ),
            button2: TodoDetailButton(
                title: "빠른 응원",
                imageName: "bolt",
                backgroundColor: LDColor.Status.warning,
                action: {}
            )
        )
    }
    
}

#Preview {
    TodoDetailButtonSection(
        button1: TodoDetailButton(
            title: "메시지 보내기",
            imageName: "message",
            backgroundColor: LDColor.Brand.primary,
            action: {}
        ),
        button2: TodoDetailButton(
            title: "빠른 응원",
            imageName: "bolt",
            backgroundColor: LDColor.Status.warning,
            action: {}
        )
    )
}

