//
//  Particle.swift
//  Fireworks
//
//  Created by Philipp on 23.10.21.
//

import Foundation

class Particle: Hashable, Equatable {
    let id = UUID()
    var x: Double
    var y: Double

    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func ==(lhs: Particle, rhs: Particle) -> Bool {
        lhs.id == rhs.id
    }
}
