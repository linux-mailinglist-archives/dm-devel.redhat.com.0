Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id E015F1E9687
	for <lists+dm-devel@lfdr.de>; Sun, 31 May 2020 11:21:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590916865;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=H6AeY8RNkfZo60iIXd/KciQLWZbwoN/Q5jryagA5yKU=;
	b=fYKUQZnKpjBx3O2WIZSIL3EpIhQ5D/bL5Bz7d+1s2usQJyUBoqXt7uG98+kTf1Asmg5hLE
	7CMRgwOTjebYuhrEHPnXe2h9h9ngq90aZsonBl330dW9zpXPDc7jHf5ozBGMuUUXf9202D
	2bfIa3pNPeEvz17sPyqPf79Td7Rj+Cg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-Tp02YxhLN0mDUFeUkQV_Hg-1; Sun, 31 May 2020 05:21:03 -0400
X-MC-Unique: Tp02YxhLN0mDUFeUkQV_Hg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3D34835B42;
	Sun, 31 May 2020 09:20:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FB882B7BB;
	Sun, 31 May 2020 09:20:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D666D7CCC8;
	Sun, 31 May 2020 09:20:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04V9JHvV031474 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 31 May 2020 05:19:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A9164202696B; Sun, 31 May 2020 09:19:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 96B322026D67
	for <dm-devel@redhat.com>; Sun, 31 May 2020 09:19:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 326C78007A4
	for <dm-devel@redhat.com>; Sun, 31 May 2020 09:19:15 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-208-MSWfzzaYNJC7uc1qgS4O3g-1; Sun, 31 May 2020 05:19:12 -0400
X-MC-Unique: MSWfzzaYNJC7uc1qgS4O3g-1
IronPort-SDR: WN8B0basMn+FiJwGwEvkc146rg7qSx1D69BG7gAQxCzyhitOXvMLMO0SLkLAygAFAO/JLHzAUJ
	tKt8ExPekSK1iAuUqZZtEg4VVXOgwt8V4Xal84Mif1+WterWZwVdCxfv5d6rAOwWB96/+t3xC8
	DsZ34nOFVNYc1tjZfRl25Gy5rDut5ywtAGXGvn0Kqz6IQB5DzKvj1cNzy8j64YPMOspB1ZANc8
	xho/uDbrChoPnoTI8vob8O8LXH7kP6yjVJbOyaBhYPVRw2ZvbbYhImKAHeev1lRVlYIJyIwT8x
	7oE=
X-IronPort-AV: E=Sophos;i="5.73,456,1583164800"; d="scan'208";a="143210523"
Received: from mail-bn7nam10lp2108.outbound.protection.outlook.com (HELO
	NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.108])
	by ob1.hgst.iphmx.com with ESMTP; 31 May 2020 17:19:11 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB1096.namprd04.prod.outlook.com (2603:10b6:910:55::32)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19;
	Sun, 31 May 2020 09:19:08 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7%9]) with mapi id 15.20.3045.022;
	Sun, 31 May 2020 09:19:08 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "snitzer@redhat.com" <snitzer@redhat.com>, "hare@suse.de" <hare@suse.de>
Thread-Topic: [PATCH 09/14] dm-zoned: per-device reclaim
Thread-Index: AQHWNeAXIGyd0mpU0kmyvHbNsyS1nKjB7VAA
Date: Sun, 31 May 2020 09:19:08 +0000
Message-ID: <162caf3ed21241302ed57014f33a772ecaf8420e.camel@wdc.com>
References: <20200529173907.40529-1-hare@suse.de>
	<20200529173907.40529-10-hare@suse.de>
