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
                         } operations;
typedef enum : NSInteger {
                            sqrt1=1005,
                            squaredX2=1006,
                            squaredX3=1007,
                            sinus=1008,
                            cosinus=1009,
                            tangens=1010,
                            divonX=1011,
                            } binaryOperations;


@interface ViewController : UIViewController
{
    Brains *brain;
}

@property (nonatomic, strong) IBOutlet UILabel *label;
@property (strong, nonatomic) IBOutlet UILabel *labelForSign;


- (IBAction)tappedClear:(UIButton *)sender;
- (IBAction)numberPressed:(UIButton *)sender;
- (IBAction)decimalPressed:(UIButton *)sender;
- (IBAction)operationPressed:(UIButton *)sender;
- (IBAction)changeSignPressed:(UIButton *)sender;
- (IBAction)tappedDellLastNumber:(UIButton *)sender;







@end

