//
//  homeBannerParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/5.
//

#import "BaseDataParser.h"
#import "bannerModel.h"
NS_ASSUME_NONNULL_BEGIN
@protocol homeBannerParserDelegate;
@interface homeBannerParser : BaseDataParser
@property(nonatomic,weak)id<homeBannerParserDelegate>myDelegate;
-(void)requestBannerPosition:(NSInteger)position num:(NSInteger)num;
@end
@protocol homeBannerParserDelegate <NSObject>

-(void)successGetCommonBanner:(NSMutableArray*)bannerArr;

@end
NS_ASSUME_NONNULL_END
