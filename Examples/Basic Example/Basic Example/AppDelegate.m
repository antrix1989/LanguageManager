//
//  ANAppDelegate.m
//  Basic Example
//
//  Created by Sergey Demchenko on 2/2/14.
//  Copyright (c) 2014 antrix1989@gmail.com. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window.rootViewController = [RootViewController new];
    
    [self.window makeKeyAndVisible];
    return YES;
}
@end
