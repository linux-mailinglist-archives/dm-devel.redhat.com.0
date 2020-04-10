Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id C02151A429F
	for <lists+dm-devel@lfdr.de>; Fri, 10 Apr 2020 08:44:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586501079;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Xl754hwSqi/+XF95Ebs8UiY8FHKp6KzI0S5zXzAGwoA=;
	b=CPfW1HmYx5mGucKXqMreaDzsJz6Ow/psmg2ve4dg+5zxIM8MjanNi1OXNy4MNPRXEsgz58
	DaGhWR4nYM//y5mYeMSFichrypDgEbnKHjxCHPAzQghgy2g/loNjlrIxeVH2o0Us7X2S/Z
	q5o1oSsLePww9c1uQX9lAT+vEBrbwAI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-cLBYRDGiMguGdPe1UCGcMA-1; Fri, 10 Apr 2020 02:44:37 -0400
X-MC-Unique: cLBYRDGiMguGdPe1UCGcMA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7EBCC8017F6;
	Fri, 10 Apr 2020 06:44:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C31E810013A1;
	Fri, 10 Apr 2020 06:44:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D719293062;
	Fri, 10 Apr 2020 06:44:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03A6iJ5l028575 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 10 Apr 2020 02:44:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CB87F100724A; Fri, 10 Apr 2020 06:44:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C5BE31007097
	for <dm-devel@redhat.com>; Fri, 10 Apr 2020 06:44:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD986800294
	for <dm-devel@redhat.com>; Fri, 10 Apr 2020 06:44:17 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-27-ZR9XSpSrOPy0-_i4N1a6VQ-1; Fri, 10 Apr 2020 02:44:13 -0400
X-MC-Unique: ZR9XSpSrOPy0-_i4N1a6VQ-1
IronPort-SDR: 2kmkGN1m/Hl/YoHoiaredn/CU9HAxXoZ+khF8Fl5R3HWUsFpnOmMX1+eR+J32p5efJV4/MTwsq
	1TnockStUv+0dHHSfg6qDIcscgzmUZv4HdgrxjSDl1cvCXtPpJp6huDp3RhmHP6TQR5ohQSmJi
	zv2G1YIOjHLfMUhnN7O1O6uWvkYg3nuQC6aQyhw5w0WiA9vhHCqvcZWcd3HTchVma27NrAKzUl
	elf1skY/tcgjY9QLb/8YKhwdI4ezpCJSDdKUoqdCr/Whd8SM61rOG+53TVSGvtByojhzO9Sn/S
	HBs=
X-IronPort-AV: E=Sophos;i="5.72,364,1580745600"; d="scan'208";a="135345757"
Received: from mail-dm6nam12lp2174.outbound.protection.outlook.com (HELO
	NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.174])
	by ob1.hgst.iphmx.com with ESMTP; 10 Apr 2020 14:43:56 +0800
Received: from BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	by BY5PR04MB6502.namprd04.prod.outlook.com (2603:10b6:a03:1db::8)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.20;
	Fri, 10 Apr 2020 06:43:52 +0000
Received: from BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606]) by
	BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606%5]) with mapi id 15.20.2900.015;
	Fri, 10 Apr 2020 06:43:52 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 06/11] dm-zoned: remove 'dev' argument from reclaim
Thread-Index: AQHWDjp6ZKX4rcXjzUO8GT29UfUPOA==
Date: Fri, 10 Apr 2020 06:43:52 +0000
Message-ID: <BY5PR04MB69009A34D81599FF8208A014E7DE0@BY5PR04MB6900.namprd04.prod.outlook.com>
References: <20200409064527.82992-1-hare@suse.de>
	<20200409064527.82992-7-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 577a37a4-6518-4a61-d053-08d7dd1a886a
