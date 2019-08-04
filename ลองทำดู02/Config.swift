//
//  File.swift
//  ลองทำดู01
//
//  Created by iPon on 16/7/2562 BE.
//  Copyright © 2562 iPon. All rights reserved.
//

import Foundation
import UIKit

class Config {
    
    /* สีปุ่ม ประเภทผ้าม่าน */
    let btnCurtainTypeColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2);
    
    /* รูปประเภทผ้าม่าน */
    let btnCurtainTypePicture = [UIImage(named: "ม่านตาไก่.png"),
                                 UIImage(named: "ม่านจีบ.png"),
                                 UIImage(named: "ม่านพับ.png")]
    
    let btnCurtainTypeTxt = ["ม่านตาไก่","ม่านจีบ","ม่านพับ"]
    
    let todoForStage : [String] = [ "วัดขนาดความกว้าง และ ความสูง",
                                    "เลือกประเภทของผ้าม่าน",
                                    "ขั้นตอนที่ 3",
                                    "ขั้นตอนที่ 4",
                                    "ขั้นตอนที่ 5",
                                    "ขั้นตอนที่ 6"]
    let globalStage : [[Bool]] = [
        /*             B1       B2      B3      B4      B5      B6  ......*/
        /* Stage1 */ [true,     false,  false,  false,  false,  false],
        /* Stage2 */ [false,    false,  true,   true,   true,   true],
        /* Stage3 */ [false,    true,   false,  true,   true,   true],
        /* Stage4 */ [false,    true,   true,   false,  true,   true],
        /* Stage5 */ [false,    true,   true,   true,   false,  true],
        /* Stage6 */ [false,    true,   true,   true,   true,   false]
        
        /*
         B1 : ปุ่ม clear ความกว้าง ความสูง
         B2 : ปุ่ม ไปเลือกชนิดของผ้าม่าน (ม่านจีบ,ม่านตาไก่,​ม่านพับ)
         */
    ]
}
