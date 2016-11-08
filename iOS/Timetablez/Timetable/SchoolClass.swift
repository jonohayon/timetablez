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
  var className: String
  var startTime: String
  var endTime: String
  var room: String
  var day: Day

  init (className: String, startTime: String, endTime: String, room: Any, day: Day) {
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
  }

  static func defaultClasses () -> [SchoolClass] {
    return [
      SchoolClass(className: "Democracy", startTime: "08:20", endTime: "09:25", room: "Main Class", day: .sunday),
      SchoolClass(className: "Math", startTime: "09:35", endTime: "10:20", room: "Biology #2", day: .sunday),
      SchoolClass(className: "Physics", startTime: "10:30", endTime: "11:40", room: "Physics Lab", day: .sunday),
    ]
  }
}
