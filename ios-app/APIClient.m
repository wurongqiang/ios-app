//
//  APIClient.m
//  ios-app
//
//  Created by Jimmy Wu on 2/10/15.
//  Copyright (c) 2015 Jimmy. All rights reserved.
//

#import "APIClient.h"

@implementation APIClient

static NSString *const baseURLString=@"http://localhost:3000/";

+(instancetype)sharedClient {
    static APIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[[self class] alloc] initWithBaseURL:[NSURL URLWithString:baseURLString]];
    });
    
    return _sharedClient;
}

-(instancetype)initWithBaseURL:(NSURL *)url
{
    if (self = [super initWithBaseURL:url]) {
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        self.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    return self;
}

-(NSURLSessionDataTask *)GET:(NSString *)URLString parameters:(NSDictionary *)parameters credential:(NSString *)credential success:(void (^)(NSURLSessionDataTask *, id))success failure:(void (^)(NSURLSessionDataTask *, NSError *))failure
{
    return [self GET:URLString parameters:parameters success:success failure:failure];
}

-(NSURLSessionDataTask *)POST:(NSString *)URLString parameters:(NSDictionary *)parameters credential:(NSString *)credential success:(void (^)(NSURLSessionDataTask *, id))success failure:(void (^)(NSURLSessionDataTask *, NSError *))failure
{
    return [self POST:URLString parameters:parameters success:success failure:failure];
}

-(NSURLSessionDataTask *)PUT:(NSString *)URLString parameters:(NSDictionary *)parameters credential:(NSString *)credential success:(void (^)(NSURLSessionDataTask *, id))success failure:(void (^)(NSURLSessionDataTask *, NSError *))failure
{
    return [self PUT:URLString parameters:parameters success:success failure:failure];
}

-(NSURLSessionDataTask *)DELETE:(NSString *)URLString parameters:(NSDictionary *)parameters credential:(NSString *)credential success:(void (^)(NSURLSessionDataTask *, id))success failure:(void (^)(NSURLSessionDataTask *, NSError *))failure
{
    return [self DELETE:URLString parameters:parameters success:success failure:failure];
}

-(NSURLSessionDataTask *)POST:(NSString *)URLString parameters:(NSDictionary *)parameters contructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))formData credential:(NSString *)credential success:(void (^)(NSURLSessionDataTask *, id))success failure:(void (^)(NSURLSessionDataTask *, NSError *))failure
{
    return [self POST:URLString parameters:parameters constructingBodyWithBlock:formData success:success failure:failure];
}


@end

