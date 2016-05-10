// ATZAlertController.h
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

#import <UIKit/UIKit.h>

typedef void(^actionHandler)(UIAlertAction * _Nonnull action , NSString * _Nonnull titleString);

@class ATZActionButton;

@interface ATZAlertController : UIAlertController

/**
*  Show alert with string array
*
*  @param title       Alert title.
*  @param message     Alert message.
*  @param cancel      Cancel title (Tapping leads to dismiss controller ONLY).
*  @param destructive Destructive title (Tapping leads to CALLBACK in block).
*  @param titleArray  Create other button with respect to array (Tapping leads to CALLBACK
                      in block respectively).
*  @param style       style description(Declare whether its Alert or ActionSheet).
*  @param showAlert   Derive to show alert immediately or leave it to user to call SHOW
                      function.
*  @param handler     handler description(Return the respective action and title of tapped
                      button).
*
*  @return return ATZAlertController object
*/
+ (nonnull instancetype)alertWithTitle:(NSString * _Nonnull)title
                               message:(NSString * _Nonnull)message
                     cancelButtonTitle:(NSString * _Nonnull)cancel
                destructiveButtonTitle:(NSString * _Nonnull)destructive
                     otherButtonTitles:(NSArray <NSString *>* _Nonnull)titleArray
                        preferredStyle:(UIAlertControllerStyle)style
                    showAlertInstantly:(BOOL)showAlert
                                 block:(nullable actionHandler)handler;
/**
 *  Show alert with ATZActionButton array
 *
 *  @param title       Alert title.
 *  @param message     Alert message.
 *  @param cancel      Cancel title (Tapping leads to dismiss controller ONLY).
 *  @param destructive Destructive title (Tapping leads to CALLBACK in block).
 *  @param titleArray  Create other button with respect to array (Tapping leads to CALLBACK
                       in block respectively).
 *  @param style       style description(Declare whether its Alert or ActionSheet).
 *  @param showAlert   Derive to show alert IMMEDIATELY or leave it to user to call SHOW
                       function.
 *  @param handler     handler description(Return the respective action and title of tapped
                       button).
 *
 *  @return return ATZAlertController object.
 */
+ (nonnull instancetype)alertWithTitle:(NSString * _Nonnull)title
                               message:(NSString * _Nonnull)message
                     cancelButtonTitle:(NSString * _Nonnull)cancel
                     otherActionButton:(NSArray <ATZActionButton *>* _Nonnull)buttonArray
                        preferredStyle:(UIAlertControllerStyle)style
                    showAlertInstantly:(BOOL)showAlert
                                 block:(nullable actionHandler)handler;
/**
 *  Show simple alert
 *
 *  @param title     Alert title.
 *  @param message   Alert message.
 *  @param cancel    Cancel title (Tapping leads to dismiss controller ONLY).
 *  @param showAlert Derive to show alert immediately or leave it to user to call SHOW
                     function.
 *
 *  @return return ATZAlertController object.
 */
+ (nonnull instancetype)alertWithTitle:(NSString * _Nonnull)title
                               message:(NSString * _Nonnull)message
                     cancelButtonTitle:(NSString * _Nonnull)cancel
                    showAlertInstantly:(BOOL)showAlert;
/**
 *  Call show alert
 */
- (void)show;
/**
 *  Call show alert with animation option
 *
 *  @param animated Derive whether to animate or not.
 */
- (void)showWithAnimation:(BOOL)animated;

@end


@interface ATZActionButton : NSObject
/**
 *  Create ATZActionButton (Recommended for [Show alert with ATZActionButton array]  
                           function).
 *
 *  @param title Button title
 *  @param style Button style(Derive whether its default,cancel or destructive).
 *
 *  @return return ATZActionButton object.
 */
+ (ATZActionButton * _Nonnull)actionWithTitle:(NSString * _Nonnull)title preferredStyle:(UIAlertActionStyle)style;

@property (copy,nonatomic)  NSString * _Nonnull title;
@property (assign,nonatomic) UIAlertActionStyle style;

@end

