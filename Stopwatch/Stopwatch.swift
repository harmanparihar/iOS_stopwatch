//
//  Stopwatch.swift
//  Stopwatch
//
//  Created by Harmanpreet Kaur on 22/01/19.
//  Copyright © 2019 Harmanpreet Kaur. All rights reserved.
//

import Foundation

class Stopwatch {
    private var startTime: Date?
    var pauseTime = 0.0
    var elapsedTime: TimeInterval {
        
        if let startTime = self.startTime {
            return ( pauseTime + -startTime.timeIntervalSinceNow)
        } else {
            if pauseTime != 0 {
                startTime = Date()
                return (pauseTime)
            }
            else{
                return 0
            }
        }
    }
    var elapsedTimeAsString: String {
        return String(format: "%02d:%02d.%02d",
                      Int(elapsedTime / 60), Int(elapsedTime.truncatingRemainder(dividingBy: 60)), Int((elapsedTime * 10).truncatingRemainder(dividingBy: 10)))
    }
    
    var isRunning: Bool {
        return startTime != nil
    }
    
    func start() {
        
        startTime = Date()
    }
    
    func stop() {
        pauseTime = elapsedTime
        startTime = nil
        print(pauseTime)
        print(startTime)
    }
    func reset(){
        startTime = nil
        pauseTime = 0.0
    }
}
