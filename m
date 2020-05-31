Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id CDC8D1E967D
	for <lists+dm-devel@lfdr.de>; Sun, 31 May 2020 11:12:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590916366;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sEtad+XSJv3D4SvZxqSO9e8e4x/4I9WF7+0+lXqV9sM=;
	b=Dsoun8hjBrsoMoQoxOuQbQQB2v/NqaR/VcRZC0oQ8gDBHrRZvxMZDzUtuPM1ZzamM5rFz7
	PAg9QjwfbRn9Po6ZWnfFr3Xckj0ofGhiEeB73XufWZkL3lzaWJKQ7GTfERUw4DwSP5KC+z
	F2K4tj0xlWdqJJ2H2WuVoKMshOQZqSg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-Wr3VUHGDOsyXnM5to9tf6Q-1; Sun, 31 May 2020 05:12:44 -0400
X-MC-Unique: Wr3VUHGDOsyXnM5to9tf6Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDA6B835B42;
	Sun, 31 May 2020 09:12:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F25625C1D3;
	Sun, 31 May 2020 09:12:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4D1B37CCC8;
	Sun, 31 May 2020 09:12:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04V9CUHr031217 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 31 May 2020 05:12:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B32D22156A2D; Sun, 31 May 2020 09:12:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ADFAE2166B27
	for <dm-devel@redhat.com>; Sun, 31 May 2020 09:12:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E04BD8007A4
	for <dm-devel@redhat.com>; Sun, 31 May 2020 09:12:27 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-260-CNHZA93lNP-qndAGfWAA-g-1; Sun, 31 May 2020 05:12:25 -0400
X-MC-Unique: CNHZA93lNP-qndAGfWAA-g-1
IronPort-SDR: gOzY3YMSIpZVrYg/pTTNOvRiPakV1vJ2Ux6ik0zK3a0hhT0weAe9sU8o/0DBPKTAPbLDiRkyEe
	twiHZvkRUyq8R4dJsmHno2Eqw0to/qHdEhyKywHkav9RVDOraIRt51040YHt7SxL33fDqptrWa
	lNejWuA4rJBYc6xjellfHf6lyBRgR4qM7gPy/6+k7aaHQ3HAWegAcGS2unVjcrIwZyd1Z15JTF
	j3KSqv/S+18JW4dMUxqfSUiZ94uQHWs0dl5voeZ8aKMlEtuNWdebszibHi+rTB0eRHHr/unEwg
	yqc=
X-IronPort-AV: E=Sophos;i="5.73,456,1583164800"; d="scan'208";a="139205675"
Received: from mail-mw2nam12lp2048.outbound.protection.outlook.com (HELO
	NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.48])
	by ob1.hgst.iphmx.com with ESMTP; 31 May 2020 17:12:18 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB0776.namprd04.prod.outlook.com (2603:10b6:903:e9::13)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19;
	Sun, 31 May 2020 09:12:16 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7%9]) with mapi id 15.20.3045.022;
	Sun, 31 May 2020 09:12:16 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "snitzer@redhat.com" <snitzer@redhat.com>, "hare@suse.de" <hare@suse.de>
Thread-Topic: [PATCH 12/14] dm-zoned: allocate zone by device index
Thread-Index: AQHWNeAXIgXqjMmbGEG0vJt2ibGGIqjB62UA
Date: Sun, 31 May 2020 09:12:15 +0000
Message-ID: <02d6c8031e64849f3718e5d036eca613b060206a.camel@wdc.com>
References: <20200529173907.40529-1-hare@suse.de>
	<20200529173907.40529-13-hare@suse.de>
In-Reply-To: <20200529173907.40529-13-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2 (3.36.2-1.fc32)
x-originating-ip: [60.117.181.124]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4ac4834c-8e1a-4551-ea7f-08d80542b675
x-ms-traffictypediagnostic: CY4PR04MB0776:
x-microsoft-antispam-prvs: <CY4PR04MB0776604352997FD486C440A6E78D0@CY4PR04MB0776.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-forefront-prvs: 0420213CCD
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SfZTsurEpr+L9srwrS6ILsReY0ZVoN2Kb0rqPk1+bsWXLwp0kYJc54Nuax/r0W4jv4gVpuI63NTTUwZQDDw48f8qw1amAUYADiLqo42f9AxDe+7i6OkPYJCjqBO3jch8RzO9OKe3NicF1CSu8xpk7RobT/JpNTbStHwbqFtvhAfhu/q8yv0xNyWdbjkdS7Lv6O1u3818U88VyQJMBrLWBxmN0XwzwSzd0+lRyLE3463e4wlvzNo0n+Etm/pdH5ztQvG08Gdx2azdj5auN3A/mxwXWsXSkSgp8EVXxDgRONZTCd/1h2P0r/hT032wQVYN
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(91956017)(6512007)(83380400001)(316002)(86362001)(110136005)(71200400001)(2616005)(6506007)(36756003)(8936002)(26005)(8676002)(76116006)(66476007)(2906002)(66446008)(4326008)(66556008)(186003)(5660300002)(64756008)(66946007)(478600001)(6486002);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: 1RptTxVmtkOjn1t5ItWbeVnx6VHASndSTb2gqTTi/pWGoOsOHbgKKuufybxXY4b0H7hjvIj9XpmlKMv+OA1c7MZlkPrtAM9e0+eucuYHdygE2pqcB7yRO4jiwSTCQ+kEgZMBIKvoUeZLQR3jCtN9KV/oRl6vnij/tFafv12wcyoIy4kcBb9XExNy74kd5K0RslFj9ImTxeCHmNsmxXauEhogBSUL72RkeYdQTaHbk8/VlZVImurqdP9ECwnb7MakSs7klW3Ell0ePy79LDn6TO61AfzJHFxi77EzIjjpVkCeKv6hkzlLCnhektnajJ6bYRAiUDNgZUMevR8S3ZIac/BR4DgTGsD1e9ymxSpDPPBj7E8Tf5bAmuT4eOMQjyX+FHA3EOHqgDWUsjmowiWHUNBInibVudBLobXRuo2yJtzfS8nbWiSnJOmeGVY5dg5067hylMmfhn3G2lWXYpsoJlX96pN6eU01ilDay1L9IpLd5CzVwStdAbRb1JVBSSe5
x-ms-exchange-transport-forked: True
Content-ID: <18116CB17313F44E8662F383421E3767@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ac4834c-8e1a-4551-ea7f-08d80542b675
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2020 09:12:15.9187 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V44kOgHf5xi0XGdiy3bcfks7TZevp8gBJ7xhJuaChfvA7DXM2WcR+JovgRbGQ4Qp7RwQbU2CmAben/mjowJoYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0776
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04V9CUHr031217
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 12/14] dm-zoned: allocate zone by device index
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

