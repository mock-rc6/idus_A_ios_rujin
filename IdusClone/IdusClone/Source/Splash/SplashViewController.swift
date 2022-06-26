//
//  SplashViewController.swift
//  IdusClone
//
//  Created by RooZin on 2022/06/26.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        usleep(3000000)
        
        if Constant.MY_TOKEN.isEmpty == true { hasnotToken() }
        else { hasToken() }
    }
  
    // MARK: 토큰이 없을때
    func hasnotToken() {
        guard let vc = UIStoryboard(name: "LogInView", bundle: nil).instantiateViewController(identifier: "LogInVC") as? LogInViewController else { return }
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    
    
    // MARK: 토큰이 있을 경우
    func hasToken() {
//        let vc = BaseTabBarController()
//        vc.modalPresentationStyle = .overFullScreen
//        self.present(vc, animated: true)
        print("aa")
    }

}
