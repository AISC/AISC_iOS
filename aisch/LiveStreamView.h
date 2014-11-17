//
//  LiveStreamView.h
//  AISC
//
//  Created by admin on 5/5/14.
//  Copyright (c) 2014 Angel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Home.h"
#import "LiveEvents.h"

@class LiveEvents;
@interface LiveStreamView : UIViewController<UIWebViewDelegate>
{
    LiveEvents *liveObj;
    IBOutlet UIWebView *webView;
    IBOutlet UIActivityIndicatorView *m_activity;
}

-(IBAction)BackButton:(id)sender;

@property (nonatomic, retain) UIActivityIndicatorView *m_activity;

@end
