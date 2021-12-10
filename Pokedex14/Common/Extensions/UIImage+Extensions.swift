//
//  UIImage+Extensions.swift
//  Pokedex14
//
//  Created by Raúl Leonardo Pavón Toral on 30/11/21.
//

import Foundation
import UIKit

extension UIImage {
    class func getImageFromURL(imageString: String) -> UIImage? {
        if let urlImage = URL(string: imageString) {
            let data = try? Data(contentsOf: urlImage)
            if let imageData = data {
                return UIImage(data: imageData) ?? UIImage()
            }
        }
        return nil
    }
}
