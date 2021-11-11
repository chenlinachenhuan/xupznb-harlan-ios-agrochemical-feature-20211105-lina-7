//
//  goodsChildrenListModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/11/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface goodsChildrenListModel : NSObject
@property(nonatomic,retain)NSString * myId;
@property(nonatomic,retain)NSString * name;
@property(nonatomic,retain)NSString * pic;
@property(nonatomic,retain)NSString *remark;
-(id)initWithData:(NSDictionary*)dic;
@end

NS_ASSUME_NONNULL_END
