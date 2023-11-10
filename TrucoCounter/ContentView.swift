//
//  ContentView.swift
//  TrucoCounter
//
//  Created by Otavio de Souza on 7/30/20.
//  Copyright © 2020 Otavio de Souza. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            HStack {
                CounterView(label: .constant("Our points"))
                Divider().background(Color.white)
                CounterView(label: .constant("Your points"))
            }.background(Color("Black"))
        }.cornerRadius(20).padding(20).background(Color("Brown"))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
