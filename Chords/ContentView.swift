//
//  ContentView.swift
//
//  Created by hunter downey on 9/18/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ChordsView()
                .navigationTitle("Chords")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
