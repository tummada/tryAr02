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
            
            btnGoToSelectTypeCurtain.isEnabled = true
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
    
    func removeAllNode(){
        // ลบ Node ทั้งหมดตอนกดปุ่มถังขยะ
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
    
    func clearAllNode(){
        // ลบ Node ออกจาก sceneView แต่ยังเก็บข้อมูลไว้ใน myDotNodes,myLineNodes
        if !myDotNodes.isEmpty{
            for dot in myDotNodes{
                dot.removeFromParentNode()
            }
        }
        if !myLineNodes.isEmpty{
            for line in myLineNodes{
                line.removeFromParentNode()
            }
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

