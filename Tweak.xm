/**
 * No iBlank Shadows - does exactly that.
 *
 * By Ad@m <http://hbang.ws>
 * Licensed under the GPL license <http://hbang.ws/s/gpl>
 */

@interface SBIcon : NSObject
-(NSString *)displayName;
@end

@interface SBIconView : UIView
-(void)setShadowsHidden:(BOOL)hidden;
@end

%hook SBIconViewMap
-(void)_addIconView:(SBIconView *)iconView forIcon:(SBIcon *)icon {
	%orig;
	if ([[icon displayName] isEqualToString:@""]) {
		[iconView setShadowsHidden:YES];
	}
}
%end
