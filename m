Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id A0D2D1D27A6
	for <lists+dm-devel@lfdr.de>; Thu, 14 May 2020 08:25:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589437532;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=PxXzMlZVrdxF9IZTx0FgXhW/eJZUy69Ple1nvHlSKY8=;
	b=RrfV5QXmIJp4lRiLVf9yyObuzH0KctQy7vqS06dl3WF9uU50j96ZzFz6RCcZzjTel1uQ0T
	NFGtcNLgamJZVx1EWRhajoKJcbRgZ/RlND/LDsZRkvGTXzj8Fdq6hauxu99SPKh5FqiG/q
	MoVEVL1yR6Edo2vwJWfJfR+UV9elWcs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-1y6hzVlBOJ6ApvSjiUbH6Q-1; Thu, 14 May 2020 02:25:29 -0400
X-MC-Unique: 1y6hzVlBOJ6ApvSjiUbH6Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B355F872FE0;
	Thu, 14 May 2020 06:25:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 10C456E705;
	Thu, 14 May 2020 06:25:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A29544E982;
	Thu, 14 May 2020 06:25:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04E6PC2t029429 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 14 May 2020 02:25:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D0D44F7FDB; Thu, 14 May 2020 06:25:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB47FF89FA
	for <dm-devel@redhat.com>; Thu, 14 May 2020 06:25:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5BF0B18A6663
	for <dm-devel@redhat.com>; Thu, 14 May 2020 06:25:09 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-132-XawMn4dpP8-GWHXrCI2iJg-1; Thu, 14 May 2020 02:25:05 -0400
X-MC-Unique: XawMn4dpP8-GWHXrCI2iJg-1
IronPort-SDR: LBZMWkWw3Sk0sbCxJxJ04h3CCAQjah7YsLyZjKZTGP5WtzzXOaQvJgio0e/oT1f1C9z+9PXeGp
	sjeezuWnrjrp4na1ZTW+T7zazq2z3qkyJatkZ5TeucMJp2DW3TLrXt4jXD+HXo8HrqV7Y0iO6v
	ei4tp33V1ycDjdDs9JN1+1Rs+39nOegEo/tsWfWeY6515QHX1mdRzzAQXrSwz5NUVjCn32kzdF
	OUewVm93cgKzbxsNiZSwuSpeMIW97sdgmxnM/feFgIOls/Ne/fgBq43y2i2VJzsDCVOkLl1//N
	GlI=
X-IronPort-AV: E=Sophos;i="5.73,390,1583164800"; d="scan'208";a="141997274"
Received: from mail-cys01nam02lp2050.outbound.protection.outlook.com (HELO
	NAM02-CY1-obe.outbound.protection.outlook.com) ([104.47.37.50])
	by ob1.hgst.iphmx.com with ESMTP; 14 May 2020 14:25:03 +0800
Received: from BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	by BY5PR04MB6568.namprd04.prod.outlook.com (2603:10b6:a03:1de::19)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20;
	Thu, 14 May 2020 06:25:02 +0000
Received: from BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606]) by
	BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606%6]) with mapi id 15.20.3000.016;
	Thu, 14 May 2020 06:25:02 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Nathan Chancellor <natechancellor@gmail.com>, Alasdair Kergon
	<agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [dm-devel] [PATCH] dm zoned: Avoid 64-bit division error in
	dmz_fixup_devices
