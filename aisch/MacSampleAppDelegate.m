//
//  MacSampleAppDelegate.m
//  AISCH
//
//  Created by on 17/02/14.
//  Copyright (c) 2014 Angel. All rights reserved.
//

#import "MacSampleAppDelegate.h"

@implementation MacSampleAppDelegate
@synthesize homeController;
@synthesize isPassword;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[UIApplication sharedApplication] setStatusBarStyle: UIStatusBarStyleLightContent];
    
    [Parse setApplicationId:@"swB5Fu5IOlTM0MgheImLwSlnjfnzTHX5nDM7BOrz"
                  clientKey:@"USccGbNybTiis12WcDXMcqo37K7gHug8ZVpjUtRz"];
    
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    testObject[@"foo"] = @"bar";
    [testObject saveInBackground];

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    if ([[UIScreen mainScreen]bounds].size.height==568) {
        self.homeController = [[Home alloc] initWithNibName:@"Home" bundle:nil];
   }else{
        self.homeController = [[Home alloc] initWithNibName:@"Home_iPhone4" bundle:nil];

    }
    self.window.rootViewController = self.homeController;
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
