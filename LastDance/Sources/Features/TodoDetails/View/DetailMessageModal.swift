
import SwiftUI

struct DetailMessageModal: View {
    let dto: TodoResponseDTO
    let members: [WitnessMemberDTO]
    @Environment(\.presentationMode) private var presentation

    var body: some View {
        VStack(spacing: 0) {
            DetailModalCommon(
                dto: dto,
                onClose: {presentation.wrappedValue.dismiss()}
            )
            TodoDetailButtonSection.messageButton
            FastMessage()
        }
        .padding(.top, 16)
    }
}

struct DetailMessageModal_Preivews: PreviewProvider {
    static var previews: some View {
        let sample = TodoResponseDTO(
            id: 1,
            title: "매일 아침 글쓰기",
            leftDays: 12,
            status: .critical,
            limitDays: 14,
            watchersNum: 2,
            isChecked: true
        )

        DetailMessageModal(dto: sample, members: WitnessMemberDTO.dummyList)
            .previewDisplayName("DetailMessageModal")
    }
}
