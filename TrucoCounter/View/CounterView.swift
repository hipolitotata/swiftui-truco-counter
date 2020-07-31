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
            VStack{
                Text("\(count)").foregroundColor(Color.white).font(.system(size: 60)).bold()
            }.frame(
                maxWidth: .infinity,
                maxHeight: 150,
                alignment: .center)
                .onTapGesture {
                    self.addCount()
            }
            HStack{
                Button(action: {
                    self.truco()
                }) {Text("+3 PONTOS").bold()}
            }.frame(
                maxWidth: 120,
                maxHeight: 70,
                alignment: .center).background(Color("Green")).foregroundColor(Color.white).padding(.vertical, 30)
            
            HStack{
                Button(action: {
                    self.addCount()
                }) {Text("+1 PONTO").bold()}
            }.frame(
                maxWidth: 120,
                maxHeight: 40,
                alignment: .center).background(Color("Blue")).foregroundColor(Color.white).padding(.vertical, 15)
            
            HStack{
                Button(action: {
                    self.removeCount()
                }) {Text("-1 PONTO").bold()}
            }.frame(
                maxWidth: 120,
                maxHeight: 40,
                alignment: .center).background(Color("Red")).foregroundColor(Color.white).padding(.vertical, 15)

        }.frame(minWidth: 0,
                maxWidth: .infinity / 2,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading)
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
        if(self.count >= 12){
            return;
        }
        
        if(self.count == 10 || self.count == 11){
            return self.count = 12
        }
        
        self.count = self.count + 3
    }
    
    private func addCount(){
        if(self.count >= 12){
            return;
        }
        self.count = self.count + 1
    }
    
    private func removeCount(){
        if(self.count == 0){
            return;
        }
        self.count = self.count - 1
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
