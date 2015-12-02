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

@end

@implementation Brains


-(NSString*)addingElementsToStorage:(NSString*)valueString
{
    NSString* finalResult;
    if(!self.storage)
    self.storage=[[NSMutableArray alloc]init];
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
}


-(NSString*)equalsPressed:(NSInteger)countOfEqualsToBeEntered :(NSString*)valueString  :(NSString*)signOfOperation  :(NSString*) dataEntered
{
    NSString* finalResult;
  
    if(self.storage.count==0)
        [self.storage addObject:valueString];
    if(self.storage.count==1&&countOfEqualsToBeEntered>0)
    {
        self.storage[1]=signOfOperation;
        self.storage[2]=valueString;
        finalResult=[self caseStorageIsFull:self.storage];
    }
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
        finalResult=[self caseStorageIsFull:self.storage];
    }
    return finalResult;

}


-(NSString*)caseChangeSign:(NSInteger)countOfEqualsToBeEntered :(NSString*)valueString
{
    CGFloat numberOne;
    if([self stringIsNumeric: valueString]&&self.storage.count==2)
         [self.storage addObject:valueString];
    if(self.storage.count<3)
        numberOne=[self.storage[0] floatValue];
    else
        numberOne=[valueString floatValue];
    numberOne*=-1;
    valueString=[NSString stringWithFormat:@"%g", numberOne];

    if(self.storage.count<3)
        self.storage[0]=valueString;
    if(self.storage.count==3)
        self.storage[3]=valueString;
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
    else if([storage[1] isEqual:@"/"])
        self.result=numberOne/numberTwo;
    return self.result;
}

-(NSString*)caseStorageIsFull: (NSMutableArray*) storage
{
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


@end
