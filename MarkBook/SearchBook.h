//
//  SearchBook.h
//  MarkBook
//
//  Created by lk on 13-11-9.
//  Copyright (c) 2013年 kelvin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchBook : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *isbnText;
- (IBAction)search:(id)sender;

@end