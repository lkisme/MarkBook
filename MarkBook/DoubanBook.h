//
//  DoubanBook.h
//  MarkBook
//
//  Created by lk on 13-11-9.
//  strongright (c) 2013年 kelvin. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DoubanBook : NSObject <NSXMLParserDelegate>


@property (nonatomic,strong) NSURL *imgLink;
@property (nonatomic,strong) NSURL *detailLink;
@property (nonatomic,strong) NSString *summary;
@property (nonatomic,strong) NSString *isbn9;
@property (nonatomic,strong) NSString *isbn13;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSNumber *pageNum;
@property (nonatomic,strong) NSString *price;
@property (nonatomic,strong) NSNumber *rate;
@property (nonatomic,strong) NSNumber *numRaters;
@property (nonatomic,strong) NSString *author;

@property (nonatomic,strong) NSMutableString *currentString;
+(id)parseXmlToBook :(NSString *)string;
+(NSURL *)getAPIAddr;
@end
