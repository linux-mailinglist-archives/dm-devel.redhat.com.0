Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6473A1DE0E7
	for <lists+dm-devel@lfdr.de>; Fri, 22 May 2020 09:28:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590132501;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=exSPSOuufnmViO5CSz5TIN4wHA6Xsz9AGtQrCngAUSs=;
	b=Cxjjl40oVb6XNNlRzi54UPKi2ESfpH0k3t2vv3J/Oofr2ymOQVIhRZphZQkCENA7LvBccc
	OA7nHj8nhX1Y7vGHKXRzNkhyiFblo5afJpBcLSaSF4eSGoGRN9b2er3wvBySAo0/CdObJF
	dm6GypWtyKYIksw6H4MAWrf9YTA6Riw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-HfRZ4x2IO9-VrSODmuF0Sw-1; Fri, 22 May 2020 03:28:18 -0400
X-MC-Unique: HfRZ4x2IO9-VrSODmuF0Sw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AEAB474;
	Fri, 22 May 2020 07:28:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FD75649A9;
	Fri, 22 May 2020 07:28:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 64D061809543;
	Fri, 22 May 2020 07:27:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04M7RR9v008659 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 22 May 2020 03:27:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8EFBB2157F23; Fri, 22 May 2020 07:27:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8997E2166BA3
	for <dm-devel@redhat.com>; Fri, 22 May 2020 07:27:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 78A958ECB2A
	for <dm-devel@redhat.com>; Fri, 22 May 2020 07:27:25 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-194-ljR4P-mjPpSUGHN4yjfyyg-1; Fri, 22 May 2020 03:27:18 -0400
X-MC-Unique: ljR4P-mjPpSUGHN4yjfyyg-1
IronPort-SDR: hHWqOaE5lD+0K/6vRGiltGosKVWXhGeBbGfK5oYFbVCKKtwLbZEs/l41yKcVtqIkDRItOO1Ibq
	Sh0wMfirnN4QOFYBSaNgq6dSyTdR6sbDwTLMK3xUUai4lLwbvfZXa7HShlPIsqJkkdM/A/LqOU
	TU5bMgbmq+gNH9HLkeM5oSHbCEZMUQ/KEZCgkt+WDm3ybuW3b7thCD5ehPJcqXU9JMCK8edTyw
	6f/lfDHYUTdr1+6YZakpzGfIMl/vAu6QN4YeFldTtHWkX5YmK0bysVhfNjf27Bp5fa3D3fzkKt
	HKE=
X-IronPort-AV: E=Sophos;i="5.73,420,1583164800"; d="scan'208";a="247299869"
Received: from mail-sn1nam02lp2051.outbound.protection.outlook.com (HELO
	NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.36.51])
	by ob1.hgst.iphmx.com with ESMTP; 22 May 2020 15:27:12 +0800
Received: from BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	by BY5PR04MB6865.namprd04.prod.outlook.com (2603:10b6:a03:219::21)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23;
	Fri, 22 May 2020 07:27:11 +0000
Received: from BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606]) by
	BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606%5]) with mapi id 15.20.3021.020;
	Fri, 22 May 2020 07:27:11 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, Jens Axboe
	<axboe@kernel.dk>, "linux-nvme@lists.infradead.org"
	<linux-nvme@lists.infradead.org>, Keith Busch <kbusch@kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>, Mike Snitzer
	<snitzer@redhat.com>
