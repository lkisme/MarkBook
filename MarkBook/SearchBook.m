//
//  SearchBook.m
//  MarkBook
//
//  Created by lk on 13-11-9.
//  Copyright (c) 2013年 kelvin. All rights reserved.
//

#import "SearchBook.h"
#import "BookDetail.h"
#import "FileAccessManager.h"

@implementation SearchBook
@synthesize imagePicker;

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    BookDetail *bd = (BookDetail*)segue.destinationViewController;
    [bd setISBN:self.isbnText.text];
}
- (IBAction)search:(id)sender {
    [self.isbnText resignFirstResponder];
}


-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            if ([[actionSheet buttonTitleAtIndex:buttonIndex]isEqualToString:@"拍照"]) {
                imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
                [self presentModalViewController:imagePicker animated:YES];
            } else {
                //确定重新加载头像
            }
            
            break;
        case 1:
            if ([[actionSheet buttonTitleAtIndex:buttonIndex]isEqualToString:@"用户相册"]) {
                imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                [self presentModalViewController:imagePicker animated:YES];
            } else {
                //确定上传头像
            }
            //确定上传头像
            break;
        case 2:
            if ([[actionSheet buttonTitleAtIndex:buttonIndex]isEqualToString:@"取消"]) {
                
            } else {
                //确定绑定邮箱
            }
            break;
        default:
            break;
    }
}
#pragma mark    imagePicker委托方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self dismissModalViewControllerAnimated:YES];
    
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];//原图
    self.img = image;
}
- (IBAction)takePhoto:(id)sender {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary] && [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {//支持相册和照相
        
        imagePicker = [[UIImagePickerController alloc]init];
        imagePicker.delegate = self;
        [imagePicker setAllowsEditing:YES];
        UIActionSheet *photoSheet = [[UIActionSheet alloc] initWithTitle:@"请选择图片来源"
                                                                delegate:self
                                                       cancelButtonTitle:@"取消"
                                                  destructiveButtonTitle:nil
                                                       otherButtonTitles:@"拍照", @"用户相册",nil];
        
        
        photoSheet.actionSheetStyle=UIActionSheetStyleDefault;
        [photoSheet showInView:self.view];
        //[photoSheet release];//注意这里，在xcode-4.2，ios5中不让这么明显的释放
    }
    else if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypePhotoLibrary])
    {
        imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        [imagePicker setAllowsEditing:YES];
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentModalViewController:imagePicker animated:YES];
        //    [self.view addSubview:imagePicker.view];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"Error accessing photo library!" delegate:nil cancelButtonTitle:@"Close" otherButtonTitles:nil];
        [alert show];
        
    }

}
- (IBAction)takeMark:(id)sender {
    BookMark *bm = [[BookMark alloc]init];
    [bm setPageNum:self.pageNm.text];
    NSDate *now = [NSDate dateWithTimeIntervalSinceNow:0];
    NSDateFormatter *ndf = [[NSDateFormatter alloc] init];
    [bm setTime:[ndf stringFromDate:now]];
    [bm setISBN: self.isbnText.text];
    [FileAccessManager saveToFile:bm withPicture:self.img];
}
@end
