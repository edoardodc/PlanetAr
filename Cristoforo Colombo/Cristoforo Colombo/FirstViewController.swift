//
//  FirstViewController.swift
//  Cristoforo Colombo
//
//  Created by Edoardo de Cal on 24/05/18.
//  Copyright © 2018 Edoardo de Cal. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class FirstViewController: UIViewController, ARSCNViewDelegate {

    let planets = ["earth_texture_map.jpg"]
    var imageHand: UIImageView!
    var buttonRadius: UIButton!
    var radius = 0.2
    var count: Int = 0 {
        didSet {
            if count == 0 {
                imageHand.alpha = 0
                buttonDeleteEarth.isHidden = true
            }else{
                buttonDeleteEarth.isHidden = false
            }
        }
    }
    @IBOutlet weak var sceneView: ARSCNView!
    @IBOutlet weak var labelSetRadius: UILabel!
    
    @IBOutlet weak var buttonDeleteEarth: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.showsStatistics = false
        let scene = SCNScene()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapped))
        self.sceneView.addGestureRecognizer(tapGestureRecognizer)
        sceneView.scene = scene
        
        let image: UIImage = UIImage(named: "HandTouch")!
        imageHand = UIImageView(image: image)
        imageHand.center = self.view.center
        buttonDeleteEarth.isHidden = true

        self.view.addSubview(imageHand!)
        
    }
    
    
    
    
    
    
    @objc func tapped(recognizer: UIGestureRecognizer) {
        
        guard let currentFrame = self.sceneView.session.currentFrame else {
            return
        }
        
        count += 1
        
        var translation = matrix_identity_float4x4
        translation.columns.3.z = -0.1
        let geometry = SCNSphere(radius: CGFloat(radius))
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: planets[0])
        geometry.materials = [material]
        let node = SCNNode(geometry: geometry)
        node.physicsBody = SCNPhysicsBody(type: .dynamic, shape: nil)
        node.physicsBody?.mass = 5
        node.physicsBody?.isAffectedByGravity = false
        node.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: -CGFloat(2*Double.pi), z: 0, duration: 40)))
        node.simdTransform = matrix_multiply(currentFrame.camera.transform, translation)
        let forceVector = SCNVector3(node.worldFront.x, node.worldFront.x, node.worldFront.x)
        node.physicsBody?.applyForce(forceVector, asImpulse: true)
        self.sceneView.scene.rootNode.addChildNode(node)
        
        
        imageHand.alpha = 0
    }
    
    @IBOutlet weak var buttonUp: UIButton!
    
    @IBAction func upRadius(_ sender: Any) {
        if radius == 0.1 {
            radius -= 0
        }else{
            radius -= 0.1
            labelSetRadius.text = String("\(radius)m")
        }
    }
    
    @IBAction func downRadius(_ sender: Any) {
        radius += 0.1
        labelSetRadius.text = String("\(radius)m")
    }
    
    
    @IBAction func eliminaTerra(_ sender: Any) {
        sceneView.scene.rootNode.enumerateChildNodes { (node, stop) in
            node.removeFromParentNode() }
        count = 0
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        imageHand.animateBounceRepeat()
    
        
        
        // Run the view's session
        sceneView.session.run(configuration)
    }



}

