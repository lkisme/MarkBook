//
//  DoubanBook.m
//  MarkBook
//
//  Created by lk on 13-11-9.
//  Copyright (c) 2013年 kelvin. All rights reserved.
//

#define TITLE @"title"
#define IMG @"image"
#define MOBILE  @"mobile"
#define AUTHOR @"author"
#define SUMMARY @"summary"
#define LINK @"link"

#import "DoubanBook.h"
@implementation DoubanBook
-(id)init{
    return [super init];
}
+(NSURL *)getAPIAddr{
    return [[NSURL alloc] initWithString:@"https://api.douban.com/v2/book/isbn/"];
}
+(id)parseXmlToBook :(NSString *)url{
    DoubanBook *book = [[DoubanBook alloc]init];
    if (book) {
        NSString *isbnURl = [NSString stringWithFormat:@"https://api.douban.com/v2/book/isbn/%@",url];
        NSURL *u = [NSURL URLWithString:isbnURl];
        NSError *error;
        //加载一个NSURL对象
        NSURLRequest *request = [NSURLRequest requestWithURL:u];
        //将请求的url数据放到NSData对象中
        NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        //IOS5自带解析类NSJSONSerialization从response中解析出数据放到字典中
        NSDictionary *bookDict = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:&error];
        [book setTitle:[bookDict objectForKey:TITLE]];
        [book setImgLink:[NSURL URLWithString:[bookDict objectForKey:IMG]]];
        [book setIsbn13:[bookDict objectForKey:@"isbn13"]];
        NSArray *authors = [bookDict objectForKey:AUTHOR];
        NSMutableString *temp = [NSMutableString stringWithString:@""];
        for (int i =0; i<authors.count; i++) {
            [temp appendString:[authors objectAtIndex:i]];
        }
        [book setAuthor:temp];
        [book setSummary:[bookDict objectForKey:SUMMARY]];
        [book setPrice:[bookDict objectForKey:@"price"]];
        NSString *pageNum = [bookDict objectForKey:@"pages"];
        
        [book setPageNum:[NSNumber numberWithInt:pageNum.integerValue]];
        NSDictionary *rating = [bookDict objectForKey:@"rating"];
        pageNum = [rating objectForKey:@"numRaters"];
        [book setNumRaters:[NSNumber numberWithInteger:pageNum.intValue]];
        [book setRate:[rating objectForKey:@"average"]];
        [book setDetailLink:[NSURL URLWithString:[bookDict objectForKey:@"alt"]]];
//        NSEnumerator *keyEnum = [bookDict keyEnumerator];
//        id key ;
//        for (NSEnumerator *keyEnum = [bookDict keyEnumerator];key = [keyEnum nextObject];) {
//            NSLog(key);
//            
//        }
        
//        NSDictionary *weatherInfo = [book objectForKey:TITLE];
    }
    return book;
}
//-(void)parser:(NSXMLParser *)parser foundComment:(NSString *)comment{
//    NSLog(comment);
//}
//-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
//    if ([elementName isEqualToString:TITLE]) {
//        self.title = self.currentString;
//    }
//    if ([elementName isEqualToString:LINK]) {
//        NSString *s = [DoubanBook parseXMLToArray:self WithAttribute:IMG];
//        self.imgLink = [NSURL URLWithString:s];
//    }
//    self.currentString = nil;
//}
//-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
//    if (!self.currentString) {
//        self.currentString = [NSMutableString stringWithString:@""];
//    }else if([elementName isEqualToString:LINK]){
//        self.currentString = [NSMutableString stringWithString:@""];
//    }
//}
//-(void)parser:(NSXMLParser *)parser foundAttributeDeclarationWithName:(NSString *)attributeName forElement:(NSString *)elementName type:(NSString *)type defaultValue:(NSString *)defaultValue{
////    if ([elementName isEqualToString:TITLE]) {
////        NSLog(attributeName);
////    }
//}
//-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
//    [self.currentString appendString:string];
//}
+(NSString *)parseXMLToArray:(DoubanBook *)db WithAttribute:(NSString *)attr{
    NSArray *arr = [db.currentString componentsSeparatedByString:@"\""];
    NSString *s = nil;
    if (!arr || arr.count<4) {
        return s;
    }
    if ([[arr objectAtIndex:3]isEqualToString:attr]) {
        s = [arr objectAtIndex:0];
    }
    return s;
}

@end
