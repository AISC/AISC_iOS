//
//  NotesView.h
//  AISCH
//
//  Created by on 20/02/14.
//  Copyright (c) 2014 Angel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UPComingEvents.h"

@class UPComingEvents;
@interface NotesView : UIViewController<UIWebViewDelegate>
{
    UPComingEvents *upComingObj;
    NSString *LoadWebString;
    IBOutlet UIWebView *webView;
    IBOutlet UIActivityIndicatorView *m_activity;
}

-(IBAction)BackButton:(id)sender;

@property(nonatomic, retain)NSString *LoadWebString;
@property (nonatomic, retain) UIActivityIndicatorView *m_activity;

@end
