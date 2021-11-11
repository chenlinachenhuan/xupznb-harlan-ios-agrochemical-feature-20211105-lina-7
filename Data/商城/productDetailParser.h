//
//  productDetailParser.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/2.
//

#import "BaseDataParser.h"
#import "productDetailModel.h"

NS_ASSUME_NONNULL_BEGIN
@protocol productDetailParserDelegate;
@interface productDetailParser : BaseDataParser
@property(nonatomic,weak)id<productDetailParserDelegate>myDelegate;
-(void)requestProductDetail:(NSInteger)myId;
@end
@protocol productDetailParserDelegate <NSObject>

-(void)successGetProductDetailInfo:(productDetailModel*)model ;

@end
NS_ASSUME_NONNULL_END
