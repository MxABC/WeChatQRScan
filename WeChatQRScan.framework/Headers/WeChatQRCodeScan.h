//
//  WeChatQRScan.h
//  WeChatQRScan
//
//  Created by lbxia on 2021/5/22.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>
#import "WeChatQRModel.h"


@protocol WeChatQRScanDelegate <NSObject>

@optional

/**
 相机启动成功，返回预览layer，主线程中返回
 */
- (void)onDeviceReady:(AVCaptureVideoPreviewLayer *)prevLayer;

- (void)onWeChatQRScanResult:(NSArray<WeChatQRModel*>*)results;

@end

/**
 HDTK 视频采集、拍照
 增加重力感应，设备任意方向，最终视频与图片都是正的方向
*/
@interface WeChatQRCodeScan : NSObject

@property (nonatomic, weak) id<WeChatQRScanDelegate> delegate;

///连续扫码，默认NO
@property (nonatomic, assign) BOOL continuous;

/**
 当前扫码结果是否需要图片
 */
@property (nonatomic, assign,getter=isNeedScanImage) BOOL needScanImage;


// 默认5,控制每秒识别线程数量
@property (nonatomic, assign) CGFloat frameCount;

/**
  摄像机位置,取值:
 - 1: AVCaptureDevicePositionBack
 - 2: AVCaptureDevicePositionFront
 
 默认值 AVCaptureDevicePositionBack
 */
@property (nonatomic, assign) NSInteger devicePosition;


/**
 - AVCaptureSessionPresetHigh    640x480
 - AVCaptureSessionPreset1280x720 1280x720
默认值：AVCaptureSessionPresetHigh
 */
@property (nonatomic, assign) NSString *videoSizeLevel;



/**
 启动相机

 @return YES if succes,else No
 */
- (BOOL)startScan;


/**
 停止相机
 */
- (void)stopScan;


//暂停
- (void)supspend;
//恢复
- (void)resume;

#pragma mark- 相机前后切换
- (void)switchCameras;


#pragma mark- 闪光灯控制
//是否有闪光灯
- (BOOL)hasFlash;

/**
 闪光灯是否打开

 @return YES:打开,NO:关闭
 */
- (BOOL)torchOn;

//打开闪光灯
- (void)openTorch;

//关闭闪光灯
- (void)closeTorch;

//闪光灯状态切换,打开->关闭，关闭->打开
- (void)changeTorch;

//设置闪光灯指定模式
- (void)torchWithMode:(AVCaptureTorchMode)mode;

@end

