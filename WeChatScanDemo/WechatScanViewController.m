//
//  WechatScanViewController.m
//  testOpenCV
//
//  Created by 夏利兵 on 2021/5/21.
//

#import "WechatScanViewController.h"
#import <WeChatQRScan/WeChatQRCodeScan.h>
#import "ShowResultViewController.h"

@interface WechatScanViewController ()<WeChatQRScanDelegate>
@property (nonatomic, strong) WeChatQRCodeScan *wcQRScan;
@end

@implementation WechatScanViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.wcQRScan = [[WeChatQRCodeScan alloc]init];
    self.wcQRScan.delegate = self;
    [self.wcQRScan startScan];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.wcQRScan resume];
}

- (void)dealloc
{
    [self.wcQRScan stopScan];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [self.wcQRScan supspend];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
//    self.prevLayer.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
}

- (void)onDeviceReady:(AVCaptureVideoPreviewLayer *)prevLayer
{
//    self.prevLayer = prevLayer;
    
    prevLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;

    
    prevLayer.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
 
    [self.view.layer insertSublayer:prevLayer atIndex:0];
}

- (void)onWeChatQRScanResult:(NSArray<WeChatQRModel *> *)results
{
    NSLog(@"onWeChatQRScanResult");
        
    dispatch_async(dispatch_get_main_queue(), ^{
        
        ShowResultViewController *vc = [[ShowResultViewController alloc]init];
        vc.results = results;
        [self.navigationController pushViewController:vc animated:YES];
    });
}
@end
