//
//  ContentView.swift
//  Flashzilla
//
//  Created by APPLE on 12/09/24.
//

import SwiftUI

struct ContentView: View {
    @State private var currentValue = 0.0
    @State private var finalValue = 1.0
    @State private var currentAngle = Angle.zero
    @State private var finalAngle = Angle.zero
    @State private var offSet = CGSize.zero
    @State private var isDragging = false
    
    var body: some View {
        VStack{
//            Text("Aditya Choubisa")
//                .onTapGesture(count:2) {
//                    print("you are aditya choubisa")
//                }
//            Text("You are ios developer")
//                .onLongPressGesture{
//                    print("Long Press")
//                }
//            Text("Long press till 2 sec")
//                .onLongPressGesture(minimumDuration:2){
//                    print("Long press after 2 sec")
//                } onPressingChanged: { inProgress in
//                    print("In progresss: \(inProgress)")
//                }
            
            Text("Aditya IOS")
                .scaleEffect(finalValue + currentValue)
                .gesture(
                   MagnifyGesture()
                    .onChanged{ value in
                        currentValue = value.magnification - 1
                        print("currentValue:",currentValue)
                    }
                    .onEnded{ value in
                        finalValue += currentValue
                        print("finalValue:",finalValue)
                        currentValue = 0
                                
                    }
                )
            
            Text("Gaurav Choubisa")
                .rotationEffect(currentAngle + finalAngle)
                .gesture(
                    RotateGesture()
                        .onChanged{ value in
                            currentAngle = value.rotation
                        }
                        .onEnded{ value in
                            finalAngle += currentAngle
                            currentAngle = Angle.zero
                        }
                    )
            
            VStack{
                Text("success full")
                    .onTapGesture {
                        print("you are success full")
                    }
            }
//            .highPriorityGesture(
            .simultaneousGesture(
                TapGesture()
                    .onEnded{
                        print("you are going to be successfull")
                    }
            )
            
            //combination of dragGesture and longpress Gesture
            let drageGesture = DragGesture()
                .onChanged{ value in
                    offSet = value.translation
                }
                .onEnded{ _ in
                    withAnimation{
                        offSet = .zero
                        isDragging = false
                    }
                }
            
            let longPressGesture = LongPressGesture()
                .onEnded{ _ in
                    withAnimation{
                        isDragging = true
                    }
                }
            
            let combined = longPressGesture.sequenced(before: drageGesture)
            
            Circle()
                .fill(.red)
                .frame(width:64,height: 64)
                .scaleEffect(isDragging ? 1.5:1)
                .offset(offSet)
                .gesture(combined)
            
            //allow Hit Testing
            ZStack{
                Rectangle()
                    .fill(.blue)
                    .frame(width:300,height: 300)
                    .onTapGesture {
                        print("tapped rectange")
                    }
                Circle()
                    .fill(.red)
                    .frame(width:300,height:300)
                    .contentShape(.rect)
                    .onTapGesture {
                        print("tap circle")
                    }
//                    .allowsHitTesting(false)
            }
            
            VStack{
                Text("hyy")
                
                Spacer()
                    .frame(height:100)
                
                Text("aditya")
            }
            .contentShape(.rect)
            .onTapGesture {
                print("Pratiksha")
            }
        }
    }
}

#Preview {
    ContentView()
}
