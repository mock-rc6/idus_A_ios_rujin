//
//  EmailRegisterViewController.swift
//  IdusClone
//
//  Created by RooZin on 2022/06/27.
//

import UIKit

class EmailRegisterViewController: UIViewController {
    
    @IBOutlet var headerView: UIView!
    @IBOutlet weak var selectView: UIView!
    @IBOutlet weak var bgImg: UIImageView!
    
    @IBOutlet weak var allAgreeBtn: UIButton!
    @IBOutlet weak var firstBtn: UIButton!
    @IBOutlet weak var secondBtn: UIButton!
    @IBOutlet weak var thirdBtn: UIButton!
    @IBOutlet weak var forthBtn: UIButton!
    
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var leftTopBtn: UIButton!
    
    var check : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func pressLeftTopBtn(_ sender: UIButton) {
        if check == 0 {
            view.endEditing(true)
            sender.setImage(UIImage(systemName: "xmark"), for: UIControl.State.normal)
            check = 1
        }
        else {
            print("a")
            check = 0
        }
    }
    
    
    
    @IBAction func allAgree(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            sender.setImage(UIImage(systemName: "square"), for : UIControl.State.normal)
            firstBtn.setImage(UIImage(systemName: "square"), for : UIControl.State.normal)
            secondBtn.setImage(UIImage(systemName: "square"), for : UIControl.State.normal)
            thirdBtn.setImage(UIImage(systemName: "square"), for : UIControl.State.normal)
            forthBtn.setImage(UIImage(systemName: "square"), for : UIControl.State.normal)
        }
        else {
            sender.isSelected = true
            sender.setImage(UIImage(systemName: "checkmark.square"), for : UIControl.State.normal)
            firstBtn.setImage(UIImage(systemName: "checkmark.square"), for : UIControl.State.normal)
            secondBtn.setImage(UIImage(systemName: "checkmark.square"), for : UIControl.State.normal)
            thirdBtn.setImage(UIImage(systemName: "checkmark.square"), for : UIControl.State.normal)
            forthBtn.setImage(UIImage(systemName: "checkmark.square"), for : UIControl.State.normal)
        }
        
    }
    
    @IBAction func ageAgree(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            sender.setImage(UIImage(systemName: "square"), for : UIControl.State.normal)
        }
        else {
            sender.isSelected = true
            sender.setImage(UIImage(systemName: "checkmark.square"), for : UIControl.State.normal)
        }
    }
    
    @IBAction func essentialAgree(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            sender.setImage(UIImage(systemName: "square"), for : UIControl.State.normal)
        }
        else {
            sender.isSelected = true
            sender.setImage(UIImage(systemName: "checkmark.square"), for : UIControl.State.normal)
        }
    }
    
    @IBAction func privateInfoAgree(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            sender.setImage(UIImage(systemName: "square"), for : UIControl.State.normal)
        }
        else {
            sender.isSelected = true
            sender.setImage(UIImage(systemName: "checkmark.square"), for : UIControl.State.normal)
        }
    }
    
    @IBAction func eventAgree(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            sender.setImage(UIImage(systemName: "square"), for : UIControl.State.normal)
        }
        else {
            sender.isSelected = true
            sender.setImage(UIImage(systemName: "checkmark.square"), for : UIControl.State.normal)
        }
    }
    
    func initUI() {
        
        self.bgImg.image = bgImg.image?.applyBlur_original(radius: 10)
        selectView.layer.borderWidth = 1
        selectView.layer.borderColor = UIColor.white.cgColor
        selectView.layer.cornerRadius = 5
        
        registerBtn.layer.borderColor = UIColor.white.cgColor
        registerBtn.layer.borderWidth = 1
        registerBtn.layer.cornerRadius = 20
        view.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        
        //leftTopBtn.imageView?.image = UIImage(named: "keyboard")
    }
    
    func setAgreeBtn() {
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 25, weight: .regular, scale: .large)
        
        let largeBoldDoc = UIImage(systemName: "square", withConfiguration: largeConfig)
        
        allAgreeBtn.setImage(largeBoldDoc, for: .normal)
    }
}
