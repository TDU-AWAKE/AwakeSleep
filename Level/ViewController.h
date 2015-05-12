//
//  ViewController.h
//  Level
//
//  Created by Satoh Wataru on 2015/05/11.
//  Copyright (c) 2015年 mycompany. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface ViewController : UIViewController

@property IBOutlet UILabel *xLabel;
@property IBOutlet UILabel *yLabel;
@property IBOutlet UILabel *zLabel;
@property(readonly, nonatomic, getter=isAccelerometerAvailable) BOOL accelerometerAvailable;
@property(readonly) CMAccelerometerData *accelerometerData;
@end
