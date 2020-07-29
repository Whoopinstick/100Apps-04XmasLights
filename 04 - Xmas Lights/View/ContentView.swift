//
//  ContentView.swift
//  04 - Xmas Lights
//
//  Created by Kevin Paul on 7/29/20.
//  Copyright © 2020 Whoopinstick. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var timer = 1
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.white,.green,.green,.green,.black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack{
                    ForEach(1..<8) {_ in
                        VStack {
                            Circle()
                                .foregroundColor(.red)
                            Circle()
                                .foregroundColor(.red)
                                .brightness(0.25)
                        }
                    }
                }
                
                VStack {
                    Button("On/Off") {
                        
                    }
                    .frame(width: 100, height: 100, alignment: .center)
                    
                    
                    
                    Text("value \(self.timer)")
                    
                    Stepper("Timer", value: $timer, in: 1...5, step: 1) { _ in
                        
                    }
                }
                .foregroundColor(.white)
                
                Spacer(minLength: 200)
                
                
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
