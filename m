Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id C00A31D291E
	for <lists+dm-devel@lfdr.de>; Thu, 14 May 2020 09:53:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589442830;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=HpdqgFLAyojzfKJkYfQedTgCa+FwEEE3DGRthUK9gz4=;
	b=BLmN7qXeRZ8zzDvKQyA8W3OHSnXa9NQ0Vp1BihaLibkj6neNSMjrXW5frouNV/dCzYKsF6
	GJbMT95OXH6lYJ7ZAIy9uIvT/RMWoymFywXYnOe3qzEnj764I8+vAtrH1TgUh8qEVrlhrj
	9ZtTm7PBG0dD4XDZXlbF6REUbhTOBRk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-u-iqawl8MJWPkpyTSS2L0A-1; Thu, 14 May 2020 03:53:48 -0400
X-MC-Unique: u-iqawl8MJWPkpyTSS2L0A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81105872FEB;
	Thu, 14 May 2020 07:53:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D1BD85C1D6;
	Thu, 14 May 2020 07:53:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 89A71180954D;
	Thu, 14 May 2020 07:53:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04E7rIHA002223 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 14 May 2020 03:53:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 69A642166B27; Thu, 14 May 2020 07:53:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C2B22166BA4
	for <dm-devel@redhat.com>; Thu, 14 May 2020 07:53:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69D7B186E3A2
	for <dm-devel@redhat.com>; Thu, 14 May 2020 07:53:12 +0000 (UTC)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-103-wQ9PEKUcMqGmco6MH2W8Nw-1; Thu, 14 May 2020 03:53:07 -0400
X-MC-Unique: wQ9PEKUcMqGmco6MH2W8Nw-1
IronPort-SDR: +J8qH0dYgt3DIQtMCNWFFS0grtJu0zwR5OA5wJ/m37+EoI3JR1ut+HhvgyhK8VmZ0onWZpVPr7
	5IoWQ7pqLCsLbIylLsnf02YP23XNFWwLMYonvGVPET10h6oibDV59CFf/tHfhIxP6pQGb0VyMO
	A7qg6XC2J21nyGFVpG+iQY/stbb86gzMJLb0RojaO+CokyZ+2bUPBgq9155K87f/qqyAx/v63Y
	B1H+vkXlydZC62y0nRTCHmMGcOJz3pHp6bDm61ZWXyNo5wos0n2nbWFqQ+W43yxISCwRZE6bqK
	ggY=
X-IronPort-AV: E=Sophos;i="5.73,390,1583164800"; d="scan'208";a="240364931"
Received: from mail-dm6nam12lp2177.outbound.protection.outlook.com (HELO
	NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.177])
	by ob1.hgst.iphmx.com with ESMTP; 14 May 2020 15:53:41 +0800
Received: from BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	by BY5PR04MB6293.namprd04.prod.outlook.com (2603:10b6:a03:1ef::17)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.33;
	Thu, 14 May 2020 07:53:03 +0000
Received: from BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606]) by
	BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606%6]) with mapi id 15.20.3000.016;
	Thu, 14 May 2020 07:53:03 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 1/2] device-mapper: use dynamic debug instead of
	compile-time config option
Thread-Index: AQHWKbZA43FxlpbIHEa1m40eGN1o/g==
Date: Thu, 14 May 2020 07:53:03 +0000
Message-ID: <BY5PR04MB6900948BCF84B9B97C5E5921E7BC0@BY5PR04MB6900.namprd04.prod.outlook.com>
References: <20200514060929.85469-1-hare@suse.de>
	<20200514060929.85469-2-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 80f75802-37fb-4fdb-5fac-08d7f7dbd4e7
