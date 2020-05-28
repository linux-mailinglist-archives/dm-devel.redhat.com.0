Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1C1421E5448
	for <lists+dm-devel@lfdr.de>; Thu, 28 May 2020 04:58:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590634684;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=6GHOY9Sv3KBHluxePd5AIH6Uy7Di6kiDQFB0AND87es=;
	b=Fi3z+hB9mm9EBZ7TXzy7k7Jnzfb/iaXnvCqx4HjB7Y2+ETXkiX9Xpq5OZ3hUnK2EP9iVwU
	pFu6YB9Hum8OY0HgI93zRq1lT9wwRUu1PSPXwZ9zKA3T/Nw3qMnISY520/zZCI8+wMtAcl
	vt8V28g2SjU5Bv7B16k7xJlrTCoaCyM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-3vGaAvkGNv2FN3igpiQkdg-1; Wed, 27 May 2020 22:58:01 -0400
X-MC-Unique: 3vGaAvkGNv2FN3igpiQkdg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B01DA107ACF2;
	Thu, 28 May 2020 02:57:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 317E72657C;
	Thu, 28 May 2020 02:57:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D2C846B4EF;
	Thu, 28 May 2020 02:57:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04S2vm6W030913 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 27 May 2020 22:57:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6FCE7D1BA8; Thu, 28 May 2020 02:57:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 87051D9607
	for <dm-devel@redhat.com>; Thu, 28 May 2020 02:57:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0781F833B44
	for <dm-devel@redhat.com>; Thu, 28 May 2020 02:57:44 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-437-On-3owz2OkW595uni6hurg-1; Wed, 27 May 2020 22:57:39 -0400
X-MC-Unique: On-3owz2OkW595uni6hurg-1
IronPort-SDR: +xNtQ9fzPG8sUnHQyh7rXDWzkcQ/Q1K3Qk0/ocl4KpE2NZGYVB2pstwe3j1Izgh34mLFdif2Ar
	bp5DbQy7+bsmO/KipMghIyu+f+gOPJ0dBDgbp4Pw0tt+hDkyhVcfaIndOHpCK9DIJ3zmvFYwy/
	Lc1CylUIXVSFkZXOw3UU5OYqGgb9o7KLb0TU38EdrtNpG+dH83YOwnEAFNireUYTqwYdZZ3QcH
	gD+cPpssvwsQ0JCBwh075nYXzyVw6iaOPxG0MfhrjTuV1CauwFQLvhoKNpID3y8CgOWcX3eyRd
	4ws=
X-IronPort-AV: E=Sophos;i="5.73,443,1583164800"; d="scan'208";a="247726286"
Received: from mail-sn1nam04lp2054.outbound.protection.outlook.com (HELO
	NAM04-SN1-obe.outbound.protection.outlook.com) ([104.47.44.54])
	by ob1.hgst.iphmx.com with ESMTP; 28 May 2020 10:57:32 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB1094.namprd04.prod.outlook.com (2603:10b6:910:52::31)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27;
	Thu, 28 May 2020 02:57:31 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7%9]) with mapi id 15.20.3021.029;
	Thu, 28 May 2020 02:57:31 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 07/15] dm-zoned: add device pointer to struct dm_zone
Thread-Index: AQHWM+89ZEN4lZh/OESq6HbkcQ5/LA==
Date: Thu, 28 May 2020 02:57:30 +0000
Message-ID: <CY4PR04MB37512702CEA45734C65005F9E78E0@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200527062225.72849-1-hare@suse.de>
	<20200527062225.72849-8-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d12ab2aa-08c0-4011-39be-08d802b2dd24