Thread-Index: AQHWKbhmdVnJ21yeQka+Xv+gMgyG9Q==
Date: Thu, 14 May 2020 06:25:02 +0000
Message-ID: <BY5PR04MB690080527BC91E2DC9EDF0BBE7BC0@BY5PR04MB6900.namprd04.prod.outlook.com>
References: <20200513084521.461116-1-natechancellor@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6021e490-5272-439a-2754-08d7f7cf8900
x-ms-traffictypediagnostic: BY5PR04MB6568:
x-microsoft-antispam-prvs: <BY5PR04MB65688C47E1AD929235A1DEA7E7BC0@BY5PR04MB6568.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:162;
x-forefront-prvs: 040359335D
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T5JIUI8vJPb/NQ4Wcl2qTNr2TGsk68q1ybhBqEIh3myA3jvlfkw0LXUP2gLIvK2HABstf7vobpbPPRClyldW3klEOLa3gAfUCx/5GmkR4IK5R6La5T+dWLJPyfYwiEWv7jOti6gfOsdVShKWdl6jdnMhgyVtVZK53+kkCxW2YXH90GTFN6csYHfG8aXbJL5tLKSFnehaPlkyDjXmw9UsDvP0//lcU4sVnS91y+T9ZK+kva/VR3vW9S83b4FC21Bg+ikB7iDpp3GMyClayncfe+TtESlIhXqpxB70lzME7hwQcTuD2NdHnDDdx6rfdqilB6WTycttHC6EnZHujYonKOASVrXfqSolJLbiZ90rtbUxP/5o0Ym1HUr0mVA1J+KSX+uGZjouesUsUlKMU6fUsWpbArAryNwhiOdPXNMUHt+U8mSL2QmDNKmxSUvlGwe8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR04MB6900.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(376002)(346002)(366004)(39860400002)(396003)(136003)(55016002)(186003)(64756008)(110136005)(66946007)(2906002)(76116006)(316002)(66446008)(86362001)(5660300002)(66476007)(8676002)(66556008)(6506007)(7696005)(4326008)(71200400001)(33656002)(26005)(53546011)(9686003)(478600001)(54906003)(52536014)(8936002);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: oTpTYmZGfKJTEqP0QZmlzksQo0eTsutAHdbVg1l7JpbJzYo7mLb7jsWgcpdg2OdKmQIaDWKrk0vuh4zriONWUSn9dJpDQJPl6lzzBI6gDTCqYhaxL5NUf3RKiVHbzeGe0oGn+CV6aWA6uTbxCwHfOYP2ZmASZkoAXOPYU1+ttgTpTSx20DUcdaKvTb5H279/jZDSry8nS6v+3B01Eh8WDaZAWtH5MuhbcfdsFUkUNu2Se+4eFz6nEweEMZzt5YMS0QXuGYx+IxNLgDLnt/C4hfMZZ7Qd6n1oXjMHq/3zSHP2ZgkUPrGUGND/s8hCNY8+q66zO2t1qq/eH35as0GVS6IC/3ufPsFFQ/cmcIAThXGdUyj2qexELIRDwc5DNK2gUcbvbUKVnRcV3XrF0m4yCFYAGa4MFHdJRyX0TCKZQG6fTLM1MYRygBqB3/xUSiO0z0i2Uqa4XHyjBUn/SCgTA+8x3ZF0X0AndytFmj5UpPkC3ldhB8NHQCHBkaNhiPfT
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6021e490-5272-439a-2754-08d7f7cf8900
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2020 06:25:02.4038 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2YlOpcy2KDbyuWEcI9igUkS+WmsGogclIOcWGtF3jH1B0PaIKhUz5FH1qznN9IaBSA7vv5ZAhkh2H3Qs/L9fag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6568
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04E6PC2t029429
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [dm-devel] [PATCH] dm zoned: Avoid 64-bit division error in
 dmz_fixup_devices
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/05/14 14:07, Nathan Chancellor wrote:
> When building arm32 allyesconfig:
> 
> ld.lld: error: undefined symbol: __aeabi_uldivmod
>>>> referenced by dm-zoned-target.c
>>>>               md/dm-zoned-target.o:(dmz_ctr) in archive drivers/built-in.a
> 
> dmz_fixup_devices uses DIV_ROUND_UP with variables of type sector_t. As
> such, it should be using DIV_ROUND_UP_SECTOR_T, which handles this
> automatically.
> 
> Fixes: 70978208ec91 ("dm zoned: metadata version 2")
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>  drivers/md/dm-zoned-target.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
> index ea43f6892ced..9c4fd4b04878 100644
> --- a/drivers/md/dm-zoned-target.c
> +++ b/drivers/md/dm-zoned-target.c
> @@ -803,8 +803,9 @@ static int dmz_fixup_devices(struct dm_target *ti)
>  
>  	if (reg_dev) {
>  		reg_dev->zone_nr_sectors = zoned_dev->zone_nr_sectors;
> -		reg_dev->nr_zones = DIV_ROUND_UP(reg_dev->capacity,
> -						 reg_dev->zone_nr_sectors);
> +		reg_dev->nr_zones =
> +			DIV_ROUND_UP_SECTOR_T(reg_dev->capacity,
> +					      reg_dev->zone_nr_sectors);>  		zoned_dev->zone_offset = reg_dev->nr_zones;
>  	}
>  	return 0;
> 
> base-commit: e098d7762d602be640c53565ceca342f81e55ad2
> 

Looks good.

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

