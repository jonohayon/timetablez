//
//  Class.swift
//  Timetable
//
//  Created by Jonathan Ohayon on 05/11/2016.
//  Copyright © 2016 Jonathan Ohayon. All rights reserved.
//

import Foundation

// Can't name it Class since it's a keyword lol
class SchoolClass {
  var className: String = ""
  var startTime: String = ""
  var endTime: String = ""
  var room: String = ""
  var day: String = ""
  var dict: [String: String] = [:]

  init (className: String, startTime: String, endTime: String, room: Any, day: String) {
    self.className = className
    self.startTime = startTime
    self.endTime = endTime
    if let roomNum = room as? Int {
      self.room = "Room \(roomNum)"
    } else if let roomName = room as? String {
      self.room = roomName
    } else {
      fatalError("Room isn't Int or String; Aborting")
    }
    self.day = day
    self.dict = [
      "className": self.className,
      "startTime": self.startTime,
      "endTime": self.endTime,
      "room": self.room,
      "day": self.day
    ]
  }
}
