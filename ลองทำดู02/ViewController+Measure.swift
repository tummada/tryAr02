//
//  ViewController+Measure.swift
//  ลองทำดู01
//
//  Created by iPon on 16/7/2562 BE.
//  Copyright © 2562 iPon. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

extension ViewController {

    @objc func addDots(recognizer: UIGestureRecognizer){
        
        guard let scenViewp = recognizer.view as? ARSCNView else {
            return
        }
        
        let touch = recognizer.location(in: scenViewp)
        
        let result = sceneView.hitTest(touch, types: .featurePoint)
        if let hit = result.first {
            
            let dotGeometry = SCNSphere(radius: 0.003)
            let material = SCNMaterial()
            material.diffuse.contents = UIColor.red
            
            dotGeometry.materials = [material]
            
            let dotNode = SCNNode(geometry: dotGeometry)
            
            dotNode.position = SCNVector3(
                x: hit.worldTransform.columns.3.x,
                y: hit.worldTransform.columns.3.y ,
                z: hit.worldTransform.columns.3.z)
            sceneView.scene.rootNode.addChildNode(dotNode)
            
            myDotNodes.append(dotNode)
            
            showLine()
            
        }
    }
   

    func showLine(){
        
        if( myDotNodes.count == 2 ){
            myWidth = calculate(start: myDotNodes[0], end: myDotNodes[1], isDrawLine: true)
            print(" Width = \(myWidth)")
//
//            let myTextWidth = txtWidthHeight.text?.replacingOccurrences(of: "ความกว้าง", with: String(myWidth))
//            txtWidthHeight.text = myTextWidth
            
        }
        else if( myDotNodes.count == 4 ){

            myHeight = calculate(start: myDotNodes[2], end: myDotNodes[3], isDrawLine: true)
            print(" Height = \(myHeight)")
            
            let buttons = createButtons(num: 1)
            stackView = createStackView(with: NSLayoutConstraint.Axis.horizontal)
            
            buttons.forEach { button in
                stackView.addArrangedSubview(button)
            }
            
            sceneView.addSubview(stackView)
            
            stackView.bottomAnchor.constraint(equalTo: sceneView.bottomAnchor, constant: -5.0).isActive = true
            stackView.leftAnchor.constraint(equalTo: sceneView.leftAnchor, constant: 5.0).isActive = true
            stackView.rightAnchor.constraint(equalTo: sceneView.rightAnchor, constant: -5.0).isActive = true
//            stackView.centerXAnchor.constraint(equalTo: sceneView.centerXAnchor).isActive = true
//            stackView.centerYAnchor.constraint(equalTo: sceneView.bottomAnchor).isActive = true
            
        }
        
    }
    
    func calculate (start: SCNNode, end: SCNNode, isDrawLine: Bool)-> Float{
      
        if isDrawLine {
            addLineBetween(start: SCNVector3.init(start.position.x, start.position.y, start.position.z),
                           end:   SCNVector3.init(end.position.x,   end.position.y,   end.position.z))
        }
        
        let distance = sqrt(
            pow(end.position.x - start.position.x, 2) +
                pow(end.position.y - start.position.y, 2) +
                pow(end.position.z - start.position.z, 2)
        )
        
        return abs(distance)
    }
    func addLineBetween(start: SCNVector3, end: SCNVector3) {
        let lineGeometry = SCNGeometry.lineFrom(vector: start, toVector: end)
        let lineNode = SCNNode(geometry: lineGeometry)
        
        sceneView.scene.rootNode.addChildNode(lineNode)
        myLineNodes.append(lineNode)
    }
    
    func clearWidthHeight(){
        
        if !myDotNodes.isEmpty{
            for dot in myDotNodes{
                dot.removeFromParentNode()
            }
            myDotNodes = [SCNNode]()
        }
        if !myLineNodes.isEmpty{
            for line in myLineNodes{
                line.removeFromParentNode()
            }
            myLineNodes = [SCNNode]()
        }
    }
    
    func createStackView(with layout: NSLayoutConstraint.Axis) -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = layout
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        return stackView
    }
    
    func createButtons(num: Int) -> [UIButton] {
        var buttons = [UIButton]()
        for x in 0..<num {
            let button = UIButton(type: .custom)
            //            button.backgroundColor = .red
            //            button.restorationIdentifier = myS
            button.backgroundColor = UIColor(red: 0, green: 0, blue:0, alpha: 0.4)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.widthAnchor.constraint(equalToConstant: 50).isActive = true
            button.addTarget(self, action: #selector(self.buttonAction), for: .touchUpInside)
            //            button.heightAnchor.constraint(equalToConstant: 100).isActive = true
            button.setTitle("Title \(x)", for: .normal)
            buttons.append(button)
        }
        return buttons
    }
    
    @objc func buttonAction(_ gesture: UITapGestureRecognizer){
        
        print("HELLO WORLD")
        let buttons = createButtons(num: 1)
        buttons.forEach { button in
            stackView.addArrangedSubview(button)
        }
        
    }
    
}

extension SCNGeometry {
    class func lineFrom(vector vector1: SCNVector3, toVector vector2: SCNVector3) -> SCNGeometry {
        let indices: [Int32] = [0, 1]
        
        let source = SCNGeometrySource(vertices: [vector1, vector2])
        let element = SCNGeometryElement(indices: indices, primitiveType: .line)
        
        return SCNGeometry(sources: [source], elements: [element])
    }
}

