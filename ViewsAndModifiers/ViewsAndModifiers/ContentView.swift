//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Janice Park on 1/31/24.
//

import SwiftUI

// reuse
struct CapsuleView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundStyle(.white)
            .background(.blue)
            .clipShape(.capsule)
    }
}

// building a custom modifier (e.g. font(), background(), clipshape()

// MODIFIERS RETURN NEW OBJECTS THEY DO NOT MODIFY ANYTHING!!!!!!!!
// Modifiers have own properties
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.blue)
            .clipShape(.rect(cornerRadius: 10))
    }
}

struct WaterMark: ViewModifier {
    var text: String
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(5)
                .background(.black)
            
        }
    }
}

// Can't have stored own properties
extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
    
    func waterMark(with text: String) -> some View {
        modifier(WaterMark(text: text))
    }
}


struct ContentView: View {
    // You have layer on top of a blank slate!
    // order of modifiers matter!
    // resuse
    var body: some View {
        VStack(spacing: 10) {
//            Text("Title").modifier(Title())
            Text("Title").titleStyle()
            CapsuleView(text: "First")
            CapsuleView(text: "Second")
            
            Color.blue
                .frame(width: 300, height: 300)
                .waterMark(with: "Testing")
                
        }
//        VStack {
//            Button("Hello World") {
//                print(type(of: self.body))
//            }
//            .background(.red)
//            .frame(width: 200, height: 200)
//            
//            Button("Hello World") {
//                print(type(of: self.body))
//            }
//            .frame(width: 200, height: 200)
//            .background(.red)
//            
//            Text("Border Demo")
//                .padding()
//                .background(.red)
//                .padding()
//                .background(.blue)
            
        }
}

#Preview {
    ContentView()
}
