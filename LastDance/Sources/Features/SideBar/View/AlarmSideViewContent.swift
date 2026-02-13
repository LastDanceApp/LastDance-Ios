//
//  AlarmSideViewContent.swift
//  LastDance
//
//  Created by 이지원 on 2/14/26.
//
import SwiftUI

struct AlarmSideViewContent<Content: View>: View {
    @Binding var isPresented: Bool
    let widthRatio: CGFloat
    let content: Content
    @GestureState private var dragOffset: CGFloat = 0
    
    init(
        isPresented: Binding<Bool>,
        widthRatio: CGFloat = 0.6,
        @ViewBuilder content: () -> Content
    ) {
        self._isPresented = isPresented
        self.widthRatio = widthRatio
        self.content = content()
    }
    
    var body: some View {
        GeometryReader { proxy in
            let menuWidth = proxy.size.width * widthRatio
            let offsetX = isPresented ? dragOffset : menuWidth + dragOffset
            
            ZStack(alignment: .trailing) {
                content
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    .background(Color.white)
            }
            .frame(width: menuWidth, alignment: .trailing)
            .frame(maxWidth: .infinity, alignment: .trailing)       
            .offset(x: offsetX)
            .animation(.interactiveSpring(response: 0.20, dampingFraction: 0.9), value: isPresented)
            .gesture(
                DragGesture()
                    .updating($dragOffset) { value, state, _ in
                        if value.translation.width <= 0 {
                            state = max(-menuWidth, value.translation.width)
                        }
                    }
                    .onEnded {value in
                        if value.translation.width <= -menuWidth * 0.3 {
                            isPresented = false
                        }
                    }
                )
        }
    }
}
