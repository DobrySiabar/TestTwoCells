//
//  ContentView.swift
//  TestTwoCells
//
//  Created by jefferson on 29.01.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            CellView()
                .padding()
                .border(Color.black, width: 1)
                .listRowSeparator(.hidden)
            
            SecondCellView()
                .padding()
                .border(Color.black, width: 1)
        }
        .listStyle(PlainListStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
