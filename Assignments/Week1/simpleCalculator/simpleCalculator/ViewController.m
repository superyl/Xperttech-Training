//
//  ViewController.m
//  simpleCalculator
//
//  Created by Lei Lei on 7/23/13.
//  Copyright (c) 2013 Xperttech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(CalculatorBrain *) brain
{
    if(!brain)
    {
        brain = [[CalculatorBrain alloc] init];
       
            }
    return brain;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)digiPressed:(UIButton *)sender {
    NSString *digit = [[sender titleLabel]text];
    
    NSRange range = [[display text]rangeOfString:@"."];
    
    if(userIsInTheMiddleOfTypingANumber)
    {
        if([[display text]isEqual:@"-0"]&&![digit isEqual:@"."])
        {
            [display setText:[@"-" stringByAppendingString:digit]];
        }
        
        
        else if([digit isEqual:@"+/-"])
        {
            if([[display text] doubleValue]>=0)
            {
                NSString *temp=@"-";
                [display setText:[temp stringByAppendingString:[display text] ]];
            }
            else
            {
                NSString *currentNumberInString2 = [NSString stringWithFormat:@"%g", [[display text] doubleValue]];
                currentNumberInString2 = [currentNumberInString2 substringFromIndex:1];
                [display setText:currentNumberInString2];
            }
        }
        else if (range.location!=NSNotFound && [digit isEqual:@"."])
        {
            
        }
        else{
            [display setText:[[display text] stringByAppendingString:digit]];}
         
    }
         else{
             if([digit isEqual:@"+/-"])
             {
                 if([[display text] doubleValue]>=0)
                 {
                     NSString *temp=@"-";
                     [display setText:[temp stringByAppendingString:[display text] ]];
                 }
                 else
                 {
                     NSString *currentNumberInString2 = [NSString stringWithFormat:@"%g", [[display text] doubleValue]];
                     currentNumberInString2 = [currentNumberInString2 substringFromIndex:1];
                     [display setText:currentNumberInString2];
                 }
                 userIsInTheMiddleOfTypingANumber=YES;
             }
             else{
                 if([digit isEqual:@"0"])
                 {
                     }
                 else{
             [display setText:digit];
                     userIsInTheMiddleOfTypingANumber=YES;}
             }
         }
    
    }


- (IBAction)operationPressed:(UIButton *)sender{
    NSString *operation = [[sender titleLabel] text];
     
    if (userIsInTheMiddleOfTypingANumber)
    {
        
            [[self brain]setOperand:[[display text] doubleValue]];
            
        userIsInTheMiddleOfTypingANumber = NO;
        
        }
double result = [[self brain] performOperation:operation];
[display setText:[NSString stringWithFormat:@"%g", result]];


        
        
    
    
}



@end
