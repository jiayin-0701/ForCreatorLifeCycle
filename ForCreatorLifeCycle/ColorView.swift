//
//  ColorView.swift
//  ForCreatorLifeCycle
//
//  Created by Cute Puppy on 2024/2/29.
//

import SwiftUI
import Glur

struct ColorView: View {
    
    var colors = Gradient(colors: [Color(hex: 0x000000), .orange])
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 64)
                .frame(width: 200, height: 200)
            RoundedRectangle(cornerRadius: 99)
                .frame(width: 120, height: 120)
                .foregroundColor(.orange)
        }
        .glur()
        .cornerRadius(64)
        
        /*//自定义
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .foregroundColor(Color(hex: 0xa0a0a0))
        
        //渐变色
        HStack {
            RoundedRectangle(cornerRadius: 16) //线性渐变
                .fill(LinearGradient(gradient: colors, startPoint: .topLeading, endPoint: .bottomTrailing))
                .glur(radius: 32, offset: 0)
                .cornerRadius(16)
            RoundedRectangle(cornerRadius: 16) //圆形渐变
                .fill(RadialGradient(gradient: colors, center: .center, startRadius: 1, endRadius: 100))
            RoundedRectangle(cornerRadius: 16) //弧度渐变
                .fill(AngularGradient.init(gradient: colors, center: .center))
        }
        .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
        .padding()
        
        //背景模糊
        ZStack(alignment: .bottom) {
            Image("Image_01")
                .glur(radius: 32.0, offset: 0)
            
                
        }
        .cornerRadius(16)
        .padding(.bottom, 64)
        
        //模糊
        Circle()
            .frame(width: 100)
            .foregroundColor(.blue)
            .blur(radius: 30)
        
        //3d旋转
        RoundedRectangle(cornerRadius: 16)
            .frame(width: 160, height: 100)
            .foregroundColor(.orange)
            .rotation3DEffect(.degrees(50),axis: (x: 0.0, y: 1.0, z: 0.0))
            .offset(x: 16)*/
    }
}

//扩展hex颜色，用 0x 表示 #
extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}


#Preview {
    ColorView()
}
