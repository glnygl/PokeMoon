//
//  UIView+Extensions.swift
//  PokeMoon
//
//  Created by Gülenay Gül on 9.02.2020.
//  Copyright © 2020 Gülenay Gül. All rights reserved.
//

import UIKit

extension UIView {

    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
         let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
         let mask = CAShapeLayer()
         mask.path = path.cgPath
         self.layer.mask = mask
    }

}
