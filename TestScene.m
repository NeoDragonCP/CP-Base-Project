#import "TestScene.h"

@implementation TestScene
{
  
}

// -----------------------------------------------------------------------
#pragma mark - Create & Destroy
// -----------------------------------------------------------------------

+ (TestScene *)scene
{
  return [[self alloc] init];
}

// -----------------------------------------------------------------------


- (id)init
{
  // Apple recommend assigning self with supers return value
  self = [super init];
  if (!self) return(nil);
  
  // Enable touch handling on scene node
  self.userInteractionEnabled = YES;
  
  
  // Get the window size
  CGSize size = [[CCDirector sharedDirector] viewSize];
  
  // Get the scale Diff based on a 480 by 320 point width and height
  float _scaleDiffX = size.width / 480;
  float _scaleDiffY = size.height / 320;
  
  
  // Add a background for testing
  CCSprite *Background = (CCSprite *) [CCSprite spriteWithImageNamed:@"bg01.png"];
  
  // ** Scale node **
  
  // scale width
  if (size.width > 480){
    Background.scaleX = _scaleDiffX;
  }
  
  // scale height
  if (size.height > 320){
    Background.scaleY = _scaleDiffY;
  }
  
  // **
  
  Background.position = ccp(size.width/2,size.height/2);
  [self addChild:Background z:1];
  
  
  // Add a label to background itself as a child
  NSString *Str_Header = [NSString stringWithFormat:@"- CP Mess Project -"];
  CCLabelTTF *Label1 = [CCLabelTTF labelWithString:Str_Header fontName:@"OLNEY-LI" fontSize:20];
  Label1.horizontalAlignment = CCVerticalTextAlignmentCenter; // align the text to the center
  [Label1 setAnchorPoint:ccp(0.5f, 1.0)]; // set the anchor point in the middle/bottom of the label
  Label1.position = ccp(240,Background.contentSize.height - 6); // position it 6 pixels/points from the top of the background
  
  // by default text is white - let's give it a black outline
  Label1.outlineWidth = 1.0f; // change the value to change the width
  Label1.outlineColor = [CCColor colorWithRed:0.0 green:0.0 blue:0.0];
  
  // Add it to the background
  [Background addChild:Label1 z:2];
  
  // Add a footer label to the bottom of the image as a child
  CCLabelTTF *Label2 = [CCLabelTTF labelWithString:@"Test Scene" fontName:@"OLNEY-LI" fontSize:14];
  Label2.horizontalAlignment = CCVerticalTextAlignmentCenter; // align the text to the center
  [Label2 setAnchorPoint:ccp(0.5f, 0.0)]; // set the anchor point in the middle/bottom of the label
  Label2.position = ccp(240,6); // position it 6 pixels/points from the bottom of the background
  
  // by default text is white - let's give it a black outline
  Label2.outlineWidth = 0.5f; // change the value to change the width
  Label2.outlineColor = [CCColor colorWithRed:0.0 green:0.0 blue:0.0];
  
  // Add it to the background
  [Background addChild:Label2 z:2];
  
  // done
  return self;
}

@end
