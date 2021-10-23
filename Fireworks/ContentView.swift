//
//  ContentView.swift
//  Fireworks
//
//  Created by Philipp on 23.10.21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var particleSystem = ParticleSystem()

    var body: some View {
        EmitterView(particleSystem: particleSystem)
            .ignoresSafeArea()
            .background(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
