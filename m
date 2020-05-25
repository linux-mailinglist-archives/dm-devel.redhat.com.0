Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 5B2561E04D4
	for <lists+dm-devel@lfdr.de>; Mon, 25 May 2020 04:47:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590374825;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=sH7YErYkoEchFT1mdRhtHrBSt/XXVyWW2KvifVv3rtU=;
	b=NK1XxrqAwOkYvI8d8iUh+l4P+fBmWW2YfSmlrAvP5xFgQct4JsF10R6U/8eJKRFzoJa4UC
	2yxE9qUxbkZQ2KrcWg6clXyl48d9mVMTYW7AgntelLHEF9WvCBF9KKeTdGU1mdTyudk+YU
	TvvLcWB/Hh5+pxBa1Xwwt1ljRD7VMyw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-7CGZYABKMZqORebqEKHGlw-1; Sun, 24 May 2020 22:47:02 -0400
X-MC-Unique: 7CGZYABKMZqORebqEKHGlw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBDB6107ACF3;
	Mon, 25 May 2020 02:46:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BBA083C02;
	Mon, 25 May 2020 02:46:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 494AF54D2B;
	Mon, 25 May 2020 02:46:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04P2kqlV002165 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 24 May 2020 22:46:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1F4972026E1C; Mon, 25 May 2020 02:46:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 06CB1202696B
	for <dm-devel@redhat.com>; Mon, 25 May 2020 02:46:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A89078007B1
	for <dm-devel@redhat.com>; Mon, 25 May 2020 02:46:48 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-240-tHbF7UJMMqyWA2fuPluyEQ-1; Sun, 24 May 2020 22:46:43 -0400
X-MC-Unique: tHbF7UJMMqyWA2fuPluyEQ-1
IronPort-SDR: AbhI22Zr79m6dUOSuO3eAVekf/J8S0ES5nL+KzIz+qjvv0OiWBudVGBkgU+250dKrA9AVxvaUh
	h8xLMmfXivwriaHKsUqkjyaN8jBroBT6K8vJ6BWKMYj4rwo0zr3WlmGUQznrohWaUzOOYElXrM
	zbdkOCf55k6XOJk/TyEsgQMH5QFJowDInemCqNSVXuU+6yzQfW/V0ugGwj8PQ7J8rGbAKi1Cc4
	C/nHcScN4Da9ykweGxXLMkcimlDSMLdZ4uhLE1/umx5ndxTrCVmLuEPJDUNfy7Gb1SJKcAGJv8
	wFE=
X-IronPort-AV: E=Sophos;i="5.73,431,1583164800"; d="scan'208";a="139870175"
Received: from mail-bn8nam11lp2175.outbound.protection.outlook.com (HELO
	NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.175])
	by ob1.hgst.iphmx.com with ESMTP; 25 May 2020 10:46:43 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB0359.namprd04.prod.outlook.com (2603:10b6:903:b3::19)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27;
	Mon, 25 May 2020 02:46:39 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7%9]) with mapi id 15.20.3021.029;
	Mon, 25 May 2020 02:46:39 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>
Thread-Topic: [PATCH 12/12] dm-zoned: per-device reclaim
Thread-Index: AQHWME8nT/11j7bq8UmpUTI1iaa8qA==
Date: Mon, 25 May 2020 02:46:39 +0000
Message-ID: <CY4PR04MB3751D84C1EC2D98D3D181F97E7B30@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200522153901.133375-1-hare@suse.de>
	<20200522153901.133375-13-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.255.47.8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b1de15f5-7ab3-4905-ab73-08d80055d987
