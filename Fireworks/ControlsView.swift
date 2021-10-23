//
//  ControlsView.swift
//  Fireworks
//
//  Created by Philipp on 23.10.21.
//

import SwiftUI

struct ControlsView: View {
    @ObservedObject var particleSystem: ParticleSystem

    var body: some View {
        Form {
            Section("Creation") {
                Stepper("Birth rate: \(particleSystem.birthRate, specifier: "%.0f")", value: $particleSystem.birthRate, in: 5...500, step: 5)

                Stepper("Lifetime: \(particleSystem.lifetime / 100, specifier: "%g")", value: $particleSystem.lifetime, in: 25...10000, step: 25)

                Stepper("Lifetime Range: \(particleSystem.lifetimeRange / 100, specifier: "%g")", value: $particleSystem.lifetimeRange, in: 0...10000, step: 25)
            }

            Section("Position") {
                HStack {
                    Stepper("X: \(particleSystem.xPosition, specifier: "%g")%", value: $particleSystem.xPosition, in: -20...120, step: 5)

                    Spacer(minLength: 50)

                    Stepper("Range: \(particleSystem.xPositionRange, specifier: "%g")%", value: $particleSystem.xPositionRange, in: -0...100, step: 5)
                }
                HStack {
                    Stepper("Y: \(particleSystem.yPosition, specifier: "%g")%", value: $particleSystem.yPosition, in: -20...120, step: 5)

                    Spacer(minLength: 50)

                    Stepper("Range: \(particleSystem.yPositionRange, specifier: "%g")%", value: $particleSystem.yPositionRange, in: -0...100, step: 5)
                }
            }

            Section("Speed") {
                Stepper("Base: \(particleSystem.speed, specifier: "%g")", value: $particleSystem.speed)

                Stepper("Range: \(particleSystem.speedRange, specifier: "%g")", value: $particleSystem.speedRange, in: 0...1000)

            }

            Section("Angle") {
                Stepper("Base: \(particleSystem.angle, specifier: "%g")", value: $particleSystem.angle, in: 0...360, step: 5)

                Stepper("Range: \(particleSystem.angleRange, specifier: "%g")", value: $particleSystem.angleRange, in: 0...360, step: 5)

            }

            Section("Scale") {
                Stepper("Base: \(particleSystem.scale, specifier: "%g")", value: $particleSystem.scale, in: 5...1000, step: 5)

                Stepper("Range: \(particleSystem.scaleRange, specifier: "%g")", value: $particleSystem.scaleRange, in: -100...100, step: 1)
            }

            Section("Opacity") {
                Stepper("Base: \(particleSystem.opacity, specifier: "%g")", value: $particleSystem.opacity, in: 0...100, step: 5)

                Stepper("Range: \(particleSystem.opacityRange, specifier: "%g")", value: $particleSystem.opacityRange, in: -100...100, step: 1)
            }
        }
    }
}

struct ControlView_Previews: PreviewProvider {
    static var previews: some View {
        ControlsView(particleSystem: ParticleSystem())
    }
}
