//
//  MyController.m
//  SampleAttributedStrings
//
//  Created by Peter Chen on 11/22/13.
//  Copyright (c) 2013 Peter Chen. All rights reserved.
//

#import "MyController.h"

@interface MyController ()

@property (nonatomic, strong) UILabel *plainStringLabel;
@property (nonatomic, strong) UILabel *attributedStringLabel;

@end

@implementation MyController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.plainStringLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, 300, 20)];
    self.plainStringLabel.numberOfLines = 0;
    self.plainStringLabel.textAlignment = NSTextAlignmentCenter;
    self.plainStringLabel.text = @"This is a plain old string";
    [self.view addSubview:self.plainStringLabel];
    
    self.attributedStringLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(self.plainStringLabel.frame) + 10, 300, 100)];
    self.attributedStringLabel.numberOfLines = 0;
    self.attributedStringLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.attributedStringLabel];
    
    [self setLabelTextWithAttributedString];
}

- (void)setLabelTextWithAttributedString {
    NSString *text = @"\nThis is an attributed string. Normal. Italics. Blue. Underline. Strikethrough.";
    NSDictionary *attributes = @{
                                 NSFontAttributeName : [UIFont boldSystemFontOfSize:15],
                                 };
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text attributes:attributes];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:[text rangeOfString:@"Normal"]];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont italicSystemFontOfSize:15] range:[text rangeOfString:@"Italics"]];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:[text rangeOfString:@"Blue"]];
    [attributedString addAttribute:NSUnderlineStyleAttributeName value:@(NSUnderlineStyleDouble) range:[text rangeOfString:@"Underline"]];
    [attributedString addAttribute:NSUnderlineColorAttributeName value:[UIColor redColor] range:[text rangeOfString:@"Underline"]];
    [attributedString addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlineStyleDouble) range:[text rangeOfString:@"Strikethrough"]];
    self.attributedStringLabel.attributedText = attributedString;
}

@end
