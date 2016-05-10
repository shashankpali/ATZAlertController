// ATZAlertController.m
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

#import "ATZAlertController+Helper.h"

@implementation ATZAlertController

- (void)show
{
  [self showAlertAnimation:YES];
}

- (void)showWithAnimation:(BOOL)animated
{
  [self showAlertAnimation:animated];
}

#pragma mark - View Disapper

- (void)viewDidDisappear:(BOOL)animated
{
  [super viewDidDisappear:animated];
  
  // precaution to insure window gets destroyed
  self.alertWindow.hidden = YES;
  self.alertWindow = nil;
}

#pragma mark - instance Method

+ (nonnull instancetype)alertWithTitle:(NSString *)title
                               message:(NSString *)message
                     cancelButtonTitle:(NSString *)cancel
                destructiveButtonTitle:(NSString *)destructive
                     otherButtonTitles:(NSArray<NSString *> *)titleArray
                        preferredStyle:(UIAlertControllerStyle)style
                    showAlertInstantly:(BOOL)showAlert
                                 block:(actionHandler)handler
{
  for (id obj in titleArray) {
    
    NSAssert([obj isKindOfClass:[NSString class]], @"Required array containing \"String\" as object");
  }
  
  ATZAlertController *alert = [ATZAlertController title:title message:message cancelButtonTitle:cancel destructiveButtonTitle:destructive otherButtonTitles:titleArray preferredStyle:style block:^(UIAlertAction * _Nonnull action, NSString * _Nonnull titleString)
                               {
                                 if (handler) {
                                   handler(action , titleString);
                                 }
                               }];
  if (showAlert)
  {
    [alert show];
  }
  return alert;
}

+ (nonnull instancetype)alertWithTitle:(NSString * _Nonnull)title
                               message:(NSString * _Nonnull)message
                     cancelButtonTitle:(NSString * _Nonnull)cancel
                     otherActionButton:(NSArray<ATZActionButton *> * _Nonnull)buttonArray
                        preferredStyle:(UIAlertControllerStyle)style
                    showAlertInstantly:(BOOL)showAlert
                                 block:(nullable actionHandler)handler
{
  for (id obj in buttonArray) {
    
    NSAssert([obj isKindOfClass:[ATZActionButton class]], @"Required array containing \"ATZActionButton\" as object");
  }
  
  ATZAlertController *alert =[ATZAlertController title:title message:message cancelButtonTitle:cancel destructiveButtonTitle:nil otherButtonTitles:buttonArray preferredStyle:style block:^(UIAlertAction * _Nonnull action, NSString * _Nonnull titleString)
                              {
                                if (handler) {
                                  handler(action , titleString);
                                }
                              }];
  if (showAlert)
  {
    [alert show];
  }
  return alert;
}

+ (nonnull instancetype)alertWithTitle:(NSString * _Nonnull)title
                               message:(NSString * _Nonnull)message
                     cancelButtonTitle:(NSString * _Nonnull)cancel
                    showAlertInstantly:(BOOL)showAlert
{
  ATZAlertController *alert =[ATZAlertController title:title message:message cancelButtonTitle:cancel destructiveButtonTitle:nil otherButtonTitles:nil preferredStyle:UIAlertControllerStyleAlert block:nil];
  if (showAlert)
  {
    [alert show];
  }
  return alert;
}

@end

#pragma mark - ATZActionButton

@implementation ATZActionButton

+ (ATZActionButton * _Nonnull)actionWithTitle:(NSString * _Nonnull)title preferredStyle:(UIAlertActionStyle)style{
  
  ATZActionButton *alertButton = [[ATZActionButton alloc] init];
  alertButton.title = title;
  alertButton.style = style;
  
  return alertButton;
}

@end