//
//  Extensions.swift
//  Timetable
//
//  Created by Jonathan Ohayon on 05/11/2016.
//  Copyright © 2016 Jonathan Ohayon. All rights reserved.
//

import UIKit

var isOpen: Bool = false

extension UIScrollView {
  func scrollToPage (num: CGFloat) {
    var sframe = frame
    sframe.origin.x = 0
    sframe.origin.y = sframe.size.height * (num - 1)
    scrollRectToVisible(sframe, animated: true)
  }

  var sidebarOpen: Bool {
    get { return isOpen }
  }

  func toggleSidebar (_ close: Bool?) {
    UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseOut, animations: {
      var scvFrame = self.frame
      if close == nil {
        scvFrame.origin.x = isOpen ? 0 : 250
        isOpen = !isOpen
      } else if close! {
        scvFrame.origin.x = 0
        isOpen = false
      } else if !close! {
        scvFrame.origin.x = 250
        isOpen = true
      }
      self.frame = scvFrame
    }, completion: nil)
  }

  func appendOverlay () {
    let rect = self.frame
    let view = UIView(frame: rect)
    view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.65)
    let tap = UITapGestureRecognizer(target: self, action: #selector(closeSidebar))
    view.addGestureRecognizer(tap)
    self.addSubview(view)
  }

  @objc private func closeSidebar () {
    self.toggleSidebar(true)
  }
}
