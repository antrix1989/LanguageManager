//
//  ANLanguageManager.h
//
//  Created by Sergey Demcheko on 7/5/13.
//  Copyright (c) 2013 antrix1989@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Posted when language is changed.
 The object is the current language identifier.
 */
extern NSString *const ANLanguageChangedNotification;

/**
 A singleton object that manages the localization.
 */
@interface ANLanguageManager : NSObject

/**
 The current language used for translation.
 */
@property (copy, nonatomic) NSString *currentLanguage;

/**
 The singleton instance of ANLanguageManager.
 @return The singleton instance of ANLanguageManager.
 */
+ (instancetype)sharedInstance;

/**
 Returns a localized version of the string.
 @param key The key for a string.
 @param value The value to return if key is nil or if a localized string for key can’t be found.
 @return A localized version of the string
 */
- (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)comment;

@end

#define ANLocalizedString(key, comment) \
[[ANLanguageManager sharedInstance] localizedStringForKey:(key) value:@""]