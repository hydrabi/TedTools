//
//  CSCachePathManager.h
//  PayChat
//
//  Created by iMac on 2018/6/19.
//  Copyright © 2018年 huangchusheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWCachePathManager : NSObject
+(SWCachePathManager*)shareInstance;
-(NSString*)mainCacheDirectory;
-(NSString*)mainImageCacheDirectory;
-(NSString*)mainAudioCacheDirectory;
-(NSString*)mainImageCacheFilePath:(NSString*)fileName;
-(NSString*)mainAudioCacheFilePath:(NSString*)fileName;
-(NSString*)createOrGetSubCacheDirectoryWithName:(NSString*)dirName;
-(NSString*)createOrGetSubImageCacheDirectoryWithName:(NSString*)dirName;
-(NSString*)createOrGetSubAudioCacheDirectoryWithName:(NSString*)dirName;
-(BOOL)mainImageCacheFileExist:(NSString*)fileName conversationId:(NSString*)conversationId;
-(BOOL)mainAudioCacheFileExist:(NSString*)fileName;
- (NSString *)mainImageCacheFilePathForUrl:(NSString *)url;
- (NSString *)mainAudioCacheFilePathForUrl:(NSString *)url;
-(BOOL)mainImageCacheFileIsExistForUrl:(NSString*)url;
-(BOOL)mainAudioCacheFildIsExistForUrl:(NSString*)url;
-(NSString*)mainAudioTempEncodeFile:(NSString*)fileName;
-(NSString*)imageCacheFilePathWithConversationId:(NSString*)conversationId fileName:(NSString*)fileName;
/* 删除该会话的所有媒体文件 */
-(void)deleteAllMidiaWithConversationId:(NSString*)conversationId;
@end
