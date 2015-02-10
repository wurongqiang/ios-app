//
//  APIClient.h
//  ios-app
//
//  Created by Jimmy Wu on 2/10/15.
//  Copyright (c) 2015 Jimmy. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface APIClient : AFHTTPSessionManager

+(instancetype)sharedClient;

-(NSURLSessionDataTask *)GET:(NSString *)URLString parameters:(NSDictionary *)parameters credential:(NSString *)credential success:(void (^)(NSURLSessionDataTask *, id))success failure:(void (^)(NSURLSessionDataTask *, NSError *))failure;

-(NSURLSessionDataTask *)POST:(NSString *)URLString parameters:(NSDictionary *)parameters credential:(NSString *)credential success:(void (^)(NSURLSessionDataTask *, id))success failure:(void (^)(NSURLSessionDataTask *, NSError *))failure;

-(NSURLSessionDataTask *)POST:(NSString *)URLString parameters:(NSDictionary *)parameters contructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))formData credential:(NSString *)credential success:(void (^)(NSURLSessionDataTask *, id))success failure:(void (^)(NSURLSessionDataTask *, NSError *))failure;

-(NSURLSessionDataTask *)PUT:(NSString *)URLString parameters:(NSDictionary *)parameters credential:(NSString *)credential success:(void (^)(NSURLSessionDataTask *, id))success failure:(void (^)(NSURLSessionDataTask *, NSError *))failure;

-(NSURLSessionDataTask *)DELETE:(NSString *)URLString parameters:(NSDictionary *)parameters credential:(NSString *)credential success:(void (^)(NSURLSessionDataTask *, id))success failure:(void (^)(NSURLSessionDataTask *, NSError *))failure;
@end

