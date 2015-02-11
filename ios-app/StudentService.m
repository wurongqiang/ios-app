//
//  StudentService.m
//  ios-app
//
//  Created by Jimmy Wu on 2/10/15.
//  Copyright (c) 2015 Jimmy. All rights reserved.
//

#import "StudentService.h"
#import "APIClient.h"
#import "Student.h"

@implementation StudentService

+ (NSURLSessionDataTask *)getAllStudentsWithCompletion:(void (^)(NSArray *, NSError *))completion
{
    return [[APIClient sharedClient] GET:@"students.json" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSArray *studentsResponse = responseObject;
        NSMutableArray *students = [NSMutableArray arrayWithCapacity:studentsResponse.count];
        for (NSDictionary *studentResponse in studentsResponse) {
            Student *student = [MTLJSONAdapter modelOfClass:[Student class]
                                                 fromJSONDictionary:studentResponse
                                                              error:nil];
            [students addObject:student];
        }
        
        if (completion) {
            completion([NSArray arrayWithArray:students], nil);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (completion) {
            completion(nil,  error);
        }
    }];
    
}

+ (NSURLSessionDataTask *)saveStudent:(Student *)student withCompletion:(void (^)(NSError *))completion
{
    NSDictionary *params = @{@"student":
                                    @{
                                        @"name":student.name,
                                        @"gpa":student.gpa
                                     }
                             };
    
    return [[APIClient sharedClient] POST:@"students.json"
                                 parameters:params
                                    success:^(NSURLSessionDataTask *task, id responseObject) {
                                        if (completion) {
                                            completion(nil);
                                        }
                                    } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                        if (completion) {
                                            completion(error);
                                        }
                                    }];
}

+ (NSURLSessionDataTask *)deleteStudent:(NSNumber *)ID withCompletion:(void (^)(NSError *))completion
{
    NSString *url = [NSString stringWithFormat:@"students/%@.json",ID];
    return [[APIClient sharedClient] DELETE:url
                               parameters:nil
                                  success:^(NSURLSessionDataTask *task, id responseObject) {
                                      if (completion) {
                                          completion(nil);
                                      }
                                  } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                      if (completion) {
                                          completion(error);
                                      }
                                  }];
}


@end
