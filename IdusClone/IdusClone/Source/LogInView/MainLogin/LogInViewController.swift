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
    
    //MARK: - 카카오 로그인
    @IBAction func pressKakaoBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "BottomSheetVC") as! BottomSheetViewController
        
        let bottomSheet: MDCBottomSheetController = MDCBottomSheetController(contentViewController: vc)
        
        bottomSheet.mdc_bottomSheetPresentationController?.preferredSheetHeight = 250
        bottomSheet.scrimColor = UIColor.black.withAlphaComponent(0.9)
        present(bottomSheet, animated: false, completion: nil)
    }
    
    //MARK: - 다른 방법으로 로그인하기
    @IBAction func LoginToAnother(_ sender: UIButton) {
        // UIAlertController 초기화
        let actionsheet = UIAlertController(title: "다른 방법으로 가입하기", message: nil, preferredStyle: .actionSheet)

        // UIAlertAction 설정
        // handler : 액션 발생시 호출
        let naver = UIAlertAction(title: "네이버", style: .default, handler: nil)
        let facebook = UIAlertAction(title: "페이스북", style: .default, handler: nil)
        let twitter = UIAlertAction(title: "트위터", style: .default, handler: nil)
        let email = UIAlertAction(title: "이메일", style: .default, handler: { action in
            let vc = EmailRegisterViewController()
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true, completion: nil)
        })
        
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)

        actionsheet.addAction(naver)
        actionsheet.addAction(facebook)
        actionsheet.addAction(twitter)
        actionsheet.addAction(email)
        actionsheet.addAction(cancel)
        
        self.present(actionsheet, animated: true, completion: nil)
    
    }
    
    //MARK: - 기존 회원 로그인
    @IBAction func pressMemberLoginBtn(_ sender: UIButton) {
        let vc = MemberLoginViewController()
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    //MARK: - 회원가입 없이 둘러보기
    @IBAction func moveToWithOutLogin(_ sender: UIButton) {
        moveToMain()
    }
    
    func initUI() {
        topView.layer.cornerRadius = 15
        memberLoginBtn.layer.borderColor = UIColor.white.cgColor
        memberLoginBtn.layer.borderWidth = 2
        memberLoginBtn.layer.cornerRadius = 25
    }


}
