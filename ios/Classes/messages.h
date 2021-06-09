// Autogenerated from Pigeon (v0.2.1), do not edit directly.
// See also: https://pub.dev/packages/pigeon
#import <Foundation/Foundation.h>
@protocol FlutterBinaryMessenger;
@class FlutterError;
@class FlutterStandardTypedData;

NS_ASSUME_NONNULL_BEGIN

@class CBKVersion;

@interface CBKVersion : NSObject
@property(nonatomic, copy, nullable) NSString * string;
@end

@protocol CBKApi
-(nullable CBKVersion *)getPlatformVersion:(FlutterError *_Nullable *_Nonnull)error;
@end

extern void CBKApiSetup(id<FlutterBinaryMessenger> binaryMessenger, id<CBKApi> _Nullable api);

NS_ASSUME_NONNULL_END
