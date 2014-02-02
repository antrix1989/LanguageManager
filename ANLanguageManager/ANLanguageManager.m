//
//  ANLanguageManager.m
//
//  Created by Sergey Demcheko on 7/5/13.
//  Copyright (c) 2013 antrix1989@gmail.com. All rights reserved.
//

#import "ANLanguageManager.h"

NSString *const ANLanguageChangedNotification = @"ANLanguageChangedNotification";

@interface ANLanguageManager ()

@property (strong, nonatomic) NSBundle *bundle;

@end

@implementation ANLanguageManager

@synthesize currentLanguage = _currentLanguage;

#pragma mark - NSObject

- (id)init
{
    self = [super init];
    
    if (self) {
        _currentLanguage = nil;
        _bundle = [NSBundle mainBundle];
    }
    
    return self;
}

#pragma mark - Public

+ (instancetype)sharedInstance
{
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

- (void)setCurrentLanguage:(NSString *)currentLanguage
{
    if (_currentLanguage && [currentLanguage isEqualToString:_currentLanguage]) {
        return;
    }
    
    NSString *path = [[NSBundle mainBundle] pathForResource:currentLanguage ofType:@"lproj"];
    
    if (path) {
        self.bundle = [NSBundle bundleWithPath:path];
        _currentLanguage = [currentLanguage copy];
    } else {
        NSLog(@"Localization for language identifier %@ is not found.", currentLanguage);
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:ANLanguageChangedNotification object:_currentLanguage];
}

- (NSString *)currentLanguage
{
    if (!_currentLanguage) {
        NSArray *languages = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];
        _currentLanguage = [languages objectAtIndex:0];
        
        NSString *path = [[NSBundle mainBundle] pathForResource:_currentLanguage ofType:@"lproj"];
        
        if (!path) {
            self.currentLanguage = @"en";
            self.bundle = [NSBundle mainBundle];
        }
    }
    
    return _currentLanguage;
}

- (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)comment
{
    return [self.bundle localizedStringForKey:key value:comment table:nil];
}

@end
