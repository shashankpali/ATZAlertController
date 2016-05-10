//
//  ViewController.m
//  ATZAlertController
//
//  Created by shashank on 09/05/16.
//  Copyright © 2016 shashank. All rights reserved.
//

#import "ViewController.h"
#import "ATZAlertController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
}

- (IBAction)testBtn:(id)sender {
  
  UIButton *button = (UIButton *)sender;
  ATZAlertController *alert= nil;
  switch (button.tag) {
    case 0:
      alert = [ATZAlertController alertWithTitle:@"Simple Alert" message:@"show my alert" cancelButtonTitle:@"ok" showAlertInstantly:NO];
      
      [alert show];
      
      break;
    case 1:
      [ATZAlertController alertWithTitle:@"My Alert"
                                 message:@"Array containing object string"
                       cancelButtonTitle:@"Cancel"
                  destructiveButtonTitle:@"Remove"
                       otherButtonTitles:@[@"Ok",@"Right"]
                          preferredStyle:UIAlertControllerStyleAlert
                      showAlertInstantly:YES
                                   block:^(UIAlertAction * _Nonnull action, NSString * _Nonnull titleString) {
                                     
                                     if ([titleString isEqualToString:@"Cancel"]) {
                                       
                                       NSLog(@"Cancel");
                                     }
                                     if ([titleString isEqualToString:@"Remove"]) {
                                       
                                       NSLog(@"Remove");
                                     }
                                     if ([titleString isEqualToString:@"Ok"]) {
                                       
                                       NSLog(@"Ok");
                                     }
                                     if ([titleString isEqualToString:@"Right"]) {
                                       
                                       NSLog(@"Right");
                                     }
                                     
                                   }];
      
      break;
    case 2: {
      ATZActionButton *button1 = [ATZActionButton actionWithTitle:@"Ok" preferredStyle:UIAlertActionStyleDefault];
      ATZActionButton *button2 = [ATZActionButton actionWithTitle:@"Remove" preferredStyle:UIAlertActionStyleDestructive];
      
      alert = [ATZAlertController alertWithTitle:@"My Alert"
                                         message:@"Array containing object string" cancelButtonTitle:@"Cancel"
                               otherActionButton:@[button1,button2]
                                  preferredStyle:UIAlertControllerStyleAlert
                              showAlertInstantly:NO
                                           block:^(UIAlertAction * _Nonnull action, NSString * _Nonnull titleString) {
                                             
                                             if ([titleString isEqualToString:@"Cancel"]) {
                                               
                                               NSLog(@"Cancel");
                                             }
                                             if ([titleString isEqualToString:@"Remove"]) {
                                               
                                               NSLog(@"Remove");
                                             }
                                             if ([titleString isEqualToString:@"Ok"]) {
                                               
                                               NSLog(@"Ok");
                                             }
                                           }];
      
      [alert showWithAnimation:NO];
      
      break;
    }
      
    default:
      break;
  }
  
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
