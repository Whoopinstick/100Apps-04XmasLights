//
//  ContentView.swift
//  04 - Xmas Lights
//
//  Created by Kevin Paul on 7/29/20.
//  Copyright © 2020 Whoopinstick. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var isOn = false
    @State private var numberOfLights = 7
    @State private var timer: Timer?
    @State private var timeInterval: Double = 1.0
    
    let colors: [Color] = [.red, .blue, .purple, .yellow, .red, .blue, .purple, .yellow]
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.white,.green,.green,.green,.black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack{
                    ForEach(0..<numberOfLights, id: \.self) { light in
                        VStack {
                            if self.isOn {
                                Circle()
                                    .foregroundColor(self.colors[light])
                                    .contrast(10)
                            } else {
                                Circle()
                                    .foregroundColor(self.colors[light])
                                    .contrast(0.7)
                            }
                        }
                    }
                }
                
                
                VStack {
                    Spacer()
                    HStack {
                        
                        Spacer()
                        
                        Button("Start") {
                            self.timer = Timer.scheduledTimer(withTimeInterval: self.timeInterval, repeats: true) { _ in
                                self.isOn.toggle()
                            }
                        }
                        .frame(width: 100, height: 100, alignment: .center)
                        .overlay(
                            Circle()
                                .stroke()
                        )
                        
                        Spacer()
                        
                        Button("Stop") {
                            //self.timer.upstream.connect().cancel()
                            self.isOn = false
                            self.timer?.invalidate()
                        }
                            
                        .frame(width: 100, height: 100, alignment: .center)
                        .overlay(
                            Circle()
                                .stroke()
                        )
                        
                        Spacer()
                        
                    }
                    Spacer()
                    
                    Stepper("Number of Lights = \(numberOfLights)", value: $numberOfLights, in: 1...7, step: 1) { _ in
                        
                    }
                    .padding([.leading,.trailing])
                    
                    Stepper("Timer Interval = \(timeInterval, specifier: "%g")", value: $timeInterval, in: 1...5, step: 1) { _ in
                        
                    }
                    .padding([.leading,.trailing])
                    
                    
                    
                }
                .foregroundColor(.white)
                
                Spacer(minLength: 150)
                
                
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
