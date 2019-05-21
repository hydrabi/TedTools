//
//  SWCachePathManager.m
//  PayChat
//
//  Created by iMac on 2018/6/19.
//  Copyright © 2018年 huangchusheng. All rights reserved.
//

#import "SWCachePathManager.h"
#import "SWQuickCacheUtils.h"
#import "NSString+Addition.h"

#define CSCachePathManagerMainCacheDirectory @"CSCachePathManagerMainCacheDirectory"
#define CSCachePathManagerMainImageCacheDirecotry @"CSCachePathManagerMainImageCacheDirecotry"
#define CSCachePathManagerMainAudioCacheDirectory @"CSCachePathManagerMainAudioCacheDirectory"

static NSString *CSAudioFileCacheSubTempEncodeFileDirectory = @"CSAudioFileCacheSubTempEncodeFileDirectory";

@implementation SWCachePathManager

+(SWCachePathManager*)shareInstance{
    static SWCachePathManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[SWCachePathManager alloc] init];
    });
    return instance;
}

-(instancetype)init{
    if(self = [super init]){
        [self setupCacheDirectorys];
    }
    return self;
}

-(void)setupCacheDirectorys{
    //主缓存
    if(![SWQuickCacheUtils directoryExist:[self mainCacheDirectory]]){
        [SWQuickCacheUtils createDirectory:[self mainCacheDirectory]];
    }
    
    //图片缓存
    if(![SWQuickCacheUtils directoryExist:[self mainImageCacheDirectory]]){
        [SWQuickCacheUtils createDirectory:[self mainImageCacheDirectory]];
    }
    
    //音频缓存
    if(![SWQuickCacheUtils directoryExist:[self mainAudioCacheDirectory]]){
        [SWQuickCacheUtils createDirectory:[self mainAudioCacheDirectory]];
    }
}

-(NSString*)mainCacheDirectory{
    return [SWQuickCacheUtils cacheDirectoryPath:CSCachePathManagerMainCacheDirectory];
}

-(NSString*)mainImageCacheDirectory{
    return [[self mainCacheDirectory] stringByAppendingPathComponent:CSCachePathManagerMainImageCacheDirecotry];
}

-(NSString*)mainAudioCacheDirectory{
    return [[self mainCacheDirectory] stringByAppendingPathComponent:CSCachePathManagerMainAudioCacheDirectory];
}

-(NSString*)mainImageCacheFilePath:(NSString*)fileName{
    if([fileName isNull]){
        return nil;
    }
    
    return [[self mainImageCacheDirectory] stringByAppendingPathComponent:fileName];
}

-(NSString*)mainAudioCacheFilePath:(NSString*)fileName{
    if([fileName isNull]){
        return nil;
    }
    
    return [[self mainAudioCacheDirectory] stringByAppendingPathComponent:fileName];
}

//在主缓存目录下面创建或者返回指定名字的目录路径
-(NSString*)createOrGetSubCacheDirectoryWithName:(NSString*)dirName{
    if([dirName isNull]){
        return nil;
    }
    
    NSString *dirPath = [[self mainCacheDirectory] stringByAppendingPathComponent:dirName];
    if([SWQuickCacheUtils directoryExist:dirPath]){
        return dirPath;
    }
    else{
        [SWQuickCacheUtils createDirectory:dirPath];
        return dirPath;
    }
}

//在主音频目录下面创建或者返回指定名字的目录路径
-(NSString*)createOrGetSubAudioCacheDirectoryWithName:(NSString*)dirName{
    if([dirName isNull]){
        return nil;
    }
    
    NSString *dirPath = [[self mainAudioCacheDirectory] stringByAppendingPathComponent:dirName];
    if([SWQuickCacheUtils directoryExist:dirPath]){
        return dirPath;
    }
    else{
        [SWQuickCacheUtils createDirectory:dirPath];
        return dirPath;
    }
}

-(BOOL)mainAudioCacheFileExist:(NSString*)fileName{
    return [SWQuickCacheUtils fileExist:[self mainAudioCacheFilePath:fileName]];
}

/* 为一个图片链接地址返回缓存路径 */
- (NSString *)mainImageCacheFilePathForUrl:(NSString *)url
{
    if ([url isNull]) {
        return nil;
    }
    NSString *fileName = [url stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
    return [self mainImageCacheFilePath:fileName];
}

/* 为一个语音地址返回缓存路径 */
- (NSString *)mainAudioCacheFilePathForUrl:(NSString *)url
{
    if ([url isNull]) {
        return nil;
    }
    NSString *fileName = [url stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
    return [self mainAudioCacheFilePath:fileName];
}

/* 确定主图片缓存下是否有链接为url的文件缓存  */
-(BOOL)mainImageCacheFileIsExistForUrl:(NSString*)url{
    return [SWQuickCacheUtils fileExist:[self mainImageCacheFilePathForUrl:url]];
}

/* 确定主语音缓存下是否有链接为url的文件缓存 */
-(BOOL)mainAudioCacheFildIsExistForUrl:(NSString*)url{
    return [SWQuickCacheUtils fileExist:[self mainAudioCacheFilePathForUrl:url]];
}

-(NSString*)mainAudioTempEncodeFile:(NSString*)fileName{
    return [[self createOrGetSubAudioCacheDirectoryWithName:CSAudioFileCacheSubTempEncodeFileDirectory] stringByAppendingPathComponent:fileName];
}



/* 删除该会话的所有媒体文件 */
-(void)deleteAllMidiaWithConversationId:(NSString*)conversationId{
    NSString *conversationImageDirPath = [self createOrGetSubImageCacheDirectoryWithName:conversationId];
    [SWQuickCacheUtils deleteDiretoryAtPath:conversationImageDirPath];
}

#pragma mark - 图片

//在主图片目录下面创建或者返回指定名字的目录路径
-(NSString*)createOrGetSubImageCacheDirectoryWithName:(NSString*)dirName{
    if([dirName isNull]){
        return nil;
    }
    
    NSString *dirPath = [[self mainImageCacheDirectory] stringByAppendingPathComponent:dirName];
    if([SWQuickCacheUtils directoryExist:dirPath]){
        return dirPath;
    }
    else{
        [SWQuickCacheUtils createDirectory:dirPath];
        return dirPath;
    }
}

//图片是否存在
-(BOOL)mainImageCacheFileExist:(NSString*)fileName conversationId:(NSString*)conversationId{
    return [SWQuickCacheUtils fileExist:[self imageCacheFilePathWithConversationId:conversationId fileName:fileName]];
}

/* 根据会话id和文件名创建文件路径 */
-(NSString*)imageCacheFilePathWithConversationId:(NSString*)conversationId fileName:(NSString*)fileName{
    NSString *conversationImageDirPath = [self createOrGetSubImageCacheDirectoryWithName:conversationId];
    NSString *filePath = [conversationImageDirPath stringByAppendingPathComponent:fileName];
    return filePath;
}
@end
