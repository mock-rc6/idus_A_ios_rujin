//
//  MidViewController.swift
//  IdusClone
//
//  Created by RooZin on 2022/06/28.
//

import UIKit
import Tabman
import Pageboy

class WorkTabViewController: TabmanViewController {
    
    var viewControllers : [UIViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpTabMan()
    }
    
}

extension WorkTabViewController {
    
    func setUpTabMan() {
        
        let firstVC = UIStoryboard.init(name: "TodayView", bundle: nil).instantiateViewController(withIdentifier: "TodayVC") as! TodayViewController
        let secondVC = UIStoryboard.init(name: "RealTimeView", bundle: nil).instantiateViewController(withIdentifier: "RealTimeVC") as! RealTimeViewController
        let thirdVC = NewViewController()
    
        viewControllers.append(firstVC)
        viewControllers.append(secondVC)
        viewControllers.append(thirdVC)
       
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

extension WorkTabViewController : PageboyViewControllerDataSource, TMBarDataSource {
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        switch index {
        case 0:
            return TMBarItem(title : "투데이")
        case 1:
            return TMBarItem(title : "실시간")
        case 2:
            return TMBarItem(title : "NEW")
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

