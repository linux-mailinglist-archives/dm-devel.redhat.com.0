Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id C14161E54DF
	for <lists+dm-devel@lfdr.de>; Thu, 28 May 2020 06:05:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590638725;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9tc/rX5ufKyaODbILoziLOb31K1uBfa7tymXPd0N9fM=;
	b=HaHa0c45wAwOHuQfI/4hy9oLeNajKYXmFVTcJDcpwDZwdd3m0CXcTb1ia0lk/gZIiTjrnr
	Ec2oZLHDpaLv1ooUnfC4S9sN8CnqIWPHf7f53e0btcUqt5ituGuBrpo+IKCovHpo4kJTqe
	dSSCcNLB5hRbnJPMHrxKiCTSeuUQd6I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-gDMblZneP3yJ-1zf59AeDA-1; Thu, 28 May 2020 00:05:22 -0400
X-MC-Unique: gDMblZneP3yJ-1zf59AeDA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0078718017F9;
	Thu, 28 May 2020 04:05:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A185F60E1C;
	Thu, 28 May 2020 04:05:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 465831809543;
	Thu, 28 May 2020 04:04:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04S44n52002350 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 28 May 2020 00:04:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 50EAD2156A2D; Thu, 28 May 2020 04:04:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B9B22156A22
	for <dm-devel@redhat.com>; Thu, 28 May 2020 04:04:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 607A58007A4
	for <dm-devel@redhat.com>; Thu, 28 May 2020 04:04:46 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-325-oondVaOlOR-T72gKib7FAw-1; Thu, 28 May 2020 00:04:41 -0400
X-MC-Unique: oondVaOlOR-T72gKib7FAw-1
IronPort-SDR: 4zqvXij9RBNl+6JJKvBBrUVvr5jzEhU9QCVZuAKhbpkjSzl6rqx94sUc6AtUF3wogP+B6bFW7u
	0CkHRKtPyqPoa3nreRoWNnuJZKEuXbx02qEj8PhQndA0aB05tkMDG/MwiAXC80rpw2f9446zMW
	s8H++tnMra1bp9pK+yBJgY1O3J7KRZD8XTpVHdDXf+Ig5PNYpnUUk4k72duh7yZo1MXk5Iyd6T
	G4cjuJBRJxQCPmLITi2v3m46VoaFLzWyNmunt4LRTv9Qi4s67ay83nFgl6LxL5/m2B76u2/nqB
	POE=
X-IronPort-AV: E=Sophos;i="5.73,443,1583164800"; d="scan'208";a="138671992"
Received: from mail-mw2nam12lp2047.outbound.protection.outlook.com (HELO
	NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.47])
	by ob1.hgst.iphmx.com with ESMTP; 28 May 2020 12:04:39 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB0984.namprd04.prod.outlook.com (2603:10b6:910:59::28)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27;
	Thu, 28 May 2020 04:04:39 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7%9]) with mapi id 15.20.3021.029;
	Thu, 28 May 2020 04:04:39 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "snitzer@redhat.com" <snitzer@redhat.com>, "hare@suse.de" <hare@suse.de>
Thread-Topic: [PATCH 12/15] dm-zoned: support arbitrary number of devices
Thread-Index: AQHWM+89UGk3X2RUK0qKXtx86DOpIKi84laA
Date: Thu, 28 May 2020 04:04:38 +0000
Message-ID: <b328b8fe29721ffbe6ddcd2315adb18fcc659e84.camel@wdc.com>
References: <20200527062225.72849-1-hare@suse.de>
	<20200527062225.72849-13-hare@suse.de>
