//
//  ViewController.m
//  CalculatorRPC.ObjectiveC
//
//  Created by Aydalvo Nery on 01/06/15.
//  Copyright (c) 2015 Aydalvo Nery. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorBrain.h"

@interface ViewController ()

//private property
@property (nonatomic) BOOL userIsInTheMidleTypingANumber;
@property (nonatomic, strong) CalculatorBrain* brain;
@end

@implementation ViewController

// this command is responsible to create the getter and setter for the property.
@synthesize display = _display;

@synthesize brain = _brain;

- (CalculatorBrain *) brain {
    
    if (!_brain) _brain = [[CalculatorBrain alloc] init];
    return _brain ;
}

@synthesize userIsInTheMidleTypingANumber= _userIsInTheMidleTypingANumber;

- (IBAction)digitPressed:(UIButton *)sender {
    
    NSString *digit = sender.currentTitle; // [sender currentTitle];
    if (self.userIsInTheMidleTypingANumber) {
        self.display.text = [self.display.text stringByAppendingString:digit];
    } else {
        self.display.text = digit;
        self.userIsInTheMidleTypingANumber = YES;
    }
    
    /* 
     * UILabel *myDisplay = self.display; //similar to [self display];
     * NSString *currentText = myDisplay.text; //Both way is acceptable [myDisplay text];
     * NSString *newText = [currentText stringByAppendingString:digit];
     *
     * call setter to the property myDisplay
     * It is also possible: myDisplay.text = newText; [myDisplay setText:newText]
     *
     * self.display.text = newText;
     *
     */
    
    // similiar to printf
    NSLog(@" digit pressed = %@", digit);
}

- (IBAction)operationPressed:(UIButton *)sender {
    
    if (self.userIsInTheMidleTypingANumber) [self enterPressed];
    double result = [self.brain performOperand:sender.currentTitle];
    NSString *resultString = [NSString stringWithFormat:@"%g", result];
    self.display.text = resultString;
}

- (IBAction)enterPressed {
    
    [self.brain pushOperand: [self.display.text doubleValue] ];
    self.userIsInTheMidleTypingANumber = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
