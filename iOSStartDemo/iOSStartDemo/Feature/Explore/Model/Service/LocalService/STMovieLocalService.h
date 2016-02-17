//
//  STMovieLocalService.h
//  iOSStartDemo
//
//  Created by qiufu on 2/16/16.
//  Copyright © 2016 CX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STMovie.h"

@interface STMovieLocalService : NSObject

#pragma mark - STMovieLocalService
+ (NSArray *)getAllMovies;
+ (int64_t)addOrUpdateMovie:(STMovie *)movie;
+ (BOOL)removeAllMovies;

@end
