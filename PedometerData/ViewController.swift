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
    var dayData: [Int] = []

    
    
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
                        self.dayData.append(totalSteps)
                    } else if (i == 2){
                        self.dayData.append(totalSteps - self.dayData[0])
                    } else if (i == 3) {
                        self.dayData.append(totalSteps - self.dayData[0] - self.dayData[1])
                    } else if (i == 4) {
                        self.dayData.append(totalSteps - self.dayData[0] - self.dayData[1] - self.dayData[2])
                    } else if (i == 5) {
                        self.dayData.append(totalSteps - self.dayData[0] - self.dayData[1] - self.dayData[2] - self.dayData[3])
                    } else if (i == 6 ) {
                        self.dayData.append(totalSteps - self.dayData[0] - self.dayData[1] - self.dayData[2] - self.dayData[3] - self.dayData[4])
                    } else if (i == 7) {
                        self.dayData.append(totalSteps - self.dayData[0] - self.dayData[1] - self.dayData[2] - self.dayData[3] - self.dayData[4] - self.dayData[5])

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
        
        var xValue = 10;
        
        for i in 0...6{
            
            
            let bar1 = UIView(frame: CGRectMake(CGFloat(xValue), (graphView.frame.height) - 40 , 35, -CGFloat(dayData[i])/25 ))
            bar1.backgroundColor = UIColor.blackColor()
            if (dayData[i] != 0){
                let bar1Label = UILabel(frame: CGRectMake(CGFloat(xValue)+2.5, (graphView.frame.height)-50, 35, 50))
                bar1Label.textColor = UIColor.blackColor()
                bar1Label.font = bar1Label.font.fontWithSize(12.5)
                bar1Label.text = String(dayData[i])
                graphView.addSubview(bar1Label)
            }
            xValue += 51
            self.graphView.addSubview(bar1)
            
        }
    }
    
    
    

    
    
    
    
}
    
    


