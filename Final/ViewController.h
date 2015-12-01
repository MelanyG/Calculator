//
//  ViewController.h
//  Final
//
//  Created by Melany Gulianovych on 11/28/15.
//  Copyright (c) 2015 Melany Gulianovych. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Brains.h"


typedef enum : NSInteger {
                            changeSign=1000,
                            plus=1001,
                            minus,
                            multyplication,
                            division,
                            equal,
                            } operations;

@interface ViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *label;
@property (strong, nonatomic) IBOutlet UILabel *labelForSign;


- (IBAction)tappedClear:(UIButton *)sender;
- (IBAction)numberPressed:(UIButton *)sender;
- (IBAction)decimalPressed:(UIButton *)sender;
- (IBAction)operationPressed:(UIButton *)sender;
- (IBAction)changeSignPressed:(UIButton *)sender;







@end

