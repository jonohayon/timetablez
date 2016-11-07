//
//  Delegates.swift
//  Timetable
//
//  Created by Jonathan Ohayon on 05/11/2016.
//  Copyright © 2016 Jonathan Ohayon. All rights reserved.
//

import Foundation

// Just some custom delegates
protocol ScrollDelegate {
  func scrollTo (page: Int)
}

protocol ClassDelegate {
  func changeClass (sclass: SchoolClass)
}
