//
//  ContentView.swift
//  TrucoCounter
//
//  Created by Otavio de Souza on 7/30/20.
//  Copyright © 2020 Otavio de Souza. All rights reserved.
//

import SwiftUI

struct CounterView: View {
    
    @State var count : Int = 0
    @Binding var label: String
    
    var body: some View {  
        VStack{
            Text(label).foregroundColor(Color.white).font(.system(size: 35)).frame(
                maxWidth: .infinity,
                maxHeight: 100,
                alignment: .center)
            Spacer()
            VStack{
                Text("\(count)").foregroundColor(Color.white).font(.system(size: 60)).bold()
            }.frame(
                maxWidth: .infinity,
                maxHeight: 400,
                alignment: .top)
                .onTapGesture {
                    self.addCount()
            }
            
        }.frame(minWidth: 0,
                maxWidth: .infinity / 2,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading)
            .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                .onEnded({ value in
                    self.gestureDetected(value: value)
                    
                }))
        
    }
    
    private func gestureDetected(value: DragGesture.Value){
        
        if (value as DragGesture.Value).translation.height < 0 {
            self.truco()
        }
        
        if (value as DragGesture.Value).translation.height > 0 {
            self.removeCount()
        }
    }
    
    private func truco(){
        self.count = self.count + 3
    }
    
    private func addCount(){
        self.count = self.count + 1
    }
    
    private func removeCount(){
        self.count = self.count - 1
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
