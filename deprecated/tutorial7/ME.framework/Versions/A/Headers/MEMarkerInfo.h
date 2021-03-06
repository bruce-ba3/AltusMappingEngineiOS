//  Copyright (c) 2012 BA3, LLC. All rights reserved.

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

/**Specifies how marker rotations are rendered by the engine.*/
typedef enum {
	kMarkerRotationScreenEdgeAligned,
	kMarkerRotationTrueNorthAligned
} MEMarkerRotationType;

/**Specifies the attributes for a marker to be added to a dynamic marker map.
 */
@interface MEDynamicMarker : NSObject

/**Contains meta data provided when the marker was generated.*/
@property (retain) NSString* name;

/**Weight of the marker. If a height color bar is applied for the dynamic marker map, this weight is treated as the parameter (altitude) for computing the color.*/
@property (assign) double weight;

/**Rotation of the marker in degrees.*/
@property (assign) double rotation;

/**Specifies how the engine will render rotation of the marker. The default is kMarkerRotationScreenEdgeAligned.*/
@property (assign) MEMarkerRotationType rotationType;

/**Geographic location of the marker.*/
@property (assign) CLLocationCoordinate2D location;

/**The name of a previously cached image to use for the marker. If uiImage is nil, the property is checked.*/
@property (retain) NSString* cachedImageName;

/**The image point that acts as the center of rotation and geographic anchor.*/
@property (assign) CGPoint anchorPoint;

/**Amount to offset marker from projected location on screen (in points) from anchorPoint.*/
@property (assign) CGPoint offset;

/**Dimensions of the hit-test box for the marker in points. When set to anything other than width=0, height=0 (the default), this property overrides the normal hitTesting logic for the marker which is based on the anchor point and size of the marker image. This property should only be set when the marker image size is small enough that targeting it with a finger-tap would be difficult due to it being too small. When set, this size is automatically scaled to physical coordinates to take into account retina displays. The hit testing logic considers a box of this size around the anchor point of the marker.*/
@property (assign) CGSize hitTestSize;

/**When a marker texture is drawn, the default sampling of it's texture is bilinear. For some markers, for example those with text that you wish to be as crisp as possible on-screen, this can appear less readable when a marker image pixel falls between screen pixels. Setting this to YES will force nearest-neighbor sampling of the texture. The down-side, is that when the marker is being animated or panned around the map it's image may appear to 'snap' to pixel alignment.*/
@property (assign) BOOL nearestNeighborTextureSampling;

/**UIImage that represents the marker. You should set this property if you do not set a cachedImageName.*/
@property (retain) UIImage* uiImage;

/**Whether or not to convert the provided uiImage to RGB565 or RGBA4444 2-byte format. This cuts texture memory size in half compared to 4-byte per pixel formats.*/
@property (assign) BOOL compressTexture;

@end


/**Specifies the attributes for a marker to be added to marker map type kMapTypeDynamicMarkerFast.
  @warning This object has been deprecated and will be removed in a future release. Use MEDynamicMarkerInfo instead.
 */
@interface MEFastMarkerInfo : NSObject

/**Contains meta data provided when the marker was generated.*/
@property (nonatomic, retain) NSString* metaData;

/**Weight of the marker.*/
@property (nonatomic, assign) double weight;

/**Rotation of the marker in degrees.*/
@property (nonatomic, assign) double rotation;

/**Specifies how the engine will render rotation of the marker. The default is kMarkerRotationScreenEdgeAligned.*/
@property (nonatomic, assign) MEMarkerRotationType rotationType;

/**Geographic location of the marker.*/
@property (nonatomic, assign) CLLocationCoordinate2D location;

/**The name of previously cached image to use for the marker. If uiImage is nil, the property is checked.*/
@property (nonatomic, retain) NSString* cachedImageName;

/**Point that represents which pixel on the marker should be placed on the
 geographic coordinate the marker represents. You should set this property when the mapping engine makes a request to the marker delegate to update the marker info.*/
@property (nonatomic, assign) CGPoint anchorPoint;

