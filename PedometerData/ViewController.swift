//
//  ViewController.swift
//  PedometerData
//
//  Created by Matt Milner on 7/17/16.
//  Copyright © 2016 Matt Milner. All rights reserved.
//

//
//In this app you are going to use the Pedometer API to find the number of steps user has taken in one week.
//
//IMG_2096.PNG (50 KB)
//
//Hint
//
//If you need to forcibly call drawRect then call the function setNeedsDisplay.
//Use CMPedometer class

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    
    @IBOutlet weak var graphView: UIView!

    var pedometer: CMPedometer!
    var totalSteps: Int!
    var day1: Int = 0
    var day2: Int = 0
    var day3: Int = 0
    var day4: Int = 0
    var day5: Int = 0
    var day6: Int = 0
    var day7: Int = 0

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.pedometer = CMPedometer()
        
        let calendar = NSCalendar.currentCalendar()
        
        for i in 1...7{
            let startDay = calendar.dateByAddingUnit(.Day, value: -i, toDate: NSDate(), options: [])
            self.pedometer.queryPedometerDataFromDate(startDay!, toDate: NSDate()) { (data: CMPedometerData?, error: NSError?) in
                
                if let data = data{
                    
                    let totalSteps: Int! = data.numberOfSteps.integerValue
                    
                    if (i == 1){
                        self.day1 = totalSteps;
                    } else if (i == 2){
                        self.day2 = totalSteps - self.day1
                    } else if (i == 3) {
                        self.day3 = totalSteps - self.day2 - self.day1
                    } else if (i == 4) {
                        self.day4 = totalSteps - self.day3 - self.day2 - self.day1
                    } else if (i == 5) {
                        self.day5 = totalSteps - self.day4 - self.day3 - self.day2 - self.day1
                    } else if (i == 6 ) {
                        self.day6 = totalSteps - self.day5 - self.day4 - self.day3 - self.day2 - self.day1
                    } else if (i == 7) {
                        self.day7 = totalSteps - self.day6 - self.day5 - self.day4 - self.day3 - self.day2 - self.day1
                    }
                }
            }
        }
        
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func generateFitnessGraph() {
        
        self.view.setNeedsDisplay()
        
        let bar1 = UIView(frame: CGRectMake(10, (graphView.frame.height) - 40 , 35, -CGFloat(self.day1)/25 ))
        bar1.backgroundColor = UIColor.blackColor()
        if (self.day1 != 0){
            let bar1Label = UILabel(frame: CGRectMake(12.5, (graphView.frame.height)-50, 35, 50))
            bar1Label.textColor = UIColor.blackColor()
            bar1Label.font = bar1Label.font.fontWithSize(12.5)
            bar1Label.text = String(self.day1)
            graphView.addSubview(bar1Label)
        }
        let bar2 = UIView(frame: CGRectMake(61, (graphView.frame.height) - 40 , 35, -CGFloat(self.day2)/25 ))
        bar2.backgroundColor = UIColor.blackColor()
        if (self.day2 != 0){
            let bar2Label = UILabel(frame: CGRectMake(63.5, (graphView.frame.height)-50, 35, 50))
            bar2Label.textColor = UIColor.blackColor()
            bar2Label.font = bar2Label.font.fontWithSize(12.5)
            bar2Label.text = String(self.day2)
            graphView.addSubview(bar2Label)
        }
        let bar3 = UIView(frame: CGRectMake(112, (graphView.frame.height) - 40 , 35, -CGFloat(self.day3)/25 ))
        bar3.backgroundColor = UIColor.blackColor()
        if (self.day3 != 0){
            let bar3Label = UILabel(frame: CGRectMake(114.5, (graphView.frame.height)-50, 35, 50))
            bar3Label.textColor = UIColor.blackColor()
            bar3Label.font = bar3Label.font.fontWithSize(12.5)
            bar3Label.text = String(self.day3)
            graphView.addSubview(bar3Label)
        }
        let bar4 = UIView(frame: CGRectMake(163, (graphView.frame.height) - 40 , 35, -CGFloat(self.day4)/25 ))
        bar4.backgroundColor = UIColor.blackColor()
        if (self.day4 != 0){
            let bar4Label = UILabel(frame: CGRectMake(165.5, (graphView.frame.height)-50, 35, 50))
            bar4Label.textColor = UIColor.blackColor()
            bar4Label.font = bar4Label.font.fontWithSize(12.5)
            bar4Label.text = String(self.day4)
            graphView.addSubview(bar4Label)
        }
        let bar5 = UIView(frame: CGRectMake(214, (graphView.frame.height) - 40 , 35, -CGFloat(self.day5)/25 ))
        bar5.backgroundColor = UIColor.blackColor()
        if (self.day5 != 0){
            let bar5Label = UILabel(frame: CGRectMake(216.5, (graphView.frame.height)-50, 35, 50))
            bar5Label.textColor = UIColor.blackColor()
            bar5Label.font = bar5Label.font.fontWithSize(12.5)
            bar5Label.text = String(self.day5)
            graphView.addSubview(bar5Label)
        }
        let bar6 = UIView(frame: CGRectMake(265, (graphView.frame.height) - 40 , 35, -CGFloat(self.day6)/25 ))
        bar6.backgroundColor = UIColor.blackColor()
        if (self.day6 != 0){
            let bar6Label = UILabel(frame: CGRectMake(267.5, (graphView.frame.height)-50, 35, 50))
            bar6Label.textColor = UIColor.blackColor()
            bar6Label.font = bar6Label.font.fontWithSize(12.5)
            bar6Label.text = String(self.day6)
            graphView.addSubview(bar6Label)
        }
        let bar7 = UIView(frame: CGRectMake(315, (graphView.frame.height) - 40 , 35, -CGFloat(self.day7)/25 ))
        bar7.backgroundColor = UIColor.blackColor()
        if (self.day7 != 0){
            let bar7Label = UILabel(frame: CGRectMake(317.5, (graphView.frame.height)-50, 35, 50))
            bar7Label.textColor = UIColor.blackColor()
            bar7Label.font = bar7Label.font.fontWithSize(12.5)
            bar7Label.text = String(self.day3)
            graphView.addSubview(bar7Label)
        }
        
        self.graphView.addSubview(bar1)
        self.graphView.addSubview(bar2)
        self.graphView.addSubview(bar3)
        self.graphView.addSubview(bar4)
        self.graphView.addSubview(bar5)
        self.graphView.addSubview(bar6)
        self.graphView.addSubview(bar7)
        
        
    }
    
    
    

    
    
    
    
}
    
    


