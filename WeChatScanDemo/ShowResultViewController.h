//
//  ShowResultViewController.h
//  testOpenCV
//
//  Created by lbxia on 2021/5/23.
//

#import <UIKit/UIKit.h>
#import <WeChatQRScan/WeChatQRModel.h>

@interface ShowResultViewController : UIViewController
@property (nonatomic, strong) NSArray<WeChatQRModel*>* results;
@end


