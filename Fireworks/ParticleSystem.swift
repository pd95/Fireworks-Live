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
    var lastUpdate = Date()
    var lastCreationDate = Date()

    @Published var birthRate = 10.0
    @Published var lifetime = 500.0
    @Published var lifetimeRange = 25.0

    @Published var xPosition = 50.0
    @Published var yPosition = 0.0
    @Published var xPositionRange = 100.0
    @Published var yPositionRange = 0.0

    @Published var angle = 90.0
    @Published var angleRange = 5.0

    @Published var speed = 50.0
    @Published var speedRange = 25.0

    @Published var opacity = 50.0
    @Published var opacityRange = 50.0
    @Published var opacitySpeed = -10.0

    @Published var scale = 100.0
    @Published var scaleRange = 50.0
    @Published var scaleSpeed = 10.0


    func update(date: Date) {
        let elapsedTime = date.timeIntervalSince1970 - lastUpdate.timeIntervalSince1970
        lastUpdate = date

        for particle in particles {
            if particle.deathDate < date {
                particles.remove(particle)
                continue
            }

            particle.x += cos(particle.angle) * particle.speed * elapsedTime / 100
            particle.y += sin(particle.angle) * particle.speed * elapsedTime / 100

            particle.scale += scaleSpeed * elapsedTime  / 50
            particle.opacity += opacitySpeed * elapsedTime  / 50
        }

        let birthSpeed = 1 / birthRate
        let elapsedSinceCreation = date.timeIntervalSince1970 - lastCreationDate.timeIntervalSince1970
        let amountToCreate = Int(elapsedSinceCreation / birthSpeed)

        for _ in 0..<amountToCreate {
            particles.insert(createParticle())
            lastCreationDate = date
        }
    }

    private func createParticle() -> Particle {
        let angleDegree = angle + Double.random(in: -angleRange/2...angleRange/2)
        let angleRadians = angleDegree * .pi / 180
        return Particle(
            x: xPosition / 100 + Double.random(in: -xPositionRange/200 ... xPositionRange/200),
            y: yPosition / 100 + Double.random(in: -yPositionRange/200 ... yPositionRange/200),
            angle: angleRadians,
            speed: speed + Double.random(in: -speedRange / 2 ... speedRange / 2),
            scale: scale / 100 + Double.random(in: -scaleRange / 200 ... scaleRange / 200),
            opacity: opacity / 100 + Double.random(in: -opacityRange / 200 ... opacityRange / 200),
            deathDate: Date() + lifetime / 100 + Double.random(in: -lifetimeRange / 200 ... lifetime / 200)
        )
    }
}
