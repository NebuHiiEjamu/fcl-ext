unit avaraline;

interface

	const
		HTLC_HDR_ICON_GETLIST = $00000745;
		HTLC_HDR_ICON_SET = $00000746;
		HTLC_HDR_ICON_GET = $00000747;
		HTLS_HDR_ICON_CHANGE = $00000748;
		HTLS_HDR_LINK_LOGIN = $00000800;
		HTLS_HDR_LINK_JOIN = $00000801;
		HTLS_HDR_LINK_LEAVE = $00000802;
		HTLS_HDR_LINK_PACKET = $00000803;
		HTLC_HDR_NEWS_GET_UNFORMATTED = $00000865;
		HTLC_HDR_USER_INFO_UNFORMATTED = $00000870;
		HTLC_HDR_ACCOUNT_SELFMODIFY = $00000900;
		HTLC_HDR_PERMISSION_LIST = $00000901;
		DATA_ICON_GIF = $0300;
		DATA_ICON_LIST = $0301;
		DATA_OFFSET = $0319;
		DATA_NEWSLIMIT = $0320;
		DATA_COUNT = $0321;
		DATA_SEARCH = $0400;
		DATA_COLOR = $0500;
		DATA_PACKET = $0600;
		DATA_POST = $0800;
		DATA_POSTID = $0801;
		DATA_PERMGROUP = $0850;
		DATA_PERM = $0851;
		DATA_IP = $0900;

		CAPABILITY_NEWS = 1 shl 0;

implementation

end.