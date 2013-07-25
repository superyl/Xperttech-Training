#import "CalculatorBrain.h"

@implementation CalculatorBrain

-(void)setOperand:(double)anOperand
{
    operand = anOperand;
    
}
-(void)setOperation:(NSString *)operation
{
    waitingOperation = operation;
}

-(NSString *)getOperation
{
    return waitingOperation;
}

-(void)performWatingOperation
{
    if ([@"+" isEqual: waitingOperation])
    {
        operand = waitingOperand + operand;
       
    }
    else if ([@"-" isEqual:waitingOperation])
    {
        operand = waitingOperand-operand;
       
    }
    else if([@"*" isEqual:waitingOperation])
    {
        operand = waitingOperand * operand;
        
    }else if([@"/" isEqual:waitingOperation])
    {
        if(operand){
            operand = waitingOperand/operand;
            }
    }
    
    
}
-(double)performOperation:(NSString *)operation
{
    if ([operation isEqual:@"sqrt"] )
    {
        operand = sqrt(operand);
    }
   
    
    else if([operation isEqual:@"C"])
    {
        operand = 0;
        waitingOperand = 0;
        isThisNumberNegative = NO;
        waitingOperation = NULL;
    }
    else if([operation isEqual:@"="])
    {
       if(waitingOperation!=NULL)
       {
        [self performWatingOperation];
           waitingOperation=NULL;
           waitingOperand=operand;
           
       }
    }
    else
    {
        [self performWatingOperation];
        waitingOperation = operation;
        waitingOperand = operand;
    }
    return operand;
    
}
@end