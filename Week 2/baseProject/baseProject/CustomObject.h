//
//  CustomObject.h
//  baseProject
//
//  Created by Matthew Lewis on 12/2/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomObject : NSObject
{
    NSString *string1;
    NSString *string2;
    NSString *string3;
}
+(CustomObject*)GetInstance;
-(NSString*) getString1;
-(NSString*) getString2;
-(NSString*) getString3;
@end
