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
  @IBOutlet weak var overlayView: UIView!

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

    let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(RootVC.toggleSidebar))
    rightSwipe.direction = .right
    self.scrollView!.addGestureRecognizer(rightSwipe)
    
    let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(RootVC.toggleSidebar))
    leftSwipe.direction = .left
    self.scrollView!.addGestureRecognizer(leftSwipe)

    let tap = UITapGestureRecognizer(target: self, action: #selector(RootVC.closeSidebar))
    tap.numberOfTapsRequired = 1
    self.overlayView!.addGestureRecognizer(tap)

    self.scrollView!.addSubview(nextUp.view)
    self.scrollView!.addSubview(timetable.view)
    self.scrollView!.contentSize = CGSize(width: sWidth, height: sHeight * 2)
    self.scrollView!.showsVerticalScrollIndicator = false
  }

  func scrollTo (page: Int) {
    self.scrollView.scrollToPage(num: CGFloat(page))
  }

  func getScrollView () -> UIScrollView {
    return self.scrollView
  }

  func toggleSidebar (sender: UISwipeGestureRecognizer) {
    if sender.direction == .right && !self.scrollView.sidebarOpen {
      self.scrollView!.toggleSidebar(false)
      self.toggleOverlay(true)
    } else if sender.direction == .left && self.scrollView.sidebarOpen {
      self.scrollView!.toggleSidebar(true)
      self.toggleOverlay(false)
    }
  }

  func closeSidebar (sender: UITapGestureRecognizer) {
    print("lmaooooo")
  }

  func toggleOverlay (_ open: Bool) {
    self.scrollView!.isScrollEnabled = !open
    let navCont = self.childViewControllers[1] as! UINavigationController
    let timetable = navCont.visibleViewController as! TimetableVC
    timetable.tableView.isScrollEnabled = !open
    UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseOut, animations: {
      self.overlayView.frame.origin.x = open ? 250 : 0
      self.overlayView.alpha = open ? 1 : 0
      self.overlayView.layer.zPosition = open ? 1 : -1
    }, completion: nil)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}
