import SwiftUI

struct Header: View {
    
    let title: String
    
    var body: some View{
        HStack(spacing: LDSpacing.s8) {
            HStack(spacing: LDSpacing.s4) {
                Image("eye")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)

                Text(title)
                    .ldStyle(LDTypography.headline, color: LDColor.Text.primary)
            }

            Spacer()

            HStack(spacing: LDSpacing.s12) {
                Image("bell.badge")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)

                Image("person")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
            }
        }
        .frame(minHeight: LDLayout.minTouch)
        .padding(.horizontal, LDSpacing.s16)
        .overlay(alignment: .bottom) {
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(LDColor.Border.divider)
        }
    }
}

#Preview {
    Header(title: "습관 증인")
}

