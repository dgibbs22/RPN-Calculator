//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Don Gibbs on 6/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
//#include <math.h>
@interface CalculatorBrain : NSObject

- (void)pushOperand:(double)operand;
- (double)performOperation:(NSString *)operation;
//- (void) clearMemory:(NSMutableArray *)self;
@end
