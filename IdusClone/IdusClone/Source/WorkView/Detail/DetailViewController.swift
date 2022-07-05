//
//  DetailViewController.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/05.
//

import UIKit

class DetailViewController: UIViewController {

    var detailData : DetailResult?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setTableView()
    }


   

}

extension DetailViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailImgTVC") as? DetailImageTableViewCell else { return UITableViewCell() }
            
            cell.imageList = detailData!.imgURLList
            
            return cell
        default :
            return UITableViewCell()
        }
    }
    
    
    func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        let detailImgCell = UINib(nibName: "DetailImageTableViewCell", bundle: nil)
        tableView.register(detailImgCell, forCellReuseIdentifier: "DetailImgTVC")
    }
}
