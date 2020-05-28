Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 3F4C11E5427
	for <lists+dm-devel@lfdr.de>; Thu, 28 May 2020 04:47:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590634036;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=woSaUKw66YrfSMNVhRrzidMIZPSXO3zKecIjRYxAj/A=;
	b=DZbGwE2TjTUGC+WVWYN0hxoYrqaU9fZFgVK5j3oVLYY3fVwqKiwhVN0/ep0ONK9QQaP7/a
	ZTAAEkSwIBg44MPzdl47NO4ldVI8V/6Gk2hyJLCwWSCrXWwujQxlwt3thQ0J2V4TjCDUAR
	urQriVbeQerSFvGWc6+KkljrkPLc3WQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-81-FCeaigtkMpqEXjgBoE9AqA-1; Wed, 27 May 2020 22:47:13 -0400
X-MC-Unique: FCeaigtkMpqEXjgBoE9AqA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C60EA105250F;
	Thu, 28 May 2020 02:47:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B2DBB62932;
	Thu, 28 May 2020 02:47:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9AA9F62D0C;
	Thu, 28 May 2020 02:46:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04S2kd9f030465 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 27 May 2020 22:46:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 68DA1D9607; Thu, 28 May 2020 02:46:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 056BDD9610
	for <dm-devel@redhat.com>; Thu, 28 May 2020 02:46:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 24CF880028B
	for <dm-devel@redhat.com>; Thu, 28 May 2020 02:46:35 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-324-N69bBPi5OVmkHO7HgjdG7Q-1; Wed, 27 May 2020 22:46:30 -0400
X-MC-Unique: N69bBPi5OVmkHO7HgjdG7Q-1
IronPort-SDR: thFeAom52G2/ZuwbhaP7iO1KYKnlEaStjyuLCxHZ6EhlsIQXCAj7d8J76R3VW9ExCn1GIB1fwz
	+mC3amIT5ZNJnef6FNQvaqaQMro5aLuYycG6f2eug87F2LS5kY+cETDE0n+Uw324YE0raEWhLr
	fLhFGMNzoppzQ/JxS+vh+Rqxvo2nc2I1lfGS9qJOW8FLgFkDIQ4Zb4fodzyYT/58PoMwQxIRAV
	40LrsiB1SwpRreHQ6oNLuSxWKt9vpdmR8eq9whNZG7bqOG/ZOHZilc6UY36wJlCWtPt1EiR9RT
	yq0=
X-IronPort-AV: E=Sophos;i="5.73,443,1583164800"; d="scan'208";a="142999763"
Received: from mail-dm6nam11lp2177.outbound.protection.outlook.com (HELO
	NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.177])
	by ob1.hgst.iphmx.com with ESMTP; 28 May 2020 10:46:30 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB0185.namprd04.prod.outlook.com (2603:10b6:903:39::10)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17;
	Thu, 28 May 2020 02:46:28 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7%9]) with mapi id 15.20.3021.029;
	Thu, 28 May 2020 02:46:28 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [dm-devel] [PATCH 05/15] dm-zoned: convert to xarray
Thread-Index: AQHWM+9GwbNQvMZjHkKC7ngCmOGVYg==
Date: Thu, 28 May 2020 02:46:27 +0000
Message-ID: <CY4PR04MB37518D9EF4D14BDB255D3635E78E0@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200527062225.72849-1-hare@suse.de>
	<20200527062225.72849-6-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 63fd1315-148a-4374-c6ca-08d802b151f7
