//
//  Book.h
//  MarkBook
//
//  Created by lk on 13-11-10.
//  Copyright (c) 2013年 kelvin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Book : NSManagedObject

@property (nonatomic, retain) NSString * isbn;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * id;
@property (nonatomic, retain) NSString * imageLink;
@property (nonatomic, retain) NSString * detailLink;
@property (nonatomic, retain) NSString * summary;
@property (nonatomic) int32_t pageNum;
@property (nonatomic, retain) NSString * price;
@property (nonatomic) double rate;
@property (nonatomic) int32_t numRater;
@property (nonatomic, retain) NSString * author;

@end
