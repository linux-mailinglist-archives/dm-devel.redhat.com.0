Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id A514F1E54E8
	for <lists+dm-devel@lfdr.de>; Thu, 28 May 2020 06:11:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590639104;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ga4Kd7YI/PcPGGgmhOkjYZRtcGirY6RovXB2RltanNU=;
	b=EeVkvf8G3IbwRZRS4WMSGaady48aKDG23akOFVk4G7xFA2DAdNUTBq8I8IHSVTFyswrili
	1MF/DsNsCGl4ct2KF6UviOJ3IF3XSMdeUM0yIP2il5B0x7X6LAzscBgPjXmlt8TkXPSHY6
	7BK2mPmwWpByxxg0S6HgT6ZYG3ww01g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-JAuCqellMFOpYajw0_650A-1; Thu, 28 May 2020 00:11:42 -0400
X-MC-Unique: JAuCqellMFOpYajw0_650A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7773100726C;
	Thu, 28 May 2020 04:11:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AD9160C84;
	Thu, 28 May 2020 04:11:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 31A1B1809543;
	Thu, 28 May 2020 04:11:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04S4BLsi002947 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 28 May 2020 00:11:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 97D6E2026DFD; Thu, 28 May 2020 04:11:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 92E9D2026D69
	for <dm-devel@redhat.com>; Thu, 28 May 2020 04:11:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F7E98007A4
	for <dm-devel@redhat.com>; Thu, 28 May 2020 04:11:19 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-211-ijiy0ZiKPrOAkOH1z_BVag-1; Thu, 28 May 2020 00:11:16 -0400
X-MC-Unique: ijiy0ZiKPrOAkOH1z_BVag-1
IronPort-SDR: IwSTbjaDwoVcp3hvIu8yGSVV3ObPXetNbEgd/UJaObR2ae/ZAns2HpDZILLYLcS/wgHvzOX/G5
	BiwVKi0R6YOq0X9WE+sUormK48LuEvSV4Gftp9BAB5YURx4/jScBggeucoTA1BmmIL2KkP4BPc
	NaNvQpUvz4axA2+FBVKtLTChObhfKmfHnKs7pp2/hxx9vf293rwyEGJD8us+ynk1n/EXT1DbjU
	pKnpXjN5BA9aJbbSvXd0Bj2379nRyrCLErfcFnZjud/ezY2/GIdlxocV9yb3MGvFpLxH7K+o4l
	qbw=
X-IronPort-AV: E=Sophos;i="5.73,443,1583164800"; d="scan'208";a="138999829"
Received: from mail-dm6nam12lp2168.outbound.protection.outlook.com (HELO
	NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.168])
	by ob1.hgst.iphmx.com with ESMTP; 28 May 2020 12:11:16 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (10.172.142.14) by
	CY4PR04MB1143.namprd04.prod.outlook.com (10.173.188.138) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.3045.17; Thu, 28 May 2020 04:11:14 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7%9]) with mapi id 15.20.3021.029;
	Thu, 28 May 2020 04:11:14 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "snitzer@redhat.com" <snitzer@redhat.com>, "hare@suse.de" <hare@suse.de>
Thread-Topic: [PATCH 14/15] dm-zoned: select reclaim zone based on device index
Thread-Index: AQHWM+8+TmpJBxAKKE+ltoy/1hUyFKi85C0A
Date: Thu, 28 May 2020 04:11:14 +0000
Message-ID: <a0b9f5c202c1c8637600ec61c09af3e3d269708f.camel@wdc.com>
References: <20200527062225.72849-1-hare@suse.de>
	<20200527062225.72849-15-hare@suse.de>