x-ms-traffictypediagnostic: BY5PR04MB6502:
x-microsoft-antispam-prvs: <BY5PR04MB6502D06AF13A8C43DAE55590E7DE0@BY5PR04MB6502.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:169;
x-forefront-prvs: 0369E8196C
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR04MB6900.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(10019020)(4636009)(39860400002)(376002)(136003)(346002)(366004)(396003)(4326008)(55016002)(71200400001)(5660300002)(110136005)(54906003)(86362001)(52536014)(316002)(9686003)(33656002)(66476007)(66556008)(66946007)(7696005)(6506007)(53546011)(2906002)(26005)(8676002)(76116006)(64756008)(66446008)(81156014)(186003)(8936002)(478600001);
	DIR:OUT; SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yNT/eEZyZhp4qQ2TPyx26Otuo4we94EcToxTlLjuQeiJRXuaqC4OQmCVEvHODZHaz2bvX6StTbfDmZUIlUluPeFGEFtboVExcAYoHPEipqwAiLbtO6FJWgg89xhWfbBYD1c+KaKJ32uYarqPhLIAGd6EwS7fHOTu6MXk/D5zHaM7C+2+Fx6NOvVqz1thrk+0eCYwY1jaxc5Q9LycEWAMlT/i9hA9XWykA9De/SRPCGV0wEZ8anb4nwJskVRvMsvck68zuN6zvmD9G/ptYtl5wXIpqzsy5V7tp6JvzfLsWFEHLeu0J39U+E5B/kgtgEQNylS5e1FN0NPlfTc7hnps7z5yZeMYr9JYj/Oico+38+an56Yyz1hL3GDXxy36f1AMAPw4hhqBR2LsvlX62sXtHBuyrlkeuYXqbwtEJ9zoFH97q9Yv5E+1AXAW2oe3Uevx
