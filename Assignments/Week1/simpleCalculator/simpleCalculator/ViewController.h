//
//  ViewController.h
//  simpleCalculator
//
//  Created by Lei Lei on 7/23/13.
//  Copyright (c) 2013 Xperttech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculatorBrain.h"

@interface ViewController : UIViewController
{
    CalculatorBrain * brain;
    IBOutlet UILabel * display;
    BOOL userIsInTheMiddleOfTypingANumber;
    BOOL isThisNumberAFloat;
    BOOL isThisNumberNegative;
    
    
    
    
}


-(IBAction)digiPressed:(UIButton *) sender;
-(IBAction)operationPressed:(UIButton *) sender;

@end
