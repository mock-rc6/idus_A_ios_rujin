//
//  UIImage.swift
//  IdusClone
//
//  Created by RooZin on 2022/06/27.
//

import UIKit



extension UIImage {

    func applyBlur_original(radius: CGFloat) -> UIImage {
        guard let ciImage = CIImage(image: self) else { return self }
        let filter = CIFilter(name: "CIGaussianBlur")
        
        filter?.setValue(ciImage, forKey: kCIInputImageKey)
        filter?.setValue(radius, forKey: kCIInputRadiusKey)

        guard let output = filter?.outputImage else { return self }

        return UIImage(ciImage: output)
    }

}
