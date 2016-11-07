//
//  RootVC.swift
//  Timetable
//
//  Created by Jonathan Ohayon on 05/11/2016.
//  Copyright © 2016 Jonathan Ohayon. All rights reserved.
//

import UIKit

class RootVC: UIViewController, ScrollDelegate {
  @IBOutlet weak var scrollView: UIScrollView!

  override func viewDidLoad() {
    super.viewDidLoad()
    let timetable = self.storyboard?.instantiateViewController(withIdentifier: "NavigationVC") as! UINavigationController
    let nextUp = self.storyboard?.instantiateViewController(withIdentifier: "NextUpVC") as! NextUpVC

    let presented = timetable.visibleViewController as! TimetableVC
    presented.delegate = nextUp
    presented.scrollDelegate = self

    nextUp.delegate = self
    nextUp.nextClass = presented.classes[0]

    let sWidth = self.scrollView.frame.width
    let sHeight = self.scrollView.frame.height

    nextUp.view.frame = CGRect(x: 0, y: 0, width: sWidth, height: sHeight)
    timetable.view.frame = CGRect(x: 0, y: sHeight, width: sWidth, height: sHeight)

    self.addChildViewController(nextUp)
    self.addChildViewController(timetable)

    self.scrollView!.addSubview(nextUp.view)
    self.scrollView!.addSubview(timetable.view)
    self.scrollView!.contentSize = CGSize(width: sWidth, height: sHeight * 2)
    self.scrollView!.showsVerticalScrollIndicator = false
  }

  func scrollTo (page: Int) {
    self.scrollView.scrollToPage(num: CGFloat(page))
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}
