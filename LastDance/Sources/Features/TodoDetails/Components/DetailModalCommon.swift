//
//  DetailModalCommon.swift
//  LastDance
//
//  Created by 김준용 on 2/10/26.
//

/**
    DetailModal의 공통 부분입니다. ( 상단 ) - 헤더 포함
 */
import SwiftUI

struct DetailModalCommon: View {
    let dto: TodoResponseDTO
    let onClose: () -> Void

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(dto.title)
                    .font(.system(
                        size: LDTypography.headline.size, weight:.bold)
                    )
                    .ldStyle(LDTypography.headline, color: LDColor.Text.primary)
                Spacer()
                Button(action: onClose) {
                    Image(systemName: "xmark")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(LDColor.Text.secondary)
                }
                
            }
            .padding(.horizontal, LDSpacing.s16)
            .padding(.bottom, LDSpacing.s12)
            .overlay(alignment: .bottom) {
                Rectangle()
                    .frame(height: 1)
                    .foregroundStyle(LDColor.Border.divider)
            }
            
            VStack(alignment: .center, spacing: LDSpacing.s8) {
                Text("\(dto.limitDays-dto.leftDays)일째")
                    .font(.system(
                        size: LDTypography.title2.size, weight:.bold)
                    )
                    .ldStyle(LDTypography.title3, color: LDColor.Text.primary)
                    .multilineTextAlignment(.center)
    
                    
                Text("하지 않고 있습니다.")
                    .ldStyle(LDTypography.footnote, color: LDColor.Text.primary)
                    .multilineTextAlignment(.center)
                
                Text("• \(dto.status.text)")
                    .font(.system(
                        size: LDTypography.caption.size, weight:.bold)
                    )
                    .ldStyle(LDTypography.caption, color: dto.status.color)
                    .multilineTextAlignment(.center)
                    
                
            
            }
            .padding(.top, LDSpacing.s24)
            .padding(.horizontal, LDSpacing.s16)
            .padding(.bottom, LDSpacing.s24)
            
            VStack{
                ProgressBar(value: Double(dto.limitDays - dto.leftDays) / Double(dto.limitDays), color: dto.status.color)
                HStack{
                    Text("경과: \(dto.limitDays-dto.leftDays)")
                        .ldStyle(LDTypography.caption, color: LDColor.Text.secondary)
                    Spacer()
                    Text("남은 기회: \(dto.leftDays)일")
                        .font(.system(
                            size: LDTypography.caption.size, weight:.bold)
                        )
                        .ldStyle(LDTypography.caption, color: dto.status.color)
                }
                
            }
            .padding(LDSpacing.s16)
            .padding(.bottom, 1)
            
            Text(dto.title)
                .font(.system(
                    size: LDTypography.footnote.size, weight:.medium)
                )
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(LDSpacing.s16)
                .padding(.vertical, LDSpacing.s2)
                .background(
                    RoundedRectangle(cornerRadius: LDRadius.textField)
                        .fill(Color(hex: 0xF2F2F2))
                )
                .foregroundStyle(LDColor.Text.secondary)
                .padding(.horizontal, LDSpacing.s16)
                .padding(.top, 2)
                .padding(.bottom, LDSpacing.s20)

            
        }
        .background(LDColor.Background.surface)
    

    }
}
