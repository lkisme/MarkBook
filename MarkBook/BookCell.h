//
//  BookCell.h
//  MarkBook
//
//  Created by lk on 13-11-10.
//  Copyright (c) 2013年 kelvin. All rights reserved.
//

#define BOOK_CELL_IDENTIFIER @"BookCellId"

#import <UIKit/UIKit.h>

@interface BookCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *btitle;
@property (weak, nonatomic) IBOutlet UIImageView *img;

@end
