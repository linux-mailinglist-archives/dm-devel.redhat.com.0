Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8D8F31E04B1
	for <lists+dm-devel@lfdr.de>; Mon, 25 May 2020 04:29:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590373742;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=wcGgysrTvkL7y/eztMr3J6UQkpy2u6P2HytwTpH+CSo=;
	b=Mfau4gvI5EvjOsjDb0GgyjzKJ4aqeFPqcgxzK5vyvce1oL1WI0OB4L+0HfWT2Sw16vWFQS
	77rV2O5pQHhOM7mWsgxR40ZxR7ZFDN2Fo3G8Jp2QQOjctu4FlcwJZ1pSmpb1C4zn8R4p+x
	09wCvpASsByNm//T/zwnCrbM3O6dvuQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-yZpuCteNNmeB3GUQFIoG1w-1; Sun, 24 May 2020 22:28:49 -0400
X-MC-Unique: yZpuCteNNmeB3GUQFIoG1w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA8E0100CCC3;
	Mon, 25 May 2020 02:28:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9569519D7C;
	Mon, 25 May 2020 02:28:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 294C754D15;
	Mon, 25 May 2020 02:28:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04P2SfOT000564 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 24 May 2020 22:28:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6B47F17459; Mon, 25 May 2020 02:28:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 65F371731D
	for <dm-devel@redhat.com>; Mon, 25 May 2020 02:28:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 396A3185A78B
	for <dm-devel@redhat.com>; Mon, 25 May 2020 02:28:39 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-167-7GmvnrDAMtmnrTGcCTGxWA-1; Sun, 24 May 2020 22:28:36 -0400
X-MC-Unique: 7GmvnrDAMtmnrTGcCTGxWA-1
IronPort-SDR: kiWZF2rxtO09Fs0YckK/LBa9JEnXAFPaKqM7KuNdYvlyFlGNs5teFUL/5kJzQZVy6XhUH+aM4Y
	RIuvOHLyVqtgvWa6wVg+SN0NZP0DBfTYsamoBDcrlGhjp158ngaoz66pa9CFiWKHW8q77/ImmA
	GoWEobrjIq1U3h5K17vXLTu6p6yKSDnsfGNYu2YGe8rvlxrHpFuvCpO2hP2e8qPFC26NSHFnVk
	ftWZftD4qLSU+rO+o8pUNP0bFOcYO7KG2LNbnyZ5bm+E04PBhDgzHm8goHxISAX4vqIFm2XqSb
	aek=
X-IronPort-AV: E=Sophos;i="5.73,431,1583164800"; d="scan'208";a="247463272"
Received: from mail-co1nam04lp2056.outbound.protection.outlook.com (HELO
	NAM04-CO1-obe.outbound.protection.outlook.com) ([104.47.45.56])
	by ob1.hgst.iphmx.com with ESMTP; 25 May 2020 10:28:32 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB3735.namprd04.prod.outlook.com (2603:10b6:903:e5::17)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.24;
	Mon, 25 May 2020 02:28:31 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7%9]) with mapi id 15.20.3021.029;
	Mon, 25 May 2020 02:28:31 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>
Thread-Topic: [PATCH 09/12] dm-zoned: improve logging messages for reclaim
Thread-Index: AQHWME8nhTr6fpN06UG/Vbwws6Sxpg==
Date: Mon, 25 May 2020 02:28:31 +0000
Message-ID: <CY4PR04MB37516C617F9B021B240374A4E7B30@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200522153901.133375-1-hare@suse.de>
	<20200522153901.133375-10-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.255.47.8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 009b1b9e-26e9-4888-8c5b-08d80053512c
