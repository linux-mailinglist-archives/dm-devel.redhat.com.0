Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id C6D66192108
	for <lists+dm-devel@lfdr.de>; Wed, 25 Mar 2020 07:21:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585117301;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=TXeCM8cVQvpcYsrr0Z7tQt4EGy6RNxXqyoA8Oh5uDdY=;
	b=HnE0YTCgsTAYFTTWDNKIjjAVCimwVl+7UjN7u/7z95lwRIuWufIrjfIfYHzq2jjXisut33
	Wbc4IHKr3vPVdHQ6zjohinP+K8BljAHTgR5464nqBZAOvYTCGPyZ4oEWGme8qsOvesV4aO
	PqG3OQYIKryTAZXqDMCJnABDUZDuuFA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-jadWEXFfND6cGRj88RZ5rQ-1; Wed, 25 Mar 2020 02:21:39 -0400
X-MC-Unique: jadWEXFfND6cGRj88RZ5rQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93FF013EA;
	Wed, 25 Mar 2020 06:21:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB1F394B44;
	Wed, 25 Mar 2020 06:21:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E82D618095FF;
	Wed, 25 Mar 2020 06:21:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02P6KtEH022479 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 25 Mar 2020 02:20:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4BFB22166B2B; Wed, 25 Mar 2020 06:20:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 46F112166B2A
	for <dm-devel@redhat.com>; Wed, 25 Mar 2020 06:20:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8AE678FF661
	for <dm-devel@redhat.com>; Wed, 25 Mar 2020 06:20:52 +0000 (UTC)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-387-3FqItdImO-igyL5cxRzaGg-1; Wed, 25 Mar 2020 02:20:50 -0400
X-MC-Unique: 3FqItdImO-igyL5cxRzaGg-1
IronPort-SDR: irj5fw7Bic7YTlJ3S1T51p3I6Nm80yp74l8QlVzw39NmY2X4d4zdegUkgYW1vXL3zwU8gZDvbm
	zGR9QUgHge8oPFf9cJsetuVry3pK+TvNR0NtH8QnM7a44ypbfcCndtcRznb1MvraiYVB9DMeNn
	oA2KXYwbnpgK8bGf94ZRN4tMbrdx2cynifzyGSmdZdYG0up3o4Whe2aBQ4dljgjjwfAzMyVgjt
	ofOdx0dAQwjN5G9/9cU52kNXuVWEI78C6r3AyfsnYSWqnZu5+LSX8hlxT3YkYdstIc8FT60G+w
	Z/M=
X-IronPort-AV: E=Sophos;i="5.72,303,1580745600"; d="scan'208";a="235664077"
Received: from mail-mw2nam12lp2047.outbound.protection.outlook.com (HELO
	NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.47])
	by ob1.hgst.iphmx.com with ESMTP; 25 Mar 2020 14:20:59 +0800
Received: from CO2PR04MB2343.namprd04.prod.outlook.com (2603:10b6:102:12::9)
	by CO2PR04MB2199.namprd04.prod.outlook.com (2603:10b6:102:d::7) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22;
	Wed, 25 Mar 2020 06:20:47 +0000
Received: from CO2PR04MB2343.namprd04.prod.outlook.com
	([fe80::c1a:6c0f:8207:580b]) by CO2PR04MB2343.namprd04.prod.outlook.com
	([fe80::c1a:6c0f:8207:580b%7]) with mapi id 15.20.2835.023;
	Wed, 25 Mar 2020 06:20:47 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Bob Liu <bob.liu@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Thread-Topic: [RFC PATCH v2 2/3] dm zoned: introduce regular device to
	dm-zoned-target
Thread-Index: AQHWAcvoaWeO+PbNHEKzSPSdKEVGAg==
Date: Wed, 25 Mar 2020 06:20:47 +0000
Message-ID: <CO2PR04MB23437670CA0BD671AB008754E7CE0@CO2PR04MB2343.namprd04.prod.outlook.com>
References: <20200324110255.8385-1-bob.liu@oracle.com>
	<20200324110255.8385-3-bob.liu@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 478e87ba-4515-4ab4-0544-08d7d084a88a