x-ms-traffictypediagnostic: CY4PR04MB1094:
x-microsoft-antispam-prvs: <CY4PR04MB1094ED0E8FACCFFE30638D6DE78E0@CY4PR04MB1094.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:635;
x-forefront-prvs: 0417A3FFD2
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4JhzgiePpGFz3rDuNcPAFDh0mr/rFro3evxz73WeO+Dh4WP0rH/6HUW1HsDnTeyadOtToBBid3KJ+vHMDW6ASgefY2fYSrG/N46wRk7wRXt1m3Sz8+YDCY4X9F3xgAyPKW3CWVbYjr7HFTvDB5PkY0RE8xDv4JWI8aCH4fjWfg9bvvGdoI95HYUTEEWbu+utrWMVkbg37Wpewy7FClGruKqu8/bpWTfBCnMQe05npeQWIGDq1exzC0q+IJQpiEod5lS8s9Nu8lthdWLKaFtoEu4THwt0D8JiVTg5gfydW+37anzamKML5R/JDWlKa8g4ke4kyrxXeXPOTNV+uyzauQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(396003)(346002)(366004)(136003)(376002)(39860400002)(91956017)(76116006)(55016002)(52536014)(6506007)(53546011)(4326008)(9686003)(8676002)(8936002)(71200400001)(5660300002)(66946007)(7696005)(478600001)(186003)(64756008)(83380400001)(33656002)(66556008)(86362001)(110136005)(2906002)(66446008)(26005)(316002)(66476007);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: Lci7ZVwBWmuiu9xpr5nm81V72n0+X0ySwVG+ltEdc6PG5B0uPHGOSmN6/ITJu0TbNCRZGP5RwwM8X5Mh3yzaM1E3xLkrs/0qpEv3SRVNJkFlI4qS2ea8wETubddpISRvO5b1jKhFlF4CIhsaw2P65ujws0scpuJ2fOPS74w0/3Jpp0v0GJaOSYFsLh1vIPRzIZsG+WLRbFnUMWCo8UPcg8TiCBKQWKUfbo9NVoYj61cYYfrCvWssE2aZDl16/lHxph4U9x5fMuZiGFei/ozHcm4u5ET2zjwvpEyUTKxgl5X/2/6Jh9b7cT6laOAKFETPysl88JS+MWKaTKakH0oaP4h9FMzHyRZV60VG1LDmnM3QcgyA3SbwUNkeMGdgKGS9/IlJZD3KHhvYSGsGqZoKZYudzDE+OsEGraHYlZxYxsJ3dPsI5uL6/Bs7JbuMSjqwOTVHWzrOL213R3+qZkXPFrfdKsmtlxGI0e4D5DFAal7k1Fww/pgw0KbzFwEmQB29
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d12ab2aa-08c0-4011-39be-08d802b2dd24
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2020 02:57:30.9958 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YcFh9bl/MsQSJ9O4T9rb0/SU5JDhSWhF9gs2EIu2ihEZea0ciAvT5hUFOC/novqGMUIjEdaJJTfDjOp/ZCleAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB1094
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04S2vm6W030913
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 07/15] dm-zoned: add device pointer to struct
	dm_zone
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

