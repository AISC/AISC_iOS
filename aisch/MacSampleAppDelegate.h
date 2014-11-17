//
//  MacSampleAppDelegate.h
//  AISCH
//
//  Created by on 17/02/14.
//  Copyright (c) 2014 Angel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "Home.h"

@class Home;
@interface MacSampleAppDelegate : UIResponder <UIApplicationDelegate>
{
    Home *homeController;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) Home *homeController;

@property(nonatomic)BOOL isPassword;

@end
