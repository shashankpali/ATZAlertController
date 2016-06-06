// ATZAlertController+Helper.m
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
#import <objc/runtime.h>

@implementation ATZAlertController (Helper)

@dynamic alertWindow;

+ (ATZAlertController *)title:(NSString *)title
                      message:(NSString *)message
            cancelButtonTitle:(NSString *)cancel
       destructiveButtonTitle:(NSString *)destructive
            otherButtonTitles:(NSArray *)titleArray
               preferredStyle:(UIAlertControllerStyle)style
                        block:(actionHandler)handler
{
  ATZAlertController *alert = [ATZAlertController alertControllerWithTitle:title message:message preferredStyle:style];
  
  for (id obj in titleArray)
  {
    UIAlertAction *action = nil;
    
    if ([obj isKindOfClass:[NSString class]])
    {
      action = [UIAlertAction actionWithTitle:obj style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
                {
                  if (handler) {
                    handler(action , action.title);
                  }
                }];
    }
    else
    {
      ATZActionButton *ATZButton = (ATZActionButton *)obj;
      
      action = [UIAlertAction actionWithTitle:ATZButton.title style:ATZButton.style handler:^(UIAlertAction * _Nonnull action)
                {
                  if (handler) {
                    handler(action , action.title);
                  }
                }];
    }
    
    [alert addAction:action];
  }
  
  if (cancel)
  {
    UIAlertAction *action = [UIAlertAction actionWithTitle:cancel style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action)
                             {
                               if (handler) {
                                 handler(action , action.title);
                               }
                             }];
    [alert addAction:action];
  }
  
  if (destructive)
  {
    UIAlertAction *action = [UIAlertAction actionWithTitle:destructive style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action)
                             {
                               if (handler) {
                                 handler(action , action.title);
                               }
                             }];
    [alert addAction:action];
  }
  
  return alert;
}

#pragma mark - Setter And Getter (Window)

- (void)setAlertWindow:(UIWindow *)alertWindow {
  objc_setAssociatedObject(self, @selector(alertWindow), alertWindow, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIWindow *)alertWindow {
  return objc_getAssociatedObject(self, @selector(alertWindow));
}

#pragma mark - ShowAlert

- (void)showAlertAnimation:(BOOL)animated
{
  self.alertWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  
}

@end
