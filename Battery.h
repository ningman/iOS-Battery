//
//  Battery.h
//  Battery
//
//  Created by xrm on 13-3-30.
//  Copyright (c) 2013年 XuRuomeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Battery : NSObject{
}

+ (NSInteger)BatteryVoltage;
+ (NSInteger)BatteryLevel;
+ (NSInteger)BatteryCurrentCapacity;
+ (NSInteger)BatteryDesignCapacity;
+ (NSInteger)BatteryMaxCapacity;
+ (NSInteger)BatteryCycleCount;
+ (NSInteger)BatteryChargerID;
+ (NSInteger)BatteryChargerCurrent;
+ (BOOL)BatteryExternalPowerConnected;
+ (BOOL)BatteryIsCharging;
+ (BOOL)BatteryChargerConnected;
+ (BOOL)BatteryExactDeviceChargerConnected;
+ (NSString *)BatteryID;
+ (NSString *)BatterySerialNumber;
+ (NSString *)BatteryChargerType;
+ (NSString *)BatteryManufacturer;

//iOS 7
+(NSString *)Draining;
+(NSString *)chargingState;
+(NSString *)temp;
+(NSString *)connectedStatus;
+(NSString *)fullyCharged;
+(NSString *)adapterInfo;
+(NSString *)RawMaxCapacity;
+(NSString *)Current;
+(NSString *)isCritical;
@end
