//
//  ViewController.swift
//  ATZAlertController->Swift
//
//  Created by ABS_MAC02 on 06/06/16.
//  Copyright © 2016 abhi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
  }
  
  @IBAction func testBtn(sender: AnyObject)
  {
    let button = sender as! UIButton
    var alert: ATZAlertController!
    
    switch button.tag {
      
    case 0:
      alert = ATZAlertController.alertWithTitle("Simple Alert",
                                                message: "show my alert",
                                                cancelButtonTitle: "Ok",
                                                showAlertInstantly: false,
                                                handler: {
                                                  print("\($1) -> \($0.title)")
      })
      alert.show()
      break
      
    case 1:
      ATZAlertController.alertWithTitle("My Alert",
                                        message: "Array containing object as 'String'",
                                        cancelButtonTitle: "Cancel",
                                        destructiveButtonTitle: "Remove",
                                        otherButtonTitles: ["Ok","Right"],
                                        preferredStyle: .Alert,
                                        showAlertInstantly: true,
                                        handler: { (action, titleString) in
                                          
                                          if(titleString == "Cancel")
                                          {
                                            print("\(action.title)")
                                          }
                                          if(titleString == "Remove")
                                          {
                                            print("\(action.title)")
                                          }
                                          if(titleString == "Ok")
                                          {
                                            print("\(action.title)")
                                          }
                                          if(titleString == "Right")
                                          {
                                            print("\(action.title)")
                                          }
      })
      break
      
    case 2:
      let button1 = ATZActionButton.actionWithTitleAndPrefferedStyle("Ok", style: .Default)
      let button2 = ATZActionButton.actionWithTitleAndPrefferedStyle("Remove", style: .Destructive)
      
      alert = ATZAlertController.alertWithTitle("My Alert",
                                                message: "Array containing object ATZActionButton",
                                                cancelButtonTitle: "Cancel",
                                                otherActionButton: [button1, button2],
                                                preferredStyle: .Alert,
                                                showAlertInstantly: false,
                                                handler: { (action, titleString) in
                                                  
                                                  if(titleString == "Cancel")
                                                  {
                                                    print("\(action.title)")
                                                  }
                                                  if(titleString == "Remove")
                                                  {
                                                    print("\(action.title)")
                                                  }
                                                  if(titleString == "Ok")
                                                  {
                                                    print("\(action.title)")
                                                  }
      })
      alert.showWithAnimation(false)
      break
      
    case 3:
      ATZAlertController.loginAlertWithTitle("Login Alert",
                                             message: "All fields are mandatory",
                                             userNamePlaceholderTitle: "Username",
                                             passwordPlaceholderTitle: "Password",
                                             showAlertInstantly: true,
                                             handler: { (action, titleString) in
                                              
                                              if(titleString == "Login")
                                              {
                                                print("\(alert.textFields![0].text) \n \(alert.textFields![1].text)")
                                              }
                                              if(titleString == "Cancel")
                                              {
                                                print("\(action.title)")
                                              }
      })
      
      break
      
    default:
      break
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}

