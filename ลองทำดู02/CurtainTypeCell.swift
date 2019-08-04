//
//  BtnCurtainTableViewCell.swift
//  ลองทำดู02
//
//  Created by iPon on 28/7/2562 BE.
//  Copyright © 2562 iPon. All rights reserved.
//

import UIKit

class CurtainTypeCell: UITableViewCell {
 
    lazy var backView: UIView = {
        let uiView = UIView(frame: CGRect(x: 10,
                                          y: 4,
                                          width: self.frame.width - 20,
                                          height: self.frame.height - 10 ))
        return uiView
    }()
    
    lazy var userImage: UIImageView = {
        let yyy = self.frame.height / 2 - 106 / 2 - 10
        let xx = UIImageView(frame: CGRect(x: 4, y: yyy, width: 106, height: 106))
        xx.contentMode = .scaleAspectFit
        return xx
    }()
    
    lazy var nameLabel: UILabel = {
        let yyy = self.frame.height / 2 - 30
        let lbl = UILabel(frame: CGRect(x: 116, y: yyy, width: self.frame.width - 116 , height: 30))
        lbl.textAlignment = .center
        lbl.textColor = UIColor.white
        lbl.font = UIFont.boldSystemFont(ofSize: 38)
        return lbl
    }()
    
    lazy var ageLabel: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 116, y: 42, width: self.frame.width - 116 , height: 30))
        lbl.textColor = UIColor.white
        lbl.textAlignment = .left
        return lbl
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
 
    override func layoutSubviews() {
        contentView.backgroundColor = UIColor.clear
        backgroundColor = UIColor.clear
        backView.layer.cornerRadius = 10
        backView.clipsToBounds = true
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        addSubview(backView)
        backView.addSubview(userImage)
        backView.addSubview(nameLabel)
        backView.addSubview(ageLabel)
    }
}
