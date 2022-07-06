//
//  PurchaseViewController.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/07.
//

import UIKit

class PurchaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


let vc = storyboard?.instantiateViewController(withIdentifier: "BottomSheetVC") as! BottomSheetViewController

let bottomSheet: MDCBottomSheetController = MDCBottomSheetController(contentViewController: vc)

bottomSheet.mdc_bottomSheetPresentationController?.preferredSheetHeight = 250
bottomSheet.scrimColor = UIColor.black.withAlphaComponent(0.9)
present(bottomSheet, animated: false, completion: nil)
