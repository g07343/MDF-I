//
//  BusinessClass.h
//  baseProject
//
//  Created by Matthew Lewis on 12/9/13.
//  Copyright (c) 2013 FullSail. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BusinessClass : NSObject
{
    NSArray *names;
}

+(BusinessClass*)GetInstance;

-(NSArray*)returnNameArray;

@end
