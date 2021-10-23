//
//  EmitterView.swift
//  Fireworks
//
//  Created by Philipp on 23.10.21.
//

import SwiftUI

struct EmitterView: View {
    var particleSystem: ParticleSystem

    var body: some View {
        TimelineView(.animation) { timeline in
            Canvas { context, size in
                particleSystem.update(date: timeline.date)
                let baseTransform = context.transform

                for particle in particleSystem.particles {
                    let xPos = particle.x * size.width
                    let yPos = particle.y * size.height

                    context.translateBy(x: xPos, y: yPos)
                    context.draw(particleSystem.image, at: .zero)
                    context.transform = baseTransform
                }
            }
        }
    }
}
