# ATZAlertController

`ATZAlertController` helps you to create an alert from any class without any dependency on `ViewController`. The name itself derives that it provides A to Z solution towards the `UIAlertController` with various types of functions you can use them accordingly. `ATZAlertController` is easy to use and implement.  

# Pod Installation 

CocoaPods is the preferred way to install this library. Add this command to your `Podfile`:

 ##### For Objective C 
 ***
```
pod 'ATZAlertController'
```
##### For Swift
***
```
pod 'ATZAlertController/Swift'
```
# Direct Installation

Download .zip file and extract it. There you will find the `ATZAlertController` folder, copy all the files from the folder to your respective project.

# Integration Method
##### Objective C
***
```objc
#import "ATZAlertController.h"

[ATZAlertController alertWithTitle:@"My Alert"
                           message:@"Array containing object string"
                 cancelButtonTitle:@"Cancel"
            destructiveButtonTitle:@"Remove"
                 otherButtonTitles:@[@"Ok",@"Right"]
                    preferredStyle:UIAlertControllerStyleAlert
                showAlertInstantly:YES
                             block:^(UIAlertAction * _Nonnull action, NSString * _Nonnull titleString) {
                                //your code
                              }];
```

```objc
#import "ATZAlertController.h"

ATZActionButton *button1 = [ATZActionButton actionWithTitle:@"Ok" preferredStyle:UIAlertActionStyleDefault];
ATZActionButton *button2 = [ATZActionButton actionWithTitle:@"Remove" preferredStyle:UIAlertActionStyleDestructive];

alert = [ATZAlertController alertWithTitle:@"My Alert"
                                   message:@"Array containing object string"
                         cancelButtonTitle:@"Cancel"
                         otherActionButton:@[button1,button2]
                            preferredStyle:UIAlertControllerStyleAlert
                        showAlertInstantly:NO
                                     block:^(UIAlertAction * _Nonnull action, NSString * _Nonnull titleString) {
                                        //your code
                                      }];

[alert showWithAnimation:NO];
```
##### For Swift
***
```Swift
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
```

```Swift
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
```

```Swift
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
```
### Thanks
- Reference from [ASJAlertController](https://github.com/sudeepjaiswal/ASJAlertController).

# License

`ATZAlertController` is available under the MIT license. See the LICENSE file for more info.
