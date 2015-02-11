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

@end

