//
//  ViewController.swift
//  ลองทำดู02
//
//  Created by iPon on 20/7/2562 BE.
//  Copyright © 2562 iPon. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    let config = Config()
    
    var curtainTypeTableView = UITableView()
    
    var btnStackView = UIStackView()
//    var curtainTypeStackView = UIStackView()
    
    var btnGoToSelectTypeCurtain : UIButton!
    
    var myDotNodes = [SCNNode]()
    var myLineNodes = [SCNNode]()
    var myWidth : Float = 0.0
    var myHeight : Float = 0.0
    var myStage : Int = 0
    
    @IBOutlet var sceneView: ARSCNView!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(addDots))
        sceneView.addGestureRecognizer(tapGesture)
        
        initStage()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    func setTableView(){
        curtainTypeTableView.frame = self.view.frame
        curtainTypeTableView.backgroundColor = UIColor.clear // done
//        tableView.separatorColor = UIColor.red
        curtainTypeTableView.delegate = self
        curtainTypeTableView.dataSource = self
        
        self.view.addSubview(curtainTypeTableView)
        
        curtainTypeTableView.register(CurtainTypeCell.self, forCellReuseIdentifier: "Cell")
    }
    
}
extension ViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return config.btnCurtainTypeTxt.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",
                                                       for: indexPath) as? CurtainTypeCell
            else { fatalError("can not load cell")}
        cell.backView.backgroundColor = config.btnCurtainTypeColor
        cell.userImage.image = config.btnCurtainTypePicture[indexPath.row]
        cell.nameLabel.text = config.btnCurtainTypeTxt[indexPath.row]
        cell.ageLabel.text = config.btnCurtainTypeTxt[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat( self.view.frame.height / 3 - 10.0 )
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Stage 1: You Select = \(indexPath.row)")
        
        let vc = CurtainTypeListViewController()
        //        self.navigationController?.pushViewController(newViewController, animated: true)
        
        //        let vc = yourCustomVCName (nibName: "yourCustomVC nibName" , bundle : nil)
        //        self.present(vc, animated: true , completion: nil)
        
        let aObjNavi = UINavigationController(rootViewController: vc)
        self.present(aObjNavi, animated: true) {
        }
        //        self.navigationController?.pushViewController(aObjNavi, animated: true)
    }
}
