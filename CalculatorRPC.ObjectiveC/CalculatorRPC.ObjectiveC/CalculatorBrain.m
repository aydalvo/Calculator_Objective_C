//
//  CalculatorBrain.m
//  CalculatorRPC.ObjectiveC
//
//  Created by Aydalvo Nery on 01/06/15.
//  Copyright (c) 2015 Aydalvo Nery. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain()
@property (nonatomic, strong) NSMutableArray *operandsStack;
@end

@implementation CalculatorBrain

@synthesize operandsStack = _operandsStack;

- (NSMutableArray *) operandsStack {
    
    // lazy initialization
    if (_operandsStack == nil) _operandsStack = [[NSMutableArray alloc] init];
    return _operandsStack;
}
- (void) setOperandsStack:(NSMutableArray *)operandsStack {
    _operandsStack = operandsStack;
}

- (void)pushOperand:(double)operand{
    
    NSNumber *operandObject = [NSNumber numberWithDouble:operand];
    [self.operandsStack addObject:operandObject];
    // [self.operandsStack addObject:[NSNumber numberWithDouble:operand]];
    
}

- (double) popOperand {
    NSNumber *operandObject = [self.operandsStack lastObject];
    if (operandObject) [self.operandsStack removeLastObject];
    return [operandObject doubleValue];
}

- (double)performOperand:(NSString *)operation{
    
    double result = 0;
    
    if ([operation isEqualToString:@"+"]) {
        result = [self popOperand] + [self popOperand];
    } else if([@"*" isEqualToString:operation]) {
        result = [self popOperand] * [self popOperand];
    }
    
    [self pushOperand:result];
    
    // calculate result
    return result;
}
@end
