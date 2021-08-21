//
//  ModalView.swift
//  HalfModalViewAssignment
//
//  Created by Frimpong Anorchie II on 2021-08-21.
//

import SwiftUI

struct ModalView: View {
    
    var result: Service
    
    @Binding var isShowing: Bool
    @State private var isDragging = false
    
    @State private var curlHeight: CGFloat = 400
    let minHeight: CGFloat = 400
    let maxHeight: CGFloat = 700
    
    
    let startOpacity: Double = 0.4
    let endOpacity: Double = 0.8
    
    var dragPercentage: Double {
        let res = Double((curlHeight - minHeight) / (maxHeight - minHeight))
        return max(0, min(1, res))
    }
    
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if isShowing {
                Color.black
                    .opacity(startOpacity + (endOpacity - startOpacity) * dragPercentage)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing = false
                    }
                
                detailsView
                .transition(.move(edge: .bottom))
            }
        }
        .frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeInOut)
        
    }
    
    var detailsView: some View {
        
        VStack {
            ZStack{
                Capsule()
                    .frame(width: 40, height: 6)
            }
            .frame(height: 40)
            .frame(maxWidth: .infinity)
            .background(Color.white.opacity(0.00001))
            .gesture(dragGesture)
            
            ZStack{
                VStack{
                    Text(result.name)
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .regular))
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        .padding(.bottom, 10)
                    
                    Text(result.category)
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .regular))
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        .padding(.bottom, 10)
                    
                    Text(result.location)
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .bold))
                }
                .padding(.horizontal, 30)
            }
            .frame(maxHeight: .infinity)
            .padding(.bottom, 35)
            
        }
        .frame(height: curlHeight)
        .frame(maxWidth: .infinity)
        .background(
            ZStack{
                RoundedRectangle(cornerRadius: 30)
                Rectangle()
                    .frame(height: curlHeight / 2)
            }
            .foregroundColor(.white)
        )
        .animation(isDragging ? nil : .easeInOut(duration: 0.45))
        .onDisappear {
            curlHeight = minHeight
        }
    }
    
    @State private var prevDragTranslation = CGSize.zero
    
    var dragGesture: some Gesture {
        DragGesture(minimumDistance: 0, coordinateSpace: .global)
            .onChanged { val in
                if isDragging {
                    isDragging = true
                }
                
                let dragAmount = val.translation.height - prevDragTranslation.height
                if  curlHeight > maxHeight || curlHeight < maxHeight {
                    curlHeight -= dragAmount / 6
                } else {
                    curlHeight -= dragAmount
                }
                
                prevDragTranslation = val.translation
            }
            .onEnded { val in
                prevDragTranslation = .zero
                isDragging = false
                if curlHeight > maxHeight {
                    curlHeight = maxHeight
                } else if curlHeight < minHeight {
                    curlHeight = minHeight
                }
            }
    }
}

//struct ModalView_Previews: PreviewProvider {
//    static var previews: some View {
//        ModalView(isShowing: .constant(true))
//    }
//}
