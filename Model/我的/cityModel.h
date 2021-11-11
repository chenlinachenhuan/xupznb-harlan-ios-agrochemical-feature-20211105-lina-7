//
//  cityModel.h
//  Agrochemical
//
//  Created by HarLan on 2021/10/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface cityModel : NSObject
@property(nonatomic,retain)NSString*city;
@property(nonatomic,retain)NSString*level;
@property(nonatomic,retain)NSString*myId;

@property(nonatomic,retain)NSString*firstWord;
-(id)initWithData:(NSDictionary*)dic;

@end

NS_ASSUME_NONNULL_END
