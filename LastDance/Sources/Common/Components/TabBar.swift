
import SwiftUI

/**
    content1 : 첫 번째 내용
    content2 : 두 번째 내용
    selectedIndex: 0이면 첫 번째 선택, 1이면 두 번째꺼 선택
 */
struct TabBar: View {
    let content1: String
    let content2: String
    @Binding var selectedIndex: Int

    var body: some View {
        HStack(spacing: 0) {
            tabItem(title: content1, index: 0)
            tabItem(title: content2, index: 1)
        }
    }

    private func tabItem(title: String, index: Int) -> some View {
        let isSelected = selectedIndex == index

        return Button {selectedIndex = index} label: { // 누르면 그게 primary 색이 됨. selectedIndex 값 정해줌
            VStack(spacing: LDSpacing.s8) {
                Text(title).ldStyle(
                    LDTypography.headline,
                    color: isSelected ? LDColor.Brand.primary : LDColor.Text.secondary
                )

                Rectangle()
                    .frame(height: 3)
                    .foregroundStyle(isSelected ? LDColor.Brand.primary : Color.clear)
                    .overlay(alignment: .bottom) {
                        Rectangle()
                            .frame(height: 1)
                            .foregroundStyle(LDColor.Border.divider)
                    }
            }
            .frame(maxWidth: .infinity)
            .frame(minHeight: LDLayout.minTouch)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    TabBar(
        content1: "나의 약속",
        content2: "내가 지켜보는 약속",
        selectedIndex: .constant(0)
    )
}
