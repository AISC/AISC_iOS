//
//  LiveEvents.m
//  AISCH
//
//  Created by admin on 3/9/14.
//  Copyright (c) 2014 Angel. All rights reserved.
//

#import "LiveEvents.h"

@interface LiveEvents ()

@end

@implementation LiveEvents
@synthesize m_activity,activityIndicatorObject;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)ClickAction:(id)sender
{
    LiveStreamView *streamObj = [[LiveStreamView alloc] initWithNibName:@"LiveStreamView" bundle:nil];
    [self presentViewController:streamObj animated:NO completion:nil];
}

- (void)viewDidLoad
{
    
    activityIndicatorObject = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    // Set Center Position for ActivityIndicator
    activityIndicatorObject.center = CGPointMake(150, 275);
    [self.view addSubview:activityIndicatorObject];
    [activityIndicatorObject startAnimating];
    
    
    webView.hidden = YES;
    lbl1.hidden = YES;
    lbl2.hidden = YES;
    btn.hidden = YES;
    LinkArray = [[NSMutableArray alloc] init];
    [self updateDataFromParse];
    
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeOrientation) name:UIDeviceOrientationDidChangeNotification object:nil];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


-(void)changeOrientation {
    UIDeviceOrientation orientation = [UIDevice currentDevice].orientation;
    if (orientation == UIDeviceOrientationPortrait) {
        
        webView.frame = CGRectMake(0,60,320, self.view.frame.size.height);
        imgView.frame = CGRectMake(0, 20, self.view.frame.size.width,40);
        liveStream.frame = CGRectMake(115, 30, 91, 21);
       
    }
    else {
        
        webView.frame = CGRectMake(0,60,self.view.frame.size.height,self.view.frame.size.width);
          imgView.frame = CGRectMake(0, 20,self.view.frame.size.height,40);
        
        liveStream.frame = CGRectMake(239, 30, 91, 21);
    }
    
}


- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user
{
//    NSLog(@"Logging in, so clearing cache.");
    [PFQuery clearAllCachedResults];
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)updateDataFromParse
{
    NSMutableArray *allObjects = [NSMutableArray array];
    NSUInteger limit = 20;
    NSUInteger skip = 0;
    PFQuery *query1 = [PFQuery queryWithClassName:@"Holiday"];
    [query1 setLimit: limit];
    [query1 setSkip: skip];
    
    [query1 findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            [allObjects addObjectsFromArray:objects];
            
            NSDictionary *eventLinkDict;
            
            for(int i=0; i<[allObjects count];i++)
            {
                eventLinkDict= [allObjects objectAtIndex:i];
                [LinkArray addObject:[eventLinkDict objectForKey:@"Link"]];
            }
            
            
            if ([LinkArray count] == 0 || [[LinkArray objectAtIndex:0]isEqualToString:@""]) {
                
                webView.hidden = YES;
                lbl1.hidden = NO;
                lbl2.hidden = NO;
                btn.hidden = NO;
            }
            else{
                webView.hidden = NO;
                lbl1.hidden = YES;
                lbl2.hidden = YES;
                btn.hidden = YES;
                NSString *linkstr = [LinkArray objectAtIndex:0];
                NSURL *url = [NSURL URLWithString:linkstr];
                NSURLRequest *request = [NSURLRequest requestWithURL:url];
                [webView loadRequest:request];
            }
            [activityIndicatorObject stopAnimating];
        }
        else {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
}


-(IBAction)BackButton:(id)sender
{
    UIDeviceOrientation orientation = [UIDevice currentDevice].orientation;
    if (orientation == UIDeviceOrientationLandscapeLeft || orientation == UIDeviceOrientationLandscapeRight)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert!"
                                                        message:@"Please Rotate the device to Portrait Mode and click on back."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];

    }
    else{
    
    
    if ([[UIScreen mainScreen]bounds].size.height==568) {
        homeObj = [[Home alloc] initWithNibName:@"Home" bundle:nil];
        [self presentViewController:homeObj animated:NO completion:nil];
    }else{
        
        homeObj = [[Home alloc] initWithNibName:@"Home_iPhone4" bundle:nil];
        [self presentViewController:homeObj animated:NO completion:nil];
    }
    }
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