In-Reply-To: <20200529173907.40529-10-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2 (3.36.2-1.fc32)
x-originating-ip: [60.117.181.124]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9702bede-5f37-40be-8d4c-08d80543ac85
x-ms-traffictypediagnostic: CY4PR04MB1096:
x-microsoft-antispam-prvs: <CY4PR04MB10963C8C75F5CB5A36CE970DE78D0@CY4PR04MB1096.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:269;
x-forefront-prvs: 0420213CCD
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2HfjL3P2kMaESxxXFTmxQBkTX8VJsjLDfcCk4l2XAVTyvI31gtImJiLh+IPURA0cNP9fCkYC8zyzM3fvirjeCGGErwHlr7TdkBZ+hRSsx6e1AgEEuEnG2uE4uABzo4RlJ3aApyHvklDHQqVh7istioOCiGQpRaFhCWBToI4exQ0WivgJleEJw/ijI8V1U9osTVPkdXCM+1cKlSSt8O7wAFV2g4QFZpox0R4KkEeiA2TevZqZH5CwYNnJFgfnbKGzXYYjdxaT26fL0ANWDgPmeoDzNQCoqrM7AxkGErHoQGFScKy3nJsQL/IR5Xd8E4APDyxWdjUmIn9sTGLvrKMd5g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(39860400002)(366004)(136003)(396003)(376002)(346002)(2906002)(83380400001)(6486002)(478600001)(86362001)(64756008)(6512007)(91956017)(76116006)(186003)(36756003)(66946007)(66476007)(66556008)(66446008)(6506007)(110136005)(4326008)(71200400001)(8676002)(2616005)(8936002)(5660300002)(26005)(30864003)(316002);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: PoBZOCsl9OaPfRXzVMq5yYPx6+1lo0vV2xDml2N3/vk9Ib8ZwY12/L3Cvz0gJthrQtJX1ViDPgrlVnImCfX12j2Gf89T96AGlOPUUVwJSFWkhhmnkmhlM6IWWWCOcWGPPCd3NJTsKuXSAbE+kCpPbaok29jfR5ZDiGwYwY1GYsdOhYRnRk/Be2BxpqJntxiIQ4EPJMQZT1l2ysgyjiDTiS/W5P10wSwwco3ZjKfxocOyk9bTXFYMhjN9d3fm/G7Gsl6Da+IjZyNdL5I+sp6TPnR5yRWVAI5rsU52ZDvIE//rV2XBZjomkyUUJkIkRuuqq7P/plQNPHDNXeB4IFyqT1d5gQBt48cwiFlaH0DauSDE+kaJb3AuFDXH8uKoCRKKbRB+WlOx7jlXyRx8JSZweE8Y0ecK952CrEV02tHeHg8BnVojlApdJQxCIR1ehgcLVt1wOCfAhqRJCMKoWe7UlVgeXw9gNo9bmq26jX7PW1l9VqO/4zgbtaoDCR0+t6Ny
x-ms-exchange-transport-forked: True
Content-ID: <2E3279058D24B0468125BBF25E9C9F7A@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9702bede-5f37-40be-8d4c-08d80543ac85
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2020 09:19:08.6917 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h3vUMcp2pRi1Wp3DAlWT6ja1x3sgnS7oVffxVGV93rVorjD6xBjK02CTugbfDxpITUoRI9ruvgexbeIZD5luAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB1096
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04V9JHvV031474
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 09/14] dm-zoned: per-device reclaim
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

