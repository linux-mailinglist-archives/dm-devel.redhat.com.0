Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 7FA891E9678
	for <lists+dm-devel@lfdr.de>; Sun, 31 May 2020 11:11:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590916280;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+LFDI1I/m+R9s5+KkMTrXqkOafOz59NHpxtklInuRA4=;
	b=Jb3Ju+T/mcFVT4Z/7E+UIIIz4ThoxgleXWr118KhTCSDZlzJKsA1Bamkt7WdYXn/x9QFSs
	nib4ZOhdvwW2PyExjKTLclhneZTkGLnm7Ry7e6oqcAM4Lb5rGoyBxkpS20e0ncp32xuNfl
	aWXCl2QUTiEbbylV90yO3MD7Gyv4Y3A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-0RwrPsmWNRCHmZ3gf2uH3g-1; Sun, 31 May 2020 05:11:18 -0400
X-MC-Unique: 0RwrPsmWNRCHmZ3gf2uH3g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E58C9BFC0;
	Sun, 31 May 2020 09:11:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CD6810013D6;
	Sun, 31 May 2020 09:11:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C9ECF1809543;
	Sun, 31 May 2020 09:11:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04V9B68R031162 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 31 May 2020 05:11:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 24EBA1040E88; Sun, 31 May 2020 09:11:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 118621040E86
	for <dm-devel@redhat.com>; Sun, 31 May 2020 09:11:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A39586C076
	for <dm-devel@redhat.com>; Sun, 31 May 2020 09:11:03 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-231-gNINxTcnM3a-R4YvCo1Mhw-1; Sun, 31 May 2020 05:11:01 -0400
X-MC-Unique: gNINxTcnM3a-R4YvCo1Mhw-1
IronPort-SDR: fSZF33nGd7sebZa8hnULy03gkzs5V0kvA9huHBac/GBFVnXidvgjEgYh39fg2wbXPPpBg3J5H6
	WgvOX6qfmp2vc44aTaRb84ONgfni1XbScABeYw7u0Vk5E6yQ2rNOHX4zZp+JGRybyNpHaaJ9/2
	gEGfJeN5kp47llBLo0i0ow+zamW5GHfs9KPk0b/lHAF3EXplgqwfuIPW9dsIVi5OuvtWKAng5f
	hlfouRSHNA7c5s7akC++3ZlxU1atvEYFYDAEnrElQNIpDFI6cCSVqdbgq7gotKO37Eoq49nFVY
	u/o=
X-IronPort-AV: E=Sophos;i="5.73,456,1583164800"; d="scan'208";a="139205637"
Received: from mail-sn1nam04lp2058.outbound.protection.outlook.com (HELO
	NAM04-SN1-obe.outbound.protection.outlook.com) ([104.47.44.58])
	by ob1.hgst.iphmx.com with ESMTP; 31 May 2020 17:11:00 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB3717.namprd04.prod.outlook.com (2603:10b6:903:e3::22)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.21;
	Sun, 31 May 2020 09:10:58 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7%9]) with mapi id 15.20.3045.022;
	Sun, 31 May 2020 09:10:58 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "snitzer@redhat.com" <snitzer@redhat.com>, "hare@suse.de" <hare@suse.de>
Thread-Topic: [PATCH 11/14] dm-zoned: support arbitrary number of devices
Thread-Index: AQHWNeAWfz8oTEeUYEqcLQDVpt81majB6weA
Date: Sun, 31 May 2020 09:10:57 +0000
Message-ID: <36914d620ecccdf0397a47703a69b926afd3d283.camel@wdc.com>
References: <20200529173907.40529-1-hare@suse.de>
	<20200529173907.40529-12-hare@suse.de>
