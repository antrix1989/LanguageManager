//
//  ANRootViewController.m
//  Basic Example
//
//  Created by Sergey Demchenko on 2/2/14.
//  Copyright (c) 2014 antrix1989@gmail.com. All rights reserved.
//

#import "RootViewController.h"
#import "ANLanguageManager.h"

@interface RootViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

- (IBAction)onLanguageSegmentValueChanged:(id)sender;

@end

@implementation RootViewController

#pragma mark - NSObject

- (id)init
{
    self = [super init];
    
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onLanguageChangedNotification:) name:ANLanguageChangedNotification object:nil];
    }
    
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - UIViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self updateUi];
}

#pragma mark - IBAction

- (IBAction)onLanguageSegmentValueChanged:(id)sender
{
    UISegmentedControl *segmentControl = sender;
    
    switch (segmentControl.selectedSegmentIndex) {
        case 0:
            [ANLanguageManager sharedInstance].currentLanguage = @"en";
            break;
        case 1: {
            [ANLanguageManager sharedInstance].currentLanguage = @"ru";
        }
            break;
        default:
            break;
    }
    
}

#pragma mark - NSNotificationCenter

- (void)onLanguageChangedNotification:(NSNotification *)notification
{
    [self updateUi];
}

#pragma mark - Private

- (void)updateUi
{
    self.titleLabel.text = ANLocalizedString(@"Hello!", nil);
}

@end
