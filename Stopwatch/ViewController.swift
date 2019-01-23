//
//  ViewController.swift
//  Stopwatch
//
//  Created by Harmanpreet Kaur on 22/01/19.
//  Copyright © 2019 Harmanpreet Kaur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let stopwatch = Stopwatch()
    @IBOutlet weak var elapsedTimeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func startButtonTapped(_ sender: UIButton) {
        print("Start button tapped")
        elapsedTimeLabel.text = "00:00.00"
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.updateElapsedTimeLabel(_:)), userInfo: nil, repeats: true)
        stopwatch.start()
    }
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        print("Stop button tapped")
        stopwatch.stop()
    }
    
    @objc func updateElapsedTimeLabel(_ timer: Timer) {
        if stopwatch.isRunning {
            elapsedTimeLabel.text = stopwatch.elapsedTimeAsString
        } else {
            timer.invalidate()
        }
    }
    
}

