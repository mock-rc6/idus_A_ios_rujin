//
//  MemberLoginViewController.swift
//  IdusClone
//
//  Created by RooZin on 2022/06/27.
//

import UIKit
import MaterialComponents.MaterialBottomSheet

class MemberLoginViewController: UIViewController {
    
    @IBOutlet weak var bgImg: UIImageView!
    
    @IBOutlet weak var snsLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    
    @IBOutlet weak var naverBtn: UIButton!
    @IBOutlet weak var facebookBtn: UIButton!
    @IBOutlet weak var kakaotalkBtn: UIButton!
    @IBOutlet weak var twitterBtn: UIButton!
    
    @IBOutlet weak var emailLoginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - ID & PW 찾기
    @IBAction func findIdPw(_ sender: UIButton) {
        
    }
    
    //MARK: - 카카오 로그인
    @IBAction func logInKaKao(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "BottomSheetVC") as! BottomSheetViewController
        
        let bottomSheet: MDCBottomSheetController = MDCBottomSheetController(contentViewController: vc)
        
        bottomSheet.mdc_bottomSheetPresentationController?.preferredSheetHeight = 250
        bottomSheet.scrimColor = UIColor.black.withAlphaComponent(0.9)
        present(bottomSheet, animated: false, completion: nil)
    }
    
    //MARK: - 이메일 로그인
    @IBAction func pressEmailLogIn(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "BaseStoryBoard", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier: "BaseTBC")

        changeRootViewController(vc)
    }
    
    //MARK: - 상단 xmark 이벤트
    @IBAction func pressXmark(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "BaseStoryBoard", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier: "BaseTBC")

        changeRootViewController(vc)
    }
    
    func initUI() {
        self.bgImg.image = bgImg.image?.applyBlur_original(radius: 10)
        
        buttonCodinate(naverBtn)
        buttonCodinate(facebookBtn)
        buttonCodinate(kakaotalkBtn)
        buttonCodinate(twitterBtn)
        buttonCodinate(emailLoginBtn)
        
        makeUnderLine(snsLbl, snsLbl.text!)
        makeUnderLine(emailLbl, emailLbl.text!)
    }
    
    //MARK: - button 꾸미기
    func buttonCodinate(_ btn : UIButton) {
        btn.layer.borderColor = UIColor.white.cgColor
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 20
    }

    //MARK: - Label에 밑줄
    func makeUnderLine(_ myLabel : UILabel, _ str : String) {
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
        let underlineAttributedString = NSAttributedString(string: str, attributes: underlineAttribute)
        myLabel.attributedText = underlineAttributedString
    }

}
