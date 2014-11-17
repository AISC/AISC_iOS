//
//  LiveEvents.h
//  AISCH
//
//  Created by admin on 3/9/14.
//  Copyright (c) 2014 Angel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Home.h"
#import <Parse/Parse.h>
#import "LiveStreamView.h"

@interface LiveEvents : UIViewController<UIWebViewDelegate>
{
    Home *homeObj;
    IBOutlet UIButton *btn;
    IBOutlet UILabel *lbl1;
    IBOutlet UILabel *lbl2;
    IBOutlet UIWebView *webView;
    NSMutableArray *LinkArray;
    IBOutlet UIActivityIndicatorView *m_activity;
    IBOutlet UIImageView *imgView;
    IBOutlet UILabel *liveStream;
    
}

-(IBAction)BackButton:(id)sender;
-(IBAction)ClickAction:(id)sender;

@property (nonatomic,retain) UIActivityIndicatorView *m_activity;
@property (nonatomic,retain) UIActivityIndicatorView *activityIndicatorObject;


@end
