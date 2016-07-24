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
        
        let barArray = [day1,day2,day3,day4,day5,day6,day7];
        var xValue = 10;
        
        for i in 0...6{
            
            
            let bar1 = UIView(frame: CGRectMake(CGFloat(xValue), (graphView.frame.height) - 40 , 35, -CGFloat(barArray[i])/25 ))
            bar1.backgroundColor = UIColor.blackColor()
            if (barArray[i] != 0){
                let bar1Label = UILabel(frame: CGRectMake(CGFloat(xValue)+2.5, (graphView.frame.height)-50, 35, 50))
                bar1Label.textColor = UIColor.blackColor()
                bar1Label.font = bar1Label.font.fontWithSize(12.5)
                bar1Label.text = String(barArray[i])
                graphView.addSubview(bar1Label)
            }
            xValue += 51
            self.graphView.addSubview(bar1)
            
        }
    }
    
    
    

    
    
    
    
}
    
    


