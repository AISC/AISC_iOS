//
//  Social.h
//  AISCH
//
//  Created by MACBOOK PRO on 17/02/14.
//  Copyright (c) 2014 Angel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Home.h"

@class Home;
@interface Social : UIViewController<UIWebViewDelegate>
{
    Home *homeObj;
    IBOutlet UIWebView *webView;
    IBOutlet UIActivityIndicatorView *m_activity;
}

-(IBAction)BackButton:(id)sender;

@property (nonatomic, retain) UIActivityIndicatorView *m_activity;

@end
