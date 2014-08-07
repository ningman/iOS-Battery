//
//  Battery.m
//  Battery
//
//  Created by xrm on 13-3-30.
//  Copyright (c) 2013年 XuRuomeng. All rights reserved.
//

#import "Battery.h"
#import <UIKit/UIKit.h>

@interface PLBatteryPropertiesEntry : NSObject
+ (id)batteryPropertiesEntry;
@property(readonly, nonatomic) BOOL draining;
@property(readonly, nonatomic) BOOL isPluggedIn;
@property(readonly, nonatomic) NSString *chargingState;
@property(readonly, nonatomic) int batteryTemp;
@property(readonly, nonatomic) NSNumber *connectedStatus;
@property(readonly, nonatomic) NSNumber *adapterInfo;
@property(readonly, nonatomic) int chargingCurrent;
@property(readonly, nonatomic) BOOL fullyCharged;
@property(readonly, nonatomic) BOOL isCharging;
@property(readonly, nonatomic) int cycleCount;
@property(readonly, nonatomic) int designCapacity;
@property(readonly, nonatomic) double rawMaxCapacity;
@property(readonly, nonatomic) double maxCapacity;
@property(readonly, nonatomic) double rawCurrentCapacity;
@property(readonly, nonatomic) double currentCapacity;
@property(readonly, nonatomic) int current;
@property(readonly, nonatomic) int voltage;
@property(readonly, nonatomic) BOOL isCritical;
@property(readonly, nonatomic) double rawCapacity;
@property(readonly, nonatomic) double capacity;
@end


@interface OSDBattery : NSObject
+ (id) sharedInstance;
- (id)_getChargerType;
- (NSString*)_getBatteryID;
- (id)_getBatteryManufacturer;
- (id)_getBatterySerialNumber;
- (BOOL)_deviceIsCharging;
- (BOOL)_exactDeviceChargerConnected;
- (BOOL)_deviceChargerConnected;
- (int)_getRawBatteryVoltage;
- (int)_getBatteryCycleCount;
- (int)_getBatteryDesignCapacity;
- (int)_getBatteryLevel;
- (int)_getChargerID;
- (int)_getChargerCurrent;
- (BOOL)_externalPowerConnected;
- (int)_getBatteryMaxCapacity;
- (int)_getBatteryCurrentCapacity;
- (unsigned int)_getIOPMPowerSourceService;
- (id)_batteryID;
@end

