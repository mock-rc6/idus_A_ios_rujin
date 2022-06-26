//
//  LogInViewController.swift
//  IdusClone
//
//  Created by RooZin on 2022/06/26.
//

import UIKit
import MaterialComponents.MaterialBottomSheet

class LogInViewController: UIViewController {

    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var memberLoginBtn: UIButton!
    @IBOutlet weak var midLineView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
        //setLineDot(view: midLineView)
    }
    
    @IBAction func pressKakaoBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "BottomSheetVC") as! BottomSheetViewController
        
        let bottomSheet: MDCBottomSheetController = MDCBottomSheetController(contentViewController: vc)
        
        bottomSheet.mdc_bottomSheetPresentationController?.preferredSheetHeight = 250
        bottomSheet.scrimColor = UIColor.black.withAlphaComponent(0.9)
        present(bottomSheet, animated: false, completion: nil)
    }
    

    func initUI() {
        topView.layer.cornerRadius = 15
        memberLoginBtn.layer.borderColor = UIColor.white.cgColor
        memberLoginBtn.layer.borderWidth = 2
        memberLoginBtn.layer.cornerRadius = 25
    }
    
//    func setLineDot(view: UIView){
//            let borderLayer = CAShapeLayer()
//
//            borderLayer.strokeColor = UIColor.white.cgColor
//        borderLayer.backgroundColor = UIColor.white.cgColor
//            borderLayer.lineDashPattern = [1, 5]
//            borderLayer.frame = view.bounds
//            borderLayer.fillColor = nil
//            borderLayer.path = UIBezierPath(rect: view.bounds).cgPath
//
//            view.layer.addSublayer(borderLayer)
//        }


}
