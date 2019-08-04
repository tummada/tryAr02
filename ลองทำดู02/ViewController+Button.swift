//
//  ViewController+Button.swift
//  ลองทำดู01
//
//  Created by iPon on 20/7/2562 BE.
//  Copyright © 2562 iPon. All rights reserved.
//

import UIKit
import SceneKit

extension ViewController {
     

    func getTemplateButton() -> UIButton {
        let btn = UIButton(type: .custom)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        btn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        btn.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        return btn
    }
    
    func createStackView(with layout: NSLayoutConstraint.Axis) { //-> UIStackView {
        //let stackView = UIStackView()
        btnStackView.translatesAutoresizingMaskIntoConstraints = false
        btnStackView.axis = layout
        btnStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        btnStackView.bottomAnchor.constraint(equalTo: sceneView.bottomAnchor, constant: -5.0).isActive = true
        btnStackView.leftAnchor.constraint(equalTo: sceneView.leftAnchor, constant: 5.0).isActive = true
        btnStackView.rightAnchor.constraint(equalTo: sceneView.rightAnchor, constant: -5.0).isActive = true
        btnStackView.distribution = .equalCentering
        btnStackView.spacing = 5
//        return stackView
    }
    
    func createCurtainType_1_Btn() -> UIButton {
        
        let img = UIImage(named: "001.png")
        let btn = getTemplateButton()
        btn.setBackgroundImage(img, for: .normal)
        btn.addTarget(self, action: #selector(self.clearWidthHeight), for: .touchUpInside)
        
        return btn
    }
    func createCurtainType_2_Btn() -> UIButton {
        
        let img = UIImage(named: "002.png")
        let btn = getTemplateButton()
        btn.setBackgroundImage(img, for: .normal)
        btn.addTarget(self, action: #selector(self.clearWidthHeight), for: .touchUpInside)
        
        return btn
    }
    func createCurtainType_3_Btn() -> UIButton {
        
        let img = UIImage(named: "003.png")
        let btn = getTemplateButton()
        btn.setBackgroundImage(img, for: .normal)
        btn.addTarget(self, action: #selector(self.clearWidthHeight), for: .touchUpInside)
        
        return btn
    }
    
    func createDeleteWidthHeightBtn() -> UIButton {
        
        let img = UIImage(named: "trash.png")
        let btn = getTemplateButton()
        btn.setBackgroundImage(img, for: .normal)
        btn.addTarget(self, action: #selector(self.clearWidthHeight), for: .touchUpInside)
        
        return btn
    }
    
    func createGoToNextStageBtn() -> UIButton {
        
        let img = UIImage(named: "003-next.png")
        let btn = getTemplateButton()
        btn.setBackgroundImage(img, for: .normal)
        btn.addTarget(self, action: #selector(self.goToNextStage), for: .touchUpInside)
        
        return btn
    }
    func createGoToPreviousStageBtn() -> UIButton {
        
        let img = UIImage(named: "004-back.png")
        let btn = getTemplateButton()
        btn.setBackgroundImage(img, for: .normal)
        btn.addTarget(self, action: #selector(self.goToPreviousStage), for: .touchUpInside)
        
        return btn
    }
    
    func createButtons(num: Int) -> [UIButton] {
        var buttons = [UIButton]()
        for x in 0..<num {
            let button = UIButton(type: .custom)
            //            button.backgroundColor = .red
//            button.restorationIdentifier = myS
            button.backgroundColor = UIColor(red: 0, green: 0, blue:0, alpha: 0.4)
            button.translatesAutoresizingMaskIntoConstraints = false
//            button.widthAnchor.constraint(equalToConstant: 50).isActive = true
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
                    btnStackView.addArrangedSubview(button)
                }
        
    }
    
    @objc func clearWidthHeight(){
        // disable ปุ่ม next
        btnGoToSelectTypeCurtain.isEnabled = false
        removeAllNode()
        
    }
    
    @objc func goToNextStage() {
        myStage = myStage + 1
        
        changeTitle(stage: myStage)
        
        switch myStage {
            case 1:
                goStage1()
            case 2:
                x1()
            case 3:
                x1()
            default:
                // กรณี เป็น stage สุดท้ายแล้ว
                myStage = myStage - 1
                // disable next btn
                x1()
        }
        
    }
    @objc func goToPreviousStage() {
        myStage = myStage - 1
        
        changeTitle(stage: myStage)
        
        switch myStage {
        case 0:
            x1()
//            backToStage0()
//            แสดงปุ่มถังขยะ ,​ปุ่ม next disable
        case 1:
            x1()
        case 2:
            x1()
        case 3:
            x1()
        default:
            // ไม่มี default
            x1()
        }
        
    }
    
}
