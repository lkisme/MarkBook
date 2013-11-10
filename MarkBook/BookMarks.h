//
//  BookMarks.h
//  MarkBook
//
//  Created by lk on 13-11-10.
//  Copyright (c) 2013年 kelvin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Book;

@interface BookMarks : NSManagedObject

@property (nonatomic) int32_t page;
@property (nonatomic) double latitude;
@property (nonatomic) double longitude;
@property (nonatomic, retain) NSData * photo;
@property (nonatomic, retain) NSString * mid;
@property (nonatomic, retain) Book *book;

@end
