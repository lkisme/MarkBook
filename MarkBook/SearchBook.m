//
//  SearchBook.m
//  MarkBook
//
//  Created by lk on 13-11-9.
//  Copyright (c) 2013年 kelvin. All rights reserved.
//

#import "SearchBook.h"
#import "BookDetail.h"

@implementation SearchBook

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    BookDetail *bd = (BookDetail*)segue.destinationViewController;
    [bd setISBN:self.isbnText.text];
}
- (IBAction)search:(id)sender {
    [self.isbnText resignFirstResponder];
}
@end