/**Dimensions of the hit-test box for the marker in points. When set to anything other than width=0, height=0 (the default), this property overrides the normal hitTesting logic for the marker which is based on the anchor point and size of the marker image. This property should only be set when the marker image size is small enough that targeting it with a finger-tap would be difficult due to it being too small. When set, this size is automatically scaled to physical coordinates to take into account retina displays. The hit testing logic considers a box of this size around the anchor point of the marker.*/
@property (nonatomic, assign) CGSize hitTestSize;

/**
 Minimum level the marker should appear. Defaults to 0. Set to higher if you want the marker to only appear at higher zoom levels.
 */
@property (nonatomic, assign) unsigned int minimumLevel;

/**When a marker texture is drawn, the default sampling of it's texture is bilinear. For some markers, for example those with text that you wise to be as crisp as possible on-screen, this can appear less readable when a marker image pixel falls between screen pixels. Setting this to YES will force nearest-neighbor sampling of the texture. The down-side, is that when the marker is being animated or panned around the map it's image may appear to 'snap' to pixel alignment.*/
@property (nonatomic, assign) BOOL nearestNeighborTextureSampling;

@end

/**
 Describes information about a marker. The engine will create and provide an instance of this object to a marker map's MEMarkerMapDelegate for each marker that needs to be displayed.
 */
@interface MEMarkerInfo : NSObject

/**Create an MEMarkerInfo object.*/
- (id) initWidthUid:(unsigned int) uid
		   metaData:(NSString*) metaData
			 weight:(double) weight
		   location:(CLLocationCoordinate2D) location;

/**The row id of the marker from the sqlite database.*/
@property (assign) unsigned int uid;

/**UIImage that represents the marker. You should set this property when the mapping engine makes a request to the marker delegate to update the marker info.*/
@property (nonatomic, retain) UIImage* uiImage;

/**Dimensions of the hit-test box for the marker in points. When set to anything other than width=0, height=0 (the default), this property overrides the normal hitTesting logic for the marker which is based on the anchor point and size of the marker image. This property should only be set when the marker image size is small enough that targeting it with a finger-tap would be difficult due to it being too small. When set, this size is automatically scaled to physical coordinates to take into account retina displays. The hit testing logic considers a box of this size around the anchor point of the marker.*/
@property (nonatomic, assign) CGSize hitTestSize;

/**Defaults to YES, but may be set to NO by the marker delegate if this marker is not to be drawn.*/
@property (nonatomic, assign) BOOL isVisible;

/**Contains meta data provided when the marker was generated.*/
@property (nonatomic, retain) NSString* metaData;

/**Weight of the marker.*/
@property (nonatomic, assign) double weight;

/**Rotation of the marker in degrees.*/
@property (nonatomic, assign) double rotation;

/**Specifies how the engine will render rotation of the marker. The default is kMarkerRotationScreenEdgeAligned.*/
@property (nonatomic, assign) MEMarkerRotationType rotationType;

/**Geographic location of the marker.*/
@property (nonatomic, assign) CLLocationCoordinate2D location;

/**The name of previously cached image to use for the marker. If uiImage is nil, the property is checked.*/
@property (nonatomic, retain) NSString* cachedImageName;

/**Point that represents which pixel on the marker should be placed on the
 geographic coordinate the marker represents. You should set this property when the mapping engine makes a request to the marker delegate to update the marker info.*/
@property (nonatomic, assign) CGPoint anchorPoint;

/**Amount to offset marker from projected location on screen (in points) from anchorPoint.*/
@property (assign) CGPoint offset;

/**
 Minimum level the marker should appear. Defaults to 0. Set to higher if you want the marker to only appear at higher zoom levels.
 */
@property (nonatomic, assign) unsigned int minimumLevel;

/**When a marker texture is drawn, the default sampling of it's texture is bilinear. For some markers, for example those with text that you wise to be as crisp as possible on-screen, this can appear less readable when a marker image pixel falls between screen pixels. Setting this to YES will force nearest-neighbor sampling of the texture. The down-side, is that when the marker is being animated or panned around the map it's image may appear to 'snap' to pixel alignment.*/
@property (nonatomic, assign) BOOL nearestNeighborTextureSampling;

@end