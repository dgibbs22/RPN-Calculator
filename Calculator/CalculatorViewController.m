//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Don Gibbs on 6/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"

@interface CalculatorViewController ()
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@property (nonatomic, strong) CalculatorBrain *brain;

@end

@implementation CalculatorViewController
@synthesize display;
@synthesize userIsInTheMiddleOfEnteringANumber;

@synthesize brain = _brain;

- (CalculatorBrain *)brain;
{
    if (!_brain) _brain =[[CalculatorBrain alloc] init];
    return _brain;
}

- (IBAction)digitPressed:(UIButton *)sender
{
    NSString *digit = [sender currentTitle];
    if (self.userIsInTheMiddleOfEnteringANumber) {
        
    self.display.text = [self.display.text stringByAppendingString:digit];
        
    } else {
        self.display.text = digit;
        self.userIsInTheMiddleOfEnteringANumber = YES;
    }
    
}

- (IBAction)enterPressed
{
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.userIsInTheMiddleOfEnteringANumber = NO;
}

- (IBAction)operationPressed:(UIButton *)sender
{
    if (self.userIsInTheMiddleOfEnteringANumber) [self enterPressed];
    //NSString *operation = [sender currentTitle];
    double result = [self.brain performOperation:sender.currentTitle];
    self.display.text = [NSString stringWithFormat:@"%g", result];
}
- (IBAction)clearMemory:(UIButton *)sender {
    double result = 0;
    self.display.text = [NSString stringWithFormat:@"%g", result];
}
- (IBAction)removeCharacter:(UIButton *)sender {
    if ( [self.display.text length] > 0)
        self.display.text = [self.display.text substringToIndex:[self.display.text length] - 1];
    
    else {
        self.display.text = [NSString stringWithFormat:@"%g", 0];
    }
}

@end
