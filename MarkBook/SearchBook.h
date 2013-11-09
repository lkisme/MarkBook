//
//  SearchBook.h
//  MarkBook
//
//  Created by lk on 13-11-9.
//  Copyright (c) 2013年 kelvin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BookMark.h"

@interface SearchBook : UIViewController <UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UITextField *isbnText;
- (IBAction)search:(id)sender;
@property (nonatomic,strong) UIImagePickerController *imagePicker;
- (IBAction)takePhoto:(id)sender;
@property (nonatomic,strong) BookMark *bookMark;
@property (nonatomic,strong) UIImage *img;
@property (weak, nonatomic) IBOutlet UITextField *pageNm;
- (IBAction)takeMark:(id)sender;

@end
