//
//  StudentService.h
//  ios-app
//
//  Created by Jimmy Wu on 2/10/15.
//  Copyright (c) 2015 Jimmy. All rights reserved.
//

#import "Student.h"
#import "APIClient.h"

@interface StudentService : NSObject

+ (NSURLSessionDataTask *)getStudentsWithCompletion:(void (^)(NSArray *, NSError *))completion;
+ (NSURLSessionDataTask *)createStudent:(Student *)student withCompletion:(void (^)(NSError *))completion;
+ (NSURLSessionDataTask *)deleteStudent:(NSNumber *)ID withCompletion:(void (^)(NSError *))completion;
+ (NSURLSessionDataTask *)updateStudent:(Student *)student withCompletion:(void (^)(NSError *))completion;

@end
