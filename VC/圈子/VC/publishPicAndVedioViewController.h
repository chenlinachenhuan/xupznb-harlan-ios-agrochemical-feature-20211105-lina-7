//
//  publishPicAndVedioViewController.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface publishPicAndVedioViewController : rootViewController
@property(nonatomic,assign)    BOOL isAllowEditVideo;

@property(nonatomic,retain)NSMutableArray *selectedPhotos;
@property(nonatomic,retain)NSMutableArray *selectedAssets;
-(void)typeForVideoOrPhoto:(NSString*)type didFinishPickingMediaWithInfo:(NSDictionary *)info;
@end

NS_ASSUME_NONNULL_END
