//
//  TimetableVC.swift
//  Timetable
//
//  Created by Jonathan Ohayon on 05/11/2016.
//  Copyright © 2016 Jonathan Ohayon. All rights reserved.
//

import UIKit

class TimetableVC: UITableViewController {
  var classes: [SchoolClass] = [
    SchoolClass(className: "Physics", startTime: "12:55", endTime: "13:40", room: 404, day: "Sunday"),
    SchoolClass(className: "Literature", startTime: "13:50", endTime: "14:35", room: "Main class", day: "Monday")
  ]
  var delegate: ClassDelegate?
  var scrollDelegate: ScrollDelegate?

  override func viewDidLoad() {
    super.viewDidLoad()
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    self.tableView.isScrollEnabled = true
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.classes.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "classCell", for: indexPath) as! ClassCell
    let sclass = self.classes[indexPath.row]
    cell.className.text = sclass.className
    cell.classInfo.text = "\(sclass.startTime) | \(sclass.room)"
    return cell
  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let del = self.delegate {
      del.changeClass(sclass: self.classes[indexPath.row])
    }
    if let sdel = self.scrollDelegate {
      sdel.scrollTo(page: 1)
    }
    self.tableView.deselectRow(at: indexPath, animated: true)
  }

  override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    return true
  }

  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      self.classes.remove(at: indexPath.row)
      self.tableView.deleteRows(at: [indexPath], with: .fade)
    }
  }

  /*
  // MARK: - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      // Get the new view controller using segue.destinationViewController.
      // Pass the selected object to the new view controller.
  }
  */
}
