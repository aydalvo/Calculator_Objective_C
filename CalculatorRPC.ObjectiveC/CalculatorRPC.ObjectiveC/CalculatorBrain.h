//
//  CalculatorBrain.h
//  CalculatorRPC.ObjectiveC
//
//  Created by Aydalvo Nery on 01/06/15.
//  Copyright (c) 2015 Aydalvo Nery. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

- (void)pushOperand:(double)operand;
- (double)performOperand:(NSString *)operation;
@end
