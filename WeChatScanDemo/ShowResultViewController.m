//
//  ShowResultViewController.m
//  testOpenCV
//
//  Created by lbxia on 2021/5/23.
//

#import "ShowResultViewController.h"

@interface ShowResultViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *labelQR;
@property (weak, nonatomic) IBOutlet UILabel *labelQRData;

@end

@implementation ShowResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    if (_results[0].image) {
        _imageView.image = _results[0].image;
    }
    
    NSString *str = [[NSString alloc]initWithData:_results[0].dataQR encoding:NSUTF8StringEncoding];
    
    NSString *hexStr = [self hexString:_results[0].dataQR];

    
    if (str) {
        
        _labelQR.text = str;
    }
    if (hexStr) {
        
        _labelQRData.text = hexStr;
    }
    
}

- (NSString*)hexString:(NSData*)data
{
    NSMutableString *arrayString = [[NSMutableString alloc]initWithCapacity:data.length * 2];
    int len = (int)data.length;
    unsigned char* bytes = (unsigned char*)data.bytes;
    
    for (int i = 0; i < len; i++)
    {
        unsigned char cValue = bytes[i];
        
//        int iValue = cValue;
//        iValue = iValue & 0x000000FF;
        
        NSString *str = [NSString stringWithFormat:@"%02x",cValue];
        
        [arrayString appendString:str];
    }
    
    return arrayString.uppercaseString;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