x-ms-exchange-antispam-messagedata: 1xsGRMO4H0L/7wJeBFdufgxC3K/Z9rOSUIQx6o7DjDJJFgwRRiPKFnfy4hwhzu6/TqRFicevzQf1jv6NZXh+MVfzS8wJDZySGMVrNLjqcDOm7qXPqNc5sypkbbkqMywlVnC3mEx0XZpe6achqnx0xg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 577a37a4-6518-4a61-d053-08d7dd1a886a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2020 06:43:52.2251 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F7Ef9EXrX+6aqbmFKw7eR+JvPUYsl/NvCgguID3biHGbRnQ90FEBdrU9z+gFVVlP5i+W/ppbCIq3kUxuAbe5mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6502
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03A6iJ5l028575
X-loop: dm-devel@redhat.com
Cc: Bob Liu <bob.liu@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 06/11] dm-zoned: remove 'dev' argument from
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/04/09 15:45, Hannes Reinecke wrote:
> Use the dmz_zone_to_dev() mapping function to remove the
> 'dev' argument from reclaim.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>  drivers/md/dm-zoned-metadata.c |  5 +++
>  drivers/md/dm-zoned-reclaim.c  | 63 +++++++++++++++++-----------------
>  drivers/md/dm-zoned-target.c   |  2 +-
>  drivers/md/dm-zoned.h          |  4 ++-
>  4 files changed, 41 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index 7cda48683c0b..cd4a8093da24 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -267,6 +267,11 @@ const char *dmz_metadata_label(struct dmz_metadata *zmd)
>  	return (const char *)zmd->devname;
>  }
>  
> +bool dmz_check_dev(struct dmz_metadata *zmd)
> +{
> +	return dmz_check_bdev(&zmd->dev[0]);
> +}
> +
>  /*
>   * Lock/unlock mapping table.
>   * The map lock also protects all the zone lists.
> diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
> index 699c4145306e..102e0686542a 100644
> --- a/drivers/md/dm-zoned-reclaim.c
> +++ b/drivers/md/dm-zoned-reclaim.c
> @@ -13,7 +13,6 @@
>  
>  struct dmz_reclaim {
>  	struct dmz_metadata     *metadata;
> -	struct dmz_dev		*dev;
>  
>  	struct delayed_work	work;
>  	struct workqueue_struct *wq;
> @@ -59,6 +58,7 @@ static int dmz_reclaim_align_wp(struct dmz_reclaim *zrc, struct dm_zone *zone,
>  				sector_t block)
>  {
>  	struct dmz_metadata *zmd = zrc->metadata;
> +	struct dmz_dev *dev = dmz_zone_to_dev(zmd, zone);
>  	sector_t wp_block = zone->wp_block;
>  	unsigned int nr_blocks;
>  	int ret;
> @@ -74,15 +74,15 @@ static int dmz_reclaim_align_wp(struct dmz_reclaim *zrc, struct dm_zone *zone,
>  	 * pointer and the requested position.
>  	 */
>  	nr_blocks = block - wp_block;
> -	ret = blkdev_issue_zeroout(zrc->dev->bdev,
> +	ret = blkdev_issue_zeroout(dev->bdev,
>  				   dmz_start_sect(zmd, zone) + dmz_blk2sect(wp_block),
>  				   dmz_blk2sect(nr_blocks), GFP_NOIO, 0);
>  	if (ret) {
> -		dmz_dev_err(zrc->dev,
> +		dmz_dev_err(dev,
>  			    "Align zone %u wp %llu to %llu (wp+%u) blocks failed %d",
>  			    zone->id, (unsigned long long)wp_block,
>  			    (unsigned long long)block, nr_blocks, ret);
> -		dmz_check_bdev(zrc->dev);
> +		dmz_check_bdev(dev);
>  		return ret;
>  	}
>  
> @@ -116,7 +116,7 @@ static int dmz_reclaim_copy(struct dmz_reclaim *zrc,
>  			    struct dm_zone *src_zone, struct dm_zone *dst_zone)
>  {
>  	struct dmz_metadata *zmd = zrc->metadata;
> -	struct dmz_dev *dev = zrc->dev;
> +	struct dmz_dev *src_dev, *dst_dev;
>  	struct dm_io_region src, dst;
>  	sector_t block = 0, end_block;
>  	sector_t nr_blocks;
> @@ -130,13 +130,17 @@ static int dmz_reclaim_copy(struct dmz_reclaim *zrc,
>  	else
>  		end_block = dmz_zone_nr_blocks(zmd);
>  	src_zone_block = dmz_start_block(zmd, src_zone);
> +	src_dev = dmz_zone_to_dev(zmd, src_zone);
>  	dst_zone_block = dmz_start_block(zmd, dst_zone);
> +	dst_dev = dmz_zone_to_dev(zmd, dst_zone);
>  
>  	if (dmz_is_seq(dst_zone))
>  		set_bit(DM_KCOPYD_WRITE_SEQ, &flags);
>  
>  	while (block < end_block) {
> -		if (dev->flags & DMZ_BDEV_DYING)
> +		if (src_dev->flags & DMZ_BDEV_DYING)
> +			return -EIO;
> +		if (dst_dev->flags & DMZ_BDEV_DYING)
>  			return -EIO;
>  
>  		/* Get a valid region from the source zone */
> @@ -156,11 +160,11 @@ static int dmz_reclaim_copy(struct dmz_reclaim *zrc,
>  				return ret;
>  		}
>  
> -		src.bdev = dev->bdev;
> +		src.bdev = src_dev->bdev;
>  		src.sector = dmz_blk2sect(src_zone_block + block);
>  		src.count = dmz_blk2sect(nr_blocks);
>  
> -		dst.bdev = dev->bdev;
> +		dst.bdev = dst_dev->bdev;
>  		dst.sector = dmz_blk2sect(dst_zone_block + block);
>  		dst.count = src.count;
>  
> @@ -194,10 +198,10 @@ static int dmz_reclaim_buf(struct dmz_reclaim *zrc, struct dm_zone *dzone)
>  	struct dmz_metadata *zmd = zrc->metadata;
>  	int ret;
>  
> -	dmz_dev_debug(zrc->dev,
> -		      "Chunk %u, move buf zone %u (weight %u) to data zone %u (weight %u)",
> -		      dzone->chunk, bzone->id, dmz_weight(bzone),
> -		      dzone->id, dmz_weight(dzone));
> +	DMDEBUG("(%s): Chunk %u, move buf zone %u (weight %u) to data zone %u (weight %u)",
> +		dmz_metadata_label(zmd),
> +		dzone->chunk, bzone->id, dmz_weight(bzone),
> +		dzone->id, dmz_weight(dzone));
>  
>  	/* Flush data zone into the buffer zone */
>  	ret = dmz_reclaim_copy(zrc, bzone, dzone);
> @@ -233,10 +237,10 @@ static int dmz_reclaim_seq_data(struct dmz_reclaim *zrc, struct dm_zone *dzone)
>  	struct dmz_metadata *zmd = zrc->metadata;
>  	int ret = 0;
>  
> -	dmz_dev_debug(zrc->dev,
> -		      "Chunk %u, move data zone %u (weight %u) to buf zone %u (weight %u)",
> -		      chunk, dzone->id, dmz_weight(dzone),
> -		      bzone->id, dmz_weight(bzone));
> +	DMDEBUG("(%s): Chunk %u, move data zone %u (weight %u) to buf zone %u (weight %u)",
> +		dmz_metadata_label(zmd),
> +		chunk, dzone->id, dmz_weight(dzone),
> +		bzone->id, dmz_weight(bzone));
>  
>  	/* Flush data zone into the buffer zone */
>  	ret = dmz_reclaim_copy(zrc, dzone, bzone);
> @@ -285,9 +289,9 @@ static int dmz_reclaim_rnd_data(struct dmz_reclaim *zrc, struct dm_zone *dzone)
>  	if (!szone)
>  		return -ENOSPC;
>  
> -	dmz_dev_debug(zrc->dev,
> -		      "Chunk %u, move rnd zone %u (weight %u) to seq zone %u",
> -		      chunk, dzone->id, dmz_weight(dzone), szone->id);
> +	DMDEBUG("(%s): Chunk %u, move rnd zone %u (weight %u) to seq zone %u",
> +		dmz_metadata_label(zmd),
> +		chunk, dzone->id, dmz_weight(dzone), szone->id);
>  
>  	/* Flush the random data zone into the sequential zone */
>  	ret = dmz_reclaim_copy(zrc, dzone, szone);
> @@ -343,6 +347,7 @@ static int dmz_do_reclaim(struct dmz_reclaim *zrc)
>  	struct dmz_metadata *zmd = zrc->metadata;
>  	struct dm_zone *dzone;
>  	struct dm_zone *rzone;
> +	struct dmz_dev *dev;
>  	unsigned long start;
>  	int ret;
>  
> @@ -352,7 +357,7 @@ static int dmz_do_reclaim(struct dmz_reclaim *zrc)
>  		return PTR_ERR(dzone);
>  
>  	start = jiffies;
> -
> +	dev = dmz_zone_to_dev(zmd, dzone);
>  	if (dmz_is_rnd(dzone)) {
>  		if (!dmz_weight(dzone)) {
>  			/* Empty zone */
> @@ -400,14 +405,14 @@ static int dmz_do_reclaim(struct dmz_reclaim *zrc)
>  
>  	ret = dmz_flush_metadata(zrc->metadata);
>  	if (ret) {
> -		dmz_dev_debug(zrc->dev,
> -			      "Metadata flush for zone %u failed, err %d\n",
> -			      rzone->id, ret);
> +		DMDEBUG("(%s): Metadata flush for zone %u failed, err %d\n",
> +			dmz_metadata_label(zmd), rzone->id, ret);
>  		return ret;
>  	}
>  
> -	dmz_dev_debug(zrc->dev, "Reclaimed zone %u in %u ms",
> -		      rzone->id, jiffies_to_msecs(jiffies - start));
> +	DMDEBUG("(%s): Reclaimed zone %u in %u ms",
> +		dmz_metadata_label(zmd),
> +		rzone->id, jiffies_to_msecs(jiffies - start));
>  	return 0;
>  }
>  
> @@ -455,9 +460,6 @@ static void dmz_reclaim_work(struct work_struct *work)
>  	unsigned int p_unmap_rnd;
>  	int ret;
>  
> -	if (dmz_bdev_is_dying(zrc->dev))
> -		return;
> -

Why do you remove this ? We should not try to start reclaim if the device is
alreaady marked as dying.

Apart from this, looks good to me.

>  	if (!dmz_should_reclaim(zrc)) {
>  		mod_delayed_work(zrc->wq, &zrc->work, DMZ_IDLE_PERIOD);
>  		return;
> @@ -490,7 +492,7 @@ static void dmz_reclaim_work(struct work_struct *work)
>  	if (ret) {
>  		DMDEBUG("(%s): Reclaim error %d\n",
>  			dmz_metadata_label(zmd), ret);
> -		if (!dmz_check_bdev(zrc->dev))
> +		if (!dmz_check_dev(zmd))
>  			return;
>  	}
>  
> @@ -500,7 +502,7 @@ static void dmz_reclaim_work(struct work_struct *work)
>  /*
>   * Initialize reclaim.
>   */
> -int dmz_ctr_reclaim(struct dmz_dev *dev, struct dmz_metadata *zmd,
> +int dmz_ctr_reclaim(struct dmz_metadata *zmd,
>  		    struct dmz_reclaim **reclaim)
>  {
>  	struct dmz_reclaim *zrc;
> @@ -510,7 +512,6 @@ int dmz_ctr_reclaim(struct dmz_dev *dev, struct dmz_metadata *zmd,
>  	if (!zrc)
>  		return -ENOMEM;
>  
> -	zrc->dev = dev;
>  	zrc->metadata = zmd;
>  	zrc->atime = jiffies;
>  
> diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
> index 73c5026c5ef3..fa297348f0bb 100644
> --- a/drivers/md/dm-zoned-target.c
> +++ b/drivers/md/dm-zoned-target.c
> @@ -839,7 +839,7 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  	mod_delayed_work(dmz->flush_wq, &dmz->flush_work, DMZ_FLUSH_PERIOD);
>  
>  	/* Initialize reclaim */
> -	ret = dmz_ctr_reclaim(dev, dmz->metadata, &dmz->reclaim);
> +	ret = dmz_ctr_reclaim(dmz->metadata, &dmz->reclaim);
>  	if (ret) {
>  		ti->error = "Zone reclaim initialization failed";
>  		goto err_fwq;
> diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
> index dd768dc60341..dee32156e69a 100644
> --- a/drivers/md/dm-zoned.h
> +++ b/drivers/md/dm-zoned.h
> @@ -176,10 +176,12 @@ void dmz_lock_flush(struct dmz_metadata *zmd);
>  void dmz_unlock_flush(struct dmz_metadata *zmd);
>  int dmz_flush_metadata(struct dmz_metadata *zmd);
>  const char *dmz_metadata_label(struct dmz_metadata *zmd);
> +bool dmz_check_dev(struct dmz_metadata *zmd);
>  
>  sector_t dmz_start_sect(struct dmz_metadata *zmd, struct dm_zone *zone);
>  sector_t dmz_start_block(struct dmz_metadata *zmd, struct dm_zone *zone);
>  unsigned int dmz_nr_chunks(struct dmz_metadata *zmd);
> +struct dmz_dev *dmz_zone_to_dev(struct dmz_metadata *zmd, struct dm_zone *zone);
>  
>  #define DMZ_ALLOC_RND		0x01
>  #define DMZ_ALLOC_RECLAIM	0x02
> @@ -251,7 +253,7 @@ int dmz_merge_valid_blocks(struct dmz_metadata *zmd, struct dm_zone *from_zone,
>  /*
>   * Functions defined in dm-zoned-reclaim.c
>   */
> -int dmz_ctr_reclaim(struct dmz_dev *dev, struct dmz_metadata *zmd,
> +int dmz_ctr_reclaim(struct dmz_metadata *zmd,
>  		    struct dmz_reclaim **zrc);
>  void dmz_dtr_reclaim(struct dmz_reclaim *zrc);
>  void dmz_suspend_reclaim(struct dmz_reclaim *zrc);
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

