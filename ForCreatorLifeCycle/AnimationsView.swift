//
//  AnimationsView.swift
//  ForCreatorLifeCycle
//
//  Created by Cute Puppy on 2024/3/1.
//

import SwiftUI

struct AnimationsView: View {
    @State private var start: Date = .now
    @State private var value: Double = 0
    @State private var currentDay = 1
    
    let startDate = Date() // 设置起始日期
    let endDate = Calendar.current.date(byAdding: .day, value: 7, to: Date())! // 设置结束日期为起始日期的7天后
    
    var body: some View {
        //1
        Text(start, style: .timer)
            .contentTransition(.numericText())
            .transaction { t in
                t.animation = .default
            }
        
        Text("\(value)")
            .contentTransition(.numericText(value: value)) // 使用.contentTransition(.numericText())转换文本为自动动画的数字文本
            .font(.largeTitle)
            .bold()
            .onTapGesture {
                withAnimation {
                    self.value += 1
                }
            }
        
        Text(getWeekdayString(for: currentDay))
            .font(.title)
            .bold()
            .contentTransition(.numericText(value: Double(currentDay)))
            .font(.title)
            .onTapGesture {
                withAnimation(.linear(duration: 0.2)) {
                    if currentDay < 5 {
                        currentDay += 1
                    } else {
                        currentDay = 1
                    }
                }
            }
    }
}


func getWeekdayString(for day: Int) -> String {
    switch day {
    case 1:
        return "Monday"
    case 2:
        return "Tuesday"
    case 3:
        return "Wednesday"
    case 4:
        return "Thursday"
    case 5:
        return "Friday"
    default:
        return ""
    }
}




#Preview {
    AnimationsView()
}
