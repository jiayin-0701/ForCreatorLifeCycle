//
//  ImageView.swift
//  ForCreatorLifeCycle
//
//  Created by Cute Puppy on 2024/2/28.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        
        ScrollView {
            
            Image("Image_01")
                .imageAvatarStyle()
            
            Image("Image_01")
                .resizable() //可变尺寸
                .scaledToFit() //填充方式
            //.aspectRatio(contentMode: .fill),调整长宽比
                .clipShape(Circle()) //剪切蒙版
                .padding(40)
            
            HStack(spacing: 16) {
                
                Button(action: {}) {
                    HStack {
                        Text("Connect")
                            .font(.headline)
                        //Spacer()
                        //Image(systemName: "point.3.connected.trianglepath.dotted")
                    }
                    .foregroundColor(.white)
                }
                .buttonStyle(CustomButtonStyle01())
                
                Button(action: {}) {
                    Text("Cancel")
                        .font(.headline)
                        .foregroundColor(.gray)
                }
                .buttonStyle(CustomButtonStyle02())
            }
            .padding(.horizontal)
            
            /*Image(systemName: "scribble.variable")
                .imageScale(.large) //专门用来调整 系统图标的大小
                .padding(.bottom)
            
            Text("图片背景")
                .font(.title)
                .padding()
                .foregroundColor(.white)
                .background(
                    Image("Image_01")
                        .resizable()
                )
                .cornerRadius(8)
            
            Image("Image_01")
                .resizable()
                //.scaleEffect(0.5)
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .overlay(
                    HStack {
                        Spacer()
                        Text("Inner Peace")
                            .font(.headline)
                            .foregroundColor(.white)
                        Spacer()
                    }
                        .padding(16)
                        .background(Color.black .opacity(0.5))
                   ,alignment: .bottom
                )
                .padding(.horizontal, 40)
                .cornerRadius(16)*/
        }
    }
}

//自定义修改器
struct AvatarModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFill()
            .scaleEffect(1)
            .frame(width: 200, height: 200)
            .clipShape(Circle())
            .shadow(radius: 3)
    }
}
//扩展View创建新函数
extension View {
    func avatarStyle() -> some View {
        self.modifier(AvatarModifier())
    }
}
//适用图片修改器 .resizable
extension Image {
    func imageAvatarStyle() -> some View {
        self.resizable()
            .avatarStyle()
    }
}

//自定义按钮按下样式
struct CustomButtonStyle01: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: 124)
            .padding(16)
            .padding(.horizontal)
            .background(configuration.isPressed ? Color.white : Color.oilBlack)
            .cornerRadius(99.0)
    }
}
struct CustomButtonStyle02: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: 124)
            .padding(16)
            .padding(.horizontal)
            .background(configuration.isPressed ? Color.white : Color.gray02)
            .cornerRadius(99.0)
    }
}


#Preview {
    ImageView()
}