x-ms-traffictypediagnostic: CY4PR04MB3735:
x-microsoft-antispam-prvs: <CY4PR04MB3735136FB452CEE368814B8FE7B30@CY4PR04MB3735.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:146;
x-forefront-prvs: 0414DF926F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j4y0vEKI2uJrFs4ZXBYJIDBaVNrV7l8lsK4FUPiuOovBMWppJ9NZRHqfY70TtJ4jtdfiObSPtE/dhVQqgLZUw1VtRZ/bF5uE20r489IxlI5Eew9leeUCe29A1cChVSoZWojMGsHNY5JibkU5+BJOwwO9lGcHYEZNZRS9sqdoqH/1b44c0yijTe8SJTK8CTF2L3aGP5FLrQyKCO+WTYS22ThS7q3kpcX9G78UzPo9oORYSOQjBCa7XRfvUh1H0am6upe8Puwh1k9fe/elv7NRhufaM/26/4FQKdT8C3tQs6CX0euVo90kYYed7m+nlg0xqUInNUyrP18ctna9Hw+S2A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(346002)(39860400002)(376002)(136003)(396003)(366004)(2906002)(7696005)(53546011)(4326008)(86362001)(6916009)(55016002)(6506007)(478600001)(316002)(71200400001)(15650500001)(9686003)(54906003)(5660300002)(52536014)(186003)(8676002)(33656002)(66556008)(64756008)(91956017)(66946007)(66446008)(26005)(76116006)(66476007)(8936002);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: 5+GwF1NSy41XITNL+wkGNE4YbiE8vdec3U3CN4wBGwViDoR7+IOC6eQJfOvVpHHh92PXbj2CWoUx3wQUewtadTnp0o9zNEn0ApBGBK0LTWOKNhVRt2iOgOaT9qOc0aFVE3811k68TpnxL6WNaDT4vOwCjy3WANqK679j3G7Th28YLxjKO4lHIty2BEnG9Y3DIUYIlDjTJrjgnENBgLQLZeOviak2FIl+iCw/hELzuuwBAMfF4kIf345lWpcPQGUzMPgdU1uzSIjERAc6C54wthc1gjg4mp06yfQfMlvwRpy5r/9H4Z3sPF3AsoxAIv6Z3dE1bH58BXkKyqz9Sn4NEEEhQMnK1FUy7J4+fZbZ3QN8ODzAVOo3WwhoV07Shc/ZozlJK/V7AGc21kHVjLrwTSgSCT5g2sIdqkEdEq+Ix0kl8+BAze6f2mGfbmSb9xSricwpSsvj9CPT+0wo0+FkydGxqM0vgzmUMwyAY4bkgL8=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 009b1b9e-26e9-4888-8c5b-08d80053512c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2020 02:28:31.5685 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0H962n6WRhrVw+cf1neqQANbB0+OLZXCYiNxUyHAXBZKKT3z8E3Adiyem0vedR5dJQkulB+hdxavUtJ2+KjFEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB3735
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04P2SfOT000564
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] [PATCH 09/12] dm-zoned: improve logging messages for
	reclaim
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/05/23 0:39, Hannes Reinecke wrote:
> Instead of just reporting the errno this patch adds some more
> verbose debugging message in the reclaim path.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>  drivers/md/dm-zoned-reclaim.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
> index d1a72b42dea2..fba0d48e38a7 100644
> --- a/drivers/md/dm-zoned-reclaim.c
> +++ b/drivers/md/dm-zoned-reclaim.c
> @@ -367,8 +367,11 @@ static int dmz_do_reclaim(struct dmz_reclaim *zrc)
>  
>  	/* Get a data zone */
>  	dzone = dmz_get_zone_for_reclaim(zmd, dmz_target_idle(zrc));
> -	if (!dzone)
> +	if (!dzone) {
> +		DMDEBUG("(%s): No zone found to reclaim",
> +			dmz_metadata_label(zmd));
>  		return -EBUSY;
> +	}
>  
>  	start = jiffies;
>  	if (dmz_is_cache(dzone) || dmz_is_rnd(dzone)) {
> @@ -412,6 +415,12 @@ static int dmz_do_reclaim(struct dmz_reclaim *zrc)
>  	}
>  out:
>  	if (ret) {
> +		if (ret == -EINTR)
> +			DMDEBUG("(%s): reclaim zone %u interrupted",
> +				dmz_metadata_label(zmd), rzone->id);
> +		else
> +			DMDEBUG("(%s): Failed to reclaim zone %u, err %d",
> +				dmz_metadata_label(zmd), rzone->id, ret);
>  		dmz_unlock_zone_reclaim(dzone);
>  		return ret;
>  	}
> @@ -515,8 +524,6 @@ static void dmz_reclaim_work(struct work_struct *work)
>  
>  	ret = dmz_do_reclaim(zrc);
>  	if (ret && ret != -EINTR) {
> -		DMDEBUG("(%s): Reclaim error %d",
> -			dmz_metadata_label(zmd), ret);
>  		if (!dmz_check_dev(zmd))
>  			return;
>  	}
> 

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

