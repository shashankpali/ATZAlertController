// ATZAlertController.swift
//
// Copyright (c) 2016 Shashank Pali
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

import UIKit
import Foundation

public typealias actionHandler = (action: UIAlertAction, titleString: String) -> Void

//MARK:- ATZAlertController Class
public class ATZAlertController: UIAlertController
{
  override public func viewDidDisappear(animated: Bool)
  {
    alertWindow.hidden = true
    alertWindow = nil
  }
  /**
   Call show alert
   */
  public func show()
  {
    showAlertAnimation(true)
  }
  /**
   Call show alert with animation option
   
   - parameter animated: Derive whether to animate or not.
   */
  public func showWithAnimation(animated: Bool)
  {
    showAlertAnimation(animated)
  }
  /**
   Show alert with string array
   
   - parameter title:                  Alert title.
   - parameter message:                Alert message.
   - parameter cancelButtonTitle:      Cancel title (Tapping leads to dismiss controller ONLY).
   - parameter destructiveButtonTitle: Destructive title (Tapping leads to CALLBACK in block).
   - parameter otherButtonTitles:      Create other button with respect to array (Tapping leads to CALLBACK
   in block respectively).
   - parameter preferredStyle:         Style description(Declare whether its Alert or ActionSheet).
   - parameter showAlertInstantly:     Derive to show alert immediately or leave it to user to call SHOW
   - parameter handler:                Handler description(Return the respective action and title of tapped button).
   
   
   - returns: return ATZAlertController object
   */
  public class func alertWithTitle(title: String,
                                   message: String,
                                   cancelButtonTitle: String,
                                   destructiveButtonTitle: String?,
                                   otherButtonTitles: [String]?,
                                   preferredStyle: UIAlertControllerStyle,
                                   showAlertInstantly: Bool,
                                   handler: actionHandler?) -> ATZAlertController
  {
    let alert = ATZAlertController.alertController(title,
                                                   message: message,
                                                   cancel: cancelButtonTitle,
                                                   destructive: destructiveButtonTitle,
                                                   titleArray: otherButtonTitles,
                                                   style: preferredStyle) {
                                                    
                                                    handler?(action: $0, titleString: $1)
                                                    
    }
    if (showAlertInstantly)
    {
      alert.show()
    }
    return alert
  }
  /**
   Show alert with ATZActionButton array
   
   - parameter title:              Alert title.
   - parameter message:            Alert message.
   - parameter cancelButtonTitle:  Cancel title (Tapping leads to dismiss controller ONLY).
   - parameter otherActionButton:  Create other button with respect to array (Tapping leads to CALLBACK
   in block respectively).
   - parameter preferredStyle:     Style description(Declare whether its Alert or ActionSheet).
   - parameter showAlertInstantly: Derive to show alert immediately or leave it to user to call SHOW
   - parameter handler:            Handler description(Return the respective action and title of tapped button).
   
   - returns: return ATZAlertController object
   */
  public class func alertWithTitle(title: String,
                                   message: String,
                                   cancelButtonTitle: String,
                                   otherActionButton: [ATZActionButton],
                                   preferredStyle: UIAlertControllerStyle,
                                   showAlertInstantly: Bool,
                                   handler: actionHandler?) -> ATZAlertController
  {
    let alert = ATZAlertController.alertController(title,
                                                   message: message,
                                                   cancel: cancelButtonTitle,
                                                   destructive: nil,
                                                   titleArray: otherActionButton,
                                                   style: preferredStyle) {
                                                    
                                                    handler?(action: $0, titleString: $1)
                                                    
    }
    if (showAlertInstantly)
    {
      alert.show()
    }
    return alert
  }
  /**
   Show simple alert
   
   - parameter title:              Alert title.
   - parameter message:            Alert message.
   - parameter cancelButtonTitle:  Cancel title (Tapping leads to dismiss controller ONLY).
   - parameter showAlertInstantly: Derive to show alert immediately or leave it to user to call SHOW
   - parameter handler:            Handler description(Return the respective action and title of tapped button).
   
   - returns: return ATZAlertController object
   */
  public class func alertWithTitle(title: String,
                                   message: String,
                                   cancelButtonTitle: String,
                                   showAlertInstantly: Bool,
                                   handler: actionHandler?) -> ATZAlertController
  {
    let alert = ATZAlertController.alertController(title,
                                                   message: message,
                                                   cancel: cancelButtonTitle,
                                                   destructive: nil,
                                                   titleArray: nil,
                                                   style: .Alert) {
                                                    
                                                    handler?(action: $0, titleString: $1)
                                                    
    }
    if (showAlertInstantly)
    {
      alert.show()
    }
    return alert
  }
  /**
   Show Login Alert
   
   - parameter title:                    Alert title.
   - parameter message:                  Alert message.
   - parameter userNamePlaceholderTitle: Shows placeholder text.
   - parameter passwordPlaceholderTitle: Shows placeholder text.
   - parameter showAlertInstantly:       Derive to show alert immediately or leave it to user to call SHOW
   - parameter handler:                  Handler description(Return the respective action and title of tapped button).
   
   - returns: return ATZAlertController object
   */
  public class func loginAlertWithTitle(title: String,
                                        message: String,
                                        userNamePlaceholderTitle: String,
                                        passwordPlaceholderTitle: String,
                                        showAlertInstantly: Bool,
                                        handler: actionHandler?) -> ATZAlertController
  {
    let alert = ATZAlertController.alertController(title,
                                                   message: message,
                                                   cancel: nil,
                                                   destructive: nil,
                                                   titleArray: ["Login","Cancel"],
                                                   style: .Alert) {
                                                    handler?(action: $0, titleString: $1)
    }
    alert.addTextFieldWithConfigurationHandler {
      $0.placeholder = userNamePlaceholderTitle
    }
    alert.addTextFieldWithConfigurationHandler {
      $0.placeholder = passwordPlaceholderTitle
      $0.secureTextEntry = true
    }
    if (showAlertInstantly)
    {
      alert.show()
    }
    return alert
  }
  
  
}

//MARK:- ATZActionButton Class
public class ATZActionButton: NSObject
{
  var title: String!
  var style: UIAlertActionStyle!
  /**
   Create ATZActionButton (Recommended for [Show alert with ATZActionButton array]
   function).
   - parameter title: Button title
   - parameter style: Button style(Derive whether its default,cancel or destructive).
   - returns: return ATZActionButton object.
   */
  public class func actionWithTitleAndPrefferedStyle(title: String, style: UIAlertActionStyle) -> ATZActionButton
  {
    let actionButton = ATZActionButton()
    actionButton.title = title
    actionButton.style = style
    
    return actionButton
  }
}
