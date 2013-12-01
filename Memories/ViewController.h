//
//  ViewController.h
//  Memories
//
//  Created by Aamir Jawaid on 11/30/2013.
//  Copyright (c) 2013 Aamir Jawaid. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LiveSDK/LiveConnectClient.h"

@interface ViewController : UIViewController<LiveAuthDelegate, LiveOperationDelegate, LiveDownloadOperationDelegate, LiveUploadOperationDelegate>

    @property (strong, nonatomic) IBOutlet UITextField* Username;

    @property (strong, nonatomic) IBOutlet UITextField* Password;
    @property (strong, nonatomic) LiveConnectClient *liveClient;
    @property (strong, nonatomic) IBOutlet UILabel *infoLabel;

- (IBAction)loginButtonPress;



@end
