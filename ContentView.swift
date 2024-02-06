//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Liko Setiawan on 05/02/24.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            CapsuleText(text: "First")
                .foregroundStyle(.white)
            CapsuleText(text: "Second")
                .foregroundStyle(.yellow)
        }
        Text("Hello World")
            .titleStyle()
        Color.blue
            .frame(width: 300, height: 200)
            .watermarked(with: "Hacking with Swift")
    }
}


struct Watermark: ViewModifier {
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

extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}


//custom modifiers
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
//shorten the modifier using extension
extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}


struct CapsuleText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
//                .foregroundStyle(.white)
            .background(.blue)
            .clipShape(.capsule)
    }
}

#Preview {
    ContentView()
}

//@ViewBuilder @MainActor var body: Self.Body { get }


//    let motto1 = Text("Draco dormiens")
//    let motto2 = Text("nunquam titillandus")
//    @State private var useRedText = false
//
//    var motto1: some View {
//        Text("Draco dormiens")
//    }
//
//    @ViewBuilder var spells: some View {
//        VStack {
//            Text("Lumos")
//            Text("Obliviate")
//        }
//    }


//        VStack {
//            Text("Gryffindor")
//                .font(.largeTitle)
//                .blur(radius: 0)
//            Text("Hufflepuff")
//            Text("Ravenclaw")
//            Text("Slytherin")
//        }
//        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
//        .blur(radius: 5)
//
//        VStack {
//            motto1
//                .foregroundStyle(.red)
//            motto2
//                .foregroundStyle(.blue)
//        }
//        if useRedText {
//              Button("Hello World") {
//                  useRedText.toggle()
//              }
//              .foregroundStyle(.red)
//          } else {
//              Button("Hello World") {
//                  useRedText.toggle()
//              }
//              .foregroundStyle(.blue)
//          }