x-ms-traffictypediagnostic: CO2PR04MB2199:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO2PR04MB219915030357EE16625F1451E7CE0@CO2PR04MB2199.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:949;
x-forefront-prvs: 0353563E2B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(86362001)(54906003)(33656002)(8936002)(186003)(81166006)(71200400001)(81156014)(26005)(110136005)(8676002)(7696005)(66446008)(9686003)(53546011)(55016002)(66556008)(91956017)(4326008)(30864003)(66476007)(478600001)(5660300002)(66946007)(316002)(64756008)(2906002)(76116006)(52536014)(6506007);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CO2PR04MB2199;
	H:CO2PR04MB2343.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Iad1fXtoIxzWU43RSLew70MDL9OICjZ6ifimfqrXx7fOBrg3D6/nRrnR2sU1BSIiKJVtARwJhzxomHcpQxAo7HYRZ9BQspyVLJap9rNwArHX0p266hvLvLiaeMEhZZ6D7ZTTSrVjLaRKrkMFgYG+E9DU84P9uvKvBUw9gTiyGOod1ZXf2f2Vsl4Vdu7NSh/imHnKQ9tOvGhkR8H2UFPMj+HQQlEy2JtPhTrgMkEpjMix9hGBvidwYVbQJgGfTiVy+zBmDNV3+de83R2WurKhEgtcfWXJOjeQFf4UufvDRM3DvRz+MhjZevh8zrD4uZm9BYKzhKE2ejpl0QhyHpWMi0wR3ai/BLw4vqOVLv72Bwar21mRwR+ji9RFLcB9vekOhLuebZhqrGZL/Up9Y57fjym9o5wlN5Df3tQKV74EZr/pURtWQUK9eN5BMnv5uz+D
x-ms-exchange-antispam-messagedata: YRXCeKZegtZMRUs2++l4ml/703ymK3n3H9B/xcXg1RF42ygVBV/b0VdFSblYNUC5AJK2x6pc25IhaJPOPWmR9Y+EJLX3b2cKpN8acadr3yeqECrHnm965ZgSKshmwNyqjQb1RdZ2/zCNF0C6UsGRwQ==
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 478e87ba-4515-4ab4-0544-08d7d084a88a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2020 06:20:47.6823 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0KQhVdOgrpLwDpUC8kTi7KgLw4p9O24GGzCFpj5tKyBnkguDGK9LIqgnam9Lh6Q/uPN5aBF4wBu/jbD5NrO/Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR04MB2199
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02P6KtEH022479
X-loop: dm-devel@redhat.com
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Fomichev <Dmitry.Fomichev@wdc.com>, Dmitry
Subject: Re: [dm-devel] [RFC PATCH v2 2/3] dm zoned: introduce regular
 device to dm-zoned-target
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

On 2020/03/24 20:03, Bob Liu wrote:
> Introduce a regular device for storing metadata and buffer write, zoned
> device is used by default if no regular device was set by dmsetup.
> 
> The corresponding dmsetup cmd is:
> echo "0 $size zoned $regular_device $zoned_device" | dmsetup create $dm-zoned-name
> 
> Signed-off-by: Bob Liu <bob.liu@oracle.com>
> ---
>  drivers/md/dm-zoned-target.c | 141 +++++++++++++++++++++++++------------------
>  drivers/md/dm-zoned.h        |  50 +++++++++++++--
>  2 files changed, 127 insertions(+), 64 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
> index 28f4d00..cae4bfe 100644
> --- a/drivers/md/dm-zoned-target.c
> +++ b/drivers/md/dm-zoned-target.c
> @@ -35,38 +35,6 @@ struct dm_chunk_work {
>  };
>  
>  /*
> - * Target descriptor.
> - */
> -struct dmz_target {
> -	struct dm_dev		*ddev;
> -
> -	unsigned long		flags;
> -
> -	/* Zoned block device information */
> -	struct dmz_dev		*zoned_dev;
> -
> -	/* For metadata handling */
> -	struct dmz_metadata     *metadata;
> -
> -	/* For reclaim */
> -	struct dmz_reclaim	*reclaim;
> -
> -	/* For chunk work */
> -	struct radix_tree_root	chunk_rxtree;
> -	struct workqueue_struct *chunk_wq;
> -	struct mutex		chunk_lock;
> -
> -	/* For cloned BIOs to zones */
> -	struct bio_set		bio_set;
> -
> -	/* For flush */
> -	spinlock_t		flush_lock;
> -	struct bio_list		flush_list;
> -	struct delayed_work	flush_work;
> -	struct workqueue_struct *flush_wq;
> -};

