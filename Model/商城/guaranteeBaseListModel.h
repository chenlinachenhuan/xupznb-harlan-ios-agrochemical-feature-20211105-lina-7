//
//  guaranteeBaseListModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface guaranteeBaseListModel : NSObject
@property(nonatomic,retain)NSString * myId;
@property(nonatomic,retain)NSString * dictValue;
@property(nonatomic,retain)NSString * remark;
-(id)initWithData:(NSDictionary*)dic;
@end

NS_ASSUME_NONNULL_END
