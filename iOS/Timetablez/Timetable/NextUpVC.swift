//
//  DataViewController.swift
//  Timetable
//
//  Created by Jonathan Ohayon on 04/11/2016.
//  Copyright © 2016 Jonathan Ohayon. All rights reserved.
//

import UIKit

class NextUpVC: UIViewController, ClassDelegate {
  @IBOutlet weak var className: UILabel!
  @IBOutlet weak var classInfo: UILabel!
  @IBOutlet weak var nextUpLabel: UILabel!

  var nextClass: SchoolClass? = nil
  var delegate: ScrollDelegate?

  @IBAction func scrollDown(_ sender: Any) {
    if let del = self.delegate {
      del.scrollTo(page: 1)
    }
  }

  @IBAction func openSidebar(_ sender: Any) {
    if let del = self.delegate {
      del.getScrollView!().toggleSidebar(nil)
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    if let sclass = self.nextClass {
      self.className.text = sclass.className
      self.classInfo.text = "\(sclass.startTime) - \(sclass.endTime) | \(sclass.room)"
    }
  }

  func changeClass (sclass: SchoolClass) {
    self.nextUpLabel.alpha = 0
    self.className.text = sclass.className
    self.classInfo.text = "\(sclass.startTime) - \(sclass.endTime) | \(sclass.room)"
  }
}
