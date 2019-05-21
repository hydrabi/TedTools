//
//  CSQuickCacheUtils.m
//  PayChat
//
//  Created by iMac on 2018/6/19.
//  Copyright © 2018年 huangchusheng. All rights reserved.
//

#import "SWQuickCacheUtils.h"
#import "NSString+Addition.h"

@implementation SWQuickCacheUtils

+(BOOL)isNullObject:(id)object{
    if(!object || [object isKindOfClass:[NSNull class]]){
        return  YES;
    }
    else{
        return NO;
    }
}

+(BOOL)checkValue:(id)value key:(id)key{
    if([self isNullObject:value]||[self isNullObject:key]){
        return YES;
    }
    else{
        return NO;
    }
}

+(NSUserDefaults*)standDefault{
    return [NSUserDefaults standardUserDefaults];
}

+(NSString*)documentDirectory{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                NSUserDomainMask,
                                                YES) firstObject];
}

+(NSString*)documentDirectoryPath:(NSString*)file{
    if([file isNull]){
        return nil;
    }
    
    return [[self documentDirectory] stringByAppendingPathComponent:file];
}

+(NSString*)cacheDirectory{
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,
                                                NSUserDomainMask,
                                                YES) firstObject];
}

+(NSString*)cacheDirectoryPath:(NSString*)file{
    if([file isNull]){
        return nil;
    }
    
    return [[self cacheDirectory] stringByAppendingPathComponent:file];
}

+(NSFileManager*)fileManager{
    return [NSFileManager defaultManager];
}

+(BOOL)fileExist:(NSString*)path{
    if([path isNull]){
        return NO;
    }
    
    return [[self fileManager] fileExistsAtPath:path];
}

+(BOOL)directoryExist:(NSString*)dirPath{
    if([dirPath isNull]){
        return NO;
    }
    
    BOOL isDir = YES;
    return [[self fileManager] fileExistsAtPath:dirPath
                                    isDirectory:&isDir];
}

+(BOOL)createDirectory:(NSString*)dirPath{
    if([dirPath isNull]){
        return NO;
    }
    
    if([self directoryExist:dirPath]){
        return YES;
    }
    
    return [[self fileManager] createDirectoryAtPath:dirPath
                         withIntermediateDirectories:YES
                                          attributes:nil
                                               error:nil];
}

+(BOOL)writeFileData:(NSData*)data toPath:(NSString*)path{
    if([self checkValue:data key:path]){
        return NO;
    }
    
    return [data writeToFile:path atomically:YES];
}

+(NSData*)readFromFile:(NSString*)path{
    if([self isNullObject:path]){
        return nil;
    }
    
    return [NSData dataWithContentsOfFile:path];
}

+(BOOL)deleteFileAtPath:(NSString*)filePath{
    if([self isNullObject:filePath]){
        return NO;
    }
    return [[self fileManager] removeItemAtPath:filePath
                                          error:nil];
}

+(BOOL)deleteDiretoryAtPath:(NSString*)dirPath{
    if([self isNullObject:dirPath]){
        return NO;
    }
    
    return [[self fileManager] removeItemAtPath:dirPath
                                          error:nil];
}

+(BOOL)copyFileFromPath:(NSString*)fromPath toPath:(NSString*)toPath isRemoveOld:(BOOL)isRemove{
    if([fromPath isNull] || [toPath isNull]){
        return NO;
    }
    
    if(![self fileExist:fromPath]){
        return NO;
    }
    
    BOOL copyResult = [[self fileManager] copyItemAtPath:fromPath
                                                  toPath:toPath
                                                   error:nil];
    if(copyResult){
        if(isRemove){
            return [[self fileManager] removeItemAtPath:fromPath
                                                  error:nil];
        }
        
        return YES;
    }
    else{
        return NO;
    }
}

+ (BOOL)archieveObject:(id<NSCoding>)anObject toFilePath:(NSString *)toPath
{
    if ([self isNullObject:anObject] || [toPath isNull]) {
        return NO;
    }
    NSData *archieveData = [NSKeyedArchiver archivedDataWithRootObject:anObject];
    if (archieveData) {
        
        return [self writeFileData:archieveData toPath:toPath];
        
    }else{
        return NO;
    }
}

+ (id)unarchieveFromPath:(NSString *)filePath
{
    if ([self isNullObject:filePath]){
        return nil;
    }
    return [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
}



@end
