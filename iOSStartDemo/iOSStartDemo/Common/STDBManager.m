//
//  STDBManager.m
//  iOSStartDemo
//
//  Created by qiufu on 2/16/16.
//  Copyright © 2016 CX. All rights reserved.
//

#import "STDBManager.h"
#import <FMDB/FMDB.h>

static NSString * const STDBFileName = @"stdb.sqlite";

@interface STDBManager ()

@property (strong, readwrite, nonatomic) NSString *dbFilePath;

@end

@implementation STDBManager

#pragma mark - Property
- (NSString *)dbFilePath {
    if (!_dbFilePath) {
        NSArray *searchPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentFolderPath = searchPaths[0];
        _dbFilePath = [documentFolderPath stringByAppendingPathComponent:STDBFileName];
    }
    
    return _dbFilePath;
}

#pragma mark - Lifecycle
+ (instancetype)sharedInstance {
    static STDBManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

#pragma mark - Utility
- (void)setupDB {
    if (![self isDBFileExist]) {
        BOOL isCopyDBOK = [self copyDBFileFromMainBundle];
        if (!isCopyDBOK) {
            if ([self createDB]) {
                [self updateDB];
            }
        }
    }
}

- (BOOL)isDBFileExist {
    return [[NSFileManager defaultManager] fileExistsAtPath:self.dbFilePath];
}

- (BOOL)copyDBFileFromMainBundle {
    BOOL result = NO;
    
    // Could not find db file, need to copy.
    NSString* backupDbPath = [[NSBundle mainBundle] pathForResource:@"stdb" ofType:@"sqlite"];
    if (backupDbPath == nil) {
        // Could not find backup db to copy.
        result = NO;
    } else {
        BOOL copiedBackupDb = [[NSFileManager defaultManager] copyItemAtPath:backupDbPath toPath:self.dbFilePath error:nil];
        if (!copiedBackupDb) {
            // Copy backup db file failed.
            result = NO;
        } else {
            result = YES;
        }
    }
    
    return result;
}

- (BOOL)createDB {
    if ([FMDatabase databaseWithPath:self.dbFilePath]) {
        return YES;
    }
    
    return NO;
}

- (void)updateDB {
    FMDatabaseQueue *dbQ = [FMDatabaseQueue databaseQueueWithPath:self.dbFilePath];
    [dbQ inTransaction:^(FMDatabase *db, BOOL *rollback) {
        [db executeUpdate:[NSString stringWithFormat:@"Create Table If Not Exists st_movie (rowid integer primary key not null, name text, year text, synopsis text, thumbnail_url text)"]];
    }];
}

@end
