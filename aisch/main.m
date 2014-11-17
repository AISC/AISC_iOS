//
//  main.m
//  AISCH
//
//  Created by on 17/02/14.
//  Copyright (c) 2014 Angel. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MacSampleAppDelegate.h"
#import "TIMERUIApplication.h"


int main(int argc, char * argv[])
{
//    @autoreleasepool {
//        return UIApplicationMain(argc, argv, nil, NSStringFromClass([MacSampleAppDelegate class]));
//    }
    
    @autoreleasepool {
        return UIApplicationMain(argc, argv, NSStringFromClass([TIMERUIApplication class]), NSStringFromClass([MacSampleAppDelegate class]));
    }
}
