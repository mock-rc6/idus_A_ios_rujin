//
//  UIImageView.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/02.
//

import UIKit

extension UIImageView {
    
    func load(url : String) {
        guard let url = URL(string: url) else {
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
