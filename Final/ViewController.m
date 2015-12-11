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
@property(nonatomic) BOOL unaryOperationpressed;
@property(nonatomic) NSInteger countOfUnaryOperationsToBeEntered;
@property(nonatomic) BOOL numbersAreEntered;

@property (nonatomic, strong) NSSet *unaryOperations;

@end

@implementation ViewController
#pragma mark - singleton method




- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.valueString=@"";
    brain = [Brains createSinglton];
    [brain creationOfStorage];
    
   self.unaryOperations= [[NSSet alloc]initWithObjects: @"1005",@"1006",@"1007",@"1008",@"1009",@"1010",@"1011",@"1012",
                        @"1013",@"1014",@"1015",@"1016",@"1017",@"1018",@"1020", @"1025",
                        @"1021",@"1026",@"1027", nil];
    
}


-(IBAction)tappedClear:(id)sender
{
    [brain clearTheStorage];
    self.valueString=@"";
    self.label.text = @"0";
    self.labelForSign.text = @"";
    self.tappeddecimal=NO;
    self.countOfUnaryOperationsToBeEntered=0;
}

- (IBAction)numberPressed:(UIButton *)sender
{
    self.countOfEqualsToBeEntered=NO;
    self.tappedEquals=NO;
    self.tappedOperation=NO;
    self.unaryOperationpressed=NO;
    self.numbersAreEntered=YES;
    self.countOfUnaryOperationsToBeEntered=0;
    
    
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
        if(![self.label.text isEqualToString: @"0"]&& [self.valueString isEqualToString:@""])
            self.valueString = [self.valueString stringByAppendingString:@"0."];
        else if([self.label.text isEqualToString: @"0"]&&[self.valueString isEqualToString:@""])
            self.valueString = [self.valueString stringByAppendingString:@"0."];
        else if(![self.valueString isEqual:@""])
            self.valueString = [self.valueString stringByAppendingString:@"."];
    }
    
    
        self.label.text = self.valueString;
    
    self.tappeddecimal=YES;
}


- (IBAction)operationPressed:(UIButton *)sender
{
    self.numbersAreEntered=NO;

    if(self.tappedOperation==NO)
    {

        self.tappeddecimal=NO;
            if((self.tappedEquals==NO) && (self.unaryOperationpressed==NO))
            {
                UnaryOperationType unary = sender.tag;
                NSString* tmp=[NSString stringWithFormat:@"%d", unary];
               if([self.unaryOperations containsObject:tmp])
               {
                   self.unaryOperationpressed=YES;
                   self.countOfUnaryOperationsToBeEntered++;
               }
               
                self.valueString=[brain addingElementsToStorage: self.label.text
                                                               : self.tappedOperation
                                                               : self.unaryOperationpressed];
                self.label.text=self.valueString;
            
                }
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
                        self.valueString=@"x²";
                        self.unaryOperationpressed=YES;
                        break;
                    case sqrt1:
                        self.valueString=@"²√";
                        self.unaryOperationpressed=YES;
                        break;
                    case squaredX3:
                        self.valueString=@"x³";
                        self.unaryOperationpressed=YES;
                        break;
                    case sinus:
                        self.valueString=@"sin";
                        self.unaryOperationpressed=YES;
                        break;
                    case cosinus:
                        self.valueString=@"cos";
                        self.unaryOperationpressed=YES;
                        break;
                    case tangens:
                        self.valueString=@"tan";
                        self.unaryOperationpressed=YES;
                        break;
                    case divonX:
                        self.valueString=@"1/x";
                        self.unaryOperationpressed=YES;
                        break;
                    case cubicsgrt:
                        self.valueString=@"³√";
                        self.unaryOperationpressed=YES;
                        break;
                    case logar:
                        self.valueString=@"ln";
                        self.unaryOperationpressed=YES;
                        break;
                    case logar2:
                        self.valueString=@"log₂";
                        self.unaryOperationpressed=YES;
                        break;
                    case sinusDegree:
                        self.valueString=@"sinDeg";
                        self.unaryOperationpressed=YES;
                        break;
                    case cosinusDegree:
                        self.valueString=@"cosDeg";
                        self.unaryOperationpressed=YES;
                        break;
                    case tangenDegree:
                        self.valueString=@"tanDeg";
                        self.unaryOperationpressed=YES;
                        break;
                    case logar10:
                        self.valueString=@"log10";
                        self.unaryOperationpressed=YES;
                        break;
                    case cotng:
                        self.valueString=@"cotng";
                        self.unaryOperationpressed=YES;
                        break;
                    case factorial:
                        self.valueString=@"x!";
                        self.unaryOperationpressed=YES;
                        break;
                    case percent:
                        self.valueString=@"%";
                        self.unaryOperationpressed=YES;
                        break;
                    case exponencial:
                        self.valueString=@"exp";
                        self.unaryOperationpressed=YES;
                        break;
                    case exponencial2:
                        self.valueString=@"exp2";
                        self.unaryOperationpressed=YES;
                        break;
                    default:
                        break;
                        
                }
        if(self.unaryOperationpressed)
        {
            self.label.text=[brain caseUnaryOperationIsPressed: self.valueString];
            self.unaryOperationpressed=NO;
            self.tappedOperation=NO;
        }
        if(self.tappedOperation && !self.unaryOperationpressed)
        {
            [brain addingElementsToStorage: self.valueString
                                          : self.tappedOperation
                                          : self.unaryOperationpressed];
        }
 
            self.valueString=@"";
    }
      




- (IBAction)changeSignPressed:(UIButton *)sender
{
   
    self.valueString=[brain caseChangeSign: self.countOfEqualsToBeEntered
                                          : self.valueString
                                          : self.numbersAreEntered];
    self.numbersAreEntered=NO;
    self.label.text=self.valueString;
    self.valueString=@"";
}

- (IBAction)tappedDellLastNumber:(UIButton *)sender
{
    self.valueString = [brain caseDellPressed: self.label.text
                                             : self.tappedOperation
                                             : self.tappedEquals];
   
    self.label.text=self.valueString;
    self.valueString=@"";
}

- (IBAction)constantButtonPressed:(UIButton *)sender
{
    self.numbersAreEntered=NO;
    switch(sender.tag)
    {
        case Pi:
            self.valueString=@"π";
            break;
        case expon:
            self.valueString=@"e";
            break;
        default:
            break;
    }
     self.label.text=[brain caseConstantIsSelected:self.valueString];
    self.valueString=self.label.text;
   
}

- (IBAction)equalPressed:(UIButton *)sender
{
    self.numbersAreEntered=NO;
    self.tappedEquals=YES;
    self.countOfEqualsToBeEntered++;
    self.countOfUnaryOperationsToBeEntered=0;
    
    NSString* result=[brain equalsPressed:self.countOfEqualsToBeEntered
                                         :self.valueString
                                         :self.labelForSign.text
                                         :self.label.text];
    self.label.text=result;
    self.labelForSign.text=@"";
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
