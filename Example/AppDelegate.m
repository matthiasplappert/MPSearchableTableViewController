//
//  AppDelegate.m
//  Example
//
//  Created by Matthias Plappert on 9/17/12.
//  Copyright (c) 2012 Matthias Plappert. All rights reserved.
//

#import "AppDelegate.h"
#import "SearchViewController.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Controller setup
    SearchViewController *controller = [[SearchViewController alloc] initWithStyle:UITableViewStylePlain];
    UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:controller];
    self.window.rootViewController = navigation;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
