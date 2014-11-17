//
//  Contacts.h
//  AISCH
//
//  Created by MACBOOK PRO on 17/02/14.
//  Copyright (c) 2014 Angel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "Home.h"

@class Home;
@interface Contacts : UIViewController<MFMailComposeViewControllerDelegate, UIScrollViewDelegate>
{
    Home *homeObj;
    IBOutlet UIScrollView *scrollView;
    IBOutlet UILabel *headOfSchoolLbl;
}

-(void)mailSend:(NSString *)mailstr;
-(void)phoneDialAuto:(NSString *)phonestr;

-(IBAction)BackButton:(id)sender;
-(IBAction)PhoneCallButton:(id)sender;
-(IBAction)ComposeMailButton:(id)sender;

@property (retain, nonatomic)IBOutlet UIScrollView *scrollView;

@end