On Fri, 2020-05-29 at 19:39 +0200, Hannes Reinecke wrote:
> Instead of having one reclaim workqueue for the entire set we should
> be allocating a reclaim workqueue per device; that will reduce
> contention and should boost performance for a multi-device setup.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>  drivers/md/dm-zoned-reclaim.c | 66 +++++++++++++++++++++++++++----------------
>  drivers/md/dm-zoned-target.c  | 41 +++++++++++++++++----------
>  drivers/md/dm-zoned.h         | 38 +++++++++++++------------
>  3 files changed, 88 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
> index e9e3b730e258..09843645248a 100644
> --- a/drivers/md/dm-zoned-reclaim.c
> +++ b/drivers/md/dm-zoned-reclaim.c
> @@ -21,6 +21,8 @@ struct dmz_reclaim {
>  	struct dm_kcopyd_throttle kc_throttle;
>  	int			kc_err;
>  
> +	int			dev_idx;
> +
>  	unsigned long		flags;
>  
>  	/* Last target access time */
> @@ -198,8 +200,8 @@ static int dmz_reclaim_buf(struct dmz_reclaim *zrc, struct dm_zone *dzone)
>  	struct dmz_metadata *zmd = zrc->metadata;
>  	int ret;
>  
> -	DMDEBUG("(%s): Chunk %u, move buf zone %u (weight %u) to data zone %u (weight %u)",
> -		dmz_metadata_label(zmd),
> +	DMDEBUG("(%s/%u): Chunk %u, move buf zone %u (weight %u) to data zone %u (weight %u)",
> +		dmz_metadata_label(zmd), zrc->dev_idx,
>  		dzone->chunk, bzone->id, dmz_weight(bzone),
>  		dzone->id, dmz_weight(dzone));
>  
> @@ -237,8 +239,8 @@ static int dmz_reclaim_seq_data(struct dmz_reclaim *zrc, struct dm_zone *dzone)
>  	struct dmz_metadata *zmd = zrc->metadata;
>  	int ret = 0;
>  
> -	DMDEBUG("(%s): Chunk %u, move data zone %u (weight %u) to buf zone %u (weight %u)",
> -		dmz_metadata_label(zmd),
> +	DMDEBUG("(%s/%u): Chunk %u, move data zone %u (weight %u) to buf zone %u (weight %u)",
> +		dmz_metadata_label(zmd), zrc->dev_idx,
>  		chunk, dzone->id, dmz_weight(dzone),
>  		bzone->id, dmz_weight(bzone));
>  
> @@ -295,8 +297,8 @@ static int dmz_reclaim_rnd_data(struct dmz_reclaim *zrc, struct dm_zone *dzone)
>  	if (!szone)
>  		return -ENOSPC;
>  
> -	DMDEBUG("(%s): Chunk %u, move %s zone %u (weight %u) to %s zone %u",
> -		dmz_metadata_label(zmd), chunk,
> +	DMDEBUG("(%s/%u): Chunk %u, move %s zone %u (weight %u) to %s zone %u",
> +		dmz_metadata_label(zmd), zrc->dev_idx, chunk,
>  		dmz_is_cache(dzone) ? "cache" : "rnd",
>  		dzone->id, dmz_weight(dzone),
>  		dmz_is_rnd(szone) ? "rnd" : "seq", szone->id);
> @@ -369,8 +371,8 @@ static int dmz_do_reclaim(struct dmz_reclaim *zrc)
>  	/* Get a data zone */
>  	dzone = dmz_get_zone_for_reclaim(zmd, dmz_target_idle(zrc));
>  	if (!dzone) {
> -		DMDEBUG("(%s): No zone found to reclaim",
> -			dmz_metadata_label(zmd));
> +		DMDEBUG("(%s/%u): No zone found to reclaim",
> +			dmz_metadata_label(zmd), zrc->dev_idx);
>  		return -EBUSY;
>  	}
>  
> @@ -417,24 +419,26 @@ static int dmz_do_reclaim(struct dmz_reclaim *zrc)
>  out:
>  	if (ret) {
>  		if (ret == -EINTR)
> -			DMDEBUG("(%s): reclaim zone %u interrupted",
> -				dmz_metadata_label(zmd), rzone->id);
> +			DMDEBUG("(%s/%u): reclaim zone %u interrupted",
> +				dmz_metadata_label(zmd), zrc->dev_idx,
> +				rzone->id);
>  		else
> -			DMDEBUG("(%s): Failed to reclaim zone %u, err %d",
> -				dmz_metadata_label(zmd), rzone->id, ret);
> +			DMDEBUG("(%s/%u): Failed to reclaim zone %u, err %d",
> +				dmz_metadata_label(zmd), zrc->dev_idx,
> +				rzone->id, ret);
>  		dmz_unlock_zone_reclaim(dzone);
>  		return ret;
>  	}
>  
>  	ret = dmz_flush_metadata(zrc->metadata);
>  	if (ret) {
> -		DMDEBUG("(%s): Metadata flush for zone %u failed, err %d",
> -			dmz_metadata_label(zmd), rzone->id, ret);
> +		DMDEBUG("(%s/%u): Metadata flush for zone %u failed, err %d",
> +			dmz_metadata_label(zmd), zrc->dev_idx, rzone->id, ret);
>  		return ret;
>  	}
>  
> -	DMDEBUG("(%s): Reclaimed zone %u in %u ms",
> -		dmz_metadata_label(zmd),
> +	DMDEBUG("(%s/%u): Reclaimed zone %u in %u ms",
> +		dmz_metadata_label(zmd), zrc->dev_idx,
>  		rzone->id, jiffies_to_msecs(jiffies - start));
>  	return 0;
>  }
> @@ -461,10 +465,20 @@ static unsigned int dmz_reclaim_percentage(struct dmz_reclaim *zrc)
>   */
>  static bool dmz_should_reclaim(struct dmz_reclaim *zrc, unsigned int p_unmap)
>  {
> -	unsigned int nr_reclaim = dmz_nr_rnd_zones(zrc->metadata);
> +	unsigned int nr_reclaim;
> +
> +	nr_reclaim = dmz_nr_rnd_zones(zrc->metadata);

This change is not really necessary: same code in the end.

>  
> -	if (dmz_nr_cache_zones(zrc->metadata))
> +	if (dmz_nr_cache_zones(zrc->metadata)) {
> +		/*
> +		 * The first device in a multi-device
> +		 * setup only contains cache zones, so
> +		 * never start reclaim there.
> +		 */
> +		if (zrc->dev_idx == 0)
> +			return false;
>  		nr_reclaim += dmz_nr_cache_zones(zrc->metadata);
> +	}
>  
>  	/* Reclaim when idle */
>  	if (dmz_target_idle(zrc) && nr_reclaim)
> @@ -488,7 +502,7 @@ static void dmz_reclaim_work(struct work_struct *work)
>  {
>  	struct dmz_reclaim *zrc = container_of(work, struct dmz_reclaim, work.work);
>  	struct dmz_metadata *zmd = zrc->metadata;
> -	unsigned int p_unmap;
> +	unsigned int p_unmap, nr_unmap_rnd = 0, nr_rnd = 0;
>  	int ret;
>  
>  	if (dmz_dev_is_dying(zmd))
> @@ -514,8 +528,11 @@ static void dmz_reclaim_work(struct work_struct *work)
>  		zrc->kc_throttle.throttle = min(75U, 100U - p_unmap / 2);
>  	}
>  
> -	DMDEBUG("(%s): Reclaim (%u): %s, %u%% free zones (%u/%u cache %u/%u random)",
> -		dmz_metadata_label(zmd),
> +	nr_unmap_rnd = dmz_nr_unmap_rnd_zones(zmd);
> +	nr_rnd = dmz_nr_rnd_zones(zmd);
> +
> +	DMDEBUG("(%s/%u): Reclaim (%u): %s, %u%% free zones (%u/%u cache %u/%u random)",
> +		dmz_metadata_label(zmd), zrc->dev_idx,
>  		zrc->kc_throttle.throttle,
>  		(dmz_target_idle(zrc) ? "Idle" : "Busy"),
>  		p_unmap, dmz_nr_unmap_cache_zones(zmd),
> @@ -536,7 +553,7 @@ static void dmz_reclaim_work(struct work_struct *work)
>   * Initialize reclaim.
>   */
>  int dmz_ctr_reclaim(struct dmz_metadata *zmd,
> -		    struct dmz_reclaim **reclaim)
> +		    struct dmz_reclaim **reclaim, int idx)
>  {
>  	struct dmz_reclaim *zrc;
>  	int ret;
> @@ -547,6 +564,7 @@ int dmz_ctr_reclaim(struct dmz_metadata *zmd,
>  
>  	zrc->metadata = zmd;
>  	zrc->atime = jiffies;
> +	zrc->dev_idx = idx;
>  
>  	/* Reclaim kcopyd client */
>  	zrc->kc = dm_kcopyd_client_create(&zrc->kc_throttle);
> @@ -558,8 +576,8 @@ int dmz_ctr_reclaim(struct dmz_metadata *zmd,
>  
>  	/* Reclaim work */
>  	INIT_DELAYED_WORK(&zrc->work, dmz_reclaim_work);
> -	zrc->wq = alloc_ordered_workqueue("dmz_rwq_%s", WQ_MEM_RECLAIM,
> -					  dmz_metadata_label(zmd));
> +	zrc->wq = alloc_ordered_workqueue("dmz_rwq_%s_%d", WQ_MEM_RECLAIM,
> +					  dmz_metadata_label(zmd), idx);
>  	if (!zrc->wq) {
>  		ret = -ENOMEM;
>  		goto err;
> diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
> index 087dd4801663..97d63d8e6c19 100644
> --- a/drivers/md/dm-zoned-target.c
> +++ b/drivers/md/dm-zoned-target.c
> @@ -41,6 +41,7 @@ struct dm_chunk_work {
>   */
>  struct dmz_target {
>  	struct dm_dev		*ddev[DMZ_MAX_DEVS];
> +	unsigned int		nr_ddevs;
>  
>  	unsigned long		flags;
>  
> @@ -50,9 +51,6 @@ struct dmz_target {
>  	/* For metadata handling */
>  	struct dmz_metadata     *metadata;
>  
> -	/* For reclaim */
> -	struct dmz_reclaim	*reclaim;
> -
>  	/* For chunk work */
>  	struct radix_tree_root	chunk_rxtree;
>  	struct workqueue_struct *chunk_wq;
> @@ -404,14 +402,15 @@ static void dmz_handle_bio(struct dmz_target *dmz, struct dm_chunk_work *cw,
>  		dm_per_bio_data(bio, sizeof(struct dmz_bioctx));
>  	struct dmz_metadata *zmd = dmz->metadata;
>  	struct dm_zone *zone;
> -	int ret;
> +	int i, ret;
>  
>  	/*
>  	 * Write may trigger a zone allocation. So make sure the
>  	 * allocation can succeed.
>  	 */
>  	if (bio_op(bio) == REQ_OP_WRITE)
> -		dmz_schedule_reclaim(dmz->reclaim);
> +		for (i = 0; i < dmz->nr_ddevs; i++)
> +			dmz_schedule_reclaim(dmz->dev[i].reclaim);
>  
>  	dmz_lock_metadata(zmd);
>  
> @@ -431,6 +430,7 @@ static void dmz_handle_bio(struct dmz_target *dmz, struct dm_chunk_work *cw,
>  	if (zone) {
>  		dmz_activate_zone(zone);
>  		bioctx->zone = zone;
> +		dmz_reclaim_bio_acc(zone->dev->reclaim);
>  	}
>  
>  	switch (bio_op(bio)) {
> @@ -577,7 +577,6 @@ static int dmz_queue_chunk_work(struct dmz_target *dmz, struct bio *bio)
>  
>  	bio_list_add(&cw->bio_list, bio);
>  
> -	dmz_reclaim_bio_acc(dmz->reclaim);
>  	if (queue_work(dmz->chunk_wq, &cw->work))
>  		dmz_get_chunk_work(cw);
>  out:
> @@ -822,7 +821,7 @@ static int dmz_fixup_devices(struct dm_target *ti)
>  static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  {
>  	struct dmz_target *dmz;
> -	int ret;
> +	int ret, i;
>  
>  	/* Check arguments */
>  	if (argc < 1 || argc > 2) {
> @@ -842,6 +841,7 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  		kfree(dmz);
>  		return -ENOMEM;
>  	}
> +	dmz->nr_ddevs = argc;
>  	ti->private = dmz;
>  
>  	/* Get the target zoned block device */
> @@ -916,10 +916,12 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  	mod_delayed_work(dmz->flush_wq, &dmz->flush_work, DMZ_FLUSH_PERIOD);
>  
>  	/* Initialize reclaim */
> -	ret = dmz_ctr_reclaim(dmz->metadata, &dmz->reclaim);
> -	if (ret) {
> -		ti->error = "Zone reclaim initialization failed";
> -		goto err_fwq;
> +	for (i = 0; i < dmz->nr_ddevs; i++) {
> +		ret = dmz_ctr_reclaim(dmz->metadata, &dmz->dev[i].reclaim, i);
> +		if (ret) {
> +			ti->error = "Zone reclaim initialization failed";
> +			goto err_fwq;
> +		}
>  	}
>  
>  	DMINFO("(%s): Target device: %llu 512-byte logical sectors (%llu blocks)",
> @@ -952,11 +954,13 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  static void dmz_dtr(struct dm_target *ti)
>  {
>  	struct dmz_target *dmz = ti->private;
> +	int i;
>  
>  	flush_workqueue(dmz->chunk_wq);
>  	destroy_workqueue(dmz->chunk_wq);
>  
> -	dmz_dtr_reclaim(dmz->reclaim);
> +	for (i = 0; i < dmz->nr_ddevs; i++)
> +		dmz_dtr_reclaim(dmz->dev[i].reclaim);
>  
>  	cancel_delayed_work_sync(&dmz->flush_work);
>  	destroy_workqueue(dmz->flush_wq);
> @@ -1025,9 +1029,11 @@ static int dmz_prepare_ioctl(struct dm_target *ti, struct block_device **bdev)
>  static void dmz_suspend(struct dm_target *ti)
>  {
>  	struct dmz_target *dmz = ti->private;
> +	int i;
>  
>  	flush_workqueue(dmz->chunk_wq);
> -	dmz_suspend_reclaim(dmz->reclaim);
> +	for (i = 0; i < dmz->nr_ddevs; i++)
> +		dmz_suspend_reclaim(dmz->dev[i].reclaim);
>  	cancel_delayed_work_sync(&dmz->flush_work);
>  }
>  
> @@ -1037,9 +1043,11 @@ static void dmz_suspend(struct dm_target *ti)
>  static void dmz_resume(struct dm_target *ti)
>  {
>  	struct dmz_target *dmz = ti->private;
> +	int i;
>  
>  	queue_delayed_work(dmz->flush_wq, &dmz->flush_work, DMZ_FLUSH_PERIOD);
> -	dmz_resume_reclaim(dmz->reclaim);
> +	for (i = 0; i < dmz->nr_ddevs; i++)
> +		dmz_resume_reclaim(dmz->dev[i].reclaim);
>  }
>  
>  static int dmz_iterate_devices(struct dm_target *ti,
> @@ -1100,7 +1108,10 @@ static int dmz_message(struct dm_target *ti, unsigned int argc, char **argv,
>  	int r = -EINVAL;
>  
>  	if (!strcasecmp(argv[0], "reclaim")) {
> -		dmz_schedule_reclaim(dmz->reclaim);
> +		int i;
> +
> +		for (i = 0; i < dmz->nr_ddevs; i++)
> +			dmz_schedule_reclaim(dmz->dev[i].reclaim);
>  		r = 0;
>  	} else
>  		DMERR("unrecognized message %s", argv[0]);
> diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
> index 983f5b5e9fa0..0cc3459f78ce 100644
> --- a/drivers/md/dm-zoned.h
> +++ b/drivers/md/dm-zoned.h
> @@ -54,6 +54,7 @@ struct dmz_reclaim;
>  struct dmz_dev {
>  	struct block_device	*bdev;
>  	struct dmz_metadata	*metadata;
> +	struct dmz_reclaim	*reclaim;
>  
>  	char			name[BDEVNAME_SIZE];
>  	uuid_t			uuid;
> @@ -229,23 +230,6 @@ static inline void dmz_activate_zone(struct dm_zone *zone)
>  	atomic_inc(&zone->refcount);
>  }
>  
> -/*
> - * Deactivate a zone. This decrement the zone reference counter
> - * indicating that all BIOs to the zone have completed when the count is 0.
> - */
> -static inline void dmz_deactivate_zone(struct dm_zone *zone)
> -{
> -	atomic_dec(&zone->refcount);
> -}
> -
> -/*
> - * Test if a zone is active, that is, has a refcount > 0.
> - */
> -static inline bool dmz_is_active(struct dm_zone *zone)
> -{
> -	return atomic_read(&zone->refcount);
> -}
> -
>  int dmz_lock_zone_reclaim(struct dm_zone *zone);
>  void dmz_unlock_zone_reclaim(struct dm_zone *zone);
>  struct dm_zone *dmz_get_zone_for_reclaim(struct dmz_metadata *zmd, bool idle);
> @@ -272,7 +256,7 @@ int dmz_merge_valid_blocks(struct dmz_metadata *zmd, struct dm_zone *from_zone,
>  /*
>   * Functions defined in dm-zoned-reclaim.c
>   */
> -int dmz_ctr_reclaim(struct dmz_metadata *zmd, struct dmz_reclaim **zrc);
> +int dmz_ctr_reclaim(struct dmz_metadata *zmd, struct dmz_reclaim **zrc, int idx);
>  void dmz_dtr_reclaim(struct dmz_reclaim *zrc);
>  void dmz_suspend_reclaim(struct dmz_reclaim *zrc);
>  void dmz_resume_reclaim(struct dmz_reclaim *zrc);
> @@ -285,4 +269,22 @@ void dmz_schedule_reclaim(struct dmz_reclaim *zrc);
>  bool dmz_bdev_is_dying(struct dmz_dev *dmz_dev);
>  bool dmz_check_bdev(struct dmz_dev *dmz_dev);
>  
> +/*
> + * Deactivate a zone. This decrement the zone reference counter
> + * indicating that all BIOs to the zone have completed when the count is 0.
> + */
> +static inline void dmz_deactivate_zone(struct dm_zone *zone)
> +{
> +	dmz_reclaim_bio_acc(zone->dev->reclaim);
> +	atomic_dec(&zone->refcount);
> +}
> +
> +/*
> + * Test if a zone is active, that is, has a refcount > 0.
> + */
> +static inline bool dmz_is_active(struct dm_zone *zone)
> +{
> +	return atomic_read(&zone->refcount);
> +}
> +
>  #endif /* DM_ZONED_H */

Apart from the nit above, looks good.

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

-- 
Damien Le Moal
Western Digital Research

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

