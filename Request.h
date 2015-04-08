//
//  Request.h
//  网络请求
//
//  Created by Zzg on 14/10/21.
//  Copyright (c) 2014年 Zzg. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FinishRequestDelegate <NSObject>

- (void)requestFinished:(NSMutableData *)severData;

@end

@interface Request : NSObject<NSURLConnectionDataDelegate>

@property(weak, nonatomic)id<FinishRequestDelegate> delegate;
//代理


@property(retain, nonatomic)NSMutableData *severData;

- (void)requestWithGetWithUrl:(NSString *)urlString;
- (void)requestWithPostWithUrl:(NSString *)urlString WithBody:(NSString *)bodyString;
@end
