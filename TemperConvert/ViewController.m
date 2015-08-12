//
//  ViewController.m
//  TemperConvert
//
//  Created by Ivan Tran on 8/8/15.
//  Copyright (c) 2015 Ivan Tran. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end



@implementation ViewController
@synthesize celsius;
@synthesize fahrenheit;
@synthesize subView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    celsius.text = @"";
    fahrenheit.text = @"";
    self.subView.layer.borderColor = [UIColor redColor].CGColor;
    self.subView.layer.borderWidth = 2.0f;
    self.celsius.delegate = self;
    self.fahrenheit.delegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *fullText = [textField.text stringByAppendingString:string];
    NSString *currentText = [textField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    if (textField.text.length >= 10 && range.length == 0) {
        return NO;
    }
    if ([fullText isEqualToString:@"."]){
        textField.text = @"0.";
        return NO;
    }
    if ([fullText rangeOfString:@".."].location != NSNotFound) {
        textField.text = [fullText stringByReplacingOccurrencesOfString:@".." withString:@"."];
        return NO;
    }
    
    NSArray *dots = [fullText componentsSeparatedByString:@"."];
    if (dots.count > 2){
        textField.text = currentText;
        return NO;
    }
    if(fullText.length == 2) {
        if([[fullText substringToIndex:1] isEqualToString:@"0"] && ![fullText isEqualToString:@"0."]) {
            textField.text = [fullText substringWithRange:NSMakeRange(1, 1)];
            return NO;
        }
    }
    else if (fullText.length >2){
        if ([fullText rangeOfString:@"-0"].location != NSNotFound){
            NSArray *arrayOfStr = [fullText componentsSeparatedByString:@"0"];
            textField.text = [arrayOfStr componentsJoinedByString:@""];
            return NO;
            
        }

    }
    return YES;
}
- (IBAction) goAwayKeyBoard:(id)sender{
    [sender resignFirstResponder];
    
}

- (IBAction) tapBackground:(id)sender{
    [celsius resignFirstResponder];
    [fahrenheit resignFirstResponder];
}

- (IBAction)negativeSign:(UIButton *)sender {
    if ([celsius isFirstResponder]) {
        celsius.text = [NSString stringWithFormat:@"%g", [celsius.text doubleValue] * (-1)];
    }
    else if ([fahrenheit isFirstResponder]) {
        fahrenheit.text = [NSString stringWithFormat:@"%g", [fahrenheit.text doubleValue] * (-1)];
    }

}

- (IBAction)clickReset:(UIButton *)sender {
    celsius.text = @"";
    fahrenheit.text = @"";
}

- (IBAction) clickCalculate:(UIButton *)sender{
    if ([celsius isFirstResponder]) {
        fahrenheit.text = [NSString stringWithFormat:@"%g",[celsius.text doubleValue] * 9/5 + 32 ];
    }
    else if ([fahrenheit isFirstResponder]) {
        celsius.text = [NSString stringWithFormat:@"%g", ([fahrenheit.text doubleValue] - 32) * 5/9];
    }
}

@end
