//
//  LayoutRelatedViews.swift
//  ForCreatorLifeCycle
//
//  Created by Cute Puppy on 2024/2/21.
//

import SwiftUI

struct LayoutRelatedViews: View {
    var body: some View {
        VStack {
            //垂直排列
            VStack {
                VStack {
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                }
                .foregroundColor(.orange)
                .frame(width: 100, height: 200)
                .padding()
                .background(.white)
                .cornerRadius(30)
                .shadow(radius: 10)
                
                .padding()
                Text("VStack")
            }
            Divider().padding()
            
            //水平排列
            VStack {
                HStack {
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                }
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .frame(width: 200, height: 100)
                .padding()
                .background(.white)
                .cornerRadius(30)
                .shadow(radius: 10)
                
                .padding()
                Text("HStack")
            }
            Divider().padding()
            
            //重叠排列
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                        .offset(CGPoint(x: -5, y: -3))
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                        .offset(CGPoint(x: 5, y: 16))
                }
                .opacity(0.7)
                .foregroundColor(.red)
                .frame(width: 200, height: 100)
                .padding()
                .padding(.horizontal)
                .padding(.bottom)
                .background(.white)
                .cornerRadius(30)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                
                .padding()
                Text("ZStack")
            }
        }
    }
}

#Preview {
    LayoutRelatedViews()
}