Thread-Topic: [PATCH] block: Improve io_opt limit stacking
Thread-Index: AQHWKb0cTYJPThBKS0yTBVeZnYkcfA==
Date: Fri, 22 May 2020 07:27:11 +0000
Message-ID: <BY5PR04MB6900144BD2729172EBF5DF2EE7B40@BY5PR04MB6900.namprd04.prod.outlook.com>
References: <20200514065819.1113949-1-damien.lemoal@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b6d7e630-d5b5-4137-4e67-08d7fe218ae8
x-ms-traffictypediagnostic: BY5PR04MB6865:
x-microsoft-antispam-prvs: <BY5PR04MB6865B6D56CCA5329035529DDE7B40@BY5PR04MB6865.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 04111BAC64
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HzSumQlc6BzUnQ6A66lCJ7CtOUOW1oKdWS1f1zSAC9c6icGAmtIwFWrIY5z18ok+RpKzlXhttC2pWtunrB+O+6tnAWtRtok6uiUr43oZTH9kBwPt5GinCg9TYu7TAkjwEU9jtuZ2CjCaLDhwu3b58giAzonrcMKst9jyJN4x2N02+XKHVA4d+a6sRn+4dMbPPB+LnIWfP/JpqjONKYMSryHu7h2kqYyuT07DeUhsOf6D9EfUXzJdwdzGZHJnuG7/XCbreXHY+t4U5hFFoTewE8meI25FwdpD//lTlFdZp6nktZOQ5qf+wuWz5h3x+dzb
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR04MB6900.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(66446008)(86362001)(52536014)(66556008)(64756008)(66946007)(316002)(5660300002)(26005)(186003)(2906002)(53546011)(110136005)(6506007)(7696005)(76116006)(9686003)(55016002)(8936002)(66476007)(33656002)(71200400001)(478600001)(8676002);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: KSnFUNw3PEjJiCH0yZESQrVcHC/q/Y8TTgfmSzrPY22PeQTmtnV8jJceHFDA4t09mLTdKeBqs/4XPUh9W4W86tKheGxaPuVqcdqriy4bf3Y14zea2Gqq0uUT5X+nfJPF8suRcilfOTgzPbs0vUtdiU2sB4NuSQiX6VlRTtS38Kdy2bhk9BlysdQHRTgqhvxneoFJgYaAKKBPdssNwVDEhrEy8IKiFlOxKhah5RCtny3mpSWrv72I5rr5F/3+V1MOZ/Y5vTvqHPqYkPd+TvutUp1IQk/1mv7W7a8SAWOSAWytqr8LYjeKI0iJq67MUllHPjwGniq1I4iTj8srvrzPJzAr3V1sixDOIesv9qLuAOArakaN0ixRNOSfoeo9nTiqAE+o07UuQGwow6L9krJA+6fZHXumHfFUnhhgIGy6akIfFi+tMoYEkd7vneKX7sYFPc/ErqfdDS4g4oogWxqmwdJpLoz+vXRlvOwqj2zWv7swsZu88+zqNvvrwzHYMAwO
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6d7e630-d5b5-4137-4e67-08d7fe218ae8
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2020 07:27:11.3104 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0scW0Z8ceVyCUpSOecQzTtCpy+fmkR/i6VJ9sAKQttAF0cVSmDCobGwF0gkjCdgZ1NfU2UJ2qcPk3od8rkHIcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6865
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04M7RR9v008659
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] block: Improve io_opt limit stacking
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/05/14 15:58, Damien Le Moal wrote:
> When devices with different physical sector sizes are stacked, the
> largest value is used as the stacked device physical sector size. For
> the optimal IO size, the lowest common multiple (lcm) of the underlying
> devices is used for the stacked device. In this scenario, if only one of
> the underlying device reports an optimal IO size, that value is used as
> is for the stacked device but that value may not be a multiple of the
> stacked device physical sector size. In this case, blk_stack_limits()
> returns an error resulting in warnings being printed on device mapper
> startup (observed with dm-zoned dual drive setup combining a 512B
> sector SSD with a 4K sector HDD).
> 
> To fix this, rather than returning an error, the optimal IO size limit
> for the stacked device can be adjusted to the lowest common multiple
> (lcm) of the stacked physical sector size and optimal IO size, resulting
> in a value that is a multiple of the physical sector size while still
> being an optimal size for the underlying devices.
> 
> This patch is complementary to the patch "nvme: Fix io_opt limit
> setting" which prevents the nvme driver from reporting an optimal IO
> size equal to a namespace sector size for a device that does not report
> an optimal IO size.
> 
> Suggested-by: Keith Busch <kbusch@kernel.org>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  block/blk-settings.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/block/blk-settings.c b/block/blk-settings.c
> index 9a2c23cd9700..9a2b017ff681 100644
> --- a/block/blk-settings.c
> +++ b/block/blk-settings.c
> @@ -561,11 +561,8 @@ int blk_stack_limits(struct queue_limits *t, struct queue_limits *b,
>  	}
>  
>  	/* Optimal I/O a multiple of the physical block size? */
> -	if (t->io_opt & (t->physical_block_size - 1)) {
> -		t->io_opt = 0;
> -		t->misaligned = 1;
> -		ret = -1;
> -	}
> +	if (t->io_opt & (t->physical_block_size - 1))
> +		t->io_opt = lcm(t->io_opt, t->physical_block_size);
>  
>  	t->raid_partial_stripes_expensive =
>  		max(t->raid_partial_stripes_expensive,
> 

Jens,

Any comment on this patch ?
Note: the patch the patch "nvme: Fix io_opt limit setting" is already queued for
5.8.

-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

