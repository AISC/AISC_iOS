//
//  Home.m
//  AISCH
//
//  Created by on 17/02/14.
//  Copyright (c) 2014 Angel. All rights reserved.
//

#import "Home.h"
#import <Parse/Parse.h>

@interface Home ()

@end

@implementation Home

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
    
    if([UIScreen mainScreen].bounds.size.height == 568){
    } else{
        // Regular iPhone
    }
    
     imgView.image = [UIImage imageNamed:@"banner1.jpg"];
    [NSTimer scheduledTimerWithTimeInterval:15 target:self selector:@selector(changeImage) userInfo:nil repeats:YES];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)changeImage
{
    [UIView transitionWithView:imgView duration:4 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        imgView.image = [UIImage imageNamed:@"banner2.jpg"];
    } completion:^(BOOL done){
        [UIView transitionWithView:imgView duration:4 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            imgView.image = [UIImage imageNamed:@"banner3.jpg"];
        } completion:^(BOOL done){
            [UIView transitionWithView:imgView duration:4 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                imgView.image = [UIImage imageNamed:@"banner4.jpg"];
            } completion:^(BOOL done){
                [UIView transitionWithView:imgView duration:4 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                    imgView.image = [UIImage imageNamed:@"banner1.jpg"];
                } completion:^(BOOL done){
                }];
            }];
        }];
    }];
    
    
//    [UIView transitionWithView:imgView
//                      duration:5.0f
//                       options:UIViewAnimationOptionTransitionCrossDissolve
//                    animations:^{
//                        imgView.image = [UIImage imageNamed:@"banner1.png"];
//                    } completion:nil];
//    
//    [UIView transitionWithView:imgView
//                      duration:5.0f
//                       options:UIViewAnimationOptionTransitionCrossDissolve
//                    animations:^{
//                        imgView.image = [UIImage imageNamed:@"banner2.png"];
//                    } completion:nil];
//    
//    [UIView transitionWithView:imgView
//                      duration:5.0f
//                       options:UIViewAnimationOptionTransitionCrossDissolve
//                    animations:^{
//                        imgView.image = [UIImage imageNamed:@"banner3.png"];
//                    } completion:nil];
//    
//    [UIView transitionWithView:imgView
//                      duration:5.0f
//                       options:UIViewAnimationOptionTransitionCrossDissolve
//                    animations:^{
//                        imgView.image = [UIImage imageNamed:@"banner4.png"];
//                    } completion:nil];
    
}


-(IBAction)NewsAction:(id)sender
{
    upcomingObj = [[UPComingEvents alloc] initWithNibName:@"UPComingEvents" bundle:nil];
//    upcomingObj.isPassword = YES;
    [self presentViewController:upcomingObj animated:NO completion:nil];
}

-(IBAction)PhotosAction:(id)sender
{
    smugSmugObj = [[Smugmug alloc] initWithNibName:@"Smugmug" bundle:nil];
    [self presentViewController:smugSmugObj animated:NO completion:nil];
}

-(IBAction)SocialAction:(id)sender
{
    socialObj = [[Social alloc] initWithNibName:@"Social" bundle:nil];
    [self presentViewController:socialObj animated:NO completion:nil];
}

-(IBAction)LiveAction:(id)sender
{
    liveObj = [[LiveEvents alloc] initWithNibName:@"LiveEvents" bundle:nil];
    [self presentViewController:liveObj animated:NO completion:nil];
}

-(IBAction)EventsAction:(id)sender
{
    eventsObj = [[Events alloc] initWithNibName:@"Events" bundle:nil];
    [sender setTintColor:[UIColor redColor]];
    
    [self presentViewController:eventsObj animated:NO completion:nil];
}

-(IBAction)VideosAction:(id)sender
{
    
}

-(IBAction)ContactsAction:(id)sender
{
    contactsObj = [[Contacts alloc] initWithNibName:@"Contacts" bundle:nil];
    contactsObj.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:contactsObj animated:NO completion:nil];
}

-(IBAction)MessagesAction:(id)sender
{
    
}

-(IBAction)MapAction:(id)sender
{
    mapObj = [[Map alloc] initWithNibName:@"Map" bundle:nil];
    [self presentViewController:mapObj animated:NO completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
