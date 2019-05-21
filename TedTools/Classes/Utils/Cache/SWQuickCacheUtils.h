//
//  CSQuickCacheUtils.h
//  PayChat
//
//  Created by iMac on 2018/6/19.
//  Copyright © 2018年 huangchusheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWQuickCacheUtils : NSObject
+(BOOL)isNullObject:(id)object;
+(NSString*)documentDirectory;
+(NSString*)documentDirectoryPath:(NSString*)file;
+(NSString*)cacheDirectory;
+(NSString*)cacheDirectoryPath:(NSString*)file; 
+(NSFileManager*)fileManager;
+(BOOL)fileExist:(NSString*)path;
+(BOOL)directoryExist:(NSString*)dirPath;
+(BOOL)createDirectory:(NSString*)dirPath;
+(BOOL)writeFileData:(NSData*)data toPath:(NSString*)path;
+(NSData*)readFromFile:(NSString*)path;
+(BOOL)deleteFileAtPath:(NSString*)filePath;
+(BOOL)deleteDiretoryAtPath:(NSString*)dirPath;
+(BOOL)copyFileFromPath:(NSString*)fromPath toPath:(NSString*)toPath isRemoveOld:(BOOL)isRemove;
+(BOOL)archieveObject:(id<NSCoding>)anObject toFilePath:(NSString *)toPath;
+(id)unarchieveFromPath:(NSString *)filePath;
@end
