//
//  InformationView.swift
//  ForCreatorLifeCycle
//
//  Created by Cute Puppy on 2024/2/22.
//

import SwiftUI

struct InformationView: View {
    let data = (1...20).map { "img\($0)" }
    //创建一个1到20的区间，映射img前缀给每个数字，返回一个数组["img1", "img2"...]，赋值给let date
    let rule = [GridItem(.adaptive(minimum: 160))]
    
    @State private var showReminderOnMainScreen = false
    @State private var sendOutNoticification = false
    var targetDurations = ["15min", "30min", "1h", "2h", "3h"]
    @State private var selectedDuration: String = "" //picker的值
    
    var body: some View {
        TabView {
            
            //列表视图
            List {
                ForEach(data, id: \.self) { item in
                    CardView()
                }
                //对于data数组中的每个元素，使用CardView()创建一个视图
                //id: \.self的作用是为了确保每个元素都有一个唯一的标识符
            }
            .listStyle(.plain)
            .tabItem {
                Label ("ListView", systemImage: "list.bullet")
            }
            
            
            //网格视图
            ScrollView {
                LazyVGrid(columns: rule, spacing: 32) {
                    ForEach(data, id: \.self) { item in
                        GridCardView()
                    }
                    //循环date中的数据，用其中的元素替换item，生成独一无二的同date中数据数等同的内容
                }
                .padding(.horizontal)
            }
            .tabItem {
                Label ("GridView", systemImage: "square.grid.2x2")
            }
            
            
            //组成框
            NavigationView {
                ScrollView {
                    GroupBox(label: Label("INNER PRACE", systemImage: "flame").foregroundColor(.red)) {
                        HStack {
                            Text("1,026,033")
                                .font(.title)
                            Text("mint")
                                .foregroundColor(.gray)
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 16)
                    }
                    .padding()
                }
            }
            .tabItem {
                Label ("GridView", systemImage: "square.grid.2x2")
            }
            
            //表单
            NavigationView {
                Form {
                    Section(header: Text("每日目标")) {
                        Toggle("自动登录", isOn: $showReminderOnMainScreen)
                        Toggle("推送提醒", isOn: $sendOutNoticification)
                        Picker("目标时间", selection: $selectedDuration) {
                            ForEach(targetDurations, id: \.self) { item in
                                Text(item)
                            }
                        }
                    }
                    Section(header: Text("每日目标")) {
                        Button(action: { }, label: {
                            Text( "帮助指南")
                        })
                        Button(action: { }, label: {
                            Text( "提交反馈")
                        })
                    }
                }
                //.padding(.top)
                .navigationTitle("设置")
            }
            .tabItem {
                Label ("Form", systemImage: "list.bullet.rectangle")
            }
            
        }
    }
}

struct GridCardView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image("Image_01")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(8)
                //.shadow(color: .clear, radius: 5)
                .padding(.bottom, 4)
            Text("INNER PEACE")
                .font(.footnote)
            Text("Slate Podcasts")
                .font(.footnote)
                .foregroundColor(.gray)
        }
        .frame(width: 160)
    }
}

#Preview {
    InformationView()
}
