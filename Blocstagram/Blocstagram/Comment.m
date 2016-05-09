//
//  Comment.m
//  Blocstagram
//
//  Created by Eddy Chan on 4/27/16.
//  Copyright © 2016 Bloc. All rights reserved.
//

#import "Comment.h"
#import "User.h"

@implementation Comment

- (instancetype)initWithDictionary:(NSDictionary *)commentDictionary {
    self = [super init];
    
    if (self) {
        self.idNumber = commentDictionary[@"id"];
        self.from     = [[User alloc] initWithDictionary:commentDictionary[@"from"]];
        self.text     = commentDictionary[@"text"];
    }
    
    return self;
}

@end
