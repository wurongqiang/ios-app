//
//  StudentService.h
//  ios-app
//
//  Created by Jimmy Wu on 2/10/15.
//  Copyright (c) 2015 Jimmy. All rights reserved.
//

#import "AFHTTPSessionManager.h"
#import "Student.h"

@interface StudentService : AFHTTPSessionManager

+ (NSURLSessionDataTask *)getAllStudentsWithCompletion:(void (^)(NSArray *, NSError *))completion;
+ (NSURLSessionDataTask *)saveStudent:(Student *)student withCompletion:(void (^)(NSError *))completion;
+ (NSURLSessionDataTask *)deleteStudent:(NSNumber *)ID withCompletion:(void (^)(NSError *))completion;

@end
