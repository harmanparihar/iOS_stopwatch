//
//  ViewController.swift
//  Stopwatch
//
//  Created by Harmanpreet Kaur on 22/01/19.
//  Copyright © 2019 Harmanpreet Kaur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var stopBtn: UIButton!
    @IBOutlet weak var resetBtn: UIButton!
    let stopwatch = Stopwatch()
    @IBOutlet weak var elapsedTimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startBtn.layer.cornerRadius = 37.5
        stopBtn.layer.cornerRadius = 37.5
        resetBtn.layer.cornerRadius = 37.5
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func startButtonTapped(_ sender: UIButton) {
        print("Start button tapped")
        stopwatch.start()
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.updateElapsedTimeLabel(_:)), userInfo: nil, repeats: true)
    }
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        print("Stop button tapped")
        stopwatch.stop()
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        print("Reset button tapped")
        elapsedTimeLabel.text = "00:00.00"
        stopwatch.reset()
    }
    @objc func updateElapsedTimeLabel(_ timer: Timer) {
        if stopwatch.isRunning {
            elapsedTimeLabel.text = stopwatch.elapsedTimeAsString
        } else {
            timer.invalidate()
        }
    }
    
}
