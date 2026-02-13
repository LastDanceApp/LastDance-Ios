
import SwiftUI

struct DetailModal: View {
    let dto: TodoResponseDTO
    let members: [WitnessMemberDTO]
    @Environment(\.presentationMode) private var presentation

    var body: some View {
        VStack(spacing: 0) {
            DetailModalCommon(
                dto: dto,
                onClose: {presentation.wrappedValue.dismiss()}
            )
            TodoDetailButtonSection.doButton
            Witness(members: members)
        }
        .padding(.top, 16)
    }
}

struct DetailModal_Previews: PreviewProvider {
    static var previews: some View {
        let sample = TodoResponseDTO(
            title: "매일 아침 글쓰기",
            leftDays: 12,
            status: .critical,
            limitDays: 14,
            watchersNum: 2,
            isChecked: true
        )

        DetailModal(dto: sample, members: WitnessMemberDTO.dummyList)
            .previewDisplayName("DetailModal")
    }
}
