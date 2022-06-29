//
//  ClassTabViewController.swift
//  IdusClone
//
//  Created by RooZin on 2022/06/29.
//

import UIKit
import Tabman
import Pageboy

class ClassTabViewController: TabmanViewController {

    var viewControllers : [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpTabMan()
    }
    
}

extension ClassTabViewController {
    
    func setUpTabMan() {
        
        let firstVC = UIStoryboard.init(name: "OnlineView", bundle: nil).instantiateViewController(withIdentifier: "OnlineVC") as! OnlineViewController
        let secondVC = UIStoryboard.init(name: "OfflineView", bundle: nil).instantiateViewController(withIdentifier: "OfflineVC") as! OfflineViewController
    
        viewControllers.append(firstVC)
        viewControllers.append(secondVC)
   
        self.dataSource = self
        
        let bar = TMBar.ButtonBar()
        bar.indicator.overscrollBehavior = .compress
        bar.backgroundView.style = .blur(style: .light)
        bar.layout.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        bar.layout.alignment = .centerDistributed
        bar.layout.contentMode = .fit
        
        bar.buttons.customize { (button) in
            button.tintColor = .systemGray2
            button.selectedTintColor = .systemOrange
            button.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
            button.selectedFont = UIFont.systemFont(ofSize: 15, weight: .semibold)
            button.sizeToFit()
        }
        
        bar.indicator.weight = .custom(value: 2)
        bar.indicator.tintColor = .systemOrange
        addBar(bar, dataSource: self, at: .top)
    }
    
}

//MARK: - PageboyViewControllerDataSource, TMBarDataSource

extension ClassTabViewController : PageboyViewControllerDataSource, TMBarDataSource {
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        switch index {
        case 0:
            return TMBarItem(title : "온라인")
        case 1:
            return TMBarItem(title : "오프라인")
        default:
            let title = "Page \(index)"
            return TMBarItem(title: title)
        }
    }
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
}
