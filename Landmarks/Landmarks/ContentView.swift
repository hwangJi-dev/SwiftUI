//
//  ContentView.swift
//  Landmarks
//
//  Created by hwangJi on 2022/06/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hi! I'm Borabong!!")
            .padding()
    }
}

// MARK: - ContentView_Previews
// 컨텐츠 미리보기 provider
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