On 2020/05/27 15:22, Hannes Reinecke wrote:
> Add a pointer to the containing device to struct dm_zone and
> kill dmz_zone_to_dev().
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>  drivers/md/dm-zoned-metadata.c | 39 ++++++++++-----------------------------
>  drivers/md/dm-zoned-reclaim.c  | 13 +++++--------
>  drivers/md/dm-zoned-target.c   |  2 +-
>  drivers/md/dm-zoned.h          |  4 +++-
>  4 files changed, 19 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index bb9ce72bf18c..302443b2d885 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -229,16 +229,10 @@ struct dmz_metadata {
>   */
>  static unsigned int dmz_dev_zone_id(struct dmz_metadata *zmd, struct dm_zone *zone)
>  {
> -	unsigned int zone_id;
> -
>  	if (WARN_ON(!zone))
>  		return 0;
>  
> -	zone_id = zone->id;
> -	if (zmd->nr_devs > 1 &&
> -	    (zone_id >= zmd->dev[1].zone_offset))
> -		zone_id -= zmd->dev[1].zone_offset;
> -	return zone_id;
> +	return zone->id - zone->dev->zone_offset;
>  }
>  
>  sector_t dmz_start_sect(struct dmz_metadata *zmd, struct dm_zone *zone)
> @@ -255,18 +249,6 @@ sector_t dmz_start_block(struct dmz_metadata *zmd, struct dm_zone *zone)
>  	return (sector_t)zone_id << zmd->zone_nr_blocks_shift;
>  }
>  
> -struct dmz_dev *dmz_zone_to_dev(struct dmz_metadata *zmd, struct dm_zone *zone)
> -{
> -	if (WARN_ON(!zone))
> -		return &zmd->dev[0];
> -
> -	if (zmd->nr_devs > 1 &&
> -	    zone->id >= zmd->dev[1].zone_offset)
> -		return &zmd->dev[1];
> -
> -	return &zmd->dev[0];
> -}
> -
>  unsigned int dmz_zone_nr_blocks(struct dmz_metadata *zmd)
>  {
>  	return zmd->zone_nr_blocks;
> @@ -333,7 +315,7 @@ static struct dm_zone *dmz_get(struct dmz_metadata *zmd, unsigned int zone_id)
>  }
>  
>  static struct dm_zone *dmz_insert(struct dmz_metadata *zmd,
> -				  unsigned int zone_id)
> +				  unsigned int zone_id, struct dmz_dev *dev)
>  {
>  	struct dm_zone *zone = kzalloc(sizeof(struct dm_zone), GFP_KERNEL);
>  
> @@ -347,6 +329,7 @@ static struct dm_zone *dmz_insert(struct dmz_metadata *zmd,
>  	atomic_set(&zone->refcount, 0);
>  	zone->id = zone_id;
>  	zone->chunk = DMZ_MAP_UNMAPPED;
> +	zone->dev = dev;
>  
>  	return zone;
>  }
> @@ -1271,7 +1254,7 @@ static int dmz_load_sb(struct dmz_metadata *zmd)
>  
>  	/* Read and check the primary super block */
>  	zmd->sb[0].block = dmz_start_block(zmd, zmd->sb[0].zone);
> -	zmd->sb[0].dev = dmz_zone_to_dev(zmd, zmd->sb[0].zone);
> +	zmd->sb[0].dev = zmd->sb[0].zone->dev;
>  	ret = dmz_get_sb(zmd, &zmd->sb[0], 0);
>  	if (ret) {
>  		dmz_dev_err(zmd->sb[0].dev, "Read primary super block failed");
> @@ -1388,7 +1371,7 @@ static int dmz_init_zone(struct blk_zone *blkz, unsigned int num, void *data)
>  	int idx = num + dev->zone_offset;
>  	struct dm_zone *zone;
>  
> -	zone = dmz_insert(zmd, idx);
> +	zone = dmz_insert(zmd, idx, dev);
>  	if (IS_ERR(zone))
>  		return PTR_ERR(zone);
>  
> @@ -1452,7 +1435,7 @@ static int dmz_emulate_zones(struct dmz_metadata *zmd, struct dmz_dev *dev)
>  	for(idx = 0; idx < dev->nr_zones; idx++) {
>  		struct dm_zone *zone;
>  
> -		zone = dmz_insert(zmd, idx);
> +		zone = dmz_insert(zmd, idx, dev);
>  		if (IS_ERR(zone))
>  			return PTR_ERR(zone);
>  		set_bit(DMZ_CACHE, &zone->flags);
> @@ -1578,7 +1561,7 @@ static int dmz_update_zone_cb(struct blk_zone *blkz, unsigned int idx,
>   */
>  static int dmz_update_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
>  {
> -	struct dmz_dev *dev = dmz_zone_to_dev(zmd, zone);
> +	struct dmz_dev *dev = zone->dev;
>  	unsigned int noio_flag;
>  	int ret;
>  
> @@ -1615,7 +1598,7 @@ static int dmz_update_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
>  static int dmz_handle_seq_write_err(struct dmz_metadata *zmd,
>  				    struct dm_zone *zone)
>  {
> -	struct dmz_dev *dev = dmz_zone_to_dev(zmd, zone);
> +	struct dmz_dev *dev = zone->dev;
>  	unsigned int wp = 0;
>  	int ret;
>  
> @@ -1652,7 +1635,7 @@ static int dmz_reset_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
>  		return 0;
>  
>  	if (!dmz_is_empty(zone) || dmz_seq_write_err(zone)) {
> -		struct dmz_dev *dev = dmz_zone_to_dev(zmd, zone);
> +		struct dmz_dev *dev = zone->dev;
>  
>  		ret = blkdev_zone_mgmt(dev->bdev, REQ_OP_ZONE_RESET,
>  				       dmz_start_sect(zmd, zone),
> @@ -2213,9 +2196,7 @@ struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd, unsigned long flags)
>  		goto again;
>  	}
>  	if (dmz_is_meta(zone)) {
> -		struct dmz_dev *dev = dmz_zone_to_dev(zmd, zone);
> -
> -		dmz_dev_warn(dev, "Zone %u has metadata", zone->id);
> +		dmz_zmd_warn(zmd, "Zone %u has metadata", zone->id);
>  		zone = NULL;
>  		goto again;
>  	}
> diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
> index fd4d47dfcea1..e9e3b730e258 100644
> --- a/drivers/md/dm-zoned-reclaim.c
> +++ b/drivers/md/dm-zoned-reclaim.c
> @@ -58,7 +58,7 @@ static int dmz_reclaim_align_wp(struct dmz_reclaim *zrc, struct dm_zone *zone,
>  				sector_t block)
>  {
>  	struct dmz_metadata *zmd = zrc->metadata;
> -	struct dmz_dev *dev = dmz_zone_to_dev(zmd, zone);
> +	struct dmz_dev *dev = zone->dev;
>  	sector_t wp_block = zone->wp_block;
>  	unsigned int nr_blocks;
>  	int ret;
> @@ -116,7 +116,6 @@ static int dmz_reclaim_copy(struct dmz_reclaim *zrc,
>  			    struct dm_zone *src_zone, struct dm_zone *dst_zone)
>  {
>  	struct dmz_metadata *zmd = zrc->metadata;
> -	struct dmz_dev *src_dev, *dst_dev;
>  	struct dm_io_region src, dst;
>  	sector_t block = 0, end_block;
>  	sector_t nr_blocks;
> @@ -130,17 +129,15 @@ static int dmz_reclaim_copy(struct dmz_reclaim *zrc,
>  	else
>  		end_block = dmz_zone_nr_blocks(zmd);
>  	src_zone_block = dmz_start_block(zmd, src_zone);
> -	src_dev = dmz_zone_to_dev(zmd, src_zone);
>  	dst_zone_block = dmz_start_block(zmd, dst_zone);
> -	dst_dev = dmz_zone_to_dev(zmd, dst_zone);
>  
>  	if (dmz_is_seq(dst_zone))
>  		set_bit(DM_KCOPYD_WRITE_SEQ, &flags);
>  
>  	while (block < end_block) {
> -		if (src_dev->flags & DMZ_BDEV_DYING)
> +		if (src_zone->dev->flags & DMZ_BDEV_DYING)
>  			return -EIO;
> -		if (dst_dev->flags & DMZ_BDEV_DYING)
> +		if (dst_zone->dev->flags & DMZ_BDEV_DYING)
>  			return -EIO;
>  
>  		if (dmz_reclaim_should_terminate(src_zone))
> @@ -163,11 +160,11 @@ static int dmz_reclaim_copy(struct dmz_reclaim *zrc,
>  				return ret;
>  		}
>  
> -		src.bdev = src_dev->bdev;
> +		src.bdev = src_zone->dev->bdev;
>  		src.sector = dmz_blk2sect(src_zone_block + block);
>  		src.count = dmz_blk2sect(nr_blocks);
>  
> -		dst.bdev = dst_dev->bdev;
> +		dst.bdev = dst_zone->dev->bdev;
>  		dst.sector = dmz_blk2sect(dst_zone_block + block);
>  		dst.count = src.count;
>  
> diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
> index 2770e293a97b..087dd4801663 100644
> --- a/drivers/md/dm-zoned-target.c
> +++ b/drivers/md/dm-zoned-target.c
> @@ -123,7 +123,7 @@ static int dmz_submit_bio(struct dmz_target *dmz, struct dm_zone *zone,
>  {
>  	struct dmz_bioctx *bioctx =
>  		dm_per_bio_data(bio, sizeof(struct dmz_bioctx));
> -	struct dmz_dev *dev = dmz_zone_to_dev(dmz->metadata, zone);
> +	struct dmz_dev *dev = zone->dev;
>  	struct bio *clone;
>  
>  	if (dev->flags & DMZ_BDEV_DYING)
> diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
> index 3451b5a768b4..316344bf07bd 100644
> --- a/drivers/md/dm-zoned.h
> +++ b/drivers/md/dm-zoned.h
> @@ -80,6 +80,9 @@ struct dm_zone {
>  	/* For listing the zone depending on its state */
>  	struct list_head	link;
>  
> +	/* Device containing this zone */
> +	struct dmz_dev		*dev;
> +
>  	/* Zone type and state */
>  	unsigned long		flags;
>  
> @@ -190,7 +193,6 @@ const char *dmz_metadata_label(struct dmz_metadata *zmd);
>  sector_t dmz_start_sect(struct dmz_metadata *zmd, struct dm_zone *zone);
>  sector_t dmz_start_block(struct dmz_metadata *zmd, struct dm_zone *zone);
>  unsigned int dmz_nr_chunks(struct dmz_metadata *zmd);
> -struct dmz_dev *dmz_zone_to_dev(struct dmz_metadata *zmd, struct dm_zone *zone);
>  
>  bool dmz_check_dev(struct dmz_metadata *zmd);
>  bool dmz_dev_is_dying(struct dmz_metadata *zmd);
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

