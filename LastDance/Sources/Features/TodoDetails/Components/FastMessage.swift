
import SwiftUI

struct FastMessage: View{
    var body: some View{
        
        Text("빠른 메시지")
            .font(.system(
                size: LDTypography.subhead.size,
                weight: .medium
            ))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, LDSpacing.s20)
            .padding(.vertical, LDSpacing.s8)
        
        
        ForEach(FastMessageText.allCases) { fastMessageText in
            
            Button(action:{
                
            }){
                Text(fastMessageText.rawValue)
                    .font(.system(size: LDTypography.subhead.size))
                    .foregroundStyle(LDColor.Text.primary)
                    .padding(.vertical, 12)
                    .padding(.leading, 14)
                    .padding(.trailing, 12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(LDColor.Border.divider, lineWidth: 1)
                    )
            }
            
            
        }
        .padding(.horizontal, LDSpacing.s20)
        .padding(.vertical, LDSpacing.s2)
        
    }
}

#Preview {
    FastMessage()
}

private enum FastMessageText: String, CaseIterable, Identifiable {
    case invitePlaceholder = "오늘도 화이팅 😎"
    case witnessTitle = "당신은 할 수 있어요 😍"
    case inviteButton = "한 걸음씩 가면 돼요 🐽"

    var id: String { rawValue }
}
