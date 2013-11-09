//
//  FileAccessManager.m
//  MarkBook
//
//  Created by lk on 13-11-9.
//  Copyright (c) 2013年 kelvin. All rights reserved.
//
#define FILE_NAME  @"KELVIN.kelvin"
#define IMG_COUNT  @"COUNT.count"

#import "FileAccessManager.h"
#import "BookMark.h"

@implementation FileAccessManager

+(NSString *)docPath
{
    NSArray *path=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDir=[path objectAtIndex:0];
    return documentsDir;
}
+(NSString *)imgPath
{
    NSArray *path=NSSearchPathForDirectoriesInDomains(NSPicturesDirectory, NSUserDomainMask, YES);
    NSString *picsDir=[path objectAtIndex:0];
    BOOL isExist=[[NSFileManager defaultManager]fileExistsAtPath:picsDir];
    if (!isExist) {
        [[NSFileManager defaultManager]createDirectoryAtPath:picsDir withIntermediateDirectories:NO attributes:nil error:nil];
    }
    return picsDir;
    //    return [self docPath];
}
+(NSArray *)readFile:(NSString *)filePath
{
    if ([[NSFileManager defaultManager]fileExistsAtPath:filePath]) {
        
        NSArray *content=[[NSArray alloc]initWithContentsOfFile:filePath];
        return content;
    } else {
        //
        return nil;
    }
}
+(void) writeToFile:(NSArray *)text withFileName:(NSString *)filePath
{
    [text writeToFile:filePath atomically:YES];
}
+(BOOL)saveToFile:(BookMark *)mark withPicture:(UIImage *)img{
    if(img){
        NSString *imgName = [FileAccessManager getImgName];
        NSString *imgPath= [[FileAccessManager imgPath] stringByAppendingPathComponent:imgName];
        imgPath = [imgPath stringByAppendingPathExtension:@"img"];
        mark.imgPath = imgPath;
        NSData *imgData = UIImagePNGRepresentation(img);
        BOOL a = [[NSFileManager defaultManager] createFileAtPath:imgPath contents:imgData attributes:nil];
        
    }
    NSString *filePath = [[FileAccessManager docPath] stringByAppendingPathComponent:FILE_NAME];
    NSArray *arr = [FileAccessManager readFile:filePath];

    for (NSDictionary* m in arr) {
        if ([mark.ISBN isEqualToString:[m objectForKey:ISBN_KEY]]) {
            return NO;
        }
    }
    NSArray *temp = [NSArray arrayWithObject:[mark BookMarkToDictionary]];
    filePath = [[FileAccessManager docPath] stringByAppendingPathComponent:FILE_NAME];
    arr = [temp arrayByAddingObjectsFromArray:arr];
    bool b = [arr writeToFile:filePath atomically:YES];
    return YES;
}
+(NSString *)getImgName{
    NSString *path = [[FileAccessManager imgPath] stringByAppendingPathComponent:IMG_COUNT];
    
    if ([[NSFileManager defaultManager]fileExistsAtPath:path]) {
        
        NSString *s = [NSString stringWithContentsOfFile:path encoding:NSASCIIStringEncoding error:nil];
        s = [NSString stringWithFormat:@"%d",s.intValue+1];
        return s;
    } else {
        [@"0" writeToFile:path atomically:YES encoding:NSASCIIStringEncoding error:Nil];
        return @"0";
    }
    
}
+(NSArray *)BookMarks{
    NSString *filePath = [[FileAccessManager docPath] stringByAppendingPathComponent:FILE_NAME];
    NSArray *arr = [FileAccessManager readFile:filePath];
    NSMutableArray *result = [NSMutableArray array];
    for (int i = 0; i<arr.count; i++) {
        BookMark *bm = [BookMark bookmarkFromDictionary:[arr objectAtIndex:i]];
        [result addObject:bm];
    }
    return result;
}
@end
