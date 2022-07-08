//
//  ClassViewController.swift
//  IdusClone
//
//  Created by RooZin on 2022/06/27.
//

import UIKit

class ClassViewController: UIViewController {

    @IBOutlet weak var classSearchView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
    }
    

    @objc func moveToCart() {
        print("CART")
        let vc = UIStoryboard(name: "CartView", bundle: Bundle.main).instantiateViewController(withIdentifier: "CartVC") as! CartViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @objc func moveToSearch(_ sender : UIGestureRecognizer) {
        let storyboard = UIStoryboard(name: "SearchView", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier: "SearchVC")
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func initUI() {
        classSearchView.layer.borderWidth = 1
        classSearchView.layer.borderColor = UIColor.systemGray4.cgColor
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.moveToSearch(_:)))
        self.classSearchView.addGestureRecognizer(gesture)
        
        setNavigationBar()
    }
    
    func setNavigationBar() {
        
        let rightBtn = makeSFSymbolButton(self, action: #selector(moveToCart), symbolName: "cart")
        
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "idus"))
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationItem.rightBarButtonItem = rightBtn

    }
}
