//
//  BookMark.h
//  MarkBook
//
//  Created by lk on 13-11-9.
//  Copyright (c) 2013年 kelvin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BookMark : NSObject
{
    @private
    NSString *latitude;
    NSString *longitude;
}

@property (nonatomic,strong) NSString *pageNum;
@property (nonatomic,strong) NSString *ISBN;
@property (nonatomic,strong) NSString *time;
@property (nonatomic,strong) NSString *bookTitle;
@property (nonatomic,strong) NSString *imgPath;


-(void)setLocationByLatitude:(double)latitude AndLongitude:(double)longitude;
-(double)Latitude;
-(double)Longitude;
@end
