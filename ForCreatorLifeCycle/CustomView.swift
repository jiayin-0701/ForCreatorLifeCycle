//
//  CustomView.swift
//  ForCreatorLifeCycle
//
//  Created by Cute Puppy on 2024/2/28.
//

import SwiftUI

struct CustomView: View {
    @State private var input = ""
    @State private var isHidden = false
    var body: some View {
        ScrollView {
            
            //frame 自动布局
            HStack {
                Rectangle()
                    .frame(width: 262, height: 100)
                    .foregroundColor(.blue)
                
                Rectangle()
                    .frame(minWidth: 100, idealWidth: 150, maxWidth: 200)
                    .frame(height: 100)
                    .foregroundColor(.blue)
            }
            .padding(.horizontal)
            
            
            //忽视安全区域设定
            VStack {
                TextField("Input", text: $input)
                    .padding(.horizontal)
                Rectangle()
                    .frame(minHeight: 100, idealHeight: 300, maxHeight: 500)
                    .foregroundColor(.orange)
                    .cornerRadius(8)
                    .padding()
                    .ignoresSafeArea(.keyboard)
            }
            
            
            //占位符
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("大标题")
                        .font(.largeTitle)
                    Text("文字部分便会被自动隐藏。")
                        .font(.body)
                        .foregroundColor(.blue)
                }
                VStack(alignment: .leading, spacing: 8) {
                    Text("大标题")
                        .font(.largeTitle)
                    Text("文字部分便会被自动隐藏。")
                        .font(.body)
                        .foregroundColor(.blue)
                }
                .redacted(reason: .placeholder) //占位符
            }
            
            
        }
    }
}

#Preview {
    CustomView()
}
