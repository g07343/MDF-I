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
    NSArray *monsterArray;
    NSArray *test;
    NSString *selectedImage;
    NSString *actorName;
    NSString *actorImage;
    NSString *otherFilms;
}
+(CustomObject*)GetInstance;

-(NSArray*) getpictures;
-(void) selectedPerson:(NSString*)name;
-(NSString*) getName;
-(NSString*) returnPicture;
-(NSString*) getFilms;
@end
