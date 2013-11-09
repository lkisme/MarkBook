    //
//  BookDetail.m
//  MarkBook
//
//  Created by lk on 13-11-9.
//  Copyright (c) 2013年 kelvin. All rights reserved.
//

#import "BookDetail.h"
#import "DoubanBook.h"
#import "DetailWebPage.h"

@implementation BookDetail
-(void)viewDidLoad{
    [super viewDidLoad];
    self.db = [DoubanBook parseXmlToBook:self.ISBN];
    [self.img setImage:[[UIImage alloc]initWithData:[NSData dataWithContentsOfURL:[self.db imgLink]]]];
    [self.btitle setText:self.db.title];
    
    [self.summary setText:self.db.summary];
    
    NSString *o =[NSString stringWithFormat:@"%@\n%@\n%@\n%@",self.db.author,self.db.price,self.db.rate,self.db.numRaters];
    [self.other setText:o];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    DetailWebPage *dwp = (DetailWebPage *)segue.destinationViewController;
    [dwp setUrl:self.db.detailLink];
}
@end
