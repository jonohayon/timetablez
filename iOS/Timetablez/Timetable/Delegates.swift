//
//  Delegates.swift
//  Timetable
//
//  Created by Jonathan Ohayon on 05/11/2016.
//  Copyright © 2016 Jonathan Ohayon. All rights reserved.
//

import UIKit

// Just some custom delegates
@objc protocol ScrollDelegate {
  func scrollTo (page: Int)
  @objc optional func getScrollView () -> UIScrollView
}

protocol ClassDelegate {
  func changeClass (sclass: SchoolClass)
}
