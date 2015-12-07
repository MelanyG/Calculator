//
//  Brains.m
//  Final
//
//  Created by Melany Gulianovych on 11/30/15.
//  Copyright (c) 2015 Melany Gulianovych. All rights reserved.
//

#import "Brains.h"

@interface Brains()

@property (nonatomic, assign) CGFloat result;
@property (nonatomic, strong) NSString* buferForData;
@property (nonatomic, strong) NSString* buferForSign;

@end

@implementation Brains

+ (Brains*)createSinglton
{
    static dispatch_once_t predicate = 0;
    __strong static id sharedObject = nil;
    //static id sharedObject = nil;  //if you're not using ARC
    dispatch_once(&predicate, ^{
        sharedObject = [[self alloc] init];
        //sharedObject = [[[self alloc] init] retain]; // if you're not using ARC
    });
    return sharedObject;
}

-(NSString*)addingElementsToStorage:(NSString*)valueString
                                   : (BOOL) tappedOperation;
{
    NSString* finalResult;
    if(!self.storage)
    self.storage=[[NSMutableArray alloc]init];
    
    if(tappedOperation)
        self.storage[1]=valueString;
    else
        [self.storage addObject: valueString];
    
    if (self.storage.count==3)
    {
        finalResult=[self caseStorageIsFull:self.storage];
        return finalResult;
     }
    return valueString;
}


-(void) clearTheStorage
{
    [self.storage removeAllObjects];
    self.buferForData=@"";
    self.buferForSign=@"";
}


-(NSString*)equalsPressed:(NSInteger)countOfEqualsToBeEntered
                         :(NSString*)valueString
                         :(NSString*)signOfOperation
                         :(NSString*) dataEntered
{
    NSString* finalResult;
    if(!self.storage)
        self.storage=[[NSMutableArray alloc]init];

    if(self.storage.count==0)
    {
        [self.storage addObject:valueString];
        finalResult=self.storage[0];
    }
    else if(self.storage.count==1&&countOfEqualsToBeEntered>0 && (self.buferForSign))
    {
        self.storage[1]=self.buferForSign;
        self.storage[2]=self.buferForData;
        finalResult=[self caseStorageIsFull:self.storage];
    }
    else if(self.storage.count==1&&countOfEqualsToBeEntered>0 && (!self.buferForSign))
        finalResult=self.storage[0];
    
    if(self.storage.count==2)
    {
        if([valueString isEqual:@""])
        {
            self.storage[2]=self.storage[0];
            valueString=dataEntered;
        }
        
        else
        {
            finalResult=@"";
            [self.storage addObject:valueString];
            
        }
        
        self.buferForData=self.storage[2];
        self.buferForSign=signOfOperation;

        finalResult=[self caseStorageIsFull:self.storage];
    }
    
    if(self.storage.count==3)
    {
        finalResult=[self caseStorageIsFull:self.storage];
    }
    
    return finalResult;

}


-(NSString*)caseChangeSign:(NSInteger)countOfEqualsToBeEntered
                          :(NSString*)valueString
{
    CGFloat numberOne;
    //if(!self.storage)
       // self.storage=[[NSMutableArray alloc]init];

    //if([self stringIsNumeric: valueString]&&self.storage.count==2)
    //{
    //    [self.storage addObject:valueString];
    //    numberOne=[valueString floatValue];
    //}
    //else if(self.storage.count==1)
    ///    numberOne=[self.storage[0] floatValue];
    //else
    //    numberOne=[valueString floatValue];
   
    //numberOne*=-1;
    //valueString=[NSString stringWithFormat:@"%g", numberOne];
//if(self.storage.count==0)
    //    [self.storage addObject:valueString];
    if(self.storage.count>0 && self.storage.count<3 && countOfEqualsToBeEntered>0)
    valueString = self.storage[0];
    
    //if(self.storage.count==3)
     //   self.storage[2]=valueString;
    
    
    
    
   // if([self stringIsNumeric: valueString]&&self.storage.count==2)
   //             [self.storage addObject:valueString];
   //if(self.storage.count<3)
   //{
   //    [self.storage addObject:valueString];
   //    numberOne=[self.storage[0] floatValue];
   //}
   //else
    numberOne=[valueString floatValue];
    numberOne*=-1;
    valueString=[NSString stringWithFormat:@"%g", numberOne];
   
     //if(self.storage.count<3)
    // //        self.storage[0]=valueString;
    //if(self.storage.count==3)
    //      self.storage[3]=valueString;
    if(self.storage.count>0 && self.storage.count<3 && countOfEqualsToBeEntered>0)
        self.storage[0]=valueString;
    
    return valueString;
}


