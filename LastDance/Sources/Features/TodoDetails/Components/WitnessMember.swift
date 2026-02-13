
import SwiftUI

struct WitnessMember: View{
    
    let member: WitnessMemberDTO
    
    var body: some View{
        
        HStack {
            HStack(spacing: LDSpacing.s8) {
                
                Image("person")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 12, height: 12)
                
                Text(member.name)
                    .font(.system(size: LDTypography.title3.size))
                    .foregroundStyle(LDColor.Text.secondary)
            }

            Spacer()
            
            Button(action: {
                // 동작 작성
            }) {
                Image("trash")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15)

            }

            
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, LDSpacing.s20)
        .padding(.vertical, LDSpacing.s12)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(LDColor.Background.app)
        )
        
    }
}

#Preview {
    WitnessMember(member: WitnessMemberDTO.dummyOne)
}

