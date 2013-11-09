//
//  FileAccessManager.m
//  MarkBook
//
//  Created by lk on 13-11-9.
//  Copyright (c) 2013年 kelvin. All rights reserved.
//
#define FILE_NAME  @"KELVIN"
#define IMG_COUNT  @"COUNT"

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
        NSString *imgPath= [[FileAccessManager imgPath] stringByAppendingPathExtension:imgName];
        mark.imgPath = imgPath;
        NSData *imgData = UIImageJPEGRepresentation(img, 1.0);
        [[NSFileManager defaultManager] createFileAtPath:[FileAccessManager imgPath] contents:imgData attributes:nil];;
    }
    NSArray *dict = [FileAccessManager BookMarks];
    for (BookMark* m in dict) {
        if ([mark.ISBN isEqualToString:m.ISBN]) {
            return NO;
        }
    }
    NSArray *temp = [NSArray arrayWithObject:mark];
    NSString *filePath = [[FileAccessManager docPath] stringByAppendingPathExtension:FILE_NAME];
    NSArray *arr = [temp arrayByAddingObjectsFromArray:dict];
    [arr writeToFile:filePath atomically:YES];
    return YES;
}
+(NSString *)getImgName{
    NSString *path = [[FileAccessManager imgPath] stringByAppendingString:IMG_COUNT];
    
    if ([[NSFileManager defaultManager]fileExistsAtPath:path]) {
        
        NSString *s = [NSString stringWithContentsOfFile:path encoding:NSASCIIStringEncoding error:nil];
        return s;
    } else {
        //
        return @"0";
    }
    
}
+(NSArray *)BookMarks{
    NSString *filePath = [[FileAccessManager docPath] stringByAppendingPathExtension:FILE_NAME];
    NSArray *dict = [FileAccessManager readFile:filePath];
    
    return dict;
}
@end
