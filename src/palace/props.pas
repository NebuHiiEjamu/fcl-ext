unit props;

interface

	const
		ASSET_CRC_MAGIC = $D9216290;
		dither20bit = 255 / 63;
		ditherS20Bit = 255 / 31;

		PF_PropFaceFlag = $02;
		PF_PropGhostFlag = $04;
		PF_PropRareFlag = $08;
		PF_Animate = $10;
		PF_Palindrome = $20;
		PROP_FORMAT_S20BIT = $200;
		PROP_FORMAT_20BIT = $40;
		PROP_FORMAT_32BIT = $100;
		PROP_FORMAT_8BIT = $00;

implementation

end.
