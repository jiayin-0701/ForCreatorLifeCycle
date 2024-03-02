//
//  ModifierView.swift
//  ForCreatorLifeCycle
//
//  Created by Cute Puppy on 2024/2/28.
//

import SwiftUI

struct ModifierView: View {
    @State private var input = ""
    var body: some View {
        ScrollView {
            VStack {
                Text("Hello, World!")
                    .font(.largeTitle)
                Text("Hello, World!")
                    .font(.title)
                Text("Hello, World!")
                    .font(.title2)
                Text("Hello, World!")
                    .font(.title3)
                    .padding(.bottom)
                
                Text("Hello, World!")
                    .font(.headline)
                Text("Hello, World!")
                    .font(.subheadline)
                    .padding(.bottom)
                
                Text("Hello, World!")
                    .font(.body)
                Text("Hello, World!")
                    .font(.callout)
                Text("Hello, World!")
                    .font(.footnote)
                Text("Hello, World!")
                    .font(.caption)
                Text("Hello, World!")
                    .font(.caption2)
            }
            .padding([.bottom, .top], 16)
            .foregroundColor(.white)
            
            VStack {
                Text("Hello, World!")
                    .font(.system(.largeTitle, design: .default, weight: .black))
                Text("Hello, World!")
                    .font(.system(.largeTitle, design: .rounded, weight: .medium))
                Text("Hello, World!")
                    .font(.system(.largeTitle, design: .monospaced, weight: .semibold))
                Text("Hello, World!")
                    .font(.system(.largeTitle, design: .serif, weight: .regular))
                    .tracking(-1)
                    .padding(.bottom, 4)
                Text("👶")
                    .font(.custom("NotoSerifSC-Regular", size: 40))
                Text("JingruLiu")
                    .baselineOffset(0.0)
            }
            .padding(.bottom, 24)
            
            VStack(spacing: 16) {
                Text("你有这么高速运转的机械进入中国，记住我给出的原理，小的时候。就是研发人，研发这个东西的原理，它是阴间政权管着呢，它为什么为什么有生灵给他运转先位，还有说专门饲养它，为什么地下产这种东西它管着它，说是五世同堂旗下子孙，你以为我跟你闹着玩呢，黄龙江一派全都带蓝牙，王龙江化名我小舅，我亲小舅赵金兰那个嫡子嫡孙。")
                    .font(.footnote)
                    .truncationMode(.tail) //省略模式
                    .lineLimit(3) //省略行数
                    .padding(.horizontal)
                /*Text("当指定的文本无法在系统分配的空间中完全显示，或已被人为限制行数时，SwiftUI 便会省略多出的文本。有时你也许不希望长文本被从尾部省略，省略开头或中间的内容也许更适合些。此时可以通过省略模式来调整长文本的省略号出现的位置，比如 .head 省略开头、.middle 省略中间、.tail 省略结尾。省略模式的语法为 ​.truncationMode(.middle)​，其中参数 .middle 指的是省略中间。")
                    .font(.footnote)
                    .truncationMode(.tail)
                    .lineLimit(2)
                    .padding(.horizontal)
                    .lineSpacing(6) //行间距*/
                
            }
            .padding(.bottom)
            
            VStack {
                TextField("", text: $input)
                    .padding(.horizontal, 80)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.sentences)
            }
            .padding(.bottom, 24)
            
            HStack(spacing: 16) {
                
                Button(action: {}) {
                    Text("今天死")
                        .font(.headline)
                        .foregroundColor(.gray)
                }
                .buttonStyle(CustomButtonStyle02())
                
                Button(action: {}) {
                    HStack {
                        Text("明天死")
                            .font(.headline)
                        //Spacer()
                        //Image(systemName: "point.3.connected.trianglepath.dotted")
                    }
                    .foregroundColor(.white)
                }
                .buttonStyle(CustomButtonStyle01())
                
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    ModifierView()
}
