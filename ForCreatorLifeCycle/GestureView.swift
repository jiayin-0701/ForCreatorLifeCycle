//
//  GestureView.swift
//  ForCreatorLifeCycle
//
//  Created by Cute Puppy on 2024/3/1.
//

import SwiftUI

struct GestureView: View {
    @State var currentGesture = "无"
    @State var longPressed = false
    
    @State var imageName = ["hare", "tortoise", "cloud", "moon", "wind", ]
    @State var currentImageName = "questionmark"
    
    //缩放
    @State var scale: CGFloat = 1.0
    @State var finalScale: CGFloat = 1.0
    //旋转
    @State var angle = Angle(degrees: 0.0)
    //拖拽
    @State var isDragging = false
    
    var body: some View {
        
        ScrollView {
            
            //长按手势
            VStack {
                Text("识别出的手势: \(currentGesture)")
                    .font(.largeTitle)
                RoundedRectangle(cornerRadius: 24)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(longPressed ? .orange : .blue)
                    .padding()
                    .onLongPressGesture {
                        currentGesture = "长按"
                        longPressed.toggle()
                    }
            }
            
            //轻点手势
            ZStack {
                RoundedRectangle(cornerRadius: 24)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.blue)
                    .padding()
                Image(systemName: currentImageName)
                    .resizable()
                    .scaleEffect(0.3)
                    .scaledToFit()
                    .foregroundStyle(.white)
            }
            .onTapGesture {
                currentImageName = imageName.randomElement()!
                currentGesture = "轻点"
            }
            
            //状态手势
            //缩放
            Circle()
                .fill(Color.blue)
                .frame(width: 300, height: 300)
                .scaleEffect(scale)
                .gesture(
                    MagnificationGesture()
                        .onChanged { value in
                            scale = value
                        }
                        .onEnded { value in
                            withAnimation(.smooth) {
                                finalScale *= value
                                scale = 1.0
                            }
                        }
                )
                .padding(80)
            
            //旋转
            Rectangle()
                .fill(Color.blue)
                .frame(width: 300, height: 300)
                .rotationEffect(angle)
                .gesture(
                    RotationGesture()
                        .onChanged { angle in
                            self.angle = angle
                        }
                )
            
            //拖拽
            Circle()
                .fill(isDragging ? .blue : .orange)
                .frame(width: 300, height: 300)
                .scaleEffect(scale)
                .gesture(
                    DragGesture()
                        .onChanged { _ in isDragging = true }
                        .onEnded { _ in isDragging = false }
                )
            
            //缩放拖拽同时进行
            let magnification =
                MagnificationGesture()
                .onChanged { scale in
                    self.scale = scale
                }
            let rotation =
                RotationGesture()
                .onChanged { angle in
                    self.angle = angle
                }
            let customGesture =
            magnification.simultaneously(with: rotation)
            
            HStack {
                Image("Image_01")
                    .gesture(customGesture)
                    .rotationEffect(angle)
                    .scaleEffect(scale)
                    .animation(.easeIn, value: 1)
            }
        }
    }
}

#Preview {
    GestureView()
}
