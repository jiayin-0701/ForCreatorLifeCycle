//
//  SwiftUIView.swift
//  ForCreatorLifeCycle
//
//  Created by Cute Puppy on 2024/2/21.
//

import SwiftUI

struct SwiftUIView: View {
    @State var input = "此处是用户键入的文本"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24.0) {
            
            Text("基础文本框")
            
            Label("带图标的文本", systemImage: "message")

            TextField("输入框", text: $input)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            SecureField("不可见文本框", text: $input)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Link("baidu 可点击链接🔗", destination: URL(string: "www.baidu.com")!)
            
            TextEditor(text: $input)
                .foregroundColor(.gray)
        }
        .padding()
        
        Divider()
            .padding()
        
        HStack {
            VStack(alignment: .leading, spacing: 6.0) {
                Text("星期二")
                    .font(.footnote)
                    .foregroundColor(.gray)
                Text("聊聊苹果Mac新品发布会，ARM新时代的启幕")
                    .font(.title2)
                Text("SwiftUI的灵活度非常高，允许你根据个人意愿将各种视图随心组合。你可以让多个视图水平排列，纵向排列，或重叠在一起排列等，本小节将介绍这些用于规整界面元素的排版视图。")
                    .font(.footnote)
                    .foregroundColor(.gray)
                
            }
            
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            
            Text("33分钟")
                .font(.body)
                .foregroundColor(.gray)
        }
        .padding()
    }
}

#Preview {
    SwiftUIView()
}
