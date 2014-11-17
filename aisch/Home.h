//
//  Home.h
//  AISCH
//
//  Created by on 17/02/14.
//  Copyright (c) 2014 Angel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Map.h"
#import "Events.h"
#import "Social.h"
#import "Smugmug.h"
#import "Contacts.h"
#import "LiveEvents.h"
#import "UPComingEvents.h"

@class Map;
@class Events;
@class Social;
@class Contacts;
@class Smugmug;
@class LiveEvents;
@class UPComingEvents;
@interface Home : UIViewController
{
    Map *mapObj;
    Events *eventsObj;
    Social *socialObj;
    LiveEvents *liveObj;
    Smugmug *smugSmugObj;
    Contacts *contactsObj;
    UPComingEvents *upcomingObj;
    
    IBOutlet UIImageView *imgView;
    NSMutableArray *_images;
    NSTimer *timer;
    int currentImage;
}

-(IBAction)MapAction:(id)sender;
-(IBAction)NewsAction:(id)sender;
-(IBAction)LiveAction:(id)sender;
-(IBAction)PhotosAction:(id)sender;
-(IBAction)EventsAction:(id)sender;
-(IBAction)VideosAction:(id)sender;
-(IBAction)SocialAction:(id)sender;
-(IBAction)ContactsAction:(id)sender;
-(IBAction)MessagesAction:(id)sender;

@end