I am not sure I understand why this needs to be moved from here
into dm-zoned.h...

> -
> -/*
>   * Flush intervals (seconds).
>   */
>  #define DMZ_FLUSH_PERIOD	(10 * HZ)
> @@ -679,7 +647,7 @@ static int dmz_map(struct dm_target *ti, struct bio *bio)
>  /*
>   * Get zoned device information.
>   */
> -static int dmz_get_zoned_device(struct dm_target *ti, char *path)
> +static int dmz_get_device(struct dm_target *ti, char *path, bool zoned)

I do not think you need the zoned argument here. You can easily detect this
using bdev_is_zoned() once you get the bdev.

>  {
>  	struct dmz_target *dmz = ti->private;
>  	struct request_queue *q;
> @@ -688,11 +656,22 @@ static int dmz_get_zoned_device(struct dm_target *ti, char *path)
>  	int ret;
>  
>  	/* Get the target device */
> -	ret = dm_get_device(ti, path, dm_table_get_mode(ti->table), &dmz->ddev);
> -	if (ret) {
> -		ti->error = "Get target device failed";
> -		dmz->ddev = NULL;
> -		return ret;
> +	if (zoned) {
> +		ret = dm_get_device(ti, path, dm_table_get_mode(ti->table),
> +				&dmz->ddev);
> +		if (ret) {
> +			ti->error = "Get target device failed";
> +			dmz->ddev = NULL;
> +			return ret;
> +		}
> +	} else {
> +		ret = dm_get_device(ti, path, dm_table_get_mode(ti->table),
> +				&dmz->regu_dm_dev);
> +		if (ret) {
> +			ti->error = "Get target device failed";
> +			dmz->regu_dm_dev = NULL;
> +			return ret;
> +		}

If you use a local variable ddev, you do not need to duplicate this hunk.
All you need is:

if (zoned)
	dmz->zddev = ddev;
else
	dmz->cddev = ddev;

>  	}
>  
>  	dev = kzalloc(sizeof(struct dmz_dev), GFP_KERNEL);
> @@ -701,39 +680,61 @@ static int dmz_get_zoned_device(struct dm_target *ti, char *path)
>  		goto err;
>  	}
>  
> -	dev->bdev = dmz->ddev->bdev;
> -	(void)bdevname(dev->bdev, dev->name);
> -
> -	if (bdev_zoned_model(dev->bdev) == BLK_ZONED_NONE) {
> -		ti->error = "Not a zoned block device";
> -		ret = -EINVAL;
> -		goto err;
> +	if (zoned) {
> +		dev->bdev = dmz->ddev->bdev;
> +		if (bdev_zoned_model(dev->bdev) == BLK_ZONED_NONE) {
> +			ti->error = "Not a zoned block device";
> +			ret = -EINVAL;
> +			goto err;
> +		}
>  	}
> +	else
> +		dev->bdev = dmz->regu_dm_dev->bdev;
> +
> +	(void)bdevname(dev->bdev, dev->name);
> +	dev->target = dmz;
>  
>  	q = bdev_get_queue(dev->bdev);
>  	dev->capacity = i_size_read(dev->bdev->bd_inode) >> SECTOR_SHIFT;
>  	aligned_capacity = dev->capacity &
>  				~((sector_t)blk_queue_zone_sectors(q) - 1);
> -	if (ti->begin ||
> -	    ((ti->len != dev->capacity) && (ti->len != aligned_capacity))) {
> -		ti->error = "Partial mapping not supported";
> -		ret = -EINVAL;
> -		goto err;
> -	}
>  
> -	dev->zone_nr_sectors = blk_queue_zone_sectors(q);
> -	dev->zone_nr_sectors_shift = ilog2(dev->zone_nr_sectors);
> +	if (zoned) {
> +		if (ti->begin || ((ti->len != dev->capacity) &&
> +					(ti->len != aligned_capacity))) {
> +			ti->error = "Partial mapping not supported";
> +			ret = -EINVAL;
> +			goto err;
> +		}
> +		dev->zone_nr_sectors = blk_queue_zone_sectors(q);
> +		dev->zone_nr_sectors_shift = ilog2(dev->zone_nr_sectors);
> +
> +		dev->zone_nr_blocks = dmz_sect2blk(dev->zone_nr_sectors);
> +		dev->zone_nr_blocks_shift = ilog2(dev->zone_nr_blocks);
>  
> -	dev->zone_nr_blocks = dmz_sect2blk(dev->zone_nr_sectors);
> -	dev->zone_nr_blocks_shift = ilog2(dev->zone_nr_blocks);
> +		dev->nr_zones = blkdev_nr_zones(dev->bdev->bd_disk);
>  
> -	dev->nr_zones = blkdev_nr_zones(dev->bdev->bd_disk);
> +		dmz->zoned_dev = dev;
> +	} else {
> +		/* Emulate regular device zone info by using the same zone size.*/
> +		dev->zone_nr_sectors = dmz->zoned_dev->zone_nr_sectors;
> +		dev->zone_nr_sectors_shift = ilog2(dev->zone_nr_sectors);
>  
> -	dmz->zoned_dev = dev;
> +		dev->zone_nr_blocks = dmz_sect2blk(dev->zone_nr_sectors);
> +		dev->zone_nr_blocks_shift = ilog2(dev->zone_nr_blocks);
> +
> +		dev->nr_zones = (get_capacity(dev->bdev->bd_disk) >>
> +				ilog2(dev->zone_nr_sectors));
> +
> +		dmz->regu_dmz_dev = dev;
> +	}
>  
>  	return 0;
>  err:
> -	dm_put_device(ti, dmz->ddev);
> +	if (zoned)
> +		dm_put_device(ti, dmz->ddev);
> +	else
> +		dm_put_device(ti, dmz->regu_dm_dev);

A local ddev variable will avoid the need for the if/else here.

>  	kfree(dev);
>  
>  	return ret;
> @@ -746,6 +747,12 @@ static void dmz_put_zoned_device(struct dm_target *ti)
>  {
>  	struct dmz_target *dmz = ti->private;
>  
> +	if (dmz->regu_dm_dev)
> +		dm_put_device(ti, dmz->regu_dm_dev);
> +	if (dmz->regu_dmz_dev) {
> +		kfree(dmz->regu_dmz_dev);
> +		dmz->regu_dmz_dev = NULL;
> +	}
>  	dm_put_device(ti, dmz->ddev);
>  	kfree(dmz->zoned_dev);
>  	dmz->zoned_dev = NULL;
> @@ -761,7 +768,7 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  	int ret;
>  
>  	/* Check arguments */
> -	if (argc != 1) {
> +	if ((argc != 1) && (argc != 2)) {
>  		ti->error = "Invalid argument count";
>  		return -EINVAL;
>  	}
> @@ -775,12 +782,25 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  	ti->private = dmz;
>  
>  	/* Get the target zoned block device */
> -	ret = dmz_get_zoned_device(ti, argv[0]);
> +	ret = dmz_get_device(ti, argv[0], 1);
>  	if (ret) {
>  		dmz->ddev = NULL;
>  		goto err;
>  	}
>  
> +	snprintf(dmz->name, BDEVNAME_SIZE, "%s", dmz->zoned_dev->name);
> +	dmz->nr_zones = dmz->zoned_dev->nr_zones;
> +	if (argc == 2) {
> +		ret = dmz_get_device(ti, argv[1], 0);
> +		if (ret) {
> +			dmz->regu_dm_dev = NULL;
> +			goto err;
> +		}
> +		snprintf(dmz->name, BDEVNAME_SIZE * 2, "%s:%s",
> +				dmz->zoned_dev->name, dmz->regu_dmz_dev->name);
> +		dmz->nr_zones += dmz->regu_dmz_dev->nr_zones;
> +	}
> +
>  	/* Initialize metadata */
>  	dev = dmz->zoned_dev;
>  	ret = dmz_ctr_metadata(dev, &dmz->metadata);
> @@ -962,6 +982,7 @@ static int dmz_iterate_devices(struct dm_target *ti,
>  	struct dmz_dev *dev = dmz->zoned_dev;
>  	sector_t capacity = dev->capacity & ~(dev->zone_nr_sectors - 1);
>  
> +	/* Todo: fn(dmz->regu_dm_dev) */
>  	return fn(ti, dmz->ddev, 0, capacity, data);
>  }
>  
> diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
> index 5b5e493..a3535bc 100644
> --- a/drivers/md/dm-zoned.h
> +++ b/drivers/md/dm-zoned.h
> @@ -46,9 +46,51 @@
>  #define dmz_bio_blocks(bio)	dmz_sect2blk(bio_sectors(bio))
>  
>  /*
> + * Target descriptor.
> + */
> +struct dmz_target {
> +	struct dm_dev		*ddev;
> +	/*
> +	 * Regular device for store metdata and buffer write, use zoned device
> +	 * by default if no regular device was set.
> +	 */
> +	struct dm_dev           *regu_dm_dev;

rddev is shorter...

> +	struct dmz_dev          *regu_dmz_dev;

And rdev here ? Or "cdev" with the c standing for "cache" and "conventional
(=not zoned)" at the same time.

> +	/* Total nr_zones. */
> +	unsigned int            nr_zones;
> +	char                    name[BDEVNAME_SIZE * 2];

I would define 2 fields rather than doubling the nbame length. The field names
can follow the same pattern and zdev/cdev, you add zname and cname. Anyway, this
string is already in dmz_dev, so why add it ?

> +
> +	unsigned long		flags;

Flags are currently for target and backedn device. This needs to sorted out
because there will be a need for per backend device (e.g. dying flag etc) flags,
so this needs to be split, one flag field for each cache and zoned dev.

> +
> +	/* Zoned block device information */
> +	struct dmz_dev		*zoned_dev;

Similarly to regu_dmz_dev, it would be better to pair this one with struct
dm_dev *ddev above and rename ddev field to zddev.

And to simplify everything, you could move ddev to struct dmz_dev and add a
flags field there. Then all you need in struct dmz_target is:

struct dm_dev           *cdev;
struct dm_dev           *zdev;

> +
> +	/* For metadata handling */
> +	struct dmz_metadata     *metadata;
> +
> +	/* For reclaim */
> +	struct dmz_reclaim	*reclaim;
> +
> +	/* For chunk work */
> +	struct radix_tree_root	chunk_rxtree;
> +	struct workqueue_struct *chunk_wq;
> +	struct mutex		chunk_lock;
> +
> +	/* For cloned BIOs to zones */
> +	struct bio_set		bio_set;
> +
> +	/* For flush */
> +	spinlock_t		flush_lock;
> +	struct bio_list		flush_list;
> +	struct delayed_work	flush_work;
> +	struct workqueue_struct *flush_wq;
> +};
> +
> +/*
>   * Zoned block device information.
>   */
>  struct dmz_dev {
> +	struct dmz_target       *target;
>  	struct block_device	*bdev;
>  
>  	char			name[BDEVNAME_SIZE];
> @@ -147,16 +189,16 @@ enum {
>   * Message functions.
>   */
>  #define dmz_dev_info(dev, format, args...)	\
> -	DMINFO("(%s): " format, (dev)->name, ## args)
> +	DMINFO("(%s): " format, (dev)->target->name, ## args)
>  
>  #define dmz_dev_err(dev, format, args...)	\
> -	DMERR("(%s): " format, (dev)->name, ## args)
> +	DMERR("(%s): " format, (dev)->target->name, ## args)
>  
>  #define dmz_dev_warn(dev, format, args...)	\
> -	DMWARN("(%s): " format, (dev)->name, ## args)
> +	DMWARN("(%s): " format, (dev)->target->name, ## args)
>  
>  #define dmz_dev_debug(dev, format, args...)	\
> -	DMDEBUG("(%s): " format, (dev)->name, ## args)
> +	DMDEBUG("(%s): " format, (dev)->target->name, ## args)
>  
>  struct dmz_metadata;
>  struct dmz_reclaim;
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

