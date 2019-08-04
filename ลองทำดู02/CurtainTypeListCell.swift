//
//  File.swift
//  UITableViewTest
//
//  Created by iPon on 27/7/2562 BE.
//  Copyright © 2562 iPon. All rights reserved.
//

import UIKit

class CurtainTypeListCell: UITableViewCell{
    
    lazy var backView: UIView = {
        
        let uiView = UIView(frame: CGRect(x: 10, y: 4, width: self.frame.width - 40, height: 100))
        uiView.backgroundColor = UIColor.yellow
        
        return uiView
    }()
    
    lazy var ageLabel: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 116, y: 42, width: self.frame.width - 116 , height: 30))
        lbl.textAlignment = .left
        return lbl
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSubview(backView)
        backView.addSubview(ageLabel)
    }
    
    override func layoutSubviews() {
        contentView.backgroundColor = UIColor.green
//        backgroundColor = UIColor.orange
        backView.layer.cornerRadius = 15
        backView.clipsToBounds = true
    }
}
