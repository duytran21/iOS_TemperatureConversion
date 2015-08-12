//
//  ViewController.h
//  TemperConvert
//
//  Created by Ivan Tran on 8/8/15.
//  Copyright (c) 2015 Ivan Tran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate> {
    UITextField *celsius;
    UITextField *fahrenheit;
    UIView *subView;
    
}

@property (strong, nonatomic) IBOutlet UITextField *celsius;

@property (strong, nonatomic) IBOutlet UITextField *fahrenheit;
@property (strong, nonatomic) IBOutlet UIView *subView;

- (IBAction)clickCalculate:(UIButton *)sender;

- (IBAction) goAwayKeyBoard:(id)sender;
- (IBAction) tapBackground:(id)sender;
- (IBAction)negativeSign:(UIButton *)sender;
- (IBAction)clickReset:(UIButton *)sender;

@end

