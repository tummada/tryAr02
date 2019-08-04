//
//  ViewController+Stage.swift
//  ลองทำดู01
//
//  Created by iPon on 16/7/2562 BE.
//  Copyright © 2562 iPon. All rights reserved.
//

import Foundation
import UIKit

extension ViewController {
    
    func initStage(){
        
        lblTitle.text = config.todoForStage[myStage]
        
        sceneView.addSubview(btnStackView)
        
        let btnDeleteWidthHeignt = createDeleteWidthHeightBtn()
        btnGoToSelectTypeCurtain = createGoToNextStageBtn()
        btnGoToSelectTypeCurtain.isEnabled = false
        
        createStackView(with: NSLayoutConstraint.Axis.horizontal)
        btnStackView.addArrangedSubview(btnDeleteWidthHeignt)
        btnStackView.addArrangedSubview(btnGoToSelectTypeCurtain)

    }
    
    func changeTitle (stage: Int){
        
        lblTitle.text = config.todoForStage[myStage]
        
//        print("Click====>" + clickBtn.restorationIdentifier!)
//        lblTitle.text = config.todoForStage[myStage]
//        lblObj1.text = "Object 1 => \(config.globalStage[myStage][0])"
//        lblObj2.text = "Object 2 => \(config.globalStage[myStage][1])"
//        lblObj3.text = "Object 3 => \(config.globalStage[myStage][2])"
//        lblObj4.text = "Object 4 => \(config.globalStage[myStage][3])"
//        lblObj5.text = "Object 5 => \(config.globalStage[myStage][4])"
//        lblObj6.text = "Object 6 => \(config.globalStage[myStage][5])"
//
//        if myStage == 0 {
//            btnPrevious.isEnabled = false
//        }
//        if myStage > 0 {
//            btnPrevious.isEnabled = true
//        }
//        if myStage == 5 {
//            btnNext.isEnabled = false
//        }
//        if myStage < 5 {
//            btnNext.isEnabled = true
//        }
        
    }
    
    func removeAllButtonFromStack(){
//      for (index, element) in stackView.arrangedSubviews.enumerated() { print(index, ":", element) }
        for (_, element) in btnStackView.arrangedSubviews.enumerated() {
            element.removeFromSuperview()
        }
    }
    
    func goStage1(){
//        removeAllButtonFromStack()

        clearAllNode()
        
        setTableView()
        btnStackView.isHidden = true
        lblTitle.isHidden = true
        
    }
    
    
    func x1(){
        
    }
    
 
}
