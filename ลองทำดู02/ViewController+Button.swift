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
