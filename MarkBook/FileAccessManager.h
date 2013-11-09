//
//  FileAccessManager.h
//  MarkBook
//
//  Created by lk on 13-11-9.
//  Copyright (c) 2013年 kelvin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BookMark.h"

@interface FileAccessManager : NSObject
+(NSArray *)BookMarks;
+(BOOL)saveToFile:(BookMark *)mark withPicture:(UIImage *)img;
@end
