//
//  TableView.swift
//  ForCreatorLifeCycle
//
//  Created by Cute Puppy on 2024/2/22.
//

import SwiftUI

struct TableView: View {
    @State var showModal = false
    @State var showActionSheet = false
    @State var showAlert = false
    @State var showRamind = false
    
    var body: some View {
        
        TabView {
            
            
            /*//滚动视图
            ScrollView {
                Circle(); Circle(); Circle()
            }
                .tabItem {
                    Label("Received", systemImage: "scroll")
                }*/
            
            
            //导航视图
            NavigationView {
                NavigationLink(destination: ControlRelatedViews()) {
                    //导航器视图内容
                    CardView()
                }
                .navigationBarTitle("Loong City", displayMode: .large) //导航视图顶部标题 字体大小可以选择 .large .inline .automatic
                .navigationBarItems(trailing: Text("Edit").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)) //导航视图顶部按钮 leading:, trailing：
            }
                .tabItem {
                    Label("Navigation", systemImage: "network")
                }
            
            
            //弹窗视图
            VStack {
                //长弹窗
                Button(action: {showModal.toggle()}) {Text("显示长弹窗")}
                    .sheet(isPresented: $showModal) {
                        ShapeRelatedViews()
                    }
                
                //行动列表
                Button(action: {showActionSheet.toggle()}) {Text("显示行动列表")}
                    .actionSheet(isPresented: $showActionSheet) {
                        ActionSheet(title: Text("要执行什么操作？"), message: Text("补充文字说明"), buttons: [
                            .default(Text("添加至收藏夹")) { },
                            .destructive(Text("123")) { },
                            .cancel()
                        ])
                    }
                
                //菜单
                Menu("菜单") {
                    Button("打开", action: { })
                    Menu("移除") {
                        Button("删除", action: { })
                        Button("取消", action: { })
                    }
                }
            }
            .tabItem {
                Label("Modal", systemImage: "tray.2")
            }
            
            
            
            //警告视图
            VStack {
                
                //警告弹窗
                Button(action: {showAlert.toggle()}, label: {Text("警告").foregroundColor(.orange)})
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("删除"), message: Text("确定永久删除此项目吗？"), primaryButton: .destructive(Text("确定")), secondaryButton: .default(Text("取消")))
                    }
                
                //可忽视的提示弹窗
                Button(action: {showRamind.toggle()}, label: {Text("提醒").foregroundColor(.blue)})
                    .alert(isPresented: $showRamind) {
                        Alert(title: Text("用时较长"), message: Text("此警告弹窗用于可忽视的提醒事项"), dismissButton: .default(Text("我知道了")))
                    }
            }
                .tabItem {
                    Label("Alert", systemImage: "exclamationmark.triangle")
                }
        }
    }
}

//自定义卡片视图
struct CardView: View {
    var body: some View {
        HStack(spacing: 16) {
            Image("Image_01")
                .resizable()
                .frame(width: 120, height: 120)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(16)
            //.padding(.leading)
            VStack(alignment: .leading) {
                HStack {
                    Text("INNER PEACE")
                        .foregroundColor(.black)
                    Image(systemName: "checkmark.seal.fill")
                        .font(.system(size: 14))
                }
                .font(.headline)
                //.foregroundColor(.black)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding(.bottom, 24)
                Text("100% Guaranteed. Serving Millions of Book Lovers Since 1980. Very Good condition.")
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/) //多行对齐
                    .font(.footnote)
                    .foregroundColor(.gray)
                //.padding(.trailing)
            }
            
        }
        .padding(.top, 4)
        .padding(.bottom, 4)
        .background()
    }
}

#Preview {
    TableView()
}
