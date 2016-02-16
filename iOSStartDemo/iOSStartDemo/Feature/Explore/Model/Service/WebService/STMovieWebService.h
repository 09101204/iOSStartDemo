//
//  STMovieWebService.h
//  iOSStartDemo
//
//  Created by qiufu on 2/14/16.
//  Copyright © 2016 CX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STMovie.h"

@interface STMovieWebService : NSObject

#pragma mark - Movie Data WebService
+ (void)requestMovieDataWithParameters:(id)parameters start:(void (^)(void))start success:(void (^)(NSDictionary *result))success failure:(void (^)(NSError *error))failure;

@end
