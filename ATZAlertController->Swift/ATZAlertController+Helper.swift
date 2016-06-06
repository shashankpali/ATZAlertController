// ATZAlertController+Helper.swift
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
import ObjectiveC

var ATZWindow: UInt8 = 0

extension ATZAlertController
{
  var alertWindow: UIWindow!
    {
    get {
      return objc_getAssociatedObject(self, &ATZWindow) as? UIWindow
    }
    set(newValue) {
      objc_setAssociatedObject(self, &ATZWindow, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
  }
  
  class func alertController(title: String, message: String, cancel: String?, destructive: String?, titleArray: NSArray?, style: UIAlertControllerStyle, handler: ((action: UIAlertAction, titleString: String) -> Void)?) -> ATZAlertController
  {
    let alert = ATZAlertController(title: title, message: message, preferredStyle: style)
    
    if ((titleArray?.count) != nil)
    {
      for obj in titleArray!
      {
        let selfAction: UIAlertAction!
        if obj is String
        {
          selfAction = UIAlertAction(title: obj as? String, style: .Default, handler: { (act) in
            if ((handler) != nil)
            {
              handler!(action: act, titleString: act.title!)
            }
          })
        }else
        {
          let ATZButton = obj as! ATZActionButton
          selfAction = UIAlertAction(title: ATZButton.title, style: ATZButton.style, handler: { (act) in
            if ((handler) != nil)
            {
              handler!(action: act, titleString: act.title!)
            }
          })
        }
        alert.addAction(selfAction)
      }
    }
    
    if let _ = cancel
    {
      let selfAction = UIAlertAction(title: cancel, style: .Cancel, handler: { (act) in
        if ((handler) != nil)
        {
          handler!(action: act, titleString: act.title!)
        }
      })
      alert.addAction(selfAction)
    }
    
    if let _ = destructive
    {
      let selfAction = UIAlertAction(title: destructive, style: .Destructive, handler: { (act) in
        if ((handler) != nil)
        {
          handler!(action: act, titleString: act.title!)
        }
      })
      alert.addAction(selfAction)
    }
    
    
    return alert
  }
  
  func showAlertAnimation(animated: Bool)
  {
    alertWindow = UIWindow(frame: UIScreen.mainScreen().bounds)
    alertWindow.rootViewController = UIViewController()
    alertWindow.tintColor = UIApplication.sharedApplication().delegate!.window??.tintColor
    let topWindow = UIApplication.sharedApplication().windows.last
    alertWindow.windowLevel = (topWindow?.windowLevel)! + 1
    
    alertWindow.makeKeyAndVisible()
    alertWindow.rootViewController?.presentViewController(self, animated: animated, completion: nil)
  }
  
}

