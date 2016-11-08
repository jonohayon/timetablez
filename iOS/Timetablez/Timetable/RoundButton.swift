//
//  RoundButton.swift
//  Timetable
//
//  Created by Jonathan Ohayon on 08/11/2016.
//  Copyright © 2016 Jonathan Ohayon. All rights reserved.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {
  @IBInspectable var cornerRadius: CGFloat = 0 {
    didSet {
      layer.cornerRadius = cornerRadius
      layer.masksToBounds = cornerRadius > 0
    }
  }

  override func draw (_ rect: CGRect) {
    self.titleLabel?.textAlignment = .center
  }
}