In-Reply-To: <20200529173907.40529-12-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2 (3.36.2-1.fc32)
x-originating-ip: [60.117.181.124]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 128f37eb-da86-43ef-df33-08d805428808
x-ms-traffictypediagnostic: CY4PR04MB3717:
x-microsoft-antispam-prvs: <CY4PR04MB37173DEA42FC42C81FB1BFEBE78D0@CY4PR04MB3717.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:345;
x-forefront-prvs: 0420213CCD
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ny7wr4w0PkxyY8hPz9fnvFNiPZXxAYBwdjH7efM9SSEZA4T58ooAoj5QVSjZdTvnbDqBRKz5PYtxwK6ZTK5tqPXWRzHyQM6w3RtTk1knVco+Vsw9szcysQVCf6EuPZGzwAcwJSPUM0iwVlRklpBLuGbhbilwGck7WkzCca21jmFOWzwJOL1+p4LsB1Caf2Kbkvrt7KDGfGT6Oec7Kh6J6BrKUYvkgHpC2F6+DcJuPK017J4l6zWL6W3JN+QpVaKTzkCAmYZ55E6MNKkiwbAC1u/OqqrXrHWGpMBnUf10e9ELkND4zCwm5dGRQ9aLrJDs49jTeWtYf6eNFKzAlt3IHg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(346002)(39860400002)(396003)(376002)(366004)(136003)(71200400001)(316002)(186003)(110136005)(36756003)(76116006)(26005)(478600001)(86362001)(6506007)(66556008)(66446008)(64756008)(91956017)(66946007)(66476007)(83380400001)(6512007)(2906002)(2616005)(4326008)(6486002)(8676002)(8936002)(5660300002);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: fHyRYpOUhugsiUYKg9cyYwMA9K9OEol3zbSoosFNXIOFojgbY1W/2g233dwBD4Ikh32JWiS2evk7UvIPKgFHzvaEvDs3M1lrXdgEYkN6KHHPi0UmDRq0btUQTMxmr84uE2Uwm5EYFQR47sg3Ln/8VSkD/vMSvoNf5vxBOP1gs0CJ5SO87Z/AJBuqp2MCe9BV9j0xaDax1Gxnvi3CSVFI0Eu9/CMpWuG75g2IuhdYBhtjvGHW7AqqAHqXFAq3ck1idRTL7q3pbWKpddQ7r2sgqYcw7OPL/Nh9PN/xuBp1juavp9rC4i5daDTKCMqT0vZ/MeJlxMOQLBRuRx/JA637tEgXbx1a7pY2p+YqCISYo5XMllk0fmSn5avQOIVdoitB46YiGLxBEbvGYIXJCf7v9XhvGplO+uGW6eO1D0SS2OGa0ro6pUhOKUYC8aN2hhN88Mg3MqobQLTUJAJrB3idYMtVrZVAkpzduRltrtflRVb9eD9c7Yj4aHMcQhOts20c
x-ms-exchange-transport-forked: True
Content-ID: <B5476770B57E2740B59CEE8FE1A8F666@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 128f37eb-da86-43ef-df33-08d805428808
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2020 09:10:57.9978 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wCMfdKQ86bOKx8MA4v6sJ1Y3WltcUggdXkamJKXZeMTHtrTBXuHoQu6fVN8OjyKlLkTUT9LXVL74bK+1ukYA2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB3717
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04V9B68R031162
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 11/14] dm-zoned: support arbitrary number of
	devices
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

