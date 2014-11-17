//
//  UPComingEvents.h
//  AISCH
//
//  Created by MACBOOK PRO on 17/02/14.
//  Copyright (c) 2014 Angel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Home.h"
#import "NotesView.h"

@class Home;
@class NotesView;
@class MacSampleAppDelegate;

@interface UPComingEvents : UIViewController<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
{
    BOOL isPassword;
    Home *homeObj;
    NotesView *NotesViewObj;
    IBOutlet UITableView *MyTable;
    NSMutableArray *arrayValue;
    IBOutlet UIView *PasswordView;
    
    IBOutlet UITextField *passwordTxt;
    
    MacSampleAppDelegate *appDelegate;
}

-(IBAction)OkButton:(id)sender;
-(IBAction)BackButton:(id)sender;

//@property(nonatomic)BOOL isPassword;

@end
