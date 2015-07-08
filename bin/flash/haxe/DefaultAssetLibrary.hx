package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Preloader;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.text.Font;
import lime.utils.ByteArray;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if flash
		
		className.set ("assets/fonts/Oxygen-Bold.ttf", __ASSET__assets_fonts_oxygen_bold_ttf);
		type.set ("assets/fonts/Oxygen-Bold.ttf", AssetType.FONT);
		className.set ("assets/fonts/Oxygen.ttf", __ASSET__assets_fonts_oxygen_ttf);
		type.set ("assets/fonts/Oxygen.ttf", AssetType.FONT);
		className.set ("assets/styles/default/circle.png", __ASSET__assets_styles_default_circle_png);
		type.set ("assets/styles/default/circle.png", AssetType.IMAGE);
		className.set ("assets/styles/default/collapse.png", __ASSET__assets_styles_default_collapse_png);
		type.set ("assets/styles/default/collapse.png", AssetType.IMAGE);
		className.set ("assets/styles/default/cross.png", __ASSET__assets_styles_default_cross_png);
		type.set ("assets/styles/default/cross.png", AssetType.IMAGE);
		className.set ("assets/styles/default/expand.png", __ASSET__assets_styles_default_expand_png);
		type.set ("assets/styles/default/expand.png", AssetType.IMAGE);
		className.set ("assets/styles/default/up_down.png", __ASSET__assets_styles_default_up_down_png);
		type.set ("assets/styles/default/up_down.png", AssetType.IMAGE);
		className.set ("assets/styles/gradient/arrow_down.png", __ASSET__assets_styles_gradient_arrow_down_png);
		type.set ("assets/styles/gradient/arrow_down.png", AssetType.IMAGE);
		className.set ("assets/styles/gradient/arrow_down_dark.png", __ASSET__assets_styles_gradient_arrow_down_dark_png);
		type.set ("assets/styles/gradient/arrow_down_dark.png", AssetType.IMAGE);
		className.set ("assets/styles/gradient/arrow_down_disabled.png", __ASSET__assets_styles_gradient_arrow_down_disabled_png);
		type.set ("assets/styles/gradient/arrow_down_disabled.png", AssetType.IMAGE);
		className.set ("assets/styles/gradient/arrow_left.png", __ASSET__assets_styles_gradient_arrow_left_png);
		type.set ("assets/styles/gradient/arrow_left.png", AssetType.IMAGE);
		className.set ("assets/styles/gradient/arrow_left_disabled.png", __ASSET__assets_styles_gradient_arrow_left_disabled_png);
		type.set ("assets/styles/gradient/arrow_left_disabled.png", AssetType.IMAGE);
		className.set ("assets/styles/gradient/arrow_right.png", __ASSET__assets_styles_gradient_arrow_right_png);
		type.set ("assets/styles/gradient/arrow_right.png", AssetType.IMAGE);
		className.set ("assets/styles/gradient/arrow_right2.png", __ASSET__assets_styles_gradient_arrow_right2_png);
		type.set ("assets/styles/gradient/arrow_right2.png", AssetType.IMAGE);
		className.set ("assets/styles/gradient/arrow_right_dark.png", __ASSET__assets_styles_gradient_arrow_right_dark_png);
		type.set ("assets/styles/gradient/arrow_right_dark.png", AssetType.IMAGE);
		className.set ("assets/styles/gradient/arrow_right_disabled.png", __ASSET__assets_styles_gradient_arrow_right_disabled_png);
		type.set ("assets/styles/gradient/arrow_right_disabled.png", AssetType.IMAGE);
		className.set ("assets/styles/gradient/arrow_up.png", __ASSET__assets_styles_gradient_arrow_up_png);
		type.set ("assets/styles/gradient/arrow_up.png", AssetType.IMAGE);
		className.set ("assets/styles/gradient/arrow_up_disabled.png", __ASSET__assets_styles_gradient_arrow_up_disabled_png);
		type.set ("assets/styles/gradient/arrow_up_disabled.png", AssetType.IMAGE);
		className.set ("assets/styles/gradient/circle_dark.png", __ASSET__assets_styles_gradient_circle_dark_png);
		type.set ("assets/styles/gradient/circle_dark.png", AssetType.IMAGE);
		className.set ("assets/styles/gradient/cross_dark.png", __ASSET__assets_styles_gradient_cross_dark_png);
		type.set ("assets/styles/gradient/cross_dark.png", AssetType.IMAGE);
		className.set ("assets/styles/gradient/cross_dark_disabled.png", __ASSET__assets_styles_gradient_cross_dark_disabled_png);
		type.set ("assets/styles/gradient/cross_dark_disabled.png", AssetType.IMAGE);
		className.set ("assets/styles/gradient/cross_light_small.png", __ASSET__assets_styles_gradient_cross_light_small_png);
		type.set ("assets/styles/gradient/cross_light_small.png", AssetType.IMAGE);
		className.set ("assets/styles/gradient/gradient.css", __ASSET__assets_styles_gradient_gradient_css);
		type.set ("assets/styles/gradient/gradient.css", AssetType.TEXT);
		className.set ("assets/styles/gradient/gradient.min.css", __ASSET__assets_styles_gradient_gradient_min_css);
		type.set ("assets/styles/gradient/gradient.min.css", AssetType.TEXT);
		className.set ("assets/styles/gradient/gradient_mobile.css", __ASSET__assets_styles_gradient_gradient_mobile_css);
		type.set ("assets/styles/gradient/gradient_mobile.css", AssetType.TEXT);
		className.set ("assets/styles/gradient/gradient_mobile.min.css", __ASSET__assets_styles_gradient_gradient_mobile_min_css);
		type.set ("assets/styles/gradient/gradient_mobile.min.css", AssetType.TEXT);
		className.set ("assets/styles/gradient/gripper_horizontal.png", __ASSET__assets_styles_gradient_gripper_horizontal_png);
		type.set ("assets/styles/gradient/gripper_horizontal.png", AssetType.IMAGE);
		className.set ("assets/styles/gradient/gripper_horizontal_disabled.png", __ASSET__assets_styles_gradient_gripper_horizontal_disabled_png);
		type.set ("assets/styles/gradient/gripper_horizontal_disabled.png", AssetType.IMAGE);
		className.set ("assets/styles/gradient/gripper_vertical.png", __ASSET__assets_styles_gradient_gripper_vertical_png);
		type.set ("assets/styles/gradient/gripper_vertical.png", AssetType.IMAGE);
		className.set ("assets/styles/gradient/gripper_vertical_disabled.png", __ASSET__assets_styles_gradient_gripper_vertical_disabled_png);
		type.set ("assets/styles/gradient/gripper_vertical_disabled.png", AssetType.IMAGE);
		className.set ("assets/styles/gradient/hsplitter_gripper.png", __ASSET__assets_styles_gradient_hsplitter_gripper_png);
		type.set ("assets/styles/gradient/hsplitter_gripper.png", AssetType.IMAGE);
		className.set ("assets/styles/gradient/vsplitter_gripper.png", __ASSET__assets_styles_gradient_vsplitter_gripper_png);
		type.set ("assets/styles/gradient/vsplitter_gripper.png", AssetType.IMAGE);
		className.set ("assets/styles/windows/accordion.css", __ASSET__assets_styles_windows_accordion_css);
		type.set ("assets/styles/windows/accordion.css", AssetType.TEXT);
		className.set ("assets/styles/windows/accordion.min.css", __ASSET__assets_styles_windows_accordion_min_css);
		type.set ("assets/styles/windows/accordion.min.css", AssetType.TEXT);
		className.set ("assets/styles/windows/button.png", __ASSET__assets_styles_windows_button_png);
		type.set ("assets/styles/windows/button.png", AssetType.IMAGE);
		className.set ("assets/styles/windows/buttons.css", __ASSET__assets_styles_windows_buttons_css);
		type.set ("assets/styles/windows/buttons.css", AssetType.TEXT);
		className.set ("assets/styles/windows/buttons.min.css", __ASSET__assets_styles_windows_buttons_min_css);
		type.set ("assets/styles/windows/buttons.min.css", AssetType.TEXT);
		className.set ("assets/styles/windows/calendar.css", __ASSET__assets_styles_windows_calendar_css);
		type.set ("assets/styles/windows/calendar.css", AssetType.TEXT);
		className.set ("assets/styles/windows/checkbox.png", __ASSET__assets_styles_windows_checkbox_png);
		type.set ("assets/styles/windows/checkbox.png", AssetType.IMAGE);
		className.set ("assets/styles/windows/container.png", __ASSET__assets_styles_windows_container_png);
		type.set ("assets/styles/windows/container.png", AssetType.IMAGE);
		className.set ("assets/styles/windows/glyphs/down_arrow.png", __ASSET__assets_styles_windows_glyphs_down_arrow_png);
		type.set ("assets/styles/windows/glyphs/down_arrow.png", AssetType.IMAGE);
		className.set ("assets/styles/windows/glyphs/hscroll_thumb_gripper_down.png", __ASSET__assets_styles_windows_glyphs_hscroll_thumb_gripper_down_png);
		type.set ("assets/styles/windows/glyphs/hscroll_thumb_gripper_down.png", AssetType.IMAGE);
		className.set ("assets/styles/windows/glyphs/hscroll_thumb_gripper_over.png", __ASSET__assets_styles_windows_glyphs_hscroll_thumb_gripper_over_png);
		type.set ("assets/styles/windows/glyphs/hscroll_thumb_gripper_over.png", AssetType.IMAGE);
		className.set ("assets/styles/windows/glyphs/hscroll_thumb_gripper_up.png", __ASSET__assets_styles_windows_glyphs_hscroll_thumb_gripper_up_png);
		type.set ("assets/styles/windows/glyphs/hscroll_thumb_gripper_up.png", AssetType.IMAGE);
		className.set ("assets/styles/windows/glyphs/left_arrow.png", __ASSET__assets_styles_windows_glyphs_left_arrow_png);
		type.set ("assets/styles/windows/glyphs/left_arrow.png", AssetType.IMAGE);
		className.set ("assets/styles/windows/glyphs/right_arrow.png", __ASSET__assets_styles_windows_glyphs_right_arrow_png);
		type.set ("assets/styles/windows/glyphs/right_arrow.png", AssetType.IMAGE);
		className.set ("assets/styles/windows/glyphs/up_arrow.png", __ASSET__assets_styles_windows_glyphs_up_arrow_png);
		type.set ("assets/styles/windows/glyphs/up_arrow.png", AssetType.IMAGE);
		className.set ("assets/styles/windows/glyphs/vscroll_thumb_gripper_down.png", __ASSET__assets_styles_windows_glyphs_vscroll_thumb_gripper_down_png);
		type.set ("assets/styles/windows/glyphs/vscroll_thumb_gripper_down.png", AssetType.IMAGE);
		className.set ("assets/styles/windows/glyphs/vscroll_thumb_gripper_over.png", __ASSET__assets_styles_windows_glyphs_vscroll_thumb_gripper_over_png);
		type.set ("assets/styles/windows/glyphs/vscroll_thumb_gripper_over.png", AssetType.IMAGE);
		className.set ("assets/styles/windows/glyphs/vscroll_thumb_gripper_up.png", __ASSET__assets_styles_windows_glyphs_vscroll_thumb_gripper_up_png);
		type.set ("assets/styles/windows/glyphs/vscroll_thumb_gripper_up.png", AssetType.IMAGE);
		className.set ("assets/styles/windows/hprogress.png", __ASSET__assets_styles_windows_hprogress_png);
		type.set ("assets/styles/windows/hprogress.png", AssetType.IMAGE);
		className.set ("assets/styles/windows/hscroll.png", __ASSET__assets_styles_windows_hscroll_png);
		type.set ("assets/styles/windows/hscroll.png", AssetType.IMAGE);
		className.set ("assets/styles/windows/listview.css", __ASSET__assets_styles_windows_listview_css);
		type.set ("assets/styles/windows/listview.css", AssetType.TEXT);
		className.set ("assets/styles/windows/listview.min.css", __ASSET__assets_styles_windows_listview_min_css);
		type.set ("assets/styles/windows/listview.min.css", AssetType.TEXT);
		className.set ("assets/styles/windows/listview.png", __ASSET__assets_styles_windows_listview_png);
		type.set ("assets/styles/windows/listview.png", AssetType.IMAGE);
		className.set ("assets/styles/windows/menus.css", __ASSET__assets_styles_windows_menus_css);
		type.set ("assets/styles/windows/menus.css", AssetType.TEXT);
		className.set ("assets/styles/windows/optionbox.png", __ASSET__assets_styles_windows_optionbox_png);
		type.set ("assets/styles/windows/optionbox.png", AssetType.IMAGE);
		className.set ("assets/styles/windows/popup.png", __ASSET__assets_styles_windows_popup_png);
		type.set ("assets/styles/windows/popup.png", AssetType.IMAGE);
		className.set ("assets/styles/windows/popups.css", __ASSET__assets_styles_windows_popups_css);
		type.set ("assets/styles/windows/popups.css", AssetType.TEXT);
		className.set ("assets/styles/windows/rtf.css", __ASSET__assets_styles_windows_rtf_css);
		type.set ("assets/styles/windows/rtf.css", AssetType.TEXT);
		className.set ("assets/styles/windows/scrolls.css", __ASSET__assets_styles_windows_scrolls_css);
		type.set ("assets/styles/windows/scrolls.css", AssetType.TEXT);
		className.set ("assets/styles/windows/scrolls.min.css", __ASSET__assets_styles_windows_scrolls_min_css);
		type.set ("assets/styles/windows/scrolls.min.css", AssetType.TEXT);
		className.set ("assets/styles/windows/sliders.css", __ASSET__assets_styles_windows_sliders_css);
		type.set ("assets/styles/windows/sliders.css", AssetType.TEXT);
		className.set ("assets/styles/windows/tab.png", __ASSET__assets_styles_windows_tab_png);
		type.set ("assets/styles/windows/tab.png", AssetType.IMAGE);
		className.set ("assets/styles/windows/tabs.css", __ASSET__assets_styles_windows_tabs_css);
		type.set ("assets/styles/windows/tabs.css", AssetType.TEXT);
		className.set ("assets/styles/windows/textinput.png", __ASSET__assets_styles_windows_textinput_png);
		type.set ("assets/styles/windows/textinput.png", AssetType.IMAGE);
		className.set ("assets/styles/windows/vprogress.png", __ASSET__assets_styles_windows_vprogress_png);
		type.set ("assets/styles/windows/vprogress.png", AssetType.IMAGE);
		className.set ("assets/styles/windows/vscroll.png", __ASSET__assets_styles_windows_vscroll_png);
		type.set ("assets/styles/windows/vscroll.png", AssetType.IMAGE);
		className.set ("assets/styles/windows/windows.css", __ASSET__assets_styles_windows_windows_css);
		type.set ("assets/styles/windows/windows.css", AssetType.TEXT);
		className.set ("styles/default/circle.png", __ASSET__styles_default_circle_png);
		type.set ("styles/default/circle.png", AssetType.IMAGE);
		className.set ("styles/default/collapse.png", __ASSET__styles_default_collapse_png);
		type.set ("styles/default/collapse.png", AssetType.IMAGE);
		className.set ("styles/default/cross.png", __ASSET__styles_default_cross_png);
		type.set ("styles/default/cross.png", AssetType.IMAGE);
		className.set ("styles/default/expand.png", __ASSET__styles_default_expand_png);
		type.set ("styles/default/expand.png", AssetType.IMAGE);
		className.set ("styles/default/up_down.png", __ASSET__styles_default_up_down_png);
		type.set ("styles/default/up_down.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_down.png", __ASSET__styles_gradient_arrow_down_png);
		type.set ("styles/gradient/arrow_down.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_down_dark.png", __ASSET__styles_gradient_arrow_down_dark_png);
		type.set ("styles/gradient/arrow_down_dark.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_down_disabled.png", __ASSET__styles_gradient_arrow_down_disabled_png);
		type.set ("styles/gradient/arrow_down_disabled.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_left.png", __ASSET__styles_gradient_arrow_left_png);
		type.set ("styles/gradient/arrow_left.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_left_disabled.png", __ASSET__styles_gradient_arrow_left_disabled_png);
		type.set ("styles/gradient/arrow_left_disabled.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_right.png", __ASSET__styles_gradient_arrow_right_png);
		type.set ("styles/gradient/arrow_right.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_right2.png", __ASSET__styles_gradient_arrow_right2_png);
		type.set ("styles/gradient/arrow_right2.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_right_dark.png", __ASSET__styles_gradient_arrow_right_dark_png);
		type.set ("styles/gradient/arrow_right_dark.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_right_disabled.png", __ASSET__styles_gradient_arrow_right_disabled_png);
		type.set ("styles/gradient/arrow_right_disabled.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_up.png", __ASSET__styles_gradient_arrow_up_png);
		type.set ("styles/gradient/arrow_up.png", AssetType.IMAGE);
		className.set ("styles/gradient/arrow_up_disabled.png", __ASSET__styles_gradient_arrow_up_disabled_png);
		type.set ("styles/gradient/arrow_up_disabled.png", AssetType.IMAGE);
		className.set ("styles/gradient/circle_dark.png", __ASSET__styles_gradient_circle_dark_png);
		type.set ("styles/gradient/circle_dark.png", AssetType.IMAGE);
		className.set ("styles/gradient/cross_dark.png", __ASSET__styles_gradient_cross_dark_png);
		type.set ("styles/gradient/cross_dark.png", AssetType.IMAGE);
		className.set ("styles/gradient/cross_dark_disabled.png", __ASSET__styles_gradient_cross_dark_disabled_png);
		type.set ("styles/gradient/cross_dark_disabled.png", AssetType.IMAGE);
		className.set ("styles/gradient/cross_light_small.png", __ASSET__styles_gradient_cross_light_small_png);
		type.set ("styles/gradient/cross_light_small.png", AssetType.IMAGE);
		className.set ("styles/gradient/gradient.css", __ASSET__styles_gradient_gradient_css);
		type.set ("styles/gradient/gradient.css", AssetType.TEXT);
		className.set ("styles/gradient/gradient.min.css", __ASSET__styles_gradient_gradient_min_css);
		type.set ("styles/gradient/gradient.min.css", AssetType.TEXT);
		className.set ("styles/gradient/gradient_mobile.css", __ASSET__styles_gradient_gradient_mobile_css);
		type.set ("styles/gradient/gradient_mobile.css", AssetType.TEXT);
		className.set ("styles/gradient/gradient_mobile.min.css", __ASSET__styles_gradient_gradient_mobile_min_css);
		type.set ("styles/gradient/gradient_mobile.min.css", AssetType.TEXT);
		className.set ("styles/gradient/gripper_horizontal.png", __ASSET__styles_gradient_gripper_horizontal_png);
		type.set ("styles/gradient/gripper_horizontal.png", AssetType.IMAGE);
		className.set ("styles/gradient/gripper_horizontal_disabled.png", __ASSET__styles_gradient_gripper_horizontal_disabled_png);
		type.set ("styles/gradient/gripper_horizontal_disabled.png", AssetType.IMAGE);
		className.set ("styles/gradient/gripper_vertical.png", __ASSET__styles_gradient_gripper_vertical_png);
		type.set ("styles/gradient/gripper_vertical.png", AssetType.IMAGE);
		className.set ("styles/gradient/gripper_vertical_disabled.png", __ASSET__styles_gradient_gripper_vertical_disabled_png);
		type.set ("styles/gradient/gripper_vertical_disabled.png", AssetType.IMAGE);
		className.set ("styles/gradient/hsplitter_gripper.png", __ASSET__styles_gradient_hsplitter_gripper_png);
		type.set ("styles/gradient/hsplitter_gripper.png", AssetType.IMAGE);
		className.set ("styles/gradient/vsplitter_gripper.png", __ASSET__styles_gradient_vsplitter_gripper_png);
		type.set ("styles/gradient/vsplitter_gripper.png", AssetType.IMAGE);
		className.set ("styles/windows/accordion.css", __ASSET__styles_windows_accordion_css);
		type.set ("styles/windows/accordion.css", AssetType.TEXT);
		className.set ("styles/windows/accordion.min.css", __ASSET__styles_windows_accordion_min_css);
		type.set ("styles/windows/accordion.min.css", AssetType.TEXT);
		className.set ("styles/windows/button.png", __ASSET__styles_windows_button_png);
		type.set ("styles/windows/button.png", AssetType.IMAGE);
		className.set ("styles/windows/buttons.css", __ASSET__styles_windows_buttons_css);
		type.set ("styles/windows/buttons.css", AssetType.TEXT);
		className.set ("styles/windows/buttons.min.css", __ASSET__styles_windows_buttons_min_css);
		type.set ("styles/windows/buttons.min.css", AssetType.TEXT);
		className.set ("styles/windows/calendar.css", __ASSET__styles_windows_calendar_css);
		type.set ("styles/windows/calendar.css", AssetType.TEXT);
		className.set ("styles/windows/checkbox.png", __ASSET__styles_windows_checkbox_png);
		type.set ("styles/windows/checkbox.png", AssetType.IMAGE);
		className.set ("styles/windows/container.png", __ASSET__styles_windows_container_png);
		type.set ("styles/windows/container.png", AssetType.IMAGE);
		className.set ("styles/windows/glyphs/down_arrow.png", __ASSET__styles_windows_glyphs_down_arrow_png);
		type.set ("styles/windows/glyphs/down_arrow.png", AssetType.IMAGE);
		className.set ("styles/windows/glyphs/hscroll_thumb_gripper_down.png", __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_down_png);
		type.set ("styles/windows/glyphs/hscroll_thumb_gripper_down.png", AssetType.IMAGE);
		className.set ("styles/windows/glyphs/hscroll_thumb_gripper_over.png", __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_over_png);
		type.set ("styles/windows/glyphs/hscroll_thumb_gripper_over.png", AssetType.IMAGE);
		className.set ("styles/windows/glyphs/hscroll_thumb_gripper_up.png", __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_up_png);
		type.set ("styles/windows/glyphs/hscroll_thumb_gripper_up.png", AssetType.IMAGE);
		className.set ("styles/windows/glyphs/left_arrow.png", __ASSET__styles_windows_glyphs_left_arrow_png);
		type.set ("styles/windows/glyphs/left_arrow.png", AssetType.IMAGE);
		className.set ("styles/windows/glyphs/right_arrow.png", __ASSET__styles_windows_glyphs_right_arrow_png);
		type.set ("styles/windows/glyphs/right_arrow.png", AssetType.IMAGE);
		className.set ("styles/windows/glyphs/up_arrow.png", __ASSET__styles_windows_glyphs_up_arrow_png);
		type.set ("styles/windows/glyphs/up_arrow.png", AssetType.IMAGE);
		className.set ("styles/windows/glyphs/vscroll_thumb_gripper_down.png", __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_down_png);
		type.set ("styles/windows/glyphs/vscroll_thumb_gripper_down.png", AssetType.IMAGE);
		className.set ("styles/windows/glyphs/vscroll_thumb_gripper_over.png", __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_over_png);
		type.set ("styles/windows/glyphs/vscroll_thumb_gripper_over.png", AssetType.IMAGE);
		className.set ("styles/windows/glyphs/vscroll_thumb_gripper_up.png", __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_up_png);
		type.set ("styles/windows/glyphs/vscroll_thumb_gripper_up.png", AssetType.IMAGE);
		className.set ("styles/windows/hprogress.png", __ASSET__styles_windows_hprogress_png);
		type.set ("styles/windows/hprogress.png", AssetType.IMAGE);
		className.set ("styles/windows/hscroll.png", __ASSET__styles_windows_hscroll_png);
		type.set ("styles/windows/hscroll.png", AssetType.IMAGE);
		className.set ("styles/windows/listview.css", __ASSET__styles_windows_listview_css);
		type.set ("styles/windows/listview.css", AssetType.TEXT);
		className.set ("styles/windows/listview.min.css", __ASSET__styles_windows_listview_min_css);
		type.set ("styles/windows/listview.min.css", AssetType.TEXT);
		className.set ("styles/windows/listview.png", __ASSET__styles_windows_listview_png);
		type.set ("styles/windows/listview.png", AssetType.IMAGE);
		className.set ("styles/windows/menus.css", __ASSET__styles_windows_menus_css);
		type.set ("styles/windows/menus.css", AssetType.TEXT);
		className.set ("styles/windows/optionbox.png", __ASSET__styles_windows_optionbox_png);
		type.set ("styles/windows/optionbox.png", AssetType.IMAGE);
		className.set ("styles/windows/popup.png", __ASSET__styles_windows_popup_png);
		type.set ("styles/windows/popup.png", AssetType.IMAGE);
		className.set ("styles/windows/popups.css", __ASSET__styles_windows_popups_css);
		type.set ("styles/windows/popups.css", AssetType.TEXT);
		className.set ("styles/windows/rtf.css", __ASSET__styles_windows_rtf_css);
		type.set ("styles/windows/rtf.css", AssetType.TEXT);
		className.set ("styles/windows/scrolls.css", __ASSET__styles_windows_scrolls_css);
		type.set ("styles/windows/scrolls.css", AssetType.TEXT);
		className.set ("styles/windows/scrolls.min.css", __ASSET__styles_windows_scrolls_min_css);
		type.set ("styles/windows/scrolls.min.css", AssetType.TEXT);
		className.set ("styles/windows/sliders.css", __ASSET__styles_windows_sliders_css);
		type.set ("styles/windows/sliders.css", AssetType.TEXT);
		className.set ("styles/windows/tab.png", __ASSET__styles_windows_tab_png);
		type.set ("styles/windows/tab.png", AssetType.IMAGE);
		className.set ("styles/windows/tabs.css", __ASSET__styles_windows_tabs_css);
		type.set ("styles/windows/tabs.css", AssetType.TEXT);
		className.set ("styles/windows/textinput.png", __ASSET__styles_windows_textinput_png);
		type.set ("styles/windows/textinput.png", AssetType.IMAGE);
		className.set ("styles/windows/vprogress.png", __ASSET__styles_windows_vprogress_png);
		type.set ("styles/windows/vprogress.png", AssetType.IMAGE);
		className.set ("styles/windows/vscroll.png", __ASSET__styles_windows_vscroll_png);
		type.set ("styles/windows/vscroll.png", AssetType.IMAGE);
		className.set ("styles/windows/windows.css", __ASSET__styles_windows_windows_css);
		type.set ("styles/windows/windows.css", AssetType.TEXT);
		className.set ("fonts/Oxygen-Bold.ttf", __ASSET__fonts_oxygen_bold_ttf);
		type.set ("fonts/Oxygen-Bold.ttf", AssetType.FONT);
		className.set ("fonts/Oxygen.ttf", __ASSET__fonts_oxygen_ttf);
		type.set ("fonts/Oxygen.ttf", AssetType.FONT);
		className.set ("libraries/swfsrc/swfsrc.swf", __ASSET__libraries_swfsrc_swfsrc_swf);
		type.set ("libraries/swfsrc/swfsrc.swf", AssetType.BINARY);
		className.set ("libraries/swfsrc.json", __ASSET__libraries_swfsrc_json);
		type.set ("libraries/swfsrc.json", AssetType.TEXT);
		
		
		#elseif html5
		
		var id;
		id = "assets/fonts/Oxygen-Bold.ttf";
		className.set (id, __ASSET__assets_fonts_oxygen_bold_ttf);
		
		type.set (id, AssetType.FONT);
		id = "assets/fonts/Oxygen.ttf";
		className.set (id, __ASSET__assets_fonts_oxygen_ttf);
		
		type.set (id, AssetType.FONT);
		id = "assets/styles/default/circle.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/styles/default/collapse.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/styles/default/cross.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/styles/default/expand.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/styles/default/up_down.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/styles/gradient/arrow_down.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/styles/gradient/arrow_down_dark.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/styles/gradient/arrow_down_disabled.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/styles/gradient/arrow_left.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/styles/gradient/arrow_left_disabled.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/styles/gradient/arrow_right.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/styles/gradient/arrow_right2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/styles/gradient/arrow_right_dark.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/styles/gradient/arrow_right_disabled.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/styles/gradient/arrow_up.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/styles/gradient/arrow_up_disabled.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/styles/gradient/circle_dark.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/styles/gradient/cross_dark.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/styles/gradient/cross_dark_disabled.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/styles/gradient/cross_light_small.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/styles/gradient/gradient.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/styles/gradient/gradient.min.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/styles/gradient/gradient_mobile.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/styles/gradient/gradient_mobile.min.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/styles/gradient/gripper_horizontal.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/styles/gradient/gripper_horizontal_disabled.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/styles/gradient/gripper_vertical.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/styles/gradient/gripper_vertical_disabled.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/styles/gradient/hsplitter_gripper.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/styles/gradient/vsplitter_gripper.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/styles/windows/accordion.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/styles/windows/accordion.min.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/styles/windows/button.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/styles/windows/buttons.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/styles/windows/buttons.min.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/styles/windows/calendar.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/styles/windows/checkbox.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/styles/windows/container.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/styles/windows/glyphs/down_arrow.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/styles/windows/glyphs/hscroll_thumb_gripper_down.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/styles/windows/glyphs/hscroll_thumb_gripper_over.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/styles/windows/glyphs/hscroll_thumb_gripper_up.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/styles/windows/glyphs/left_arrow.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/styles/windows/glyphs/right_arrow.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/styles/windows/glyphs/up_arrow.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/styles/windows/glyphs/vscroll_thumb_gripper_down.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/styles/windows/glyphs/vscroll_thumb_gripper_over.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/styles/windows/glyphs/vscroll_thumb_gripper_up.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/styles/windows/hprogress.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/styles/windows/hscroll.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/styles/windows/listview.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/styles/windows/listview.min.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/styles/windows/listview.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/styles/windows/menus.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/styles/windows/optionbox.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/styles/windows/popup.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/styles/windows/popups.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/styles/windows/rtf.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/styles/windows/scrolls.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/styles/windows/scrolls.min.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/styles/windows/sliders.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/styles/windows/tab.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/styles/windows/tabs.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/styles/windows/textinput.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/styles/windows/vprogress.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/styles/windows/vscroll.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/styles/windows/windows.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/default/circle.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/default/collapse.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/default/cross.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/default/expand.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/default/up_down.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_down.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_down_dark.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_down_disabled.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_left.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_left_disabled.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_right.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_right2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_right_dark.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_right_disabled.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_up.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/arrow_up_disabled.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/circle_dark.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/cross_dark.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/cross_dark_disabled.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/cross_light_small.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/gradient.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/gradient/gradient.min.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/gradient/gradient_mobile.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/gradient/gradient_mobile.min.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/gradient/gripper_horizontal.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/gripper_horizontal_disabled.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/gripper_vertical.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/gripper_vertical_disabled.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/hsplitter_gripper.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/gradient/vsplitter_gripper.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/accordion.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/windows/accordion.min.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/windows/button.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/buttons.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/windows/buttons.min.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/windows/calendar.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/windows/checkbox.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/container.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/glyphs/down_arrow.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/glyphs/hscroll_thumb_gripper_down.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/glyphs/hscroll_thumb_gripper_over.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/glyphs/hscroll_thumb_gripper_up.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/glyphs/left_arrow.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/glyphs/right_arrow.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/glyphs/up_arrow.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/glyphs/vscroll_thumb_gripper_down.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/glyphs/vscroll_thumb_gripper_over.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/glyphs/vscroll_thumb_gripper_up.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/hprogress.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/hscroll.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/listview.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/windows/listview.min.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/windows/listview.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/menus.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/windows/optionbox.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/popup.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/popups.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/windows/rtf.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/windows/scrolls.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/windows/scrolls.min.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/windows/sliders.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/windows/tab.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/tabs.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "styles/windows/textinput.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/vprogress.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/vscroll.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "styles/windows/windows.css";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "fonts/Oxygen-Bold.ttf";
		className.set (id, __ASSET__fonts_oxygen_bold_ttf);
		
		type.set (id, AssetType.FONT);
		id = "fonts/Oxygen.ttf";
		className.set (id, __ASSET__fonts_oxygen_ttf);
		
		type.set (id, AssetType.FONT);
		id = "libraries/swfsrc/swfsrc.swf";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "libraries/swfsrc.json";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		
		
		var assetsPrefix = ApplicationMain.config.assetsPrefix;
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if openfl
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_oxygen_bold_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_oxygen_ttf);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__fonts_oxygen_bold_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__fonts_oxygen_ttf);
		
		
		
		#end
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("assets/fonts/Oxygen-Bold.ttf", __ASSET__assets_fonts_oxygen_bold_ttf);
		type.set ("assets/fonts/Oxygen-Bold.ttf", AssetType.FONT);
		
		className.set ("assets/fonts/Oxygen.ttf", __ASSET__assets_fonts_oxygen_ttf);
		type.set ("assets/fonts/Oxygen.ttf", AssetType.FONT);
		
		className.set ("assets/styles/default/circle.png", __ASSET__assets_styles_default_circle_png);
		type.set ("assets/styles/default/circle.png", AssetType.IMAGE);
		
		className.set ("assets/styles/default/collapse.png", __ASSET__assets_styles_default_collapse_png);
		type.set ("assets/styles/default/collapse.png", AssetType.IMAGE);
		
		className.set ("assets/styles/default/cross.png", __ASSET__assets_styles_default_cross_png);
		type.set ("assets/styles/default/cross.png", AssetType.IMAGE);
		
		className.set ("assets/styles/default/expand.png", __ASSET__assets_styles_default_expand_png);
		type.set ("assets/styles/default/expand.png", AssetType.IMAGE);
		
		className.set ("assets/styles/default/up_down.png", __ASSET__assets_styles_default_up_down_png);
		type.set ("assets/styles/default/up_down.png", AssetType.IMAGE);
		
		className.set ("assets/styles/gradient/arrow_down.png", __ASSET__assets_styles_gradient_arrow_down_png);
		type.set ("assets/styles/gradient/arrow_down.png", AssetType.IMAGE);
		
		className.set ("assets/styles/gradient/arrow_down_dark.png", __ASSET__assets_styles_gradient_arrow_down_dark_png);
		type.set ("assets/styles/gradient/arrow_down_dark.png", AssetType.IMAGE);
		
		className.set ("assets/styles/gradient/arrow_down_disabled.png", __ASSET__assets_styles_gradient_arrow_down_disabled_png);
		type.set ("assets/styles/gradient/arrow_down_disabled.png", AssetType.IMAGE);
		
		className.set ("assets/styles/gradient/arrow_left.png", __ASSET__assets_styles_gradient_arrow_left_png);
		type.set ("assets/styles/gradient/arrow_left.png", AssetType.IMAGE);
		
		className.set ("assets/styles/gradient/arrow_left_disabled.png", __ASSET__assets_styles_gradient_arrow_left_disabled_png);
		type.set ("assets/styles/gradient/arrow_left_disabled.png", AssetType.IMAGE);
		
		className.set ("assets/styles/gradient/arrow_right.png", __ASSET__assets_styles_gradient_arrow_right_png);
		type.set ("assets/styles/gradient/arrow_right.png", AssetType.IMAGE);
		
		className.set ("assets/styles/gradient/arrow_right2.png", __ASSET__assets_styles_gradient_arrow_right2_png);
		type.set ("assets/styles/gradient/arrow_right2.png", AssetType.IMAGE);
		
		className.set ("assets/styles/gradient/arrow_right_dark.png", __ASSET__assets_styles_gradient_arrow_right_dark_png);
		type.set ("assets/styles/gradient/arrow_right_dark.png", AssetType.IMAGE);
		
		className.set ("assets/styles/gradient/arrow_right_disabled.png", __ASSET__assets_styles_gradient_arrow_right_disabled_png);
		type.set ("assets/styles/gradient/arrow_right_disabled.png", AssetType.IMAGE);
		
		className.set ("assets/styles/gradient/arrow_up.png", __ASSET__assets_styles_gradient_arrow_up_png);
		type.set ("assets/styles/gradient/arrow_up.png", AssetType.IMAGE);
		
		className.set ("assets/styles/gradient/arrow_up_disabled.png", __ASSET__assets_styles_gradient_arrow_up_disabled_png);
		type.set ("assets/styles/gradient/arrow_up_disabled.png", AssetType.IMAGE);
		
		className.set ("assets/styles/gradient/circle_dark.png", __ASSET__assets_styles_gradient_circle_dark_png);
		type.set ("assets/styles/gradient/circle_dark.png", AssetType.IMAGE);
		
		className.set ("assets/styles/gradient/cross_dark.png", __ASSET__assets_styles_gradient_cross_dark_png);
		type.set ("assets/styles/gradient/cross_dark.png", AssetType.IMAGE);
		
		className.set ("assets/styles/gradient/cross_dark_disabled.png", __ASSET__assets_styles_gradient_cross_dark_disabled_png);
		type.set ("assets/styles/gradient/cross_dark_disabled.png", AssetType.IMAGE);
		
		className.set ("assets/styles/gradient/cross_light_small.png", __ASSET__assets_styles_gradient_cross_light_small_png);
		type.set ("assets/styles/gradient/cross_light_small.png", AssetType.IMAGE);
		
		className.set ("assets/styles/gradient/gradient.css", __ASSET__assets_styles_gradient_gradient_css);
		type.set ("assets/styles/gradient/gradient.css", AssetType.TEXT);
		
		className.set ("assets/styles/gradient/gradient.min.css", __ASSET__assets_styles_gradient_gradient_min_css);
		type.set ("assets/styles/gradient/gradient.min.css", AssetType.TEXT);
		
		className.set ("assets/styles/gradient/gradient_mobile.css", __ASSET__assets_styles_gradient_gradient_mobile_css);
		type.set ("assets/styles/gradient/gradient_mobile.css", AssetType.TEXT);
		
		className.set ("assets/styles/gradient/gradient_mobile.min.css", __ASSET__assets_styles_gradient_gradient_mobile_min_css);
		type.set ("assets/styles/gradient/gradient_mobile.min.css", AssetType.TEXT);
		
		className.set ("assets/styles/gradient/gripper_horizontal.png", __ASSET__assets_styles_gradient_gripper_horizontal_png);
		type.set ("assets/styles/gradient/gripper_horizontal.png", AssetType.IMAGE);
		
		className.set ("assets/styles/gradient/gripper_horizontal_disabled.png", __ASSET__assets_styles_gradient_gripper_horizontal_disabled_png);
		type.set ("assets/styles/gradient/gripper_horizontal_disabled.png", AssetType.IMAGE);
		
		className.set ("assets/styles/gradient/gripper_vertical.png", __ASSET__assets_styles_gradient_gripper_vertical_png);
		type.set ("assets/styles/gradient/gripper_vertical.png", AssetType.IMAGE);
		
		className.set ("assets/styles/gradient/gripper_vertical_disabled.png", __ASSET__assets_styles_gradient_gripper_vertical_disabled_png);
		type.set ("assets/styles/gradient/gripper_vertical_disabled.png", AssetType.IMAGE);
		
		className.set ("assets/styles/gradient/hsplitter_gripper.png", __ASSET__assets_styles_gradient_hsplitter_gripper_png);
		type.set ("assets/styles/gradient/hsplitter_gripper.png", AssetType.IMAGE);
		
		className.set ("assets/styles/gradient/vsplitter_gripper.png", __ASSET__assets_styles_gradient_vsplitter_gripper_png);
		type.set ("assets/styles/gradient/vsplitter_gripper.png", AssetType.IMAGE);
		
		className.set ("assets/styles/windows/accordion.css", __ASSET__assets_styles_windows_accordion_css);
		type.set ("assets/styles/windows/accordion.css", AssetType.TEXT);
		
		className.set ("assets/styles/windows/accordion.min.css", __ASSET__assets_styles_windows_accordion_min_css);
		type.set ("assets/styles/windows/accordion.min.css", AssetType.TEXT);
		
		className.set ("assets/styles/windows/button.png", __ASSET__assets_styles_windows_button_png);
		type.set ("assets/styles/windows/button.png", AssetType.IMAGE);
		
		className.set ("assets/styles/windows/buttons.css", __ASSET__assets_styles_windows_buttons_css);
		type.set ("assets/styles/windows/buttons.css", AssetType.TEXT);
		
		className.set ("assets/styles/windows/buttons.min.css", __ASSET__assets_styles_windows_buttons_min_css);
		type.set ("assets/styles/windows/buttons.min.css", AssetType.TEXT);
		
		className.set ("assets/styles/windows/calendar.css", __ASSET__assets_styles_windows_calendar_css);
		type.set ("assets/styles/windows/calendar.css", AssetType.TEXT);
		
		className.set ("assets/styles/windows/checkbox.png", __ASSET__assets_styles_windows_checkbox_png);
		type.set ("assets/styles/windows/checkbox.png", AssetType.IMAGE);
		
		className.set ("assets/styles/windows/container.png", __ASSET__assets_styles_windows_container_png);
		type.set ("assets/styles/windows/container.png", AssetType.IMAGE);
		
		className.set ("assets/styles/windows/glyphs/down_arrow.png", __ASSET__assets_styles_windows_glyphs_down_arrow_png);
		type.set ("assets/styles/windows/glyphs/down_arrow.png", AssetType.IMAGE);
		
		className.set ("assets/styles/windows/glyphs/hscroll_thumb_gripper_down.png", __ASSET__assets_styles_windows_glyphs_hscroll_thumb_gripper_down_png);
		type.set ("assets/styles/windows/glyphs/hscroll_thumb_gripper_down.png", AssetType.IMAGE);
		
		className.set ("assets/styles/windows/glyphs/hscroll_thumb_gripper_over.png", __ASSET__assets_styles_windows_glyphs_hscroll_thumb_gripper_over_png);
		type.set ("assets/styles/windows/glyphs/hscroll_thumb_gripper_over.png", AssetType.IMAGE);
		
		className.set ("assets/styles/windows/glyphs/hscroll_thumb_gripper_up.png", __ASSET__assets_styles_windows_glyphs_hscroll_thumb_gripper_up_png);
		type.set ("assets/styles/windows/glyphs/hscroll_thumb_gripper_up.png", AssetType.IMAGE);
		
		className.set ("assets/styles/windows/glyphs/left_arrow.png", __ASSET__assets_styles_windows_glyphs_left_arrow_png);
		type.set ("assets/styles/windows/glyphs/left_arrow.png", AssetType.IMAGE);
		
		className.set ("assets/styles/windows/glyphs/right_arrow.png", __ASSET__assets_styles_windows_glyphs_right_arrow_png);
		type.set ("assets/styles/windows/glyphs/right_arrow.png", AssetType.IMAGE);
		
		className.set ("assets/styles/windows/glyphs/up_arrow.png", __ASSET__assets_styles_windows_glyphs_up_arrow_png);
		type.set ("assets/styles/windows/glyphs/up_arrow.png", AssetType.IMAGE);
		
		className.set ("assets/styles/windows/glyphs/vscroll_thumb_gripper_down.png", __ASSET__assets_styles_windows_glyphs_vscroll_thumb_gripper_down_png);
		type.set ("assets/styles/windows/glyphs/vscroll_thumb_gripper_down.png", AssetType.IMAGE);
		
		className.set ("assets/styles/windows/glyphs/vscroll_thumb_gripper_over.png", __ASSET__assets_styles_windows_glyphs_vscroll_thumb_gripper_over_png);
		type.set ("assets/styles/windows/glyphs/vscroll_thumb_gripper_over.png", AssetType.IMAGE);
		
		className.set ("assets/styles/windows/glyphs/vscroll_thumb_gripper_up.png", __ASSET__assets_styles_windows_glyphs_vscroll_thumb_gripper_up_png);
		type.set ("assets/styles/windows/glyphs/vscroll_thumb_gripper_up.png", AssetType.IMAGE);
		
		className.set ("assets/styles/windows/hprogress.png", __ASSET__assets_styles_windows_hprogress_png);
		type.set ("assets/styles/windows/hprogress.png", AssetType.IMAGE);
		
		className.set ("assets/styles/windows/hscroll.png", __ASSET__assets_styles_windows_hscroll_png);
		type.set ("assets/styles/windows/hscroll.png", AssetType.IMAGE);
		
		className.set ("assets/styles/windows/listview.css", __ASSET__assets_styles_windows_listview_css);
		type.set ("assets/styles/windows/listview.css", AssetType.TEXT);
		
		className.set ("assets/styles/windows/listview.min.css", __ASSET__assets_styles_windows_listview_min_css);
		type.set ("assets/styles/windows/listview.min.css", AssetType.TEXT);
		
		className.set ("assets/styles/windows/listview.png", __ASSET__assets_styles_windows_listview_png);
		type.set ("assets/styles/windows/listview.png", AssetType.IMAGE);
		
		className.set ("assets/styles/windows/menus.css", __ASSET__assets_styles_windows_menus_css);
		type.set ("assets/styles/windows/menus.css", AssetType.TEXT);
		
		className.set ("assets/styles/windows/optionbox.png", __ASSET__assets_styles_windows_optionbox_png);
		type.set ("assets/styles/windows/optionbox.png", AssetType.IMAGE);
		
		className.set ("assets/styles/windows/popup.png", __ASSET__assets_styles_windows_popup_png);
		type.set ("assets/styles/windows/popup.png", AssetType.IMAGE);
		
		className.set ("assets/styles/windows/popups.css", __ASSET__assets_styles_windows_popups_css);
		type.set ("assets/styles/windows/popups.css", AssetType.TEXT);
		
		className.set ("assets/styles/windows/rtf.css", __ASSET__assets_styles_windows_rtf_css);
		type.set ("assets/styles/windows/rtf.css", AssetType.TEXT);
		
		className.set ("assets/styles/windows/scrolls.css", __ASSET__assets_styles_windows_scrolls_css);
		type.set ("assets/styles/windows/scrolls.css", AssetType.TEXT);
		
		className.set ("assets/styles/windows/scrolls.min.css", __ASSET__assets_styles_windows_scrolls_min_css);
		type.set ("assets/styles/windows/scrolls.min.css", AssetType.TEXT);
		
		className.set ("assets/styles/windows/sliders.css", __ASSET__assets_styles_windows_sliders_css);
		type.set ("assets/styles/windows/sliders.css", AssetType.TEXT);
		
		className.set ("assets/styles/windows/tab.png", __ASSET__assets_styles_windows_tab_png);
		type.set ("assets/styles/windows/tab.png", AssetType.IMAGE);
		
		className.set ("assets/styles/windows/tabs.css", __ASSET__assets_styles_windows_tabs_css);
		type.set ("assets/styles/windows/tabs.css", AssetType.TEXT);
		
		className.set ("assets/styles/windows/textinput.png", __ASSET__assets_styles_windows_textinput_png);
		type.set ("assets/styles/windows/textinput.png", AssetType.IMAGE);
		
		className.set ("assets/styles/windows/vprogress.png", __ASSET__assets_styles_windows_vprogress_png);
		type.set ("assets/styles/windows/vprogress.png", AssetType.IMAGE);
		
		className.set ("assets/styles/windows/vscroll.png", __ASSET__assets_styles_windows_vscroll_png);
		type.set ("assets/styles/windows/vscroll.png", AssetType.IMAGE);
		
		className.set ("assets/styles/windows/windows.css", __ASSET__assets_styles_windows_windows_css);
		type.set ("assets/styles/windows/windows.css", AssetType.TEXT);
		
		className.set ("styles/default/circle.png", __ASSET__styles_default_circle_png);
		type.set ("styles/default/circle.png", AssetType.IMAGE);
		
		className.set ("styles/default/collapse.png", __ASSET__styles_default_collapse_png);
		type.set ("styles/default/collapse.png", AssetType.IMAGE);
		
		className.set ("styles/default/cross.png", __ASSET__styles_default_cross_png);
		type.set ("styles/default/cross.png", AssetType.IMAGE);
		
		className.set ("styles/default/expand.png", __ASSET__styles_default_expand_png);
		type.set ("styles/default/expand.png", AssetType.IMAGE);
		
		className.set ("styles/default/up_down.png", __ASSET__styles_default_up_down_png);
		type.set ("styles/default/up_down.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_down.png", __ASSET__styles_gradient_arrow_down_png);
		type.set ("styles/gradient/arrow_down.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_down_dark.png", __ASSET__styles_gradient_arrow_down_dark_png);
		type.set ("styles/gradient/arrow_down_dark.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_down_disabled.png", __ASSET__styles_gradient_arrow_down_disabled_png);
		type.set ("styles/gradient/arrow_down_disabled.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_left.png", __ASSET__styles_gradient_arrow_left_png);
		type.set ("styles/gradient/arrow_left.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_left_disabled.png", __ASSET__styles_gradient_arrow_left_disabled_png);
		type.set ("styles/gradient/arrow_left_disabled.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_right.png", __ASSET__styles_gradient_arrow_right_png);
		type.set ("styles/gradient/arrow_right.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_right2.png", __ASSET__styles_gradient_arrow_right2_png);
		type.set ("styles/gradient/arrow_right2.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_right_dark.png", __ASSET__styles_gradient_arrow_right_dark_png);
		type.set ("styles/gradient/arrow_right_dark.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_right_disabled.png", __ASSET__styles_gradient_arrow_right_disabled_png);
		type.set ("styles/gradient/arrow_right_disabled.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_up.png", __ASSET__styles_gradient_arrow_up_png);
		type.set ("styles/gradient/arrow_up.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/arrow_up_disabled.png", __ASSET__styles_gradient_arrow_up_disabled_png);
		type.set ("styles/gradient/arrow_up_disabled.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/circle_dark.png", __ASSET__styles_gradient_circle_dark_png);
		type.set ("styles/gradient/circle_dark.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/cross_dark.png", __ASSET__styles_gradient_cross_dark_png);
		type.set ("styles/gradient/cross_dark.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/cross_dark_disabled.png", __ASSET__styles_gradient_cross_dark_disabled_png);
		type.set ("styles/gradient/cross_dark_disabled.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/cross_light_small.png", __ASSET__styles_gradient_cross_light_small_png);
		type.set ("styles/gradient/cross_light_small.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/gradient.css", __ASSET__styles_gradient_gradient_css);
		type.set ("styles/gradient/gradient.css", AssetType.TEXT);
		
		className.set ("styles/gradient/gradient.min.css", __ASSET__styles_gradient_gradient_min_css);
		type.set ("styles/gradient/gradient.min.css", AssetType.TEXT);
		
		className.set ("styles/gradient/gradient_mobile.css", __ASSET__styles_gradient_gradient_mobile_css);
		type.set ("styles/gradient/gradient_mobile.css", AssetType.TEXT);
		
		className.set ("styles/gradient/gradient_mobile.min.css", __ASSET__styles_gradient_gradient_mobile_min_css);
		type.set ("styles/gradient/gradient_mobile.min.css", AssetType.TEXT);
		
		className.set ("styles/gradient/gripper_horizontal.png", __ASSET__styles_gradient_gripper_horizontal_png);
		type.set ("styles/gradient/gripper_horizontal.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/gripper_horizontal_disabled.png", __ASSET__styles_gradient_gripper_horizontal_disabled_png);
		type.set ("styles/gradient/gripper_horizontal_disabled.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/gripper_vertical.png", __ASSET__styles_gradient_gripper_vertical_png);
		type.set ("styles/gradient/gripper_vertical.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/gripper_vertical_disabled.png", __ASSET__styles_gradient_gripper_vertical_disabled_png);
		type.set ("styles/gradient/gripper_vertical_disabled.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/hsplitter_gripper.png", __ASSET__styles_gradient_hsplitter_gripper_png);
		type.set ("styles/gradient/hsplitter_gripper.png", AssetType.IMAGE);
		
		className.set ("styles/gradient/vsplitter_gripper.png", __ASSET__styles_gradient_vsplitter_gripper_png);
		type.set ("styles/gradient/vsplitter_gripper.png", AssetType.IMAGE);
		
		className.set ("styles/windows/accordion.css", __ASSET__styles_windows_accordion_css);
		type.set ("styles/windows/accordion.css", AssetType.TEXT);
		
		className.set ("styles/windows/accordion.min.css", __ASSET__styles_windows_accordion_min_css);
		type.set ("styles/windows/accordion.min.css", AssetType.TEXT);
		
		className.set ("styles/windows/button.png", __ASSET__styles_windows_button_png);
		type.set ("styles/windows/button.png", AssetType.IMAGE);
		
		className.set ("styles/windows/buttons.css", __ASSET__styles_windows_buttons_css);
		type.set ("styles/windows/buttons.css", AssetType.TEXT);
		
		className.set ("styles/windows/buttons.min.css", __ASSET__styles_windows_buttons_min_css);
		type.set ("styles/windows/buttons.min.css", AssetType.TEXT);
		
		className.set ("styles/windows/calendar.css", __ASSET__styles_windows_calendar_css);
		type.set ("styles/windows/calendar.css", AssetType.TEXT);
		
		className.set ("styles/windows/checkbox.png", __ASSET__styles_windows_checkbox_png);
		type.set ("styles/windows/checkbox.png", AssetType.IMAGE);
		
		className.set ("styles/windows/container.png", __ASSET__styles_windows_container_png);
		type.set ("styles/windows/container.png", AssetType.IMAGE);
		
		className.set ("styles/windows/glyphs/down_arrow.png", __ASSET__styles_windows_glyphs_down_arrow_png);
		type.set ("styles/windows/glyphs/down_arrow.png", AssetType.IMAGE);
		
		className.set ("styles/windows/glyphs/hscroll_thumb_gripper_down.png", __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_down_png);
		type.set ("styles/windows/glyphs/hscroll_thumb_gripper_down.png", AssetType.IMAGE);
		
		className.set ("styles/windows/glyphs/hscroll_thumb_gripper_over.png", __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_over_png);
		type.set ("styles/windows/glyphs/hscroll_thumb_gripper_over.png", AssetType.IMAGE);
		
		className.set ("styles/windows/glyphs/hscroll_thumb_gripper_up.png", __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_up_png);
		type.set ("styles/windows/glyphs/hscroll_thumb_gripper_up.png", AssetType.IMAGE);
		
		className.set ("styles/windows/glyphs/left_arrow.png", __ASSET__styles_windows_glyphs_left_arrow_png);
		type.set ("styles/windows/glyphs/left_arrow.png", AssetType.IMAGE);
		
		className.set ("styles/windows/glyphs/right_arrow.png", __ASSET__styles_windows_glyphs_right_arrow_png);
		type.set ("styles/windows/glyphs/right_arrow.png", AssetType.IMAGE);
		
		className.set ("styles/windows/glyphs/up_arrow.png", __ASSET__styles_windows_glyphs_up_arrow_png);
		type.set ("styles/windows/glyphs/up_arrow.png", AssetType.IMAGE);
		
		className.set ("styles/windows/glyphs/vscroll_thumb_gripper_down.png", __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_down_png);
		type.set ("styles/windows/glyphs/vscroll_thumb_gripper_down.png", AssetType.IMAGE);
		
		className.set ("styles/windows/glyphs/vscroll_thumb_gripper_over.png", __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_over_png);
		type.set ("styles/windows/glyphs/vscroll_thumb_gripper_over.png", AssetType.IMAGE);
		
		className.set ("styles/windows/glyphs/vscroll_thumb_gripper_up.png", __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_up_png);
		type.set ("styles/windows/glyphs/vscroll_thumb_gripper_up.png", AssetType.IMAGE);
		
		className.set ("styles/windows/hprogress.png", __ASSET__styles_windows_hprogress_png);
		type.set ("styles/windows/hprogress.png", AssetType.IMAGE);
		
		className.set ("styles/windows/hscroll.png", __ASSET__styles_windows_hscroll_png);
		type.set ("styles/windows/hscroll.png", AssetType.IMAGE);
		
		className.set ("styles/windows/listview.css", __ASSET__styles_windows_listview_css);
		type.set ("styles/windows/listview.css", AssetType.TEXT);
		
		className.set ("styles/windows/listview.min.css", __ASSET__styles_windows_listview_min_css);
		type.set ("styles/windows/listview.min.css", AssetType.TEXT);
		
		className.set ("styles/windows/listview.png", __ASSET__styles_windows_listview_png);
		type.set ("styles/windows/listview.png", AssetType.IMAGE);
		
		className.set ("styles/windows/menus.css", __ASSET__styles_windows_menus_css);
		type.set ("styles/windows/menus.css", AssetType.TEXT);
		
		className.set ("styles/windows/optionbox.png", __ASSET__styles_windows_optionbox_png);
		type.set ("styles/windows/optionbox.png", AssetType.IMAGE);
		
		className.set ("styles/windows/popup.png", __ASSET__styles_windows_popup_png);
		type.set ("styles/windows/popup.png", AssetType.IMAGE);
		
		className.set ("styles/windows/popups.css", __ASSET__styles_windows_popups_css);
		type.set ("styles/windows/popups.css", AssetType.TEXT);
		
		className.set ("styles/windows/rtf.css", __ASSET__styles_windows_rtf_css);
		type.set ("styles/windows/rtf.css", AssetType.TEXT);
		
		className.set ("styles/windows/scrolls.css", __ASSET__styles_windows_scrolls_css);
		type.set ("styles/windows/scrolls.css", AssetType.TEXT);
		
		className.set ("styles/windows/scrolls.min.css", __ASSET__styles_windows_scrolls_min_css);
		type.set ("styles/windows/scrolls.min.css", AssetType.TEXT);
		
		className.set ("styles/windows/sliders.css", __ASSET__styles_windows_sliders_css);
		type.set ("styles/windows/sliders.css", AssetType.TEXT);
		
		className.set ("styles/windows/tab.png", __ASSET__styles_windows_tab_png);
		type.set ("styles/windows/tab.png", AssetType.IMAGE);
		
		className.set ("styles/windows/tabs.css", __ASSET__styles_windows_tabs_css);
		type.set ("styles/windows/tabs.css", AssetType.TEXT);
		
		className.set ("styles/windows/textinput.png", __ASSET__styles_windows_textinput_png);
		type.set ("styles/windows/textinput.png", AssetType.IMAGE);
		
		className.set ("styles/windows/vprogress.png", __ASSET__styles_windows_vprogress_png);
		type.set ("styles/windows/vprogress.png", AssetType.IMAGE);
		
		className.set ("styles/windows/vscroll.png", __ASSET__styles_windows_vscroll_png);
		type.set ("styles/windows/vscroll.png", AssetType.IMAGE);
		
		className.set ("styles/windows/windows.css", __ASSET__styles_windows_windows_css);
		type.set ("styles/windows/windows.css", AssetType.TEXT);
		
		className.set ("fonts/Oxygen-Bold.ttf", __ASSET__fonts_oxygen_bold_ttf);
		type.set ("fonts/Oxygen-Bold.ttf", AssetType.FONT);
		
		className.set ("fonts/Oxygen.ttf", __ASSET__fonts_oxygen_ttf);
		type.set ("fonts/Oxygen.ttf", AssetType.FONT);
		
		className.set ("libraries/swfsrc/swfsrc.swf", __ASSET__libraries_swfsrc_swfsrc_swf);
		type.set ("libraries/swfsrc/swfsrc.swf", AssetType.BINARY);
		
		className.set ("libraries/swfsrc.json", __ASSET__libraries_swfsrc_json);
		type.set ("libraries/swfsrc.json", AssetType.TEXT);
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						if (eventCallback != null) {
							
							eventCallback (this, "change");
							
						}
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), ByteArray));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return cast (Type.createInstance (className.get (id), []), ByteArray);
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return bitmapData.getPixels (bitmapData.rect);
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);
		
		#elseif html5
		
		var bytes:ByteArray = null;
		var data = Preloader.loaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), ByteArray);
		else return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var bytes:ByteArray = null;
		var data = Preloader.loaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			return cast data;
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes.readUTFBytes (bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		//if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		//}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String, handler:AudioBuffer -> Void):Void {
		
		#if (flash)
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				handler (audioBuffer);
				
			});
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			handler (getAudioBuffer (id));
			
		}
		#else
		handler (getAudioBuffer (id));
		
		#end
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				handler (bytes);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBytes (id));
			
		}
		
		#else
		
		handler (getBytes (id));
		
		#end
		
	}
	
	
	public override function loadImage (id:String, handler:Image -> Void):Void {
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				handler (Image.fromBitmapData (bitmapData));
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getImage (id));
			
		}
		
		#else
		
		handler (getImage (id));
		
		#end
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = ByteArray.readFile ("../Resources/manifest");
			#elseif ios
			var bytes = ByteArray.readFile ("assets/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if ios
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	/*public override function loadMusic (id:String, handler:Dynamic -> Void):Void {
		
		#if (flash || html5)
		
		//if (path.exists (id)) {
			
		//	var loader = new Loader ();
		//	loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
		//		handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
		//	});
		//	loader.load (new URLRequest (path.get (id)));
			
		//} else {
			
			handler (getMusic (id));
			
		//}
		
		#else
		
		handler (getMusic (id));
		
		#end
		
	}*/
	
	
	public override function loadText (id:String, handler:String -> Void):Void {
		
		//#if html5
		
		/*if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (event.currentTarget.data);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getText (id));
			
		}*/
		
		//#else
		
		var callback = function (bytes:ByteArray):Void {
			
			if (bytes == null) {
				
				handler (null);
				
			} else {
				
				handler (bytes.readUTFBytes (bytes.length));
				
			}
			
		}
		
		loadBytes (id, callback);
		
		//#end
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__assets_fonts_oxygen_bold_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_oxygen_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__assets_styles_default_circle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_styles_default_collapse_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_styles_default_cross_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_styles_default_expand_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_styles_default_up_down_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_styles_gradient_arrow_down_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_styles_gradient_arrow_down_dark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_styles_gradient_arrow_down_disabled_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_styles_gradient_arrow_left_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_styles_gradient_arrow_left_disabled_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_styles_gradient_arrow_right_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_styles_gradient_arrow_right2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_styles_gradient_arrow_right_dark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_styles_gradient_arrow_right_disabled_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_styles_gradient_arrow_up_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_styles_gradient_arrow_up_disabled_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_styles_gradient_circle_dark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_styles_gradient_cross_dark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_styles_gradient_cross_dark_disabled_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_styles_gradient_cross_light_small_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_styles_gradient_gradient_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_styles_gradient_gradient_min_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_styles_gradient_gradient_mobile_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_styles_gradient_gradient_mobile_min_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_styles_gradient_gripper_horizontal_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_styles_gradient_gripper_horizontal_disabled_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_styles_gradient_gripper_vertical_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_styles_gradient_gripper_vertical_disabled_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_styles_gradient_hsplitter_gripper_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_styles_gradient_vsplitter_gripper_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_styles_windows_accordion_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_styles_windows_accordion_min_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_styles_windows_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_styles_windows_buttons_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_styles_windows_buttons_min_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_styles_windows_calendar_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_styles_windows_checkbox_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_styles_windows_container_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_styles_windows_glyphs_down_arrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_styles_windows_glyphs_hscroll_thumb_gripper_down_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_styles_windows_glyphs_hscroll_thumb_gripper_over_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_styles_windows_glyphs_hscroll_thumb_gripper_up_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_styles_windows_glyphs_left_arrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_styles_windows_glyphs_right_arrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_styles_windows_glyphs_up_arrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_styles_windows_glyphs_vscroll_thumb_gripper_down_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_styles_windows_glyphs_vscroll_thumb_gripper_over_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_styles_windows_glyphs_vscroll_thumb_gripper_up_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_styles_windows_hprogress_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_styles_windows_hscroll_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_styles_windows_listview_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_styles_windows_listview_min_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_styles_windows_listview_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_styles_windows_menus_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_styles_windows_optionbox_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_styles_windows_popup_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_styles_windows_popups_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_styles_windows_rtf_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_styles_windows_scrolls_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_styles_windows_scrolls_min_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_styles_windows_sliders_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_styles_windows_tab_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_styles_windows_tabs_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_styles_windows_textinput_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_styles_windows_vprogress_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_styles_windows_vscroll_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_styles_windows_windows_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__styles_default_circle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_default_collapse_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_default_cross_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_default_expand_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_default_up_down_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_arrow_down_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_arrow_down_dark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_arrow_down_disabled_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_arrow_left_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_arrow_left_disabled_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_arrow_right_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_arrow_right2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_arrow_right_dark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_arrow_right_disabled_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_arrow_up_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_arrow_up_disabled_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_circle_dark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_cross_dark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_cross_dark_disabled_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_cross_light_small_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_gradient_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_gradient_min_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_gradient_mobile_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_gradient_mobile_min_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_gripper_horizontal_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_gripper_horizontal_disabled_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_gripper_vertical_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_gripper_vertical_disabled_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_hsplitter_gripper_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_gradient_vsplitter_gripper_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_accordion_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__styles_windows_accordion_min_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__styles_windows_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_buttons_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__styles_windows_buttons_min_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__styles_windows_calendar_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__styles_windows_checkbox_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_container_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_glyphs_down_arrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_down_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_over_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_up_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_glyphs_left_arrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_glyphs_right_arrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_glyphs_up_arrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_down_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_over_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_up_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_hprogress_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_hscroll_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_listview_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__styles_windows_listview_min_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__styles_windows_listview_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_menus_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__styles_windows_optionbox_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_popup_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_popups_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__styles_windows_rtf_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__styles_windows_scrolls_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__styles_windows_scrolls_min_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__styles_windows_sliders_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__styles_windows_tab_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_tabs_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__styles_windows_textinput_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_vprogress_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_vscroll_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__styles_windows_windows_css extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__fonts_oxygen_bold_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__fonts_oxygen_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__libraries_swfsrc_swfsrc_swf extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__libraries_swfsrc_json extends flash.utils.ByteArray { }


#elseif html5

@:keep #if display private #end class __ASSET__assets_fonts_oxygen_bold_ttf extends lime.text.Font { public function new () { super (); name = "Oxygen Bold"; } } 
@:keep #if display private #end class __ASSET__assets_fonts_oxygen_ttf extends lime.text.Font { public function new () { super (); name = "Oxygen Regular"; } } 






































































































































@:keep #if display private #end class __ASSET__fonts_oxygen_bold_ttf extends lime.text.Font { public function new () { super (); name = "Oxygen Bold"; } } 
@:keep #if display private #end class __ASSET__fonts_oxygen_ttf extends lime.text.Font { public function new () { super (); name = "Oxygen Regular"; } } 




#else



#if (windows || mac || linux)


@:font("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/fonts/Oxygen-Bold.ttf") #if display private #end class __ASSET__assets_fonts_oxygen_bold_ttf extends lime.text.Font {}
@:font("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/fonts/Oxygen.ttf") #if display private #end class __ASSET__assets_fonts_oxygen_ttf extends lime.text.Font {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/default/circle.png") #if display private #end class __ASSET__assets_styles_default_circle_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/default/collapse.png") #if display private #end class __ASSET__assets_styles_default_collapse_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/default/cross.png") #if display private #end class __ASSET__assets_styles_default_cross_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/default/expand.png") #if display private #end class __ASSET__assets_styles_default_expand_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/default/up_down.png") #if display private #end class __ASSET__assets_styles_default_up_down_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/gradient/arrow_down.png") #if display private #end class __ASSET__assets_styles_gradient_arrow_down_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/gradient/arrow_down_dark.png") #if display private #end class __ASSET__assets_styles_gradient_arrow_down_dark_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/gradient/arrow_down_disabled.png") #if display private #end class __ASSET__assets_styles_gradient_arrow_down_disabled_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/gradient/arrow_left.png") #if display private #end class __ASSET__assets_styles_gradient_arrow_left_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/gradient/arrow_left_disabled.png") #if display private #end class __ASSET__assets_styles_gradient_arrow_left_disabled_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/gradient/arrow_right.png") #if display private #end class __ASSET__assets_styles_gradient_arrow_right_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/gradient/arrow_right2.png") #if display private #end class __ASSET__assets_styles_gradient_arrow_right2_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/gradient/arrow_right_dark.png") #if display private #end class __ASSET__assets_styles_gradient_arrow_right_dark_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/gradient/arrow_right_disabled.png") #if display private #end class __ASSET__assets_styles_gradient_arrow_right_disabled_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/gradient/arrow_up.png") #if display private #end class __ASSET__assets_styles_gradient_arrow_up_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/gradient/arrow_up_disabled.png") #if display private #end class __ASSET__assets_styles_gradient_arrow_up_disabled_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/gradient/circle_dark.png") #if display private #end class __ASSET__assets_styles_gradient_circle_dark_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/gradient/cross_dark.png") #if display private #end class __ASSET__assets_styles_gradient_cross_dark_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/gradient/cross_dark_disabled.png") #if display private #end class __ASSET__assets_styles_gradient_cross_dark_disabled_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/gradient/cross_light_small.png") #if display private #end class __ASSET__assets_styles_gradient_cross_light_small_png extends lime.graphics.Image {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/gradient/gradient.css") #if display private #end class __ASSET__assets_styles_gradient_gradient_css extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/gradient/gradient.min.css") #if display private #end class __ASSET__assets_styles_gradient_gradient_min_css extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/gradient/gradient_mobile.css") #if display private #end class __ASSET__assets_styles_gradient_gradient_mobile_css extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/gradient/gradient_mobile.min.css") #if display private #end class __ASSET__assets_styles_gradient_gradient_mobile_min_css extends lime.utils.ByteArray {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/gradient/gripper_horizontal.png") #if display private #end class __ASSET__assets_styles_gradient_gripper_horizontal_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/gradient/gripper_horizontal_disabled.png") #if display private #end class __ASSET__assets_styles_gradient_gripper_horizontal_disabled_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/gradient/gripper_vertical.png") #if display private #end class __ASSET__assets_styles_gradient_gripper_vertical_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/gradient/gripper_vertical_disabled.png") #if display private #end class __ASSET__assets_styles_gradient_gripper_vertical_disabled_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/gradient/hsplitter_gripper.png") #if display private #end class __ASSET__assets_styles_gradient_hsplitter_gripper_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/gradient/vsplitter_gripper.png") #if display private #end class __ASSET__assets_styles_gradient_vsplitter_gripper_png extends lime.graphics.Image {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/accordion.css") #if display private #end class __ASSET__assets_styles_windows_accordion_css extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/accordion.min.css") #if display private #end class __ASSET__assets_styles_windows_accordion_min_css extends lime.utils.ByteArray {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/button.png") #if display private #end class __ASSET__assets_styles_windows_button_png extends lime.graphics.Image {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/buttons.css") #if display private #end class __ASSET__assets_styles_windows_buttons_css extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/buttons.min.css") #if display private #end class __ASSET__assets_styles_windows_buttons_min_css extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/calendar.css") #if display private #end class __ASSET__assets_styles_windows_calendar_css extends lime.utils.ByteArray {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/checkbox.png") #if display private #end class __ASSET__assets_styles_windows_checkbox_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/container.png") #if display private #end class __ASSET__assets_styles_windows_container_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/glyphs/down_arrow.png") #if display private #end class __ASSET__assets_styles_windows_glyphs_down_arrow_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/glyphs/hscroll_thumb_gripper_down.png") #if display private #end class __ASSET__assets_styles_windows_glyphs_hscroll_thumb_gripper_down_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/glyphs/hscroll_thumb_gripper_over.png") #if display private #end class __ASSET__assets_styles_windows_glyphs_hscroll_thumb_gripper_over_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/glyphs/hscroll_thumb_gripper_up.png") #if display private #end class __ASSET__assets_styles_windows_glyphs_hscroll_thumb_gripper_up_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/glyphs/left_arrow.png") #if display private #end class __ASSET__assets_styles_windows_glyphs_left_arrow_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/glyphs/right_arrow.png") #if display private #end class __ASSET__assets_styles_windows_glyphs_right_arrow_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/glyphs/up_arrow.png") #if display private #end class __ASSET__assets_styles_windows_glyphs_up_arrow_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/glyphs/vscroll_thumb_gripper_down.png") #if display private #end class __ASSET__assets_styles_windows_glyphs_vscroll_thumb_gripper_down_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/glyphs/vscroll_thumb_gripper_over.png") #if display private #end class __ASSET__assets_styles_windows_glyphs_vscroll_thumb_gripper_over_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/glyphs/vscroll_thumb_gripper_up.png") #if display private #end class __ASSET__assets_styles_windows_glyphs_vscroll_thumb_gripper_up_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/hprogress.png") #if display private #end class __ASSET__assets_styles_windows_hprogress_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/hscroll.png") #if display private #end class __ASSET__assets_styles_windows_hscroll_png extends lime.graphics.Image {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/listview.css") #if display private #end class __ASSET__assets_styles_windows_listview_css extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/listview.min.css") #if display private #end class __ASSET__assets_styles_windows_listview_min_css extends lime.utils.ByteArray {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/listview.png") #if display private #end class __ASSET__assets_styles_windows_listview_png extends lime.graphics.Image {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/menus.css") #if display private #end class __ASSET__assets_styles_windows_menus_css extends lime.utils.ByteArray {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/optionbox.png") #if display private #end class __ASSET__assets_styles_windows_optionbox_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/popup.png") #if display private #end class __ASSET__assets_styles_windows_popup_png extends lime.graphics.Image {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/popups.css") #if display private #end class __ASSET__assets_styles_windows_popups_css extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/rtf.css") #if display private #end class __ASSET__assets_styles_windows_rtf_css extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/scrolls.css") #if display private #end class __ASSET__assets_styles_windows_scrolls_css extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/scrolls.min.css") #if display private #end class __ASSET__assets_styles_windows_scrolls_min_css extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/sliders.css") #if display private #end class __ASSET__assets_styles_windows_sliders_css extends lime.utils.ByteArray {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/tab.png") #if display private #end class __ASSET__assets_styles_windows_tab_png extends lime.graphics.Image {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/tabs.css") #if display private #end class __ASSET__assets_styles_windows_tabs_css extends lime.utils.ByteArray {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/textinput.png") #if display private #end class __ASSET__assets_styles_windows_textinput_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/vprogress.png") #if display private #end class __ASSET__assets_styles_windows_vprogress_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/vscroll.png") #if display private #end class __ASSET__assets_styles_windows_vscroll_png extends lime.graphics.Image {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/windows.css") #if display private #end class __ASSET__assets_styles_windows_windows_css extends lime.utils.ByteArray {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/default/circle.png") #if display private #end class __ASSET__styles_default_circle_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/default/collapse.png") #if display private #end class __ASSET__styles_default_collapse_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/default/cross.png") #if display private #end class __ASSET__styles_default_cross_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/default/expand.png") #if display private #end class __ASSET__styles_default_expand_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/default/up_down.png") #if display private #end class __ASSET__styles_default_up_down_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/gradient/arrow_down.png") #if display private #end class __ASSET__styles_gradient_arrow_down_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/gradient/arrow_down_dark.png") #if display private #end class __ASSET__styles_gradient_arrow_down_dark_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/gradient/arrow_down_disabled.png") #if display private #end class __ASSET__styles_gradient_arrow_down_disabled_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/gradient/arrow_left.png") #if display private #end class __ASSET__styles_gradient_arrow_left_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/gradient/arrow_left_disabled.png") #if display private #end class __ASSET__styles_gradient_arrow_left_disabled_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/gradient/arrow_right.png") #if display private #end class __ASSET__styles_gradient_arrow_right_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/gradient/arrow_right2.png") #if display private #end class __ASSET__styles_gradient_arrow_right2_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/gradient/arrow_right_dark.png") #if display private #end class __ASSET__styles_gradient_arrow_right_dark_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/gradient/arrow_right_disabled.png") #if display private #end class __ASSET__styles_gradient_arrow_right_disabled_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/gradient/arrow_up.png") #if display private #end class __ASSET__styles_gradient_arrow_up_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/gradient/arrow_up_disabled.png") #if display private #end class __ASSET__styles_gradient_arrow_up_disabled_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/gradient/circle_dark.png") #if display private #end class __ASSET__styles_gradient_circle_dark_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/gradient/cross_dark.png") #if display private #end class __ASSET__styles_gradient_cross_dark_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/gradient/cross_dark_disabled.png") #if display private #end class __ASSET__styles_gradient_cross_dark_disabled_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/gradient/cross_light_small.png") #if display private #end class __ASSET__styles_gradient_cross_light_small_png extends lime.graphics.Image {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/gradient/gradient.css") #if display private #end class __ASSET__styles_gradient_gradient_css extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/gradient/gradient.min.css") #if display private #end class __ASSET__styles_gradient_gradient_min_css extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/gradient/gradient_mobile.css") #if display private #end class __ASSET__styles_gradient_gradient_mobile_css extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/gradient/gradient_mobile.min.css") #if display private #end class __ASSET__styles_gradient_gradient_mobile_min_css extends lime.utils.ByteArray {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/gradient/gripper_horizontal.png") #if display private #end class __ASSET__styles_gradient_gripper_horizontal_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/gradient/gripper_horizontal_disabled.png") #if display private #end class __ASSET__styles_gradient_gripper_horizontal_disabled_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/gradient/gripper_vertical.png") #if display private #end class __ASSET__styles_gradient_gripper_vertical_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/gradient/gripper_vertical_disabled.png") #if display private #end class __ASSET__styles_gradient_gripper_vertical_disabled_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/gradient/hsplitter_gripper.png") #if display private #end class __ASSET__styles_gradient_hsplitter_gripper_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/gradient/vsplitter_gripper.png") #if display private #end class __ASSET__styles_gradient_vsplitter_gripper_png extends lime.graphics.Image {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/accordion.css") #if display private #end class __ASSET__styles_windows_accordion_css extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/accordion.min.css") #if display private #end class __ASSET__styles_windows_accordion_min_css extends lime.utils.ByteArray {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/button.png") #if display private #end class __ASSET__styles_windows_button_png extends lime.graphics.Image {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/buttons.css") #if display private #end class __ASSET__styles_windows_buttons_css extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/buttons.min.css") #if display private #end class __ASSET__styles_windows_buttons_min_css extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/calendar.css") #if display private #end class __ASSET__styles_windows_calendar_css extends lime.utils.ByteArray {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/checkbox.png") #if display private #end class __ASSET__styles_windows_checkbox_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/container.png") #if display private #end class __ASSET__styles_windows_container_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/glyphs/down_arrow.png") #if display private #end class __ASSET__styles_windows_glyphs_down_arrow_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/glyphs/hscroll_thumb_gripper_down.png") #if display private #end class __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_down_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/glyphs/hscroll_thumb_gripper_over.png") #if display private #end class __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_over_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/glyphs/hscroll_thumb_gripper_up.png") #if display private #end class __ASSET__styles_windows_glyphs_hscroll_thumb_gripper_up_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/glyphs/left_arrow.png") #if display private #end class __ASSET__styles_windows_glyphs_left_arrow_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/glyphs/right_arrow.png") #if display private #end class __ASSET__styles_windows_glyphs_right_arrow_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/glyphs/up_arrow.png") #if display private #end class __ASSET__styles_windows_glyphs_up_arrow_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/glyphs/vscroll_thumb_gripper_down.png") #if display private #end class __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_down_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/glyphs/vscroll_thumb_gripper_over.png") #if display private #end class __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_over_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/glyphs/vscroll_thumb_gripper_up.png") #if display private #end class __ASSET__styles_windows_glyphs_vscroll_thumb_gripper_up_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/hprogress.png") #if display private #end class __ASSET__styles_windows_hprogress_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/hscroll.png") #if display private #end class __ASSET__styles_windows_hscroll_png extends lime.graphics.Image {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/listview.css") #if display private #end class __ASSET__styles_windows_listview_css extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/listview.min.css") #if display private #end class __ASSET__styles_windows_listview_min_css extends lime.utils.ByteArray {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/listview.png") #if display private #end class __ASSET__styles_windows_listview_png extends lime.graphics.Image {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/menus.css") #if display private #end class __ASSET__styles_windows_menus_css extends lime.utils.ByteArray {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/optionbox.png") #if display private #end class __ASSET__styles_windows_optionbox_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/popup.png") #if display private #end class __ASSET__styles_windows_popup_png extends lime.graphics.Image {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/popups.css") #if display private #end class __ASSET__styles_windows_popups_css extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/rtf.css") #if display private #end class __ASSET__styles_windows_rtf_css extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/scrolls.css") #if display private #end class __ASSET__styles_windows_scrolls_css extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/scrolls.min.css") #if display private #end class __ASSET__styles_windows_scrolls_min_css extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/sliders.css") #if display private #end class __ASSET__styles_windows_sliders_css extends lime.utils.ByteArray {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/tab.png") #if display private #end class __ASSET__styles_windows_tab_png extends lime.graphics.Image {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/tabs.css") #if display private #end class __ASSET__styles_windows_tabs_css extends lime.utils.ByteArray {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/textinput.png") #if display private #end class __ASSET__styles_windows_textinput_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/vprogress.png") #if display private #end class __ASSET__styles_windows_vprogress_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/vscroll.png") #if display private #end class __ASSET__styles_windows_vscroll_png extends lime.graphics.Image {}
@:file("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/styles/windows/windows.css") #if display private #end class __ASSET__styles_windows_windows_css extends lime.utils.ByteArray {}
@:font("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/fonts/Oxygen-Bold.ttf") #if display private #end class __ASSET__fonts_oxygen_bold_ttf extends lime.text.Font {}
@:font("C:/HaxeToolkit/haxe/lib/haxeui/1,7,13/assets/fonts/Oxygen.ttf") #if display private #end class __ASSET__fonts_oxygen_ttf extends lime.text.Font {}
@:file("assets/abc.swf") #if display private #end class __ASSET__libraries_swfsrc_swfsrc_swf extends lime.utils.ByteArray {}
@:file("") #if display private #end class __ASSET__libraries_swfsrc_json extends lime.utils.ByteArray {}



#end

#if openfl
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_oxygen_bold_ttf extends openfl.text.Font { public function new () { __fontPath = "assets/fonts/Oxygen-Bold.ttf"; name = "Oxygen Bold"; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_oxygen_ttf extends openfl.text.Font { public function new () { __fontPath = "assets/fonts/Oxygen.ttf"; name = "Oxygen Regular"; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__fonts_oxygen_bold_ttf extends openfl.text.Font { public function new () { __fontPath = "fonts/Oxygen-Bold.ttf"; name = "Oxygen Bold"; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__fonts_oxygen_ttf extends openfl.text.Font { public function new () { __fontPath = "fonts/Oxygen.ttf"; name = "Oxygen Regular"; super (); }}

#end

#end
#end

