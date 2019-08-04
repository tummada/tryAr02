//
//  TestOtherViewController.swift
//  UITableViewTest
//
//  Created by iPon on 27/7/2562 BE.
//  Copyright © 2562 iPon. All rights reserved.
//

import UIKit

class CurtainColorListViewController: UIViewController {
    
    var curtainColorListTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        // Do any additional setup after loading the view.
        
        let backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItem.Style.plain, target: self, action: #selector(goBack))
        navigationItem.leftBarButtonItem = backButton
        
    }
    @objc func goBack(){
        dismiss(animated: true, completion: nil)
    }
    
    func setTableView(){
        curtainColorListTableView.frame = self.view.frame
        curtainColorListTableView.backgroundColor = UIColor.orange
//        curtainColorListTableView.separatorColor = UIColor.clear
        curtainColorListTableView.delegate = self
        curtainColorListTableView.dataSource = self
        
        self.view.addSubview(curtainColorListTableView)
        
        curtainColorListTableView.register(CurtainColorListCell.self, forCellReuseIdentifier: "Cell")
    }
    
}
extension CurtainColorListViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",
                                                       for: indexPath) as? CurtainColorListCell
            else { fatalError("can not load cell")}
        
        //        cell.userImage.image = userModelArr[indexPath.row].userImage
        //        cell.nameLabel.text = userModelArr[indexPath.row].nameLabel
        //        cell.ageLabel.text = userModelArr[indexPath.row].ageLabel
        cell.textLabel?.text = "\(indexPath.row)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 118
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("        Stage 3: You Select = \(indexPath.row)")
        
        //        let vc = TestOtherViewController2()
        //
        //        let aObjNavi = UINavigationController(rootViewController: vc)
        //        self.present(aObjNavi, animated: true) {
        //        }
    }
}
