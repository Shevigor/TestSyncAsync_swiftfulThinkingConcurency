//
//  ContentView.swift
//  TestSyncAsync
//
//  Created by user on 11.07.2023.
//

import SwiftUI

struct ContentView: View {
    var myPrint = MyPrint()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Text(myPrint.FetchData())
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class MyPrint {
    func FetchData () -> String {
        print("1")
        DispatchQueue.main.async{
            print("2")
            DispatchQueue.main.async{
                print("3")
            }
            DispatchQueue.global().sync{
                print("4")
            }
            print("5")
        }
        print("6")
        return "123"
    }
}
