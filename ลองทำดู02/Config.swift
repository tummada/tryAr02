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
    
    let todoForStage : [String] = [ "วัดขนาดความกว้าง และ ความสูง",
                                    "ขั้นตอนที่ 2",
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
         */
    ]
}
