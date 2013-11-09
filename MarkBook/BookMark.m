//
//  BookMark.m
//  MarkBook
//
//  Created by lk on 13-11-9.
//  Copyright (c) 2013年 kelvin. All rights reserved.
//

#import "BookMark.h"

@implementation BookMark

-(void)setLocationByLatitude:(double)lati AndLongitude:(double)longit{
    latitude = [NSString stringWithFormat:@"%f",lati];
    longitude = [NSString stringWithFormat:@"%f",longit];
}
-(double)Latitude{
    double d = [latitude doubleValue];
    return d;
}
-(double)Longitude{
    return [longitude doubleValue];
}

@end
