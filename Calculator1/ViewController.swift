//
//  ViewController.swift
//  Calculator1
//
//  Created by Will Chen on 24/09/19.
//  Copyright © 2019 Will Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numnberOnScreen:Double = 0;
    var previousNumber:Double = 0;
    var performingMath = false
    var operation = 0;
    

    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton)
    {
        if performingMath == true
        {
            label.text = String(sender.tag-1)
            numnberOnScreen = Double(label.text!)!
            performingMath = false
        }
        else
        {
            label.text = label.text! + String(sender.tag-1)
            numnberOnScreen = Double(label.text!)!
        }

    }
    
    
    @IBAction func buttons(_ sender: UIButton) {
        
        if label.text != "" && sender.tag != 11 && sender.tag != 16
        {
            previousNumber = Double(label.text!)!
            
            
            if sender.tag == 12 //Divide
            {
                label.text = "/";
            }
            else if sender.tag == 13 //Multiply
            {
                label.text = "*";
            }
            else if sender.tag == 14 //Minus
            {
                label.text = "-";
            }
            else if sender.tag == 15 //Plus
            {
                label.text = "+";
            }
            
            operation = sender.tag
            performingMath = true;
        }
        else if sender.tag == 16
        {
            if operation == 12
            {
                if numnberOnScreen == 0 {
                    label.text = "ERROR"
                }
                else
                {
                label.text = String(previousNumber / numnberOnScreen)
                }
            }
            else if operation == 13
            {
                label.text = String(previousNumber * numnberOnScreen)
            }
            else if operation == 14
            {
                label.text = String(previousNumber - numnberOnScreen)
            }
            else if operation == 15
            {
                label.text = String(previousNumber + numnberOnScreen)
            }
        }
        else if sender.tag == 11
        {
            label.text = ""
            previousNumber = 0;
            numnberOnScreen = 0;
            operation = 0;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

