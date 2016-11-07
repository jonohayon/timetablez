//
//  Extensions.swift
//  Timetable
//
//  Created by Jonathan Ohayon on 05/11/2016.
//  Copyright © 2016 Jonathan Ohayon. All rights reserved.
//

import Foundation
import UIKit

extension UIScrollView {
  func scrollToPage (num: CGFloat) {
    var sframe = frame
    sframe.origin.x = 0
    sframe.origin.y = sframe.size.height * (num - 1)
    scrollRectToVisible(sframe, animated: true)
  }
}