In-Reply-To: <20200527062225.72849-15-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2 (3.36.2-1.fc32)
x-originating-ip: [2400:2411:43c0:6000:62d1:16e6:ecb1:d604]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: aa88161e-4d04-4f7f-8256-08d802bd29b2
x-ms-traffictypediagnostic: CY4PR04MB1143:
x-microsoft-antispam-prvs: <CY4PR04MB1143A4BD20278714D2719A22E78E0@CY4PR04MB1143.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:773;
x-forefront-prvs: 0417A3FFD2
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lAOy4Ji5MRYDRaz8LJtBFuUoF85rynq2NRJ4odQkGIxXzKO5qaHiUq6WbRSQV3Zws8i5YYMroAOco5KmDYaoCEgxyPSEXA3Fsa2DBxH4u+imuTnVn/KvYXIe0RAr7PhTIsthAk5KT0igfLS4sFWRwnYByrtIOZhDMvvrTxp61qMU/BNv2UoLd6V3GbVvVt5HswHkZlsc6Crl1AZQ9+VFoyahd/RfOutZaw8D3kFsQPTOMYlxESM/EUIf/gLzhxtNOwRyIZaOmGBZBqVDckNzJZ2I6BL4Miffx9jraXZz/AibuxPJjzxOdUH/ayM5Ml98WPHTqgqAzc07FUH9BnZJqA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(366004)(376002)(39860400002)(396003)(346002)(136003)(6506007)(83380400001)(186003)(4326008)(6486002)(2616005)(71200400001)(8936002)(316002)(110136005)(478600001)(6512007)(64756008)(66446008)(66476007)(66556008)(91956017)(66946007)(36756003)(76116006)(8676002)(2906002)(86362001)(5660300002);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: bUasRtTp4KwIdQvSKVv6N2hYPHgChW9L9coNSnha3L1+8/j95QV24I3M9FxClPHrxjSnZJxuZEXqhZfECLsPwR+4l5U68zjphy1s5YZE8KH24FoxacAJtxagzSb7+eqlgjA+QmMAs1asWIOkB9lxyXlbk8xMreLTCpc/3HFUrPuIx6NVGBW5/aXRBv2ts0mzWt/GyJXosOOqg04lj9IFqDeF5sjV0phwIGImAD9+mRCx6L8MPWBF/mxtMF5PROLSCbbrt66E+yCiZbWeBkATLfWsFQnIU3hDNQLnYLMAdFZyRMdh6xcT5ACd3x1Rrta/QcXOFDK5Tbfgg3WJodVw0XtKl76qofTZecEbJhE0uamk2kZnDLOGae+XUfl4tom7f5GskjNZslvJTP2QwHa8aWi71eSo13OMYWLPGowsVjEyZXPg9FFYZbLWScvklc/FtEzRi0sBdqNhpO7IH4uvxrVtrY26RLep+4mI2rX/kK3s4hRL0A5rRXdAcer0WyCHYZttG5Gjz5n/Hu1qYyWRj2eH8/Bws0xC+ZrGiU1bjtnNosbTvMs14xB3aPPUFm82
x-ms-exchange-transport-forked: True
Content-ID: <9378C9C1FE6C0240A0290A0C21EF0DDE@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa88161e-4d04-4f7f-8256-08d802bd29b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2020 04:11:14.2535 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pk7ta2ikN182pjFmx+yF92OtkGO1XfXe02y2QLwN+msmruoCuIMIga5tQ91A3ELqfO5F8nIKfO6no6xvSi8OIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB1143
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04S4BLsi002947
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 14/15] dm-zoned: select reclaim zone based on
	device index
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2020-05-27 at 08:22 +0200, Hannes Reinecke wrote:
> per-device reclaim should select zones on that device only.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>  drivers/md/dm-zoned-metadata.c | 50 +++++++++++++++++-------------------------
>  drivers/md/dm-zoned-reclaim.c  |  3 ++-
>  drivers/md/dm-zoned-target.c   |  1 +
>  drivers/md/dm-zoned.h          |  5 ++++-
>  4 files changed, 27 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index 0d65af94309a..b89b3d3b9ec9 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -1933,7 +1933,7 @@ static void dmz_wait_for_reclaim(struct dmz_metadata *zmd, struct dm_zone *zone)
>   * Select a cache or random write zone for reclaim.
>   */
>  static struct dm_zone *dmz_get_rnd_zone_for_reclaim(struct dmz_metadata *zmd,
> -						    bool idle)
> +						    unsigned int idx, bool idle)
>  {
>  	struct dm_zone *dzone = NULL;
>  	struct dm_zone *zone;
> @@ -1943,24 +1943,17 @@ static struct dm_zone *dmz_get_rnd_zone_for_reclaim(struct dmz_metadata *zmd,
>  	if (zmd->nr_cache) {
>  		zone_list = &zmd->map_cache_list;
>  		/* Try to relaim random zones, too, when idle */
> -		if (idle && list_empty(zone_list)) {
> -			int i;
> -
> -			for (i = 1; i < zmd->nr_devs; i++) {
> -				zone_list = &zmd->dev[i].map_rnd_list;
> -				if (!list_empty(zone_list))
> -					break;
> -			}
> -		}
> -	} else {
> -		/* Otherwise the random zones are on the first disk */
> -		zone_list = &zmd->dev[0].map_rnd_list;
> -	}
> +		if (idle && list_empty(zone_list))
> +			zone_list = &zmd->dev[idx].map_rnd_list;
> +	} else
> +		zone_list = &zmd->dev[idx].map_rnd_list;
>  
>  	list_for_each_entry(zone, zone_list, link) {
> -		if (dmz_is_buf(zone))
> +		if (dmz_is_buf(zone)) {
>  			dzone = zone->bzone;
> -		else
> +			if (dzone->dev->dev_idx != idx)
> +				continue;
> +		} else
>  			dzone = zone;
>  		if (dmz_lock_zone_reclaim(dzone))
>  			return dzone;
> @@ -1972,20 +1965,16 @@ static struct dm_zone *dmz_get_rnd_zone_for_reclaim(struct dmz_metadata *zmd,
>  /*
>   * Select a buffered sequential zone for reclaim.
>   */
> -static struct dm_zone *dmz_get_seq_zone_for_reclaim(struct dmz_metadata *zmd)
> +static struct dm_zone *dmz_get_seq_zone_for_reclaim(struct dmz_metadata *zmd,
> +						    unsigned int idx)
>  {
>  	struct dm_zone *zone;
> -	int i;
> -
> -	for (i = 0; i < zmd->nr_devs; i++) {
> -		struct dmz_dev *dev = &zmd->dev[i];
>  
> -		list_for_each_entry(zone, &dev->map_seq_list, link) {
> -			if (!zone->bzone)
> -				continue;
> -			if (dmz_lock_zone_reclaim(zone))
> -				return zone;
> -		}
> +	list_for_each_entry(zone, &zmd->dev[idx].map_seq_list, link) {
> +		if (!zone->bzone)
> +			continue;
> +		if (dmz_lock_zone_reclaim(zone))
> +			return zone;
>  	}
>  
>  	return NULL;
> @@ -1994,7 +1983,8 @@ static struct dm_zone *dmz_get_seq_zone_for_reclaim(struct dmz_metadata *zmd)
>  /*
>   * Select a zone for reclaim.
>   */
> -struct dm_zone *dmz_get_zone_for_reclaim(struct dmz_metadata *zmd, bool idle)
> +struct dm_zone *dmz_get_zone_for_reclaim(struct dmz_metadata *zmd,
> +					 unsigned int dev_idx, bool idle)
>  {
>  	struct dm_zone *zone;
>  
> @@ -2008,9 +1998,9 @@ struct dm_zone *dmz_get_zone_for_reclaim(struct dmz_metadata *zmd, bool idle)
>  	 */
>  	dmz_lock_map(zmd);
>  	if (list_empty(&zmd->reserved_seq_zones_list))
> -		zone = dmz_get_seq_zone_for_reclaim(zmd);
> +		zone = dmz_get_seq_zone_for_reclaim(zmd, dev_idx);
>  	else
> -		zone = dmz_get_rnd_zone_for_reclaim(zmd, idle);
> +		zone = dmz_get_rnd_zone_for_reclaim(zmd, dev_idx, idle);
>  	dmz_unlock_map(zmd);
>  
>  	return zone;
> diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
> index 5a04e34d17a9..2261b4dd60b7 100644
> --- a/drivers/md/dm-zoned-reclaim.c
> +++ b/drivers/md/dm-zoned-reclaim.c
> @@ -370,7 +370,8 @@ static int dmz_do_reclaim(struct dmz_reclaim *zrc)
>  	int ret;
>  
>  	/* Get a data zone */
> -	dzone = dmz_get_zone_for_reclaim(zmd, dmz_target_idle(zrc));
> +	dzone = dmz_get_zone_for_reclaim(zmd, zrc->dev_idx,
> +					 dmz_target_idle(zrc));
>  	if (!dzone) {
>  		DMDEBUG("(%s/%u): No zone found to reclaim",
>  			dmz_metadata_label(zmd), zrc->dev_idx);
> diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
> index 4a51738d4b0d..a23f1fbd208f 100644
> --- a/drivers/md/dm-zoned-target.c
> +++ b/drivers/md/dm-zoned-target.c
> @@ -738,6 +738,7 @@ static int dmz_get_zoned_device(struct dm_target *ti, char *path,
>  		dev = &dmz->dev[idx];
>  	}
>  	dev->bdev = bdev;
> +	dev->dev_idx = idx;
>  	(void)bdevname(dev->bdev, dev->name);
>  
>  	dev->capacity = i_size_read(bdev->bd_inode) >> SECTOR_SHIFT;
> diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
> index ec020bb1caf7..22f11440b423 100644
> --- a/drivers/md/dm-zoned.h
> +++ b/drivers/md/dm-zoned.h
> @@ -61,6 +61,8 @@ struct dmz_dev {
>  
>  	sector_t		capacity;
>  
> +	unsigned int		dev_idx;
> +
>  	unsigned int		nr_zones;
>  	unsigned int		zone_offset;
>  
> @@ -243,7 +245,8 @@ static inline void dmz_activate_zone(struct dm_zone *zone)
>  
>  int dmz_lock_zone_reclaim(struct dm_zone *zone);
>  void dmz_unlock_zone_reclaim(struct dm_zone *zone);
> -struct dm_zone *dmz_get_zone_for_reclaim(struct dmz_metadata *zmd, bool idle);
> +struct dm_zone *dmz_get_zone_for_reclaim(struct dmz_metadata *zmd,
> +					 unsigned int dev_idx, bool idle);
>  
>  struct dm_zone *dmz_get_chunk_mapping(struct dmz_metadata *zmd,
>  				      unsigned int chunk, int op);

Looks good.

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

-- 
Damien Le Moal
Western Digital Research

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