x-ms-traffictypediagnostic: CY4PR04MB0185:
x-microsoft-antispam-prvs: <CY4PR04MB018553B4A6283FB543868FA7E78E0@CY4PR04MB0185.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:446;
x-forefront-prvs: 0417A3FFD2
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IsCM7s3XeXV7wyJczeFdbrvm1Iiu9ZcT+1kFNKdNeHWC66POE4P5Mner0DINggf+cZwfqbZ+o1TP0GZ3Ne+blpQuwLWwZ6RYTiDJYoX4X5yYUXuS6VIul/b7ExWbBexz+8BRiUeSxoMcpknmKIoBfYndjpE3ZhiEwZrgFccEKu5ijEhYSw08HNdoDlNKZwpNk6o/DO8+92XqIloAdhEryUSZEPbxz17CQpA5EHZHBIUk1MVeHCr97yhgVI8IJV63+Gm5Ymb6UgIiCf1PYeUTCp6m1CsDrj5VMPcVjRSR7TU+m7lG0oQSwX2uPROZgo3z6crzcgRGSshAxshnEdWr5w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(39860400002)(396003)(136003)(366004)(346002)(376002)(86362001)(2906002)(316002)(9686003)(478600001)(110136005)(8676002)(52536014)(33656002)(66446008)(64756008)(71200400001)(55016002)(66946007)(66556008)(76116006)(91956017)(66476007)(53546011)(6506007)(26005)(5660300002)(7696005)(186003)(83380400001)(4326008)(8936002);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: cKaZoT5vde6HIomQ04USybZX8sKZSeL4czG+2eooBbogZf2LzYosWmjUuxDfR96c/+vm7476DplJ8ZfwEJ6Q3EWpMUFf+FKzIirMQvWCneGuUkX5vGOVlcyYAy2tTT1f6oD0vS1Hr9+16bpXTeud/dI5kkUnMmqFiQRXJfyLy04O4C0xvfG7pmgNKNytMSxOPbK1AlgCDJU9tTjilO7nY2M0egiEwigvN7wISnyIy1KCLQk7oPIN6T4KHKLM2W+AAnieyO7pXQs5ZuTgzX5aZVWFg71oddvKd6vzZkzKnFcvGWJn/RAXtp+YnX7dDzC9VrekFss3MMGiq7d91te6QgM7yXFHdQjdTq10vyIL3fJUG63QZfa4/gg6oT6vnBP4LMMJRoF8uVU5LC3k66bXlFpImz6lKW6xpl4Ghz5ZLpeYE2zq5DpDlfTqgPrPi9O4uvJiNA2zIxnUm/egtU+BDmr7KKWmQXHrcDX4sQOnp+U0+a3hqueR/nzeerqsw7nj
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63fd1315-148a-4374-c6ca-08d802b151f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2020 02:46:27.9795 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qjCEFFGHMl2u8AThArScYFaf2gYf4aS9YZkwGLFdk/o94/CtEIl+QWNzganJTKGKiIOwAQfYhBayHuFLfHnmqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0185
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04S2kd9f030465
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 05/15] dm-zoned: convert to xarray
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

