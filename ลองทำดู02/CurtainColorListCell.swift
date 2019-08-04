//
//  BtnCurtainTableViewCell.swift
//  ลองทำดู02
//
//  Created by iPon on 28/7/2562 BE.
//  Copyright © 2562 iPon. All rights reserved.
//

import UIKit

class CurtainColorListCell: UITableViewCell {
    
    lazy var backView: UIView = {
        
        let uiView = UIView(frame: CGRect(x: 10, y: 4, width: self.frame.width - 20, height: 110))
        //uiView.backgroundColor = UIColor.orange
        
        return uiView
    }()
    
    lazy var userImage: UIImageView = {
        let xx = UIImageView(frame: CGRect(x: 4, y: 4, width: 106, height: 106))
        xx.contentMode = .scaleAspectFill
        return xx
    }()
    
    lazy var nameLabel: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 116, y: 8, width: self.frame.width - 116 , height: 30))
        lbl.textAlignment = .left
        lbl.font = UIFont.boldSystemFont(ofSize: 18)
        return lbl
    }()
    
    lazy var ageLabel: UILabel = {
        let lbl = UILabel(frame: CGRect(x: 116, y: 42, width: self.frame.width - 116 , height: 30))
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
