
/**
     투두 상세 화면에서 증인 부분입니다.
    DetailModal의 하단에 붙입니다.
 */
import SwiftUI

struct Witness: View {
    let members: [WitnessMemberDTO]
    @State var email: String = ""
    
    var body: some View {
        
        VStack{
            
            HStack{
                
                Image("eye")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                        
                
                Text("증인 (\(members.count))")
                    .font(.system(
                        size: LDTypography.headline.size, weight:.medium)
                    )
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack{
                TextField("초대 링크 복사", text: $email)
                    .font(.system(size: LDTypography.subhead.size))
                    .padding(.vertical, 9)
                    .padding(.leading, 14)
                    .padding(.trailing, 9)
                    .background(LDColor.Background.surface)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(LDColor.Border.divider, lineWidth: 1)
                    )
                
                Button(action: {
                    // 동작 작성
                }) {
                    Image("document.on.document")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 15)
                        .padding(10)
                        .padding(.horizontal, 6)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(LDColor.Brand.primary)
                        )
                }
                
                
                
            }
            
            ForEach(members, id: \.memberId) { member in
                    WitnessMember(member: member)
                }
            
        }
        
        .padding(.horizontal, LDSpacing.s20)
        .padding(.vertical, LDSpacing.s24)
        
    }
}


#Preview {
    Witness(members: WitnessMemberDTO.dummyList)
}
