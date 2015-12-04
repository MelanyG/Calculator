//
//  Brains.h
//  Final
//
//  Created by Melany Gulianovych on 11/30/15.
//  Copyright (c) 2015 Melany Gulianovych. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface Brains : NSObject

@property(strong, nonatomic)NSMutableArray *storage;

-(NSString*)addingElementsToStorage:(NSString*)valueString;
-(NSString*)caseChangeSign:(NSInteger)countOfEqualsToBeEntered
                          :(NSString*)valueString;

-(void) clearTheStorage;
-(NSString*)equalsPressed:(NSInteger)countOfEqualsToBeEntered
                         :(NSString*)valueString
                         :(NSString*)signOfOperation
                         :(NSString*) dataEntered;


+ (Brains*)createSinglton;


@end
