//
//  UserManager.m
//  Ruim de Roda
//
//  Created by Matheus Frozzi Alberton on 11/04/15.
//  Copyright (c) 2015 Ruim de Roda. All rights reserved.
//

#import "UserManager.h"

@implementation UserManager

- (void)createUser:(void (^)(NSString *objectID, NSError *error))response {
    
    PFUser *user = [PFUser user];
    user.username = @"ruimderoda";
    user.password = @"123";
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            response(nil, error);
        } else {
            NSString *errorString = [error userInfo][@"error"];
            NSLog(@"%@", errorString);
        }
        
        response(user.objectId, error);
    }];
}

-(void)setUserDefaults:(NSString *)objectID {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    [userDefaults setObject:objectID forKey:@"objectID"];

    [userDefaults synchronize];
}
- (NSString *)getUserDefaults {
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"objectID"]) {
        return [[NSUserDefaults standardUserDefaults] objectForKey:@"objectID"];
    } else {
        return nil;
    }
}
@end