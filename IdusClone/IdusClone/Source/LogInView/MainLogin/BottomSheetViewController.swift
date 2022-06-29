//
//  BottomSheetViewController.swift
//  IdusClone
//
//  Created by RooZin on 2022/06/27.
//

import UIKit
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

class BottomSheetViewController: UIViewController {
    
    @IBOutlet weak var xMarkBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setXMarkBtn()
    }
    
    @IBAction func loginToKakaoTalk(_ sender: UIButton) {
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")

                    self.moveToMain()
                    _ = oauthToken
                }
            }
            
        }
    }
    
    @IBAction func logInToKakaoAccount(_ sender: UIButton) {
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoAccount() success.")

                    self.moveToMain()
                    _ = oauthToken
                }
            }
    }
    
    
    @IBAction func pressXbtn(_ sender: UIButton) {
        self.dismiss(animated: false)
    }
    
    // xmark 버튼 크기 설정
    func setXMarkBtn() {
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 25, weight: .regular, scale: .large)
               
        let largeBoldDoc = UIImage(systemName: "xmark.circle", withConfiguration: largeConfig)
        
        xMarkBtn.setImage(largeBoldDoc, for: .normal)
    }
    

}
