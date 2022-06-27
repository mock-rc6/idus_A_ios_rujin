//
//  WorkViewController.swift
//  IdusClone
//
//  Created by RooZin on 2022/06/27.
//

import UIKit

class WorkViewController: UIViewController {
    
    @IBOutlet weak var searchView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
    }
    
    @objc func goToCart() {
        print("cart")
    }
    
    @objc func moveToSearch(_ sender : UIGestureRecognizer) {
        let storyboard = UIStoryboard(name: "SearchView", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier: "SearchVC")
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func setNavigationBar() {
        
        let rightBtn = makeSFSymbolButton(self, action: #selector(goToCart), symbolName: "cart")
        
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "idus"))
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationItem.rightBarButtonItem = rightBtn
    }
    
    func initUI() {
        searchView.layer.borderWidth = 1
        searchView.layer.borderColor = UIColor.systemGray4.cgColor
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.moveToSearch(_:)))
        self.searchView.addGestureRecognizer(gesture)
        
        setNavigationBar()
    }
    
    
}
