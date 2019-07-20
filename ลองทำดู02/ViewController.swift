//
//  ViewController.swift
//  ลองทำดู02
//
//  Created by iPon on 20/7/2562 BE.
//  Copyright © 2562 iPon. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    let config = Config()
    
    var stackView : UIStackView!
    
    var myDotNodes = [SCNNode]()
    var myLineNodes = [SCNNode]()
    var myWidth : Float = 0.0
    var myHeight : Float = 0.0
    
    @IBOutlet var sceneView: ARSCNView!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(addDots))
        sceneView.addGestureRecognizer(tapGesture)
        
        initStage()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
}
