//
//  NotesView.m
//  AISCH
//
//  Created by on 20/02/14.
//  Copyright (c) 2014 Angel. All rights reserved.
//

#import "NotesView.h"

@interface NotesView ()

@end

@implementation NotesView
@synthesize LoadWebString,m_activity;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(BOOL)shouldAutorotate{
    return NO;
}

-(NSUInteger)supportedInterfaceOrientations{
    return (UIInterfaceOrientationMaskPortrait);
}
- (void)viewDidLoad
{
    [self LoadWebViewScreen:LoadWebString];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)LoadWebViewScreen:(NSString*)LoadString
{
    NSURL *url;
    if ([LoadString isEqualToString:@"Head of School's Newsletter"])
    {
        url = [NSURL URLWithString:@"http://hosnewsletter.blogspot.in/"];
    }
    else if([LoadString isEqualToString:@"Elementary School Principal's Newsletter"])
    {
        url = [NSURL URLWithString:@"http://es-principal-notes.blogspot.in/"];
    }
    else if([LoadString isEqualToString:@"Middle School Principal's Newsletter"])
    {
        url = [NSURL URLWithString:@"http://ms-principal-notes.blogspot.in/"];
    }
    else if([LoadString isEqualToString:@"High School Principal's Newsletter"])
    {
        url = [NSURL URLWithString:@"http://aischsprincipal.blogspot.in/"];
    }
    else if([LoadString isEqualToString:@"PTA Newsletter"])
    {
        url = [NSURL URLWithString:@"http://aiscptonews.blogspot.in/"];
    }
    else{
        url = [NSURL URLWithString:@"http://www.aisch.org"];
    }
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}

-(IBAction)BackButton:(id)sender
{
    upComingObj = [[UPComingEvents alloc] initWithNibName:@"UPComingEvents" bundle:nil];
//    upComingObj.isPassword = YES;
    [self presentViewController:upComingObj animated:NO completion:nil];
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
