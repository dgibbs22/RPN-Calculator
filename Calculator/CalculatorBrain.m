//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Don Gibbs on 6/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain()
@property (nonatomic, strong) NSMutableArray *operandStack;
@end

@implementation CalculatorBrain

@synthesize operandStack = _operandStack;

-(NSMutableArray *)operandStack;
{
    if (!_operandStack) {
        _operandStack = [[NSMutableArray alloc] init];
    }
    return _operandStack;
}

//- (void)setOperandStack:(NSMutableArray *)anArray;
//{
//    _operandStack = anArray;
//}

- (void)pushOperand:(double)operand
{
    NSNumber *operandObject = [NSNumber numberWithDouble:operand];
    [self.operandStack addObject:operandObject];
}

- (double)popOperand
{
    NSNumber *operandObject = [self.operandStack lastObject];
    if (operandObject) [self.operandStack removeLastObject];
    {
    return [operandObject doubleValue];
    }
}

//- (void) clearMemory:(NSMutableArray *)operandStack
//{
//    [self.operandStack removeAllObjects];
//}
-(double)performOperation:(NSString *)operation
{
    double result = 0;
    if ([operation isEqualToString:@"+"]) {
        result = [self popOperand] + [self popOperand];
    } else if ([operation isEqualToString:@"*"]) {
        result = [self popOperand] * [self popOperand];
    } else if ([operation isEqualToString:@"-"]) {
        double subtrahend = [self popOperand];
        result = [self popOperand] - subtrahend;
    } else if ([operation isEqualToString:@"/"]) {
        double divisor = [self popOperand];
        if (divisor) result = [self popOperand] / divisor;
    } else if ([operation isEqualToString:@"π"]) {
        result = [self popOperand] / 3.1415;
    } else if ([operation isEqualToString:@"^"]) {
        result = pow([self popOperand], [self popOperand]);
    } else if ([operation isEqualToString:@"sin"]) {
        result = sin([self popOperand]);
    } else if ([operation isEqualToString:@"cos"]) {
        result = cos([self popOperand]);
    }else if ([operation isEqualToString:@"sqrt"]) {
        result = sqrt([self popOperand]);
    }else if ([operation isEqualToString:@"log"]) {
        result = log([self popOperand]);
    }else if ([operation isEqualToString:@"←"]) {
        result = [self popOperand];
    }else if ([operation isEqualToString:@"C"]) {
        [self.operandStack removeAllObjects];
        result = 0;
    }
    [self pushOperand:result];
    return result;
}
@end
