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
//@property(nonatomic) BOOL userIsInProcessOfEnteringNumber;
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
    //self.userIsInProcessOfEnteringNumber=YES;
    self.valueString=@"";
    self.storage=[[NSMutableArray alloc]init];
    
}

-(IBAction)tappedClear:(id)sender
{
    [self.storage removeAllObjects];
    self.valueString=@"";
    self.label.text = @"0";
    self.labelForSign.text = @"";
}

- (IBAction)numberPressed:(UIButton *)sender
{
    self.countOfEqualsToBeEntered=0;
    self.tappedEquals=NO;
    self.tappedOperation=NO;
    //self.userIsInProcessOfEnteringNumber=YES;
    NSString *number=[NSString stringWithFormat:@"%li",(long)sender.tag];
    self.valueString = [self.valueString stringByAppendingString:number];
    //if (self.userIsInProcessOfEnteringNumber)
    //{
        if([self.label.text isEqualToString: @"0"])
           self.label.text = [NSString stringWithFormat:@"%li",(long)sender.tag];
        else
           self.label.text=self.valueString ;
    //}
}

- (IBAction)decimalPressed:(UIButton *)sender
{
    NSString *decimal=@".";
    if(!self.tappeddecimal)
    {
        self.valueString = [self.valueString stringByAppendingString:decimal];
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
            [self.storage addObject:self.valueString];
    self.valueString=@"";
    if (self.storage.count==3)
            {
                [self caseStorageIsFull:self.storage];
                
            }
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
                        self.labelForSign.text =@"/";
                        self.valueString=@"/";
                        break;
                     default:
                        break;
                        
            }
        if(self.tappedOperation)
            [self.storage addObject:self.valueString];
        
            self.valueString=@"";
    }
      
}



- (IBAction)changeSignPressed:(UIButton *)sender
{
    CGFloat numberOne;
    if(self.countOfEqualsToBeEntered>0)
        numberOne=[self.storage[0] floatValue];
    else
        numberOne=[self.valueString floatValue];
    numberOne*=-1;
    self.valueString=[NSString stringWithFormat:@"%g", numberOne];
    self.label.text=self.valueString;
    if(self.storage.count==1)
        self.storage[0]=self.valueString;
    if(self.storage.count==3)
        self.storage[0]=self.valueString;
    
}

- (IBAction)equalPressed:(UIButton *)sender
{
    self.tappedEquals=YES;
    
    if(self.storage.count==0)
        [self.storage addObject:self.valueString];
    if(self.storage.count==1&&self.countOfEqualsToBeEntered>0)
    {
        self.storage[1]=self.labelForSign.text;
        self.storage[2]=self.valueString;
        [self caseStorageIsFull:self.storage];
    }
    if(self.storage.count==2)
        {
            if([self.valueString isEqual:@""])
                {
                    self.storage[2]=self.storage[0];
                    self.valueString=self.label.text;
                }
            else
                {
                    self.labelForSign.text=@"";
                    [self.storage addObject:self.valueString];
                }
            [self caseStorageIsFull:self.storage];
            //self.valueString=self.storage[0];
        }
    self.countOfEqualsToBeEntered++;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CGFloat) calculationsDone:(NSMutableArray*) storage
{
    CGFloat numberOne=[storage[0] floatValue];
    CGFloat numberTwo=[storage[2] floatValue];

    CGFloat result;
    if([storage[1] isEqual:@"+"])
        result=numberOne+numberTwo;
    else if([storage[1] isEqual:@"-"])
        result=numberOne-numberTwo;
    else if([storage[1] isEqual:@"*"])
        result=numberOne*numberTwo;
    else if([storage[1] isEqual:@"/"])
        result=numberOne/numberTwo;
    return result;
}

-(void)caseStorageIsFull: (NSMutableArray*) storage
{
    CGFloat result;
    result = [self calculationsDone: self.storage];
    
    NSString * finalResult=@"";
    
    [self.storage removeAllObjects];
    finalResult=[NSString stringWithFormat:@"%g", result];
    self.label.text=finalResult;
    //self.userIsInProcessOfEnteringNumber=YES;
    [self.storage addObject:finalResult];
}

@end
