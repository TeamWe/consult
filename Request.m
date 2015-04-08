//
//  Request.m
//  网络请求
//
//  Created by Zzg on 14/10/21.
//  Copyright (c) 2014年 Zzg. All rights reserved.
//
 /*
  //网络请求（get）
  1.设置URl（如果有中文，需要转码）
  2.省略Get
  3.建立请求（NSRequest），进行连接（NSConnection， 开始连接为Start）。
  4.解析返回数据
*/

/*
 网络请求（POST）
 1.设置URl
 2.设置POST方法
 3.设置请求体，建立连接
 4.解析
 
 */












#import "Request.h"

NSInteger flag = 0;

@implementation Request


//Get请求
- (void)requestWithGetWithUrl:(NSString *)urlString
{
    
    //有中文需转换,使用UTF-8
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    //1.设置URL
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSLog(@"%@", urlString);


    
    //2.设置请求方式（get，此步骤可省略）
    //3.建立请求，进行连接（NSConnec）
    
    //    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //建立请求
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:5];
    //参数1地址，参数2缓存策略，参数3超时时间
    

    
    //设置连接
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
    
//    [NSConnection ];
    //开始连接
    [connection start];

    //4.进行解析（返回数据）
    
    //不是第四步
    _severData = [NSMutableData data];
}


//Post请求
- (void)requestWithPostWithUrl:(NSString *)urlString WithBody:(NSString *)bodyString
{
    
    //POST  请求头（服务器地址） 请求体（参数）
    
    //1.设置URL
    
    NSURL *url = [NSURL URLWithString:urlString];

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    
    
    //2.设置请求方式（POST不可省略）
    [request setHTTPMethod:@"POST"];
    
    NSData *body = [bodyString dataUsingEncoding:NSUTF8StringEncoding];
    
    //3.1设置请求体
    [request setHTTPBody:body];
    
    //3.2建立连接
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
    
    [connection start];
    
    _severData = [NSMutableData data];
    
}

# pragma mark NSURLConnectionDataDelegate //mark 用作标记
# warning  //用作警告



//接收到服务器的响应，客户端做好准备，接收数据
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"服务器收到响应");
}

//就收服务器数据，多次执行
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"第%ld次执行", flag ++);
    
    [_severData appendData:data];
}

//接收数据完成，做后续处理
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"%@",_severData);
    [self.delegate requestFinished:_severData];
}


//服务器请求失败
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    
    _severData = (NSMutableData *)[error.localizedDescription dataUsingEncoding:NSUTF8StringEncoding];
    [self.delegate requestFinished:_severData];
}

//向服务器发送数据，仅用于Post
- (void)connection:(NSURLConnection *)connection didSendBodyData:(NSInteger)bytesWritten totalBytesWritten:(NSInteger)totalBytesWritten totalBytesExpectedToWrite:(NSInteger)totalBytesExpectedToWrite
{
    NSLog(@"发送数据");
}
@end