x-ms-traffictypediagnostic: CY4PR04MB0359:
x-microsoft-antispam-prvs: <CY4PR04MB035902599BF62AD5E3186BA8E7B30@CY4PR04MB0359.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:136;
x-forefront-prvs: 0414DF926F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s+yZ1XMJ8wLNaegMByE6M6rlt+If043y92XiC2hpUsDsFO7C1DBale1n8UGFYGUdOJp+lgeSwl148oc7+wLHrPyRi4qN++jDiU3Z8uril8jJv9lm0i1+CH6SCMLcSxgt2nV/mcUUQ+ZGutL5w6IKL/V0FxJAqSzs3b2EzeR7aRii5JMBVe+Okv4HZ042odCyWOXn+t1mDOb1ry4RBUSP5KNTNpcT7ATPOx1e334IjAJJuexi2iHe8u+nPhBAevtGgUxnIdHEr12zwcW0H7c1UJtXNIuB57PvRqfv9ViMEU6V0oeD9fXKqRAdYcUH1XV/87mnTXAM0WFKANJgqYay2Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(376002)(136003)(39860400002)(366004)(346002)(396003)(478600001)(6506007)(53546011)(86362001)(33656002)(64756008)(66946007)(7696005)(4326008)(66476007)(66446008)(66556008)(52536014)(76116006)(316002)(91956017)(54906003)(55016002)(71200400001)(2906002)(8936002)(30864003)(8676002)(6916009)(26005)(9686003)(186003)(5660300002);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: i2ZyJhwzXQsSHjbOIIGlH6AqmcFzYNIEUibnEPRoAGpHxmvzWpLdvEinNaDH4Xa2jqzqltNqYrXYg3fHN64mDuZOco39Rkw4RDRC+YBNxoWUElgH4iJufmeJyrpSmzoRVWM9OKDrS2g8HLQNcZat4PgPaT14KshctMPRw6niAdA1zh5QaWSvT3LdM75xrS/T/Xog/M7PgHEKuSmuFeQ0GBc6VdIcfNuasw0SEEAlClc5msicFk4twLw2SPOKEt6zUuLxVfm2zx3xd0fHt6Hf8MUQo5e0uTvpaS/vRclnHQ91Gr8DM9uUcdnA4cUJr+NZbK48dwIF79bqBCiVW49YEg2mEKVDal2eaTRotbZ5142UeOdcJ2Rz2zrs5IC88EIswxjdEwx9/XiUq0SNhrYnKPvncNfZgp44YHoOF64QkDipNL5Jm+xXfHSbJH8xb7SV2h3fnmwdzTEcK/AoKfpCmyj18ltjXzrN+9W8sk/D6jM=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1de15f5-7ab3-4905-ab73-08d80055d987
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2020 02:46:39.3982 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +6xwPfLnfXiwcheHXbDDEIrZoflmnUATyN845bdeWIo5M3VwFjELKW6VFhx0mfy7KPDnU/AVhTujfXYJj3XdHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0359
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04P2kqlV002165
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] [PATCH 12/12] dm-zoned: per-device reclaim
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/05/23 0:39, Hannes Reinecke wrote:
> Instead of having one reclaim workqueue for the entire set we should
> be allocating a reclaim workqueue per device; that will reduce
> contention and should boost performance for a multi-device setup.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>  drivers/md/dm-zoned-reclaim.c | 70 +++++++++++++++++++++----------------------
>  drivers/md/dm-zoned-target.c  | 36 +++++++++++++---------
>  drivers/md/dm-zoned.h         | 38 ++++++++++++-----------
>  3 files changed, 76 insertions(+), 68 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
> index f2e053b5f2db..6f3d8f18b989 100644
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
> @@ -197,8 +199,8 @@ static int dmz_reclaim_buf(struct dmz_reclaim *zrc, struct dm_zone *dzone)
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
> @@ -236,8 +238,8 @@ static int dmz_reclaim_seq_data(struct dmz_reclaim *zrc, struct dm_zone *dzone)
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
> @@ -294,8 +296,8 @@ static int dmz_reclaim_rnd_data(struct dmz_reclaim *zrc, struct dm_zone *dzone)
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
> @@ -368,8 +370,8 @@ static int dmz_do_reclaim(struct dmz_reclaim *zrc)
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
> @@ -416,24 +418,26 @@ static int dmz_do_reclaim(struct dmz_reclaim *zrc)
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
> @@ -448,12 +452,8 @@ static unsigned int dmz_reclaim_percentage(struct dmz_reclaim *zrc)
>  		nr_zones = nr_cache;
>  		nr_unmap = dmz_nr_unmap_cache_zones(zmd);
>  	} else {
> -		int i;
> -
> -		for (i = 0; i < dmz_nr_devs(zmd); i++) {
> -			nr_zones += dmz_nr_rnd_zones(zmd, i);
> -			nr_unmap += dmz_nr_unmap_rnd_zones(zmd, i);
> -		}
> +		nr_zones = dmz_nr_rnd_zones(zmd, zrc->dev_idx);
> +		nr_unmap = dmz_nr_unmap_rnd_zones(zmd, zrc->dev_idx);
>  	}
>  	return nr_unmap * 100 / nr_zones;
>  }
> @@ -463,11 +463,9 @@ static unsigned int dmz_reclaim_percentage(struct dmz_reclaim *zrc)
>   */
>  static bool dmz_should_reclaim(struct dmz_reclaim *zrc, unsigned int p_unmap)
>  {
> -	int i;
> -	unsigned int nr_reclaim = 0;
> +	unsigned int nr_reclaim;
>  
> -	for (i = 0; i < dmz_nr_devs(zrc->metadata); i++)
> -		nr_reclaim += dmz_nr_rnd_zones(zrc->metadata, i);
> +	nr_reclaim = dmz_nr_rnd_zones(zrc->metadata, zrc->dev_idx);
>  
>  	if (dmz_nr_cache_zones(zrc->metadata))
>  		nr_reclaim += dmz_nr_cache_zones(zrc->metadata);
> @@ -495,7 +493,7 @@ static void dmz_reclaim_work(struct work_struct *work)
>  	struct dmz_reclaim *zrc = container_of(work, struct dmz_reclaim, work.work);
>  	struct dmz_metadata *zmd = zrc->metadata;
>  	unsigned int p_unmap, nr_unmap_rnd = 0, nr_rnd = 0;
> -	int ret, i;
> +	int ret;
>  
>  	if (dmz_dev_is_dying(zmd))
>  		return;
> @@ -520,12 +518,11 @@ static void dmz_reclaim_work(struct work_struct *work)
>  		zrc->kc_throttle.throttle = min(75U, 100U - p_unmap / 2);
>  	}
>  
> -	for (i = 0; i < dmz_nr_devs(zmd); i++) {
> -		nr_unmap_rnd += dmz_nr_unmap_rnd_zones(zmd, i);
> -		nr_rnd += dmz_nr_rnd_zones(zmd, i);
> -	}
> -	DMDEBUG("(%s): Reclaim (%u): %s, %u%% free zones (%u/%u cache %u/%u random)",
> -		dmz_metadata_label(zmd),
> +	nr_unmap_rnd = dmz_nr_unmap_rnd_zones(zmd, zrc->dev_idx);
> +	nr_rnd = dmz_nr_rnd_zones(zmd, zrc->dev_idx);
> +
> +	DMDEBUG("(%s/%u): Reclaim (%u): %s, %u%% free zones (%u/%u cache %u/%u random)",
> +		dmz_metadata_label(zmd), zrc->dev_idx,
>  		zrc->kc_throttle.throttle,
>  		(dmz_target_idle(zrc) ? "Idle" : "Busy"),
>  		p_unmap, dmz_nr_unmap_cache_zones(zmd),
> @@ -545,7 +542,7 @@ static void dmz_reclaim_work(struct work_struct *work)
>   * Initialize reclaim.
>   */
>  int dmz_ctr_reclaim(struct dmz_metadata *zmd,
> -		    struct dmz_reclaim **reclaim)
> +		    struct dmz_reclaim **reclaim, int idx)
>  {
>  	struct dmz_reclaim *zrc;
>  	int ret;
> @@ -556,6 +553,7 @@ int dmz_ctr_reclaim(struct dmz_metadata *zmd,
>  
>  	zrc->metadata = zmd;
>  	zrc->atime = jiffies;
> +	zrc->dev_idx = idx;
>  
>  	/* Reclaim kcopyd client */
>  	zrc->kc = dm_kcopyd_client_create(&zrc->kc_throttle);
> @@ -567,8 +565,8 @@ int dmz_ctr_reclaim(struct dmz_metadata *zmd,
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
> index f34fcc3f7cc6..a33c26a6ab31 100644
> --- a/drivers/md/dm-zoned-target.c
> +++ b/drivers/md/dm-zoned-target.c
> @@ -49,9 +49,6 @@ struct dmz_target {
>  	/* For metadata handling */
>  	struct dmz_metadata     *metadata;
>  
> -	/* For reclaim */
> -	struct dmz_reclaim	*reclaim;
> -
>  	/* For chunk work */
>  	struct radix_tree_root	chunk_rxtree;
>  	struct workqueue_struct *chunk_wq;
> @@ -402,14 +399,15 @@ static void dmz_handle_bio(struct dmz_target *dmz, struct dm_chunk_work *cw,
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
> @@ -575,7 +573,6 @@ static int dmz_queue_chunk_work(struct dmz_target *dmz, struct bio *bio)
>  
>  	bio_list_add(&cw->bio_list, bio);
>  
> -	dmz_reclaim_bio_acc(dmz->reclaim);
>  	if (queue_work(dmz->chunk_wq, &cw->work))
>  		dmz_get_chunk_work(cw);
>  out:
> @@ -935,10 +932,12 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  	mod_delayed_work(dmz->flush_wq, &dmz->flush_work, DMZ_FLUSH_PERIOD);
>  
>  	/* Initialize reclaim */
> -	ret = dmz_ctr_reclaim(dmz->metadata, &dmz->reclaim);
> -	if (ret) {
> -		ti->error = "Zone reclaim initialization failed";
> -		goto err_fwq;
> +	for (i = 0; i < argc; i++) {
> +		ret = dmz_ctr_reclaim(dmz->metadata, &dmz->dev[i].reclaim, i);
> +		if (ret) {
> +			ti->error = "Zone reclaim initialization failed";
> +			goto err_fwq;
> +		}
>  	}
>  
>  	DMINFO("(%s): Target device: %llu 512-byte logical sectors (%llu blocks)",
> @@ -971,11 +970,13 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  static void dmz_dtr(struct dm_target *ti)
>  {
>  	struct dmz_target *dmz = ti->private;
> +	int i;
>  
>  	flush_workqueue(dmz->chunk_wq);
>  	destroy_workqueue(dmz->chunk_wq);
>  
> -	dmz_dtr_reclaim(dmz->reclaim);
> +	for (i = 0; i < dmz_nr_devs(dmz->metadata); i++)
> +		dmz_dtr_reclaim(dmz->dev[i].reclaim);
>  
>  	cancel_delayed_work_sync(&dmz->flush_work);
>  	destroy_workqueue(dmz->flush_wq);
> @@ -1044,9 +1045,11 @@ static int dmz_prepare_ioctl(struct dm_target *ti, struct block_device **bdev)
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
> @@ -1056,9 +1059,11 @@ static void dmz_suspend(struct dm_target *ti)
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
> @@ -1130,7 +1135,10 @@ static int dmz_message(struct dm_target *ti, unsigned int argc, char **argv,
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
> index 0052eee12299..1ee91a3a4076 100644
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
> @@ -240,23 +241,6 @@ static inline void dmz_activate_zone(struct dm_zone *zone)
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
> @@ -283,7 +267,7 @@ int dmz_merge_valid_blocks(struct dmz_metadata *zmd, struct dm_zone *from_zone,
>  /*
>   * Functions defined in dm-zoned-reclaim.c
>   */
> -int dmz_ctr_reclaim(struct dmz_metadata *zmd, struct dmz_reclaim **zrc);
> +int dmz_ctr_reclaim(struct dmz_metadata *zmd, struct dmz_reclaim **zrc, int idx);
>  void dmz_dtr_reclaim(struct dmz_reclaim *zrc);
>  void dmz_suspend_reclaim(struct dmz_reclaim *zrc);
>  void dmz_resume_reclaim(struct dmz_reclaim *zrc);
> @@ -296,4 +280,22 @@ void dmz_schedule_reclaim(struct dmz_reclaim *zrc);
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

