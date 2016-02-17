//
//  STMovie.h
//  iOSStartDemo
//
//  Created by qiufu on 2/14/16.
//  Copyright © 2016 CX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STMovie : NSObject

@property (assign, nonatomic) int64_t rowid;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *year;
@property (copy, nonatomic) NSString *synopsis;
@property (copy, nonatomic) NSString *thumbnailImageURLString;

@end