x-ms-traffictypediagnostic: BY5PR04MB6293:
x-microsoft-antispam-prvs: <BY5PR04MB6293797428C350CC2E32FC2DE7BC0@BY5PR04MB6293.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1002;
x-forefront-prvs: 040359335D
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sb7ZxUAxExTQze/sKmca9cyy8mVnaffUG1JSOtwtrW+hz5DAjCUjZ79X/u668OboaVZzyjHuzVpLWKLV9xzjru+il8r6ZHwQ+neMvPjXv9QSwRCEEj/mRcv9ZBctOfYnVT3cp+LJVQmc/OWA4w+Hs1jEXi7FLGyXEWJmgnFU5yiGAIaYrAxCDBY4aWVMJOHOgnV5sQPa5ZYFCar3/qndqv555psmWkoF6Ap8wYVptp5QKGWkuvEpu2Ir5gwoFRnR/tAu8yLoMijZx6n3oDX4oIgL0Z44GBJYNC79WuC0Q1q4H+W4BY2DdiUUwmTGw0J98/lfbATbH4LW3g0BWxnWd+tKTS9nXZeboeZie52ZN9jZ5fpj/gYDfgU7mxvIa70kkV5qkUuXYwmcviLibbnBLUrrjC4XUuL8wjyzvkprRPutO+AlEEVxhV8ASLI6grLS
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR04MB6900.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(396003)(366004)(136003)(39860400002)(376002)(346002)(66556008)(8936002)(5660300002)(76116006)(186003)(86362001)(66946007)(478600001)(33656002)(316002)(26005)(7696005)(6506007)(66476007)(110136005)(53546011)(4326008)(55016002)(71200400001)(8676002)(52536014)(64756008)(66446008)(2906002)(9686003);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: a5zkpE11y2V8PvTkbzn0x54/HaJsvM3GZe0Lo7IQmsrp38VqcSzSH2Xe99Yb3+jwlrT6yaG8H7BFnYFKCZ4v2KXEsO5sXd5OQWMlZb0xs2sSYC7Uo3MdUg/7QHoFNOFz7JlOwd6NyHxDQbbr5MuLWkhdAfOvzWwBlqzNL+2c+Jw0xJ739uA4ck1y3nHyzcMCKSMvmP7VEcNnGLbmlZdkIbM+WLCXcHbNitj03rN5SkHIlV4iSFrGJznUIAlKK2bIvG7/ukI2PyC/L7DCI+VhAdSa8ZZZ9myVnUC+LOXn1fCWXGwVitHZxuHJGU8QZNyJ6KQ0apQn0ZaRWBIt/pXeII/MlJ3jUUGntzW0RMTI/KPGy3Ricgz6IwKsWvGdGxm80M/aeCHcvSAeR45wixt2kCAlZW5+CqgqeQcZsWaqBJjvX6n3DjERfhGyFCl1KzmJ/VIaD7DKSkAqy5XshfWDBoJUMqNfuGIpy1XSy0DmSStKnEtUpBCaJLDsxIBceZTF
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80f75802-37fb-4fdb-5fac-08d7f7dbd4e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2020 07:53:03.6652 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JtH/J+l3scgejMAj03XOqVxVIM4Yrpw2bZ9udPHUQFSbP8+dStiudWbWlfJBBCrEVO2EQVNAGBvFNX0vwQSGVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6293
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04E7rIHA002223
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/2] device-mapper: use dynamic debug instead
 of compile-time config option
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/05/14 15:09, Hannes Reinecke wrote:
> Switch to use dynamic debug to avoid having recompile the kernel
> just to enable debugging messages.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>  include/linux/device-mapper.h | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/device-mapper.h b/include/linux/device-mapper.h
> index af48d9da3916..4694e1bb4196 100644
> --- a/include/linux/device-mapper.h
> +++ b/include/linux/device-mapper.h
> @@ -557,12 +557,11 @@ void *dm_vcalloc(unsigned long nmemb, unsigned long elem_size);
>  #define DMINFO(fmt, ...) pr_info(DM_FMT(fmt), ##__VA_ARGS__)
>  #define DMINFO_LIMIT(fmt, ...) pr_info_ratelimited(DM_FMT(fmt), ##__VA_ARGS__)
>  
> +#define DMDEBUG_LIMIT(fmt, ...) pr_debug_ratelimited(DM_FMT(fmt), ##__VA_ARGS__)

Why do you move this one out of the #ifdef CONFIG_DM_DEBUG scope ?

>  #ifdef CONFIG_DM_DEBUG
>  #define DMDEBUG(fmt, ...) printk(KERN_DEBUG DM_FMT(fmt), ##__VA_ARGS__)
> -#define DMDEBUG_LIMIT(fmt, ...) pr_debug_ratelimited(DM_FMT(fmt), ##__VA_ARGS__)
>  #else
> -#define DMDEBUG(fmt, ...) no_printk(fmt, ##__VA_ARGS__)
> -#define DMDEBUG_LIMIT(fmt, ...) no_printk(fmt, ##__VA_ARGS__)
> +#define DMDEBUG(fmt, ...) pr_debug(DM_FMT(fmt), ##__VA_ARGS__)
>  #endif
>  
>  #define DMEMIT(x...) sz += ((sz >= maxlen) ? \
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

