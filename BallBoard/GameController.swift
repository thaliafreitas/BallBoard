//
//  GameController.swift
//  BallBoard
//
//  Created by Thalia Freitas on 17/06/19.
//  Copyright © 2019 Thalia Freitas. All rights reserved.
//
import Foundation
import RealityKit
import simd

class GameController {
    
    indirect enum State: Equatable {
        
        /// The player is attempting to locate a playable real-world surface.
        case placingContent
        
        /// Game content is loading and the app is waiting for the load to complete before transitioning to the next state.
        case waitingForContent(nextState: State)
        
        /// The game is ready for the player to attempt a bowling frame.
        case readyToBowl
        
        /// The player has bowled and the ball is moving.
        case ballInMotion
        
        /// The ball has come to a stop.
        case ballAtRest
    }



    var sizeChapter: Experience.Labirinto!
    var plane: (Entity & HasPhysics)? {
        sizeChapter?.plane as? Entity & HasPhysics
    }
    
    
    var walls = [Entity]()
    var currentLevel = 0
    private var gameNumber = 0
    var gestureStartLocation: SIMD3<Float>?
    var gestureRecognizer: EntityGestureRecognizer?
    
    struct Sides : OptionSet {
        let rawValue: Int
        
        static let left = Sides(rawValue:1)
        static let right = Sides(rawValue:2)
        
        static let both : Sides = [.left, .right]
        static let none : Sides = []
    }
    
//    @objc
//    func moveLabirinto(_ recognizer: EntityTranslationGestureRecognizer) {
//        guard let ball = gameAnchor.ballPlay else { return }
//        if recognizer.state == .ended || recognizer.state == .cancelled {
//
//            // Disable the gesture recognizer and return to dynamic physics so that any in-motion physics movements continue to play.
//            recognizer.isEnabled = false
//            gestureStartLocation = nil
////            ball.physicsBody?.mode = .dynamic
////            ball.physicsBody?.mode = .dynamic
//
//            return
//        }
//    }
//
//    guard let gestureCurrentLocation = recognizer.translation(in: nil) else { return }
//    guard let gestureStartLocation = self.gestureStartLocation else {
//    self.gestureStartLocation = gestureCurrentLocation
//    return
//    }
//
//    // Calculate the gesture's current distance from its physical start location in the real world.
//    let delta = gestureStartLocation - gestureCurrentLocation
//    let distance = ((delta.x * delta.x) + (delta.y * delta.y) + (delta.z * delta.z)).squareRoot()
//
//    // If the current gesture location has moved more than 0.5m from where the gesture started, ignore any
//    // further translation from this gesture, and return to dynamic physics to play out the remaining motion.
//    if distance > settings.ballPlayDistanceThreshold {
//    self.gestureStartLocation = nil
//    ball.physicsBody?.mode = .dynamic
//    return
//    }

  



}

extension Experience {
    
    public struct AnchorPlacement {
        
        /// The identifier of the anchor the game is placed on. Used to re-localized the game between levels.
        var arAnchorIdentifier: UUID?
        
        /// The transform of the anchor the game is placed on . Used to re-localize the game between levels.
        var placementTransform: Transform?
    }
}

extension Experience.Labirinto {
    var allWalls: [Entity?] {
        return [wall1,
                wall2,
                wall3,
                wall4,
                wall5,
                wall6,
                wall7,
                wall8,
                wall9,
                wall10]
    }
    var planeD: Entity? {
        return plane
    }
}
