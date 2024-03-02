//
//  ControlRelatedViews.swift
//  ForCreatorLifeCycle
//
//  Created by Cute Puppy on 2024/2/22.
//

import SwiftUI
import MapKit

struct ControlRelatedViews: View {
    @State var toggleValue = true
    @State var pickerValue = 0
    var pickerOptions = ["步行","自行车","汽车"]
    @State var sliderValue = 0.0
    @State var stepperValue = 0
    @State var selectedDate = Date()
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .day, value: -100, to: Date())!
        let max = Calendar.current.date(byAdding: .day, value: 100, to: Date())!
        return min...max
    }
    @State var progressValue = 0.5
    @State var location = MKCoordinateRegion(center: .init(latitude: 39.9130, longitude: 116.3907), latitudinalMeters: 1000, longitudinalMeters: 1000)
    
    var body: some View {
        ScrollView {
            
            HStack {
                
                //开关
                VStack(alignment: .leading) {
                    Text("Toggle")
                        .font(.headline)
                    Toggle("自动登录", isOn: $toggleValue)
                        .toggleStyle(SwitchToggleStyle(tint: Color.blue))
                }
                .frame(height: 80)
                .cardStyle()
                .padding(.leading)
                
                
                //按钮
                VStack(alignment: .leading) {
                    Text("Button")
                        .font(.headline)
                    Button(action: { }, label: {
                        Image(systemName: "person.crop.circle.fill.badge.minus")
                            .font(.system(size: 16, weight: .bold))
                        Text("退出")
                            .bold()
                    })
                    .foregroundColor(.white)
                    .padding()
                    .background(.blue)
                    .cornerRadius(15)
                }
                .frame(height: 80)
                .cardStyle()
                .padding(.trailing)
            }
            .padding(.bottom)
            
            
            //选择器
            VStack(alignment: .leading) {
                Text("Picker")
                    .font(.headline)
                Picker("Picker", selection: $pickerValue) {
                    ForEach(0..<pickerOptions.count) { index in
                        Text(pickerOptions[index]).tag(index)
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            .cardStyle()
            .padding(.horizontal)
            .padding(.bottom)
            
            //滑动条
            VStack(alignment: .leading) {
                Text("Slider")
                    .font(.headline)
                HStack {
                    Image(systemName: "sun.min")
                    Slider(value: $sliderValue, in: -5...5, step: 0.1)
                    Image(systemName: "sun.max.fill")
                }
            }
            .cardStyle()
            .padding(.horizontal)
            .padding(.bottom)
            
            //进步器
            VStack(alignment: .leading) {
                Text("Stepper")
                    .font(.headline)
                Stepper("购买数量: \(stepperValue)", value: $stepperValue, in: -5...5, step: 1)
            }
            .cardStyle()
            .padding(.horizontal)
            .padding(.bottom)
            
            //日期选择
            VStack(alignment: .leading) {
                Text("Date Picker")
                    .font(.headline)
                DatePicker(
                    selection: $selectedDate, in: dateRange,
                    displayedComponents: [.hourAndMinute, .date],
                    label: { Text("截止日期") }
                )
            }
            .cardStyle()
            .padding(.horizontal)
            .padding(.bottom)
            
            
            HStack {
                
                //长按菜单
                VStack(alignment: .leading) {
                    Text("Context")
                        .font(.headline)
                    Image(systemName: "ellipsis.circle.fill")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .frame(width: 80, height: 80)
                        .contextMenu {
                            Button("选项 A") { }
                            Button("选项 B") { }
                        }
                    Text("长按菜单")
                        .bold()
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                }
                .frame(height: 120)
                .cardStyle()
                .padding(.leading)
                
                //载入状态
                VStack(alignment: .leading) {
                    Text("Loading")
                        .font(.headline)
                    Spacer()
                    ProgressView(value: progressValue)
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                        .padding()
                }
                .frame(height: 120)
                .cardStyle()
                .padding(.horizontal)
                
                //地图
                VStack {
                    Text("Map")
                        .font(.headline)
                    Map(coordinateRegion: $location)
                        .frame(width: 40, height: 100, alignment: .center)
                        .cornerRadius(15)
                }
                .frame(height: 120)
                .cardStyle()
                .padding(.trailing)
            }
            
        }
    }
}

//打包常用修改器
struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background()
            .cornerRadius(15)
            .shadow(color: .gray, radius: 3)
    }
}

//打包修改器转化为函数
extension View {
    func cardStyle() -> some View {
        modifier(CardModifier())
    }
}

#Preview {
    ControlRelatedViews()
}
