//
//  ViewController.m
//  Final
//
//  Created by Melany Gulianovych on 11/28/15.
//  Copyright (c) 2015 Melany Gulianovych. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@property NSString *valueString;
@property(nonatomic) BOOL tappedEquals;
@property(nonatomic) BOOL tappeddecimal;
@property(nonatomic) BOOL tappedOperation;
@property(strong, nonatomic)NSMutableArray *storage;
@property(nonatomic) NSInteger countOfEqualsToBeEntered;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.valueString=@"";
    brain = [[Brains alloc]init];
    
}


-(IBAction)tappedClear:(id)sender
{
    [brain clearTheStorage];
    self.valueString=@"";
    self.label.text = @"0";
    self.labelForSign.text = @"";
}

- (IBAction)numberPressed:(UIButton *)sender
{
    self.countOfEqualsToBeEntered=NO;
    self.tappedEquals=NO;
    self.tappedOperation=NO;
    
    NSString *number=[NSString stringWithFormat:@"%li",(long)sender.tag];
    self.valueString = [self.valueString stringByAppendingString:number];
    
        if([self.label.text isEqualToString: @"0"])
           self.label.text = [NSString stringWithFormat:@"%li",(long)sender.tag];
        else
           self.label.text=self.valueString ;

}

- (IBAction)decimalPressed:(UIButton *)sender
{
    if(!self.tappeddecimal)
    {
        self.valueString = [self.valueString stringByAppendingString:@"."];
        self.label.text = self.valueString;
     
    }
    self.tappeddecimal=YES;
}


- (IBAction)operationPressed:(UIButton *)sender
{
    if(self.tappedOperation==NO)
    {

    self.tappeddecimal=NO;
        if(self.tappedEquals==NO)
        {
            self.valueString=[brain addingElementsToStorage: self.valueString];
            self.label.text=self.valueString;
        }
      
    self.valueString=@"";
        
     self.tappedOperation=YES;
          switch(sender.tag)
                {
                    case plus:
                        self.labelForSign.text =@"+";
                        self.valueString=@"+";
                        break;
                    case minus:
                        self.labelForSign.text =@"-";
                        self.valueString=@"-";
                        break;
                    case multyplication:
                        self.labelForSign.text =@"*";
                        self.valueString=@"*";
                        break;
                    case division:
                        self.labelForSign.text =@"÷";
                        self.valueString=@"÷";
                        break;
                    case squaredX2:
                        self.labelForSign.text =@"x^2";
                        self.valueString=@"x^2";
                        break;
                    case sqrt1:
                        self.labelForSign.text =@"√";
                        self.valueString=@"√";
                        break;
                     default:
                        break;
                        
            }
        if(self.tappedOperation)
        {
            [brain addingElementsToStorage: self.valueString];
        }
 
            self.valueString=@"";
    }
      
}



- (IBAction)changeSignPressed:(UIButton *)sender
{
    self.valueString=[brain caseChangeSign: self.countOfEqualsToBeEntered
                                          : self.valueString];
    self.label.text=self.valueString;
   }

- (IBAction)equalPressed:(UIButton *)sender
{
    self.tappedEquals=YES;
    NSString* result=[brain equalsPressed:self.countOfEqualsToBeEntered
                                         :self.valueString
                                         :self.labelForSign.text
                                         :self.label.text];
        self.label.text=result;
    self.labelForSign.text=@"";
    self.countOfEqualsToBeEntered++;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
