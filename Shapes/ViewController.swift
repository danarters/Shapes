//
//  ViewController.swift
//  Shapes
//
//  Created by Dan on 1/28/16.
//  Copyright © 2016 Dan. All rights reserved.
//
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tap: UITapGestureRecognizer!
    
    private var direction: Bool = true //true represents forwards, false represents backwards
    
    private var previousColor: String? = "Blue"
    
    private var previousColorUI: UIColor = UIColor.blueColor()
    
    private var nextColor: String? = "Blue"
    
    private var nextColorUI: UIColor = UIColor.blueColor()
    
    private let Red: UIColor = UIColor(red: 251/255, green: 0, blue: 7/255, alpha: 1)
    
    private let Green: UIColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
    
    private let Yellow: UIColor = UIColor(red: 1, green: 1, blue: 11/255, alpha: 1)
    
    private let Teal: UIColor = UIColor(red: 33/255, green: 1, blue: 1, alpha: 1)
    
    private let Blue: UIColor = UIColor(red: 0, green: 0, blue: 255, alpha: 1)
    
    private let Purple: UIColor = UIColor(red: 0, green: 0, blue: 109/255, alpha: 1)
    
    private let Forrest: UIColor = UIColor(red: 17/255, green: 112/255, blue: 2/255, alpha: 1)
    
    @IBAction func tapped(sender: UITapGestureRecognizer) {
        let point = tap.locationInView(UIView?(self.view))
        let xInt = Int(point.x)
        let yInt = Int(point.y)
        createImage(xInt, yValue: yInt)
    }
    
    @IBOutlet weak var reverseButtonVar: UIButton!
    
    @IBAction func reverseButton(sender: UIButton) {
        if (self.direction)
        {
            direction = false
        }
        else
        {
            direction = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.previousColor = randomColor()
        self.previousColorUI = generateColor(previousColor)
        self.nextColor = randomColor()
        self.nextColorUI = generateColor(nextColor)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func createImage(xValue : Int, yValue : Int)
    {
        if (self.direction)
        {
            let image = randomShape(nextColor!)
            let tempColor: UIColor = generateColor(nextColor!)
            self.previousColor = self.nextColor
            self.previousColorUI = self.nextColorUI
            self.nextColor = self.randomColor()
            self.nextColorUI = self.generateColor(self.nextColor)
            let imageView = UIImageView(image: image!)
            imageView.frame = CGRect(x: xValue-5, y: yValue-5, width: 10, height: 10)
            view.addSubview(imageView)
            UIView.animateWithDuration(4.0, animations: {             imageView.frame = CGRectMake(imageView.center.x-1000, imageView.center.y-1000, imageView.frame.width*200, imageView.frame.height*200)
                }, completion: { finished in
                    self.view.backgroundColor = tempColor
                    self.reverseButtonVar.bringSubviewToFront(self.view)
                    imageView.removeFromSuperview()
            })
        }
        else
        {
            let image = randomShape(nextColor!)
            let imageView = UIImageView(image: image!)
            self.previousColor = self.nextColor
            self.previousColorUI = self.nextColorUI
            self.nextColor = self.randomColor()
            self.nextColorUI = self.generateColor(self.nextColor)
            imageView.frame = CGRect(x: xValue-200, y: yValue-200, width: 400, height: 400)
            view.addSubview(imageView)
            self.view.backgroundColor = UIColor.blackColor()
            UIView.animateWithDuration(2.0, animations: {             imageView.frame = CGRectMake(imageView.center.x-5, imageView.center.y-5, imageView.frame.width/40, imageView.frame.height/40)
                self.reverseButtonVar.bringSubviewToFront(self.view)
                }, completion: { finished in
                    imageView.removeFromSuperview()
            })

        }
        
    }
    
    func generateColor(color : String?) -> UIColor
    {
        if (color=="Red")
        {
            return self.Red
        }
        else if (color=="Yellow")
        {
            return self.Yellow
        }
        else if (color=="Green")
        {
            return self.Green
        }
        else if (color=="Forrest")
        {
            return self.Forrest
        }
        else if (color=="Blue")
        {
            return self.Blue
        }
        else if (color=="Teal")
        {
            return self.Teal
        }
        return self.Purple
    }
    
    func randomColor() -> String?
    {
        let randomTemp = arc4random_uniform(7)
        var colorName = ""
        if (randomTemp==0)
        {
            colorName += "Red"
        }
        else if (randomTemp==1)
        {
            colorName += "Yellow"
        }
        else if (randomTemp==2)
        {
            colorName += "Green"
        }
        else if (randomTemp==3)
        {
            colorName += "Forrest"
        }
        else if (randomTemp==4)
        {
            colorName += "Teal"
        }
        else if (randomTemp==5)
        {
            colorName += "Blue"
        }
        else
        {
            colorName += "Purple"
        }
        return colorName
    }
    
    func randomShape(shapeColor : String) -> UIImage?
    {
        var shapeName = ""
        
        let randomTemp = arc4random_uniform(5)
        if (randomTemp==0)
        {
            shapeName = "Circle"
        }
        else if (randomTemp==1)
        {
            shapeName = "Square"
        }
        else if (randomTemp==2)
        {
            shapeName = "Triangle"
        }
        else if (randomTemp==3)
        {
            shapeName = "Star"
        }
        else
        {
            shapeName = "Pentagon"
        }
        
        shapeName += shapeColor
        
        return UIImage(named: shapeName)
    }


}