On Fri, 2020-05-29 at 19:39 +0200, Hannes Reinecke wrote:
> Remove the hard-coded limit of two devices and support an unlimited
> number of additional zoned devices.
> With that we need to increase the device-mapper version number to
> 3.0.0 as we've modified the interface.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>  drivers/md/dm-zoned-metadata.c |  15 +++++-
>  drivers/md/dm-zoned-target.c   | 106 ++++++++++++++++++++++++-----------------
>  2 files changed, 75 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index 044c152eb756..221163ae5f68 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -1523,7 +1523,20 @@ static int dmz_init_zones(struct dmz_metadata *zmd)
>  		 */
>  		zmd->sb[0].zone = dmz_get(zmd, 0);
>  
> -		zoned_dev = &zmd->dev[1];
> +		for (i = 1; i < zmd->nr_devs; i++) {
> +			zoned_dev = &zmd->dev[i];
> +
> +			ret = blkdev_report_zones(zoned_dev->bdev, 0,
> +						  BLK_ALL_ZONES,
> +						  dmz_init_zone, zoned_dev);
> +			if (ret < 0) {
> +				DMDEBUG("(%s): Failed to report zones, error %d",
> +					zmd->devname, ret);
> +				dmz_drop_zones(zmd);
> +				return ret;
> +			}
> +		}
> +		return 0;
>  	}
>  
>  	/*
> diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
> index aa3d26d16441..4a51738d4b0d 100644
> --- a/drivers/md/dm-zoned-target.c
> +++ b/drivers/md/dm-zoned-target.c
> @@ -13,8 +13,6 @@
>  
>  #define DMZ_MIN_BIOS		8192
>  
> -#define DMZ_MAX_DEVS		2
> -
>  /*
>   * Zone BIO context.
>   */
> @@ -40,10 +38,10 @@ struct dm_chunk_work {
>   * Target descriptor.
>   */
>  struct dmz_target {
> -	struct dm_dev		*ddev[DMZ_MAX_DEVS];
> +	struct dm_dev		**ddev;
>  	unsigned int		nr_ddevs;
>  
> -	unsigned long		flags;
> +	unsigned int		flags;
>  
>  	/* Zoned block device information */
>  	struct dmz_dev		*dev;
> @@ -764,7 +762,7 @@ static void dmz_put_zoned_device(struct dm_target *ti)
>  	struct dmz_target *dmz = ti->private;
>  	int i;
>  
> -	for (i = 0; i < DMZ_MAX_DEVS; i++) {
> +	for (i = 0; i < dmz->nr_ddevs; i++) {
>  		if (dmz->ddev[i]) {
>  			dm_put_device(ti, dmz->ddev[i]);
>  			dmz->ddev[i] = NULL;
> @@ -777,21 +775,35 @@ static int dmz_fixup_devices(struct dm_target *ti)
>  	struct dmz_target *dmz = ti->private;
>  	struct dmz_dev *reg_dev, *zoned_dev;
>  	struct request_queue *q;
> +	sector_t zone_nr_sectors = 0;
> +	int i;
>  
>  	/*
> -	 * When we have two devices, the first one must be a regular block
> -	 * device and the second a zoned block device.
> +	 * When we have more than on devices, the first one must be a
> +	 * regular block device and the others zoned block devices.
>  	 */
> -	if (dmz->ddev[0] && dmz->ddev[1]) {
> +	if (dmz->nr_ddevs > 1) {
>  		reg_dev = &dmz->dev[0];
>  		if (!(reg_dev->flags & DMZ_BDEV_REGULAR)) {
>  			ti->error = "Primary disk is not a regular device";
>  			return -EINVAL;
>  		}
> -		zoned_dev = &dmz->dev[1];
> -		if (zoned_dev->flags & DMZ_BDEV_REGULAR) {
> -			ti->error = "Secondary disk is not a zoned device";
> -			return -EINVAL;
> +		for (i = 1; i < dmz->nr_ddevs; i++) {
> +			zoned_dev = &dmz->dev[i];
> +			if (zoned_dev->flags & DMZ_BDEV_REGULAR) {
> +				ti->error = "Secondary disk is not a zoned device";
> +				return -EINVAL;
> +			}
> +			q = bdev_get_queue(zoned_dev->bdev);
> +			if (zone_nr_sectors &&
> +			    zone_nr_sectors != blk_queue_zone_sectors(q)) {
> +				ti->error = "Zone nr sectors mismatch";
> +				return -EINVAL;
> +			}
> +			zone_nr_sectors = blk_queue_zone_sectors(q);
> +			zoned_dev->zone_nr_sectors = zone_nr_sectors;
> +			zoned_dev->nr_zones =
> +				blkdev_nr_zones(zoned_dev->bdev->bd_disk);
>  		}
>  	} else {
>  		reg_dev = NULL;
> @@ -800,17 +812,24 @@ static int dmz_fixup_devices(struct dm_target *ti)
>  			ti->error = "Disk is not a zoned device";
>  			return -EINVAL;
>  		}
> +		q = bdev_get_queue(zoned_dev->bdev);
> +		zoned_dev->zone_nr_sectors = blk_queue_zone_sectors(q);
> +		zoned_dev->nr_zones = blkdev_nr_zones(zoned_dev->bdev->bd_disk);
>  	}
> -	q = bdev_get_queue(zoned_dev->bdev);
> -	zoned_dev->zone_nr_sectors = blk_queue_zone_sectors(q);
> -	zoned_dev->nr_zones = blkdev_nr_zones(zoned_dev->bdev->bd_disk);
>  
>  	if (reg_dev) {
> -		reg_dev->zone_nr_sectors = zoned_dev->zone_nr_sectors;
> +		sector_t zone_offset;
> +
> +		reg_dev->zone_nr_sectors = zone_nr_sectors;
>  		reg_dev->nr_zones =
>  			DIV_ROUND_UP_SECTOR_T(reg_dev->capacity,
>  					      reg_dev->zone_nr_sectors);
> -		zoned_dev->zone_offset = reg_dev->nr_zones;
> +		reg_dev->zone_offset = 0;
> +		zone_offset = reg_dev->nr_zones;
> +		for (i = 1; i < dmz->nr_ddevs; i++) {
> +			dmz->dev[i].zone_offset = zone_offset;
> +			zone_offset += dmz->dev[i].nr_zones;
> +		}
>  	}
>  	return 0;
>  }
> @@ -824,7 +843,7 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  	int ret, i;
>  
>  	/* Check arguments */
> -	if (argc < 1 || argc > 2) {
> +	if (argc < 1) {
>  		ti->error = "Invalid argument count";
>  		return -EINVAL;
>  	}
> @@ -835,32 +854,31 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  		ti->error = "Unable to allocate the zoned target descriptor";
>  		return -ENOMEM;
>  	}
> -	dmz->dev = kcalloc(2, sizeof(struct dmz_dev), GFP_KERNEL);
> +	dmz->dev = kcalloc(argc, sizeof(struct dmz_dev), GFP_KERNEL);
>  	if (!dmz->dev) {
>  		ti->error = "Unable to allocate the zoned device descriptors";
>  		kfree(dmz);
>  		return -ENOMEM;
>  	}
> +	dmz->ddev = kcalloc(argc, sizeof(struct dm_dev *), GFP_KERNEL);
> +	if (!dmz->ddev) {
> +		ti->error = "Unable to allocate the dm device descriptors";
> +		ret = -ENOMEM;
> +		goto err;
> +	}
>  	dmz->nr_ddevs = argc;
> +
>  	ti->private = dmz;
>  
>  	/* Get the target zoned block device */
> -	ret = dmz_get_zoned_device(ti, argv[0], 0, argc);
> -	if (ret)
> -		goto err;
> -
> -	if (argc == 2) {
> -		ret = dmz_get_zoned_device(ti, argv[1], 1, argc);
> -		if (ret) {
> -			dmz_put_zoned_device(ti);
> -			goto err;
> -		}
> +	for (i = 0; i < argc; i++) {
> +		ret = dmz_get_zoned_device(ti, argv[i], i, argc);
> +		if (ret)
> +			goto err_dev;
>  	}
>  	ret = dmz_fixup_devices(ti);
> -	if (ret) {
> -		dmz_put_zoned_device(ti);
> -		goto err;
> -	}
> +	if (ret)
> +		goto err_dev;
>  
>  	/* Initialize metadata */
>  	ret = dmz_ctr_metadata(dmz->dev, argc, &dmz->metadata,
> @@ -1056,13 +1074,13 @@ static int dmz_iterate_devices(struct dm_target *ti,
>  	struct dmz_target *dmz = ti->private;
>  	unsigned int zone_nr_sectors = dmz_zone_nr_sectors(dmz->metadata);
>  	sector_t capacity;
> -	int r;
> +	int i, r;
>  
> -	capacity = dmz->dev[0].capacity & ~(zone_nr_sectors - 1);
> -	r = fn(ti, dmz->ddev[0], 0, capacity, data);
> -	if (!r && dmz->ddev[1]) {
> -		capacity = dmz->dev[1].capacity & ~(zone_nr_sectors - 1);
> -		r = fn(ti, dmz->ddev[1], 0, capacity, data);
> +	for (i = 0; i < dmz->nr_ddevs; i++) {
> +		capacity = dmz->dev[i].capacity & ~(zone_nr_sectors - 1);
> +		r = fn(ti, dmz->ddev[i], 0, capacity, data);
> +		if (r)
> +			break;
>  	}
>  	return r;
>  }
> @@ -1083,9 +1101,7 @@ static void dmz_status(struct dm_target *ti, status_type_t type,
>  		       dmz_nr_zones(dmz->metadata),
>  		       dmz_nr_unmap_cache_zones(dmz->metadata),
>  		       dmz_nr_cache_zones(dmz->metadata));
> -		for (i = 0; i < DMZ_MAX_DEVS; i++) {
> -			if (!dmz->ddev[i])
> -				continue;
> +		for (i = 0; i < dmz->nr_ddevs; i++) {
>  			/*
>  			 * For a multi-device setup the first device
>  			 * contains only cache zones.
> @@ -1104,8 +1120,8 @@ static void dmz_status(struct dm_target *ti, status_type_t type,
>  		dev = &dmz->dev[0];
>  		format_dev_t(buf, dev->bdev->bd_dev);
>  		DMEMIT("%s", buf);
> -		if (dmz->dev[1].bdev) {
> -			dev = &dmz->dev[1];
> +		for (i = 1; i < dmz->nr_ddevs; i++) {
> +			dev = &dmz->dev[i];
>  			format_dev_t(buf, dev->bdev->bd_dev);
>  			DMEMIT(" %s", buf);
>  		}
> @@ -1133,7 +1149,7 @@ static int dmz_message(struct dm_target *ti, unsigned int argc, char **argv,
>  
>  static struct target_type dmz_type = {
>  	.name		 = "zoned",
> -	.version	 = {2, 0, 0},
> +	.version	 = {3, 0, 0},
>  	.features	 = DM_TARGET_SINGLETON | DM_TARGET_ZONED_HM,
>  	.module		 = THIS_MODULE,
>  	.ctr		 = dmz_ctr,

Looks all good to me, but thinking more about it, don't we need to add
a device index in the super blocks ? The reason is that if the drive
configuration changes between stopt/start (drives removed, added or
changed slots), the drive names will change and while the userspace
will still be able to find the group of drives constituting the target
(using UUID9, there is no obvious way to find out what the original
drive order was. Since the kernel side relies on the drive being passed
to the ctr function in the order of the mapping, we need to preserve
that. Or change also the kernel side to use the index in the super
block to put each drive in its correct dmz->dev[] slot.

-- 
Damien Le Moal
Western Digital Research

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

