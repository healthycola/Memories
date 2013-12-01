//
//  ViewController.m
//  Memories
//
//  Created by Aamir Jawaid on 11/30/2013.
//  Copyright (c) 2013 Aamir Jawaid. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize liveClient;
@synthesize infoLabel;

NSString* APP_CLIENT_ID=@"000000004810CD20";

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.liveClient = [[LiveConnectClient alloc] initWithClientId:APP_CLIENT_ID
                                                         delegate:self
                                                        userState:@"initialize"];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)authCompleted:(LiveConnectSessionStatus) status
              session:(LiveConnectSession *) session
            userState:(id) userState
{
    if ([userState isEqual:@"initialize"])
    {
        //wl.basic,wl.signin,wl.offline_access,wl.skydrive,wl.photos
        [self.infoLabel setText:@"Initialized."];
        [self.liveClient login:self
                        scopes:[NSArray arrayWithObjects:@"wl.signin", @"wl.offline_access", @"wl.basic", @"wl.photos", @"wl.skydrive", nil]
                      delegate:self
                     userState:@"signin"];
    }
    if ([userState isEqual:@"signin"])
    {
        if (session != nil)
        {
            [self.infoLabel setText:@"Signed in."];
        }
    }
}

- (void)authFailed:(NSError *) error
         userState:(id)userState
{
    [self.infoLabel setText:[NSString stringWithFormat:@"Error: %@", [error localizedDescription]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginButtonPress{
    NSLog(@"Pressed!");
}
@end
