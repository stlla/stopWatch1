//
//  ViewController.swift
//  stopwatch
//
//  Created by D7703_17 on 2019. 4. 4..
//  Copyright © 2019년 D7703_17. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
      @IBOutlet weak var timeLabel: UILabel!
      @IBOutlet weak var startButton: UIBarButtonItem!
      @IBOutlet weak var pauseButton: UIBarButtonItem!
      @IBOutlet weak var resetButton: UIBarButtonItem!
      
      
      var time = 0
      // Timer 객체 생성
      var myTimer = Timer()
      
      
      override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
            timeLabel.text = String(time)
      }
      
      override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
      }

      @IBAction func btnStart(_ sender: Any) {
      
      myTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector:
      #selector(updateTime), userInfo: nil, repeats: true)
      
            changButtonstate(start: false, pause: true, stop: true)
      }
      @IBAction func btnpause(_ sender: Any) {
            myTimer.invalidate()
            changButtonstate(start: true, pause: false, stop: true)
      }
      
      @IBAction func btnStop(_ sender: Any) {
            myTimer.invalidate()
            time = 0
            timeLabel.text = String(time)
            changButtonstate(start: true, pause: false, stop: false)
      }

      @objc func updateTime(){
      time += 1
      timeLabel.text = String(time)
}

      func changButtonstate(start : Bool, pause : Bool, stop : Bool){
      resetButton.isEnabled = stop
      startButton.isEnabled = start
      pauseButton.isEnabled = pause
      }
}