-(CGFloat) calculationsDone:(NSMutableArray*) storage
{
    CGFloat numberOne=[storage[0] floatValue];
    CGFloat numberTwo=[storage[2] floatValue];
    
    if([storage[1] isEqual:@"+"])
        self.result=numberOne+numberTwo;
    else if([storage[1] isEqual:@"-"])
        self.result=numberOne-numberTwo;
    else if([storage[1] isEqual:@"*"])
        self.result=numberOne*numberTwo;
    else if([storage[1] isEqual:@"÷"])
        self.result=numberOne/numberTwo;
    
    return self.result;
}

-(NSString*)caseStorageIsFull: (NSMutableArray*) storage
                             //: (BOOL) UnaryOperationPressed
{
    //if(UnaryOperationPressed)
    //self.result=[self caseUnaryOperationIsPressed: self.storage];
    //else
    self.result = [self calculationsDone: self.storage];
    
    NSString * finalResult=@"";
    
    [self.storage removeAllObjects];
    finalResult=[NSString stringWithFormat:@"%g", self.result];
    
    [self.storage addObject:finalResult];
    return finalResult;
}

-(BOOL) stringIsNumeric:(NSString *) str
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    NSNumber *number = [formatter numberFromString:str];
    return number; // If the string is not numeric, number will be nil
}

-(NSString*)caseDellPressed: (NSString*)valueString
                           : (BOOL) tappedOperation
{
    if (!tappedOperation)
    {
        NSString * new = [valueString substringToIndex:[valueString length] - 1];
        if ([new length] > 0)
        {
            valueString = new;
        }
        else
        {
            valueString = @"0";
        }
        
    }

    return valueString;
}
-(NSString*) caseUnaryOperationIsPressed: (NSString*)valueString
{
    CGFloat numberOne=[self.storage[0] floatValue];
    [self.storage addObject:valueString];
    
    
     if([self.storage[1] isEqual:@"²√"])
        self.result=sqrt(numberOne);
     else if([self.storage[1] isEqual:@"x²"])
         self.result=pow(numberOne,2);
     else if([self.storage[1] isEqual:@"x³"])
         self.result=pow(numberOne,3);
     else if([self.storage[1] isEqual:@"cos"])
         self.result = cos(numberOne*3.14159265/180);
     else if([self.storage[1] isEqual:@"sin"])
         self.result = sin(numberOne*3.14159265/180);
     else if([self.storage[1] isEqual:@"tan"])
         self.result = tan(numberOne*3.14159265/180);
     else if([self.storage[1] isEqual:@"1/x"])
         self.result = 1/numberOne;
     else if([self.storage[1] isEqual:@"³√"])
         self.result = cbrt(numberOne);
     else if([self.storage[1] isEqual:@"ln"])
         self.result = log(numberOne);
     else if([self.storage[1] isEqual:@"log₂"])
         self.result = log2(numberOne);
     else if([self.storage[1] isEqual:@"cosDeg"])
         self.result = acos(numberOne)* 180 / 3.14159265;
       else if([self.storage[1] isEqual:@"sinDeg"])
         self.result = asin(numberOne)* 180 / 3.14159265;
     else if([self.storage[1] isEqual:@"tanDeg"])
         self.result = atan (numberOne) * 180 / 3.14159265;
     else if([self.storage[1] isEqual:@"log10"])
         self.result = log10(numberOne) ;
     else if([self.storage[1] isEqual:@"ctg"])
         self.result = 1/tan(numberOne);
     else if([self.storage[1] isEqual:@"π"])
         self.result = 3.14159265;
     else if([self.storage[1] isEqual:@"x!"])
         self.result = tgamma(numberOne);
     else if([self.storage[1] isEqual:@"e"])
         self.result = 2.71828182;

    NSString * finalResult=@"";
    
    [self.storage removeAllObjects];
    finalResult=[NSString stringWithFormat:@"%g", self.result];
    
    [self.storage addObject:finalResult];
    return finalResult;
}
@end