@implementation Battery
+ (NSInteger)BatteryVoltage{
    NSInteger result = [(NSString *)[[[super alloc] BatteryInfo] objectForKey:@"Raw Voltage"] integerValue];
    return result;
}
+ (NSInteger)BatteryLevel{
    NSInteger result = [(NSString *)[[[super alloc] BatteryInfo] objectForKey:@"Level"] integerValue];
    return result;
}
+ (NSInteger)BatteryCurrentCapacity{
    NSInteger result = [(NSString *)[[[super alloc] BatteryInfo] objectForKey:@"Current Capacity"] integerValue];
    return result;
}
+ (NSInteger)BatteryDesignCapacity{
    NSInteger result = [(NSString *)[[[super alloc] BatteryInfo] objectForKey:@"Design Capacity"] integerValue];
    return result;
}
+ (NSInteger)BatteryMaxCapacity{
    NSInteger result = [(NSString *)[[[super alloc] BatteryInfo] objectForKey:@"Max Capacity"] integerValue];
    return result;
}
+ (NSInteger)BatteryCycleCount{
    NSInteger result = [(NSString *)[[[super alloc] BatteryInfo] objectForKey:@"Cycle Count"] integerValue];
    return result;
}
+ (NSInteger)BatteryChargerID{
    NSInteger result = [(NSString *)[[[super alloc] BatteryInfo] objectForKey:@"Charger ID"] integerValue];
    return result;
}
+ (NSInteger)BatteryChargerCurrent{
    NSInteger result = [(NSString *)[[[super alloc] BatteryInfo] objectForKey:@"Charger Current"] integerValue];
    return result;
}
+ (BOOL)BatteryExternalPowerConnected{
    BOOL result = [(NSString*)[[[super alloc] BatteryInfo] objectForKey:@"External Power"] boolValue];
    return result;
}
+ (BOOL)BatteryIsCharging{
    BOOL result = [(NSString*)[[[super alloc] BatteryInfo] objectForKey:@"Device Charging"] boolValue];
    return result;
}
+ (BOOL)BatteryChargerConnected{
    BOOL result = [(NSString*)[[[super alloc] BatteryInfo] objectForKey:@"Device Charger Connected"] boolValue];
    return result;
}
+(BOOL)BatteryExactDeviceChargerConnected{
    BOOL result = [(NSString*)[[[super alloc] BatteryInfo] objectForKey:@"Exact Device Charger"] boolValue];
    return result;
}
+ (NSString *)BatteryID{
    NSString *result = (NSString*)[[[super alloc] BatteryInfo] objectForKey:@"Battery ID"];
    return result;
}
+ (NSString *)BatterySerialNumber{
    NSString *result = (NSString*)[[[super alloc] BatteryInfo] objectForKey:@"Serial Number"];
    return result;
}
+ (NSString *)BatteryChargerType{
    NSString *result = (NSString*)[[[super alloc] BatteryInfo] objectForKey:@"Charger Type"];
    return result;
}
+ (NSString *)BatteryManufacturer{
    NSString *result = (NSString*)[[[super alloc] BatteryInfo] objectForKey:@"Manufacturer"];
    return result;
}
+(NSString *)Draining{
    NSString *result = (NSString*)[[[super alloc] BatteryInfo] objectForKey:@"Draining"];
    return result;
}
+(NSString *)chargingState{
    NSString *result = (NSString*)[[[super alloc] BatteryInfo] objectForKey:@"chargingState"];
    return result;
}
+(NSString *)temp{
    NSString *result = (NSString*)[[[super alloc] BatteryInfo] objectForKey:@"Battery Temp"];
    return result;
}
+(NSString *)connectedStatus{
    NSString *result = (NSString*)[[[super alloc] BatteryInfo] objectForKey:@"connectedStatus"];
    return result;
}
+(NSString *)adapterInfo{
    NSString *result = (NSString*)[[[super alloc] BatteryInfo] objectForKey:@"Adapter Info"];
    return result;
}
+(NSString *)fullyCharged{
    NSString *result = (NSString*)[[[super alloc] BatteryInfo] objectForKey:@"fullyCharged"];
    return result;
}
+(NSString *)RawMaxCapacity{
    NSString *result = (NSString*)[[[super alloc] BatteryInfo] objectForKey:@"Raw Max Capacity"];
    return result;
}
+(NSString *)Current{
    NSString *result = (NSString*)[[[super alloc] BatteryInfo] objectForKey:@"Current"];
    return result;
}
+(NSString *)isCritical{
    NSString *result = (NSString*)[[[super alloc] BatteryInfo] objectForKey:@"isCritical"];
    return result;
}
- (NSMutableDictionary *) BatteryInfo {
    NSString *path;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0) {
        path = @"/System/Library/PrivateFrameworks/GAIA.framework";
    } else {
        path = @"/System/Library/PrivateFrameworks/PowerlogLoggerSupport.framework";
    }
    NSBundle *b = [NSBundle bundleWithPath:path];
    BOOL success = [b load];
    
    if (success) {
        if ([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0){
            Class OSDBattery = NSClassFromString(@"OSDBattery");
            id powerController = [OSDBattery sharedInstance];
            
            NSMutableDictionary *batteryInfo = [NSMutableDictionary dictionary];

            [batteryInfo setObject:[NSString stringWithFormat:@"%d", [powerController _getRawBatteryVoltage]] forKey:@"Raw Voltage"];
            [batteryInfo setObject:[NSString stringWithFormat:@"%d", [powerController _getBatteryLevel]] forKey:@"Level"];
            [batteryInfo setObject:[NSString stringWithFormat:@"%d", [powerController _getBatteryCurrentCapacity]] forKey:@"Current Capacity"];
            [batteryInfo setObject:[NSString stringWithFormat:@"%d", [powerController _getBatteryDesignCapacity]] forKey:@"Design Capacity"];
            [batteryInfo setObject:[NSString stringWithFormat:@"%d", [powerController _getBatteryCycleCount]] forKey:@"Cycle Count"];
            [batteryInfo setObject:[NSString stringWithFormat:@"%d", [powerController _getChargerID]] forKey:@"Charger ID"];
            [batteryInfo setObject:[NSString stringWithFormat:@"%d", [powerController _getChargerCurrent]] forKey:@"Charger Current"];
            [batteryInfo setObject:[powerController _externalPowerConnected] ? @"Yes" : @"No" forKey:@"External Power"];
            [batteryInfo setObject:[powerController _deviceIsCharging] ? @"Yes" : @"No"  forKey:@"Device Charging"];
            [batteryInfo setObject:[powerController _deviceChargerConnected] ? @"Yes" : @"No" forKey:@"Device Charger Connected"];
            [batteryInfo setObject:[powerController _exactDeviceChargerConnected] ? @"Yes" : @"No" forKey:@"Exact Device Charger"];
            [batteryInfo setObject:[powerController _batteryID] forKey:@"Battery ID"];
            [batteryInfo setObject:[powerController _getBatterySerialNumber] forKey:@"Serial Number"];
            [batteryInfo setObject:[powerController _getBatteryManufacturer]  forKey:@"Manufacturer"];
            [batteryInfo setObject:[powerController _getChargerType] forKey:@"Charger Type"];
            [batteryInfo setObject:[NSString stringWithFormat:@"%d", [powerController _getBatteryMaxCapacity]] forKey:@"Max Capacity"];
            return batteryInfo;
        } else{
            Class PLBatteryPropertiesEntry = NSClassFromString(@"PLBatteryPropertiesEntry");
            id deviceInfo = [[PLBatteryPropertiesEntry alloc] init];
            
            NSMutableDictionary *batteryInfo = [NSMutableDictionary dictionary];
            
            [batteryInfo setObject:[deviceInfo draining] ? @"Yes" : @"No" forKey:@"Draining"];//new 7
            [batteryInfo setObject:[deviceInfo isPluggedIn] ? @"Yes" : @"No" forKey:@"Device Charger Connected"];
            [batteryInfo setObject:[NSString stringWithFormat:@"%@", [deviceInfo chargingState]] forKey:@"chargingState"];//new 7
            [batteryInfo setObject:[NSString stringWithFormat:@"%d", [deviceInfo batteryTemp]] forKey:@"Battery Temp"];//new 7
            [batteryInfo setObject:[NSString stringWithFormat:@"%@", [deviceInfo connectedStatus]] forKey:@"connectedStatus"];//new 7
            [batteryInfo setObject:[NSString stringWithFormat:@"%@", [deviceInfo adapterInfo]] forKey:@"Adapter Info"];//new 7
            [batteryInfo setObject:[NSString stringWithFormat:@"%d", [deviceInfo chargingCurrent]] forKey:@"Charger Current"];
            [batteryInfo setObject:[deviceInfo fullyCharged] ? @"Yes" : @"No" forKey:@"fullyCharged"];//new7
            [batteryInfo setObject:[deviceInfo isCharging] ? @"Yes" : @"No" forKey:@"Device Charging"];
            [batteryInfo setObject:[NSString stringWithFormat:@"%d", [deviceInfo cycleCount]] forKey:@"Cycle Count"];
            [batteryInfo setObject:[NSString stringWithFormat:@"%d", [deviceInfo designCapacity]] forKey:@"Design Capacity"];
            [batteryInfo setObject:[NSString stringWithFormat:@"%f", [deviceInfo rawMaxCapacity]] forKey:@"Raw Max Capacity"];//new 7
            [batteryInfo setObject:[NSString stringWithFormat:@"%f", [deviceInfo maxCapacity]] forKey:@"Max Capacity"];
            [batteryInfo setObject:[NSString stringWithFormat:@"%f", [deviceInfo currentCapacity]] forKey:@"Current Capacity"];
            [batteryInfo setObject:[NSString stringWithFormat:@"%d", [deviceInfo current]] forKey:@"Current"];//new 7
            [batteryInfo setObject:[NSString stringWithFormat:@"%d", [deviceInfo voltage]] forKey:@"Raw Voltage"];
            [batteryInfo setObject:[deviceInfo isCritical] ? @"Yes" : @"No" forKey:@"isCritical"];//new 7
            [batteryInfo setObject:[NSString stringWithFormat:@"%f", [deviceInfo rawCapacity]] forKey:@"Level"];
            return batteryInfo;
        }
    }
    return nil;
}


@end
