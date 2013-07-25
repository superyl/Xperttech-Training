#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject
{
    double operand;
    NSString *waitingOperation;
    NSString *previousOperation;
    double waitingOperand;
 BOOL isThisNumberNegative;
}
-(NSString *)getOperation;
-(void)setOperand:(double)anOperand;
-(double)performOperation:(NSString *)operation;
-(void)performWatingOperation;
-(void)setOperation:(NSString *)operation;

@end