In-Reply-To: <20200527062225.72849-13-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2 (3.36.2-1.fc32)
x-originating-ip: [2400:2411:43c0:6000:62d1:16e6:ecb1:d604]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: cdb9df02-ff2b-4740-c548-08d802bc3dfe
x-ms-traffictypediagnostic: CY4PR04MB0984:
x-microsoft-antispam-prvs: <CY4PR04MB098454786A3D1D456CC2B9DDE78E0@CY4PR04MB0984.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:260;
x-forefront-prvs: 0417A3FFD2
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wYPkLt5OV7NI2L8Lw80g6Xm11e/wjHK/pbWjNG5C2hZPT06xmYuUGPtDQs7imBq1eQzoYZTEG6i+p9JFB3FrKWVpzRUZHgGLETi35zow8PpwadYJ6k3XVnJDs7PBl1OJMXdqMwN44GyFINxKw1ze/o6TuhASv9PCggyGa13ohYTQJ1ih8USjFQvMXFKR0HKRDr4ifSbiTpW5DsNZ6RYlFa/jyEn5/eW6eCSUR7FrfqM9BCzpFbmeb6xBbpHkwjxOtP+RRxWmzf2bJoUnFSsFK+uJFxF8UlubhTdpOJlJmplht4WG3B4FIDoqQojKW2pR7mZYsxICo0pcBF0o6rvd6w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(136003)(376002)(366004)(346002)(396003)(39860400002)(36756003)(86362001)(478600001)(66476007)(8936002)(66556008)(66446008)(76116006)(64756008)(6506007)(91956017)(5660300002)(316002)(4326008)(66946007)(186003)(110136005)(2906002)(8676002)(71200400001)(6512007)(83380400001)(6486002)(2616005);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: ZdCcQCneb6pxAqu/BARuJfNvBKRV9l53hEHNpCOsSsOkzNoYDiC5KM2mIBg7b1pTMW97OlXHSYVBQxYXdAVRXQKUuHoNgYQwSXnlcFYwMe1Mzw7Lz38QFkZBqzdZ5oADpVzERJywgq0PV/t7HDhayY/ylY0PtkX5/foThoEu31lXC8Ra55hGIGpiCuKOugfMq3nf2jKTbXM5R2SRNDWjQFNkvL9Mcjh0QQfd6wy/3cpcKpxs8H4sKKG56aWjwa6Sff7mjkhtpml/4Pn+KltpUNk+VfyWOgeOgNLgrpu3tez8tSAmTMABXUrrazzXy8n0Pw/zscF68tPgzZb1l5epABcZx7l4+EuWHd8GQL1yZJ2cjmp17GwtL6uLFq5Pmus8XmvoC4j3rqgAa2uPGHhixK23/Ew/ovpx2qfjlLL+vh1poL+h2RxNjMS4oGLZVaMMMA2Dk5BhkpkLakRsHyTIOSEx/p+XvefHBnGiUP+/KpMxzicSeakE+Fkxy8h813zmxBOMmC8u+9PtXJRpj6rnbmxB32Rml/OGFHJvPwNqAu5YlyF6T/c8Wkbgcwa781a7
x-ms-exchange-transport-forked: True
Content-ID: <39D30E1CFD0B15479E2CCAB9D665B681@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdb9df02-ff2b-4740-c548-08d802bc3dfe
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2020 04:04:38.8440 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EpSfkeGkcFMbblNOjqbHTfhhE3UnlbS21Ff8jMl3EGpHKOQ6xGOCqbiSkL/QI5hBydNG51kNPN1kqcjJ4OcrpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0984
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04S44n52002350
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 12/15] dm-zoned: support arbitrary number of
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2020-05-27 at 08:22 +0200, Hannes Reinecke wrote:
> Remove the hard-coded limit of two devices and support an unlimited
> number of additional zoned devices.
> With that we need to increase the device-mapper version number to
> 3.0.0 as we've modified the interface.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>  drivers/md/dm-zoned-metadata.c | 15 +++++++-
>  drivers/md/dm-zoned-target.c   | 81 +++++++++++++++++++++++-------------------
>  2 files changed, 59 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index f309219a5457..689c1dd7ab20 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -1520,7 +1520,20 @@ static int dmz_init_zones(struct dmz_metadata *zmd)
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
> index f6f00a363903..4a51738d4b0d 100644
> --- a/drivers/md/dm-zoned-target.c
> +++ b/drivers/md/dm-zoned-target.c
> @@ -13,8 +13,6 @@
>  
>  #define DMZ_MIN_BIOS		8192
>  
> -#define DMZ_MAX_DEVS		2

This should probably be done in patch 9, and that will naturally fix
the forgotten out-of-bound loop access in patch 11.

Or just merge this patch with patch 9 ?

> -
>  /*
>   * Zone BIO context.
>   */
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
> @@ -852,22 +871,14 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
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
> @@ -1090,9 +1101,7 @@ static void dmz_status(struct dm_target *ti, status_type_t type,
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
> @@ -1111,8 +1120,8 @@ static void dmz_status(struct dm_target *ti, status_type_t type,
>  		dev = &dmz->dev[0];
>  		format_dev_t(buf, dev->bdev->bd_dev);
>  		DMEMIT("%s", buf);
> -		if (dmz->nr_ddevs > 1) {
> -			dev = &dmz->dev[1];
> +		for (i = 1; i < dmz->nr_ddevs; i++) {
> +			dev = &dmz->dev[i];
>  			format_dev_t(buf, dev->bdev->bd_dev);
>  			DMEMIT(" %s", buf);
>  		}
> @@ -1140,7 +1149,7 @@ static int dmz_message(struct dm_target *ti, unsigned int argc, char **argv,
>  
>  static struct target_type dmz_type = {
>  	.name		 = "zoned",
> -	.version	 = {2, 0, 0},
> +	.version	 = {3, 0, 0},
>  	.features	 = DM_TARGET_SINGLETON | DM_TARGET_ZONED_HM,
>  	.module		 = THIS_MODULE,
>  	.ctr		 = dmz_ctr,

Apart from the nit above, looks good.

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

-- 
Damien Le Moal
Western Digital Research

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

