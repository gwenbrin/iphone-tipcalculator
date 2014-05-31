//
//  TipViewController.m
//  tipcalculator
//
//  Created by Guinevere Brinsmead on 5/28/14.
//  Copyright (c) 2014 gwenbrin. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billText;
@property (weak, nonatomic) IBOutlet UITextField *splitText;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *billLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UILabel *splitLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

- (IBAction)onTap:(id)sender;
- (void)updateValues;


@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Tip Calculator";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateValues];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:(YES)];
    [self updateValues];
}

- (void)updateValues {
    float billAmount = [self.billText.text floatValue];
    float splitBy = [self.splitText.text floatValue];
    
    NSArray *tipValues = @[@(0.1), @(0.15), @(0.2)];
    float tipAmount = billAmount * [tipValues[self.tipControl.selectedSegmentIndex] floatValue];
    float totalAmount = tipAmount + billAmount;
    float splitAmount = totalAmount / splitBy;
    
    self.billLabel.text = [NSString stringWithFormat:@"%0.2f", billAmount];
    self.tipLabel.text = [NSString stringWithFormat:@"%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
    self.splitLabel.text = [NSString stringWithFormat:@"%0.2f", splitAmount];
}

@end