On Fri, 2020-05-29 at 19:39 +0200, Hannes Reinecke wrote:
> When allocating a zone we should pass in an indicator on which
> device the zone should be allocated; this increases performance
> for a multi-device setup as then reclaim can allocate zones on
> the device for which reclaim is running.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>  drivers/md/dm-zoned-metadata.c | 17 +++++++++++------
>  drivers/md/dm-zoned-reclaim.c  |  3 ++-
>  drivers/md/dm-zoned.h          |  3 ++-
>  3 files changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index 221163ae5f68..7f46b2ea554c 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -2048,7 +2048,7 @@ struct dm_zone *dmz_get_chunk_mapping(struct dmz_metadata *zmd, unsigned int chu
>  			goto out;
>  
>  		/* Allocate a random zone */
> -		dzone = dmz_alloc_zone(zmd, alloc_flags);
> +		dzone = dmz_alloc_zone(zmd, 0, alloc_flags);
>  		if (!dzone) {
>  			if (dmz_dev_is_dying(zmd)) {
>  				dzone = ERR_PTR(-EIO);
> @@ -2154,7 +2154,7 @@ struct dm_zone *dmz_get_chunk_buffer(struct dmz_metadata *zmd,
>  		goto out;
>  
>  	/* Allocate a random zone */
> -	bzone = dmz_alloc_zone(zmd, alloc_flags);
> +	bzone = dmz_alloc_zone(zmd, 0, alloc_flags);
>  	if (!bzone) {
>  		if (dmz_dev_is_dying(zmd)) {
>  			bzone = ERR_PTR(-EIO);
> @@ -2185,11 +2185,12 @@ struct dm_zone *dmz_get_chunk_buffer(struct dmz_metadata *zmd,
>   * Get an unmapped (free) zone.
>   * This must be called with the mapping lock held.
>   */
> -struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd, unsigned long flags)
> +struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd, unsigned int dev_idx,
> +			       unsigned long flags)
>  {
>  	struct list_head *list;
>  	struct dm_zone *zone;
> -	unsigned int dev_idx = 0;
> +	int i = 0;
>  
>  again:
>  	if (flags & DMZ_ALLOC_CACHE)
> @@ -2205,8 +2206,12 @@ struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd, unsigned long flags)
>  		 */
>  		if (!(flags & DMZ_ALLOC_RECLAIM))
>  			return NULL;
> -		if (dev_idx < zmd->nr_devs) {
> -			dev_idx++;
> +		/*
> +		 * Try to allocate from other devices
> +		 */
> +		if (i < zmd->nr_devs) {
> +			dev_idx = (dev_idx + 1) % zmd->nr_devs;
> +			i++;
>  			goto again;
>  		}
>  
> diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
> index 18edf1b9bf52..5a04e34d17a9 100644
> --- a/drivers/md/dm-zoned-reclaim.c
> +++ b/drivers/md/dm-zoned-reclaim.c
> @@ -288,7 +288,8 @@ static int dmz_reclaim_rnd_data(struct dmz_reclaim *zrc, struct dm_zone *dzone)
>  	/* Get a free random or sequential zone */
>  	dmz_lock_map(zmd);
>  again:
> -	szone = dmz_alloc_zone(zmd, alloc_flags | DMZ_ALLOC_RECLAIM);
> +	szone = dmz_alloc_zone(zmd, zrc->dev_idx,
> +			       alloc_flags | DMZ_ALLOC_RECLAIM);
>  	if (!szone && alloc_flags == DMZ_ALLOC_SEQ && dmz_nr_cache_zones(zmd)) {
>  		alloc_flags = DMZ_ALLOC_RND;
>  		goto again;
> diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
> index f2a760f62db5..ec020bb1caf7 100644
> --- a/drivers/md/dm-zoned.h
> +++ b/drivers/md/dm-zoned.h
> @@ -214,7 +214,8 @@ bool dmz_dev_is_dying(struct dmz_metadata *zmd);
>  #define DMZ_ALLOC_SEQ		0x04
>  #define DMZ_ALLOC_RECLAIM	0x10
>  
> -struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd, unsigned long flags);
> +struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd,
> +			       unsigned int dev_idx, unsigned long flags);
>  void dmz_free_zone(struct dmz_metadata *zmd, struct dm_zone *zone);
>  
>  void dmz_map_zone(struct dmz_metadata *zmd, struct dm_zone *zone,

Looks good.

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

-- 
Damien Le Moal
Western Digital Research

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

