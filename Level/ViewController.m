//
//  ViewController.m
//  Level
//
//  Created by Satoh Wataru on 2015/05/11.
//  Copyright (c) 2015年 mycompany. All rights reserved.
//

#import "ViewController.h"
#import <CoreMotion/CoreMotion.h>

@interface ViewController ()

@end

@implementation ViewController{
    CMMotionManager *motionManager;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupAccelerometer];
    
}

- (void) setupAccelerometer {
    // CMMotionManagerのインスタンス生成
    motionManager = [[CMMotionManager alloc] init];
    
    if (motionManager.gyroAvailable){
        // センサーの更新間隔の指定
        motionManager.gyroUpdateInterval = 0.01;
            // ハンドラを設定
            CMGyroHandler handler = ^(CMGyroData *data, NSError *error)
            {
                // 画面に表示
                self.xLabel.text = [NSString stringWithFormat:@"x: %0.3f", data.rotationRate.x];
                self.yLabel.text = [NSString stringWithFormat:@"y: %0.3f", data.rotationRate.y];
                self.zLabel.text = [NSString stringWithFormat:@"z: %0.3f", data.rotationRate.z];
            };
        // 加速度の取得開始
        [motionManager startGyroUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:handler];
        
        // (不必要になったら)センサーの停止
        if (motionManager.gyroActive) {
            [motionManager stopGyroUpdates];
        }
    }else{
        
    }
}
@end