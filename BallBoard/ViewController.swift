//
//  ViewController.swift
//  BallBoard
//
//  Created by Thalia Freitas on 13/06/19.
//  Copyright © 2019 Thalia Freitas. All rights reserved.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    
    @IBOutlet var arView: ARView!

    var sizeChapter: Experience.Labirinto!
    var plane: (Entity & HasPhysics)? {
        sizeChapter?.plane as? Entity & HasPhysics
    }
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadScene()
//        loadSecondScene()
        // Load the "Box" scene from the "Experience" Reality File
//        let boxAnchor = try! Experience.loadBox()
//
//        // Add the box anchor to the scene
//        arView.scene.anchors.append(boxAnchor)
    }
    
    
    
    func loadScene() {
        Experience.loadLabirintoAsync { (loadedAnchor, error) in
            guard let sizeAnchor = loadedAnchor, error == nil else {
                return
            }
            
            let realAnchor = AnchorEntity.init(plane: .horizontal, classification: .table, minimumBounds: SIMD2<Float>.zero)
            let modelEntity = ModelEntity.init()
            modelEntity.generateCollisionShapes(recursive: true)
            modelEntity.physicsBody?.mode = .dynamic
//            sizeAnchor.children.forEach { (entity) in
//                entity.removeFromParent()
//                modelEntity.addChild(entity)
//            }
            
            DispatchQueue.main.async {
                for index in 0..<sizeAnchor.children.count {
                    modelEntity.addChild(sizeAnchor.children[index])
                }
                
                realAnchor.addChild(modelEntity)
                
                modelEntity.generateCollisionShapes(recursive: true)
                self.arView.scene.anchors.append(realAnchor)
                Timer.scheduledTimer(withTimeInterval: 10, repeats: false) { (_) in
                    modelEntity.addTorque(SIMD3<Float>.init(x: Float.pi * 100, y: Float.pi * 100, z: Float.pi * 100), relativeTo: nil)
                    modelEntity.addForce(SIMD3<Float>.init(x: 10, y: 10, z: 10), relativeTo: nil)
                }
                
                
            }
            
            
            
        }
        
    }
    func createBall() -> ModelEntity{
        return ModelEntity.init(mesh: MeshResource.generateSphere(radius: 0.2))
    }
    
//    func loadSecondScene() {
//        Experience.loadBallAsync { (loadedAnchor, error) in
//            guard let gameAnchor = loadedAnchor, error == nil else {
//                return
//            }
//            gameAnchor.generateCollisionShapes(recursive: true)
//            self.arView.scene.anchors.append(gameAnchor)
//        }
//    }

    
    
}
