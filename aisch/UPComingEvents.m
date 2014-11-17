//
//  UPComingEvents.m
//  AISCH
//
//  Created by MACBOOK PRO on 17/02/14.
//  Copyright (c) 2014 Angel. All rights reserved.
//

#import "UPComingEvents.h"
#import "TIMERUIApplication.h"
#import "MacSampleAppDelegate.h"

@interface UPComingEvents ()

@end

@implementation UPComingEvents
//@synthesize isPassword;

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
    
   appDelegate = (MacSampleAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if (appDelegate.isPassword == YES) {
        PasswordView.hidden = YES;
    }
    
    
    
    [self.view addSubview:PasswordView];
    
    arrayValue = [[NSMutableArray alloc] init];
    [arrayValue addObject:@"Head of School's Newsletter"];
    [arrayValue addObject:@"Elementary School Principal's Newsletter"];
    [arrayValue addObject:@"Middle School Principal's Newsletter"];
    [arrayValue addObject:@"High School Principal's Newsletter"];
    [arrayValue addObject:@"PTA Newsletter"];

    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(IBAction)OkButton:(id)sender
{
    if ([passwordTxt.text isEqualToString:@"raptors14"]) {
        [passwordTxt resignFirstResponder];
        PasswordView.hidden = YES;
        appDelegate.isPassword = YES;
         [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidTimeout:) name:kApplicationDidTimeoutNotification object:nil];
    }
    else if ([passwordTxt.text length] == 0)
    {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Warning"
                                                           message:@"Please enter password"
                                                          delegate:self
                                                 cancelButtonTitle:@"Ok"
                                                 otherButtonTitles:nil,nil];
        [alertView show];
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Warning"
                                                           message:@"Wrong Password, Plz try again"
                                                          delegate:self
                                                 cancelButtonTitle:@"Ok"
                                                 otherButtonTitles:nil,nil];
        [alertView show];
    }
}

-(void)applicationDidTimeout:(NSNotification *) notif
{
    

    appDelegate.isPassword = NO;

    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self viewDidLoad];
    PasswordView.hidden = NO;
}


-(IBAction)BackButton:(id)sender
{
    
    if ([[UIScreen mainScreen]bounds].size.height==568) {
        homeObj = [[Home alloc] initWithNibName:@"Home" bundle:nil];
        [self presentViewController:homeObj animated:NO completion:nil];
    }else{
        
        homeObj = [[Home alloc] initWithNibName:@"Home_iPhone4" bundle:nil];
        [self presentViewController:homeObj animated:NO completion:nil];
    }
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [textField resignFirstResponder];
    return YES;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arrayValue count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        UIView* elementView =  [ [UIView alloc] initWithFrame:CGRectMake(5,5,312,480)];
		elementView.tag = 0;
		[cell.contentView addSubview:elementView];
    }
    
    UIView* elementView  = [cell.contentView viewWithTag:0];
	for(UIView* subView in elementView.subviews)
	{
		[subView removeFromSuperview];
	}
	
	if([arrayValue count]>0)
    {
        UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 13, 300, 15)];
        nameLabel.font = [UIFont fontWithName:@"Helvetica" size:15];
        nameLabel.textColor = [UIColor blackColor];
        nameLabel.text = [arrayValue objectAtIndex:indexPath.row];
        [elementView addSubview:nameLabel];
	}
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *SelectedArray = [arrayValue objectAtIndex:indexPath.row];
    NotesViewObj = [[NotesView alloc] initWithNibName:@"NotesView" bundle:[NSBundle mainBundle]];
    NotesViewObj.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    NotesViewObj.LoadWebString = SelectedArray;
    [self presentViewController:NotesViewObj animated:YES completion:nil];
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //hides keyboard when another part of layout was touched
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
