//
//  WeChatQRModel.h
//  WeChatQRScan
//
//  Created by lbxia on 2021/5/24.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface WeChatQRModel : NSObject
//二维码数据，自行根据二维码数据编码类型来转NSString
@property (nonatomic, strong) NSData *dataQR;
@property (nonatomic, assign) CGRect rect;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSDate *date;
@end


