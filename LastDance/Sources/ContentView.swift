import SwiftUI

public struct ContentView: View {
    public init() {}

    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    public var body: some View {
        let margin = LDGrid.horizontalMargin(for: horizontalSizeClass)

        return VStack(alignment: .leading, spacing: LDSpacing.s16) {
            Header(title: "Last Dance")

            Text("Last Dance")
                .ldStyle(LDTypography.largeTitle, color: LDColor.Text.primary)

            Text("사용자를 재촉하지 않고, 이미 다가온 사실을 조용히 보여준다.")
                .ldStyle(LDTypography.body, color: LDColor.Background.surface)

            LDCard {
                VStack(alignment: .leading, spacing: LDSpacing.s12) {
                    Text("오늘의 상태")
                        .ldStyle(LDTypography.headline)

                    Text("남은 시간: 3일")
                        .ldStyle(LDTypography.caption, color: LDColor.Brand.primary)
                }
            }

            HStack(spacing: LDSpacing.s12) {
                Button("확인") {}
                    .buttonStyle(LDButtonStyle(.primary))

                Button("나중에") {}
                    .buttonStyle(LDButtonStyle(.secondary))
            }

            Button("삭제") {}
                .buttonStyle(LDButtonStyle(.destructive))
        }
        .padding(.horizontal, margin)
        .padding(.top, LDSpacing.s24)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(LDColor.Background.surface)
        .tint(LDColor.Brand.primary)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
