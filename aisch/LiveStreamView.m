//
//  LiveStreamView.m
//  AISC
//
//  Created by admin on 5/5/14.
//  Copyright (c) 2014 Angel. All rights reserved.
//

#import "LiveStreamView.h"

@interface LiveStreamView ()

@end

@implementation LiveStreamView
@synthesize m_activity;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(IBAction)BackButton:(id)sender
{
    liveObj = [[LiveEvents alloc] initWithNibName:@"LiveEvents" bundle:nil];
    [self presentViewController:liveObj animated:NO completion:nil];
}

- (void)viewDidLoad
{
    NSURL *url = [NSURL URLWithString:@"http://www.aisch.org/index.php?option=com_content&view=article&id=187&Itemid=459"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}





- (void)webViewDidFinishLoad:(UIWebView *)webView {
    m_activity.hidden= TRUE;
    [m_activity stopAnimating];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    m_activity.hidden= FALSE;
    [m_activity startAnimating];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
