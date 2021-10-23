//
//  ParticleSystem.swift
//  Fireworks
//
//  Created by Philipp on 23.10.21.
//

import SwiftUI

class ParticleSystem: ObservableObject {
    let image = Image("spark")
    var particles = Set<Particle>()

    func update(date: Date) {
        particles.insert(createParticle())
    }

    private func createParticle() -> Particle {
        return Particle(
            x: Double.random(in: 0...1),
            y: Double.random(in: 0...1)
        )
    }
}
