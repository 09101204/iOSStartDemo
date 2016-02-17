//
//  STDBManager.h
//  iOSStartDemo
//
//  Created by qiufu on 2/16/16.
//  Copyright © 2016 CX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STDBManager : NSObject

@property (strong, readonly, nonatomic) NSString *dbFilePath;

+ (instancetype)sharedInstance;
- (void)setupDB;

@end