On 2020/05/27 15:23, Hannes Reinecke wrote:
> The zones array is getting really large, and large arrays
> tend to wreak havoc with the CPU caches.
> So convert it to xarray to become more cache friendly.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>  drivers/md/dm-zoned-metadata.c | 120 ++++++++++++++++++++++++++++++-----------
>  1 file changed, 88 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index 0982ab1758a6..839f9078806d 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -172,7 +172,7 @@ struct dmz_metadata {
>  	unsigned int		nr_chunks;
>  
>  	/* Zone information array */
> -	struct dm_zone		*zones;
> +	struct xarray		zones;
>  
>  	struct dmz_sb		sb[3];
>  	unsigned int		mblk_primary;
> @@ -327,6 +327,30 @@ unsigned int dmz_nr_unmap_seq_zones(struct dmz_metadata *zmd)
>  	return atomic_read(&zmd->unmap_nr_seq);
>  }
>  
> +static struct dm_zone *dmz_get(struct dmz_metadata *zmd, unsigned int zone_id)
> +{
> +	return xa_load(&zmd->zones, zone_id);
> +}
> +
> +static struct dm_zone *dmz_insert(struct dmz_metadata *zmd,
> +				  unsigned int zone_id)
> +{
> +	struct dm_zone *zone = kzalloc(sizeof(struct dm_zone), GFP_KERNEL);
> +
> +	if (!zone)
> +		return ERR_PTR(-ENOMEM);
> +
> +	if (xa_insert(&zmd->zones, zone_id, zone, GFP_KERNEL))
> +		return ERR_PTR(-EBUSY);
> +
> +	INIT_LIST_HEAD(&zone->link);
> +	atomic_set(&zone->refcount, 0);
> +	zone->id = zone_id;
> +	zone->chunk = DMZ_MAP_UNMAPPED;
> +
> +	return zone;
> +}
> +
>  const char *dmz_metadata_label(struct dmz_metadata *zmd)
>  {
>  	return (const char *)zmd->label;
> @@ -1122,6 +1146,7 @@ static int dmz_lookup_secondary_sb(struct dmz_metadata *zmd)
>  {
>  	unsigned int zone_nr_blocks = zmd->zone_nr_blocks;
>  	struct dmz_mblock *mblk;
> +	unsigned int zone_id = zmd->sb[0].zone->id;
>  	int i;
>  
>  	/* Allocate a block */
> @@ -1134,16 +1159,15 @@ static int dmz_lookup_secondary_sb(struct dmz_metadata *zmd)
>  
>  	/* Bad first super block: search for the second one */
>  	zmd->sb[1].block = zmd->sb[0].block + zone_nr_blocks;
> -	zmd->sb[1].zone = zmd->sb[0].zone + 1;
> +	zmd->sb[1].zone = dmz_get(zmd, zone_id + 1);
>  	zmd->sb[1].dev = zmd->sb[0].dev;
> -	for (i = 0; i < zmd->nr_rnd_zones - 1; i++) {
> +	for (i = 1; i < zmd->nr_rnd_zones; i++) {
>  		if (dmz_read_sb(zmd, 1) != 0)
>  			break;
> -		if (le32_to_cpu(zmd->sb[1].sb->magic) == DMZ_MAGIC) {
> -			zmd->sb[1].zone += i;
> +		if (le32_to_cpu(zmd->sb[1].sb->magic) == DMZ_MAGIC)
>  			return 0;
> -		}
>  		zmd->sb[1].block += zone_nr_blocks;
> +		zmd->sb[1].zone = dmz_get(zmd, zone_id + i);
>  	}
>  
>  	dmz_free_mblock(zmd, mblk);
> @@ -1259,8 +1283,12 @@ static int dmz_load_sb(struct dmz_metadata *zmd)
>  	/* Read and check secondary super block */
>  	if (ret == 0) {
>  		sb_good[0] = true;
> -		if (!zmd->sb[1].zone)
> -			zmd->sb[1].zone = zmd->sb[0].zone + zmd->nr_meta_zones;
> +		if (!zmd->sb[1].zone) {
> +			unsigned int zone_id =
> +				zmd->sb[0].zone->id + zmd->nr_meta_zones;
> +
> +			zmd->sb[1].zone = dmz_get(zmd, zone_id);
> +		}
>  		zmd->sb[1].block = dmz_start_block(zmd, zmd->sb[1].zone);
>  		zmd->sb[1].dev = zmd->sb[0].dev;
>  		ret = dmz_get_sb(zmd, 1);
> @@ -1341,7 +1369,11 @@ static int dmz_init_zone(struct blk_zone *blkz, unsigned int num, void *data)
>  	struct dmz_metadata *zmd = data;
>  	struct dmz_dev *dev = zmd->nr_devs > 1 ? &zmd->dev[1] : &zmd->dev[0];
>  	int idx = num + dev->zone_offset;
> -	struct dm_zone *zone = &zmd->zones[idx];
> +	struct dm_zone *zone;
> +
> +	zone = dmz_insert(zmd, idx);
> +	if (IS_ERR(zone))
> +		return PTR_ERR(zone);
>  
>  	if (blkz->len != zmd->zone_nr_sectors) {
>  		if (zmd->sb_version > 1) {
> @@ -1353,11 +1385,6 @@ static int dmz_init_zone(struct blk_zone *blkz, unsigned int num, void *data)
>  		return -ENXIO;
>  	}
>  
> -	INIT_LIST_HEAD(&zone->link);
> -	atomic_set(&zone->refcount, 0);
> -	zone->id = idx;
> -	zone->chunk = DMZ_MAP_UNMAPPED;
> -
>  	switch (blkz->type) {
>  	case BLK_ZONE_TYPE_CONVENTIONAL:
>  		set_bit(DMZ_RND, &zone->flags);
> @@ -1397,18 +1424,17 @@ static int dmz_init_zone(struct blk_zone *blkz, unsigned int num, void *data)
>  	return 0;
>  }
>  
> -static void dmz_emulate_zones(struct dmz_metadata *zmd, struct dmz_dev *dev)
> +static int dmz_emulate_zones(struct dmz_metadata *zmd, struct dmz_dev *dev)
>  {
>  	int idx;
>  	sector_t zone_offset = 0;
>  
>  	for(idx = 0; idx < dev->nr_zones; idx++) {
> -		struct dm_zone *zone = &zmd->zones[idx];
> +		struct dm_zone *zone;
>  
> -		INIT_LIST_HEAD(&zone->link);
> -		atomic_set(&zone->refcount, 0);
> -		zone->id = idx;
> -		zone->chunk = DMZ_MAP_UNMAPPED;
> +		zone = dmz_insert(zmd, idx);
> +		if (IS_ERR(zone))
> +			return PTR_ERR(zone);
>  		set_bit(DMZ_CACHE, &zone->flags);
>  		zone->wp_block = 0;
>  		zmd->nr_cache_zones++;
> @@ -1420,6 +1446,7 @@ static void dmz_emulate_zones(struct dmz_metadata *zmd, struct dmz_dev *dev)
>  		}
>  		zone_offset += zmd->zone_nr_sectors;
>  	}
> +	return 0;
>  }
>  
>  /*
> @@ -1427,8 +1454,15 @@ static void dmz_emulate_zones(struct dmz_metadata *zmd, struct dmz_dev *dev)
>   */
>  static void dmz_drop_zones(struct dmz_metadata *zmd)
>  {
> -	kfree(zmd->zones);
> -	zmd->zones = NULL;
> +	int idx;
> +
> +	for(idx = 0; idx < zmd->nr_zones; idx++) {
> +		struct dm_zone *zone = xa_load(&zmd->zones, idx);
> +
> +		kfree(zone);
> +		xa_erase(&zmd->zones, idx);
> +	}
> +	xa_destroy(&zmd->zones);
>  }
>  
>  /*
> @@ -1460,20 +1494,25 @@ static int dmz_init_zones(struct dmz_metadata *zmd)
>  		DMERR("(%s): No zones found", zmd->devname);
>  		return -ENXIO;
>  	}
> -	zmd->zones = kcalloc(zmd->nr_zones, sizeof(struct dm_zone), GFP_KERNEL);
> -	if (!zmd->zones)
> -		return -ENOMEM;
> +	xa_init(&zmd->zones);
>  
>  	DMDEBUG("(%s): Using %zu B for zone information",
>  		zmd->devname, sizeof(struct dm_zone) * zmd->nr_zones);
>  
>  	if (zmd->nr_devs > 1) {
> -		dmz_emulate_zones(zmd, &zmd->dev[0]);
> +		ret = dmz_emulate_zones(zmd, &zmd->dev[0]);
> +		if (ret < 0) {
> +			DMDEBUG("(%s): Failed to emulate zones, error %d",
> +				zmd->devname, ret);
> +			dmz_drop_zones(zmd);
> +			return ret;
> +		}
> +
>  		/*
>  		 * Primary superblock zone is always at zone 0 when multiple
>  		 * drives are present.
>  		 */
> -		zmd->sb[0].zone = &zmd->zones[0];
> +		zmd->sb[0].zone = dmz_get(zmd, 0);
>  
>  		zoned_dev = &zmd->dev[1];
>  	}
> @@ -1576,11 +1615,6 @@ static int dmz_handle_seq_write_err(struct dmz_metadata *zmd,
>  	return 0;
>  }
>  
> -static struct dm_zone *dmz_get(struct dmz_metadata *zmd, unsigned int zone_id)
> -{
> -	return &zmd->zones[zone_id];
> -}
> -
>  /*
>   * Reset a zone write pointer.
>   */
> @@ -1662,6 +1696,11 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
>  		}
>  
>  		dzone = dmz_get(zmd, dzone_id);
> +		if (!dzone) {
> +			dmz_zmd_err(zmd, "Chunk %u mapping: data zone %u not present",
> +				    chunk, dzone_id);
> +			return -EIO;
> +		}
>  		set_bit(DMZ_DATA, &dzone->flags);
>  		dzone->chunk = chunk;
>  		dmz_get_zone_weight(zmd, dzone);
> @@ -1685,6 +1724,11 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
>  		}
>  
>  		bzone = dmz_get(zmd, bzone_id);
> +		if (!bzone) {
> +			dmz_zmd_err(zmd, "Chunk %u mapping: buffer zone %u not present",
> +				    chunk, bzone_id);
> +			return -EIO;
> +		}
>  		if (!dmz_is_rnd(bzone) && !dmz_is_cache(bzone)) {
>  			dmz_zmd_err(zmd, "Chunk %u mapping: invalid buffer zone %u",
>  				    chunk, bzone_id);
> @@ -1715,6 +1759,8 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
>  	 */
>  	for (i = 0; i < zmd->nr_zones; i++) {
>  		dzone = dmz_get(zmd, i);
> +		if (!dzone)
> +			continue;
>  		if (dmz_is_meta(dzone))
>  			continue;
>  		if (dmz_is_offline(dzone))
> @@ -1978,6 +2024,10 @@ struct dm_zone *dmz_get_chunk_mapping(struct dmz_metadata *zmd, unsigned int chu
>  	} else {
>  		/* The chunk is already mapped: get the mapping zone */
>  		dzone = dmz_get(zmd, dzone_id);
> +		if (!dzone) {
> +			dzone = ERR_PTR(-EIO);
> +			goto out;
> +		}
>  		if (dzone->chunk != chunk) {
>  			dzone = ERR_PTR(-EIO);
>  			goto out;
> @@ -2794,6 +2844,12 @@ int dmz_ctr_metadata(struct dmz_dev *dev, int num_dev,
>  	/* Set metadata zones starting from sb_zone */
>  	for (i = 0; i < zmd->nr_meta_zones << 1; i++) {
>  		zone = dmz_get(zmd, zmd->sb[0].zone->id + i);
> +		if (!zone) {
> +			dmz_zmd_err(zmd,
> +				    "metadata zone %u not present", i);
> +			ret = -ENXIO;
> +			goto err;
> +		}
>  		if (!dmz_is_rnd(zone) && !dmz_is_cache(zone)) {
>  			dmz_zmd_err(zmd,
>  				    "metadata zone %d is not random", i);
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

