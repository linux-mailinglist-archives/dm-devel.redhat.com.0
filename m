Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id C0332192118
	for <lists+dm-devel@lfdr.de>; Wed, 25 Mar 2020 07:30:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585117813;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=hvC0hfYaa9bKKjUM+/y3MWPlwh6877fQBTWdoDG1bn4=;
	b=ZUBkimo3dJbVofLaWwE2cAkEuJ4/sDjpn1wiGkNO/DparO9pBoKkaoLY0a4mta7lZMIYp9
	1Mlycg0hg2h/Gcnu+iMX9tvlxWrQj1DvIjyHbSXLMAPcAJTHjeSJ+Q5/EVW2XZN++I1wYE
	9KIUL3uAjg//VFwW9aM6tdZP3GD1vB8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-Wq6VM25UOXOY3Y7UULWTPw-1; Wed, 25 Mar 2020 02:30:10 -0400
X-MC-Unique: Wq6VM25UOXOY3Y7UULWTPw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A1B9DB60;
	Wed, 25 Mar 2020 06:30:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ABE3D1001938;
	Wed, 25 Mar 2020 06:30:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 57C1418089C8;
	Wed, 25 Mar 2020 06:29:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02P6TlLY022780 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 25 Mar 2020 02:29:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D99D01004040; Wed, 25 Mar 2020 06:29:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D2EE810F8E22
	for <dm-devel@redhat.com>; Wed, 25 Mar 2020 06:29:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC2AD80029A
	for <dm-devel@redhat.com>; Wed, 25 Mar 2020 06:29:44 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-343-emAaTyGIN6K7BtTtdbASCA-1; Wed, 25 Mar 2020 02:29:42 -0400
X-MC-Unique: emAaTyGIN6K7BtTtdbASCA-1
IronPort-SDR: q23FnEucJ7PdEjbD/AiK61431djkdGVtAwO7/ksv50JvOVDqLkN21jSFwP4yRS4y389XQ4TBL9
	qwN+KN1W2ab/vnhPE7Py0sMcMUDH0T2xYJDQxxzMwf9J2YcxFNwcFF4R23p99g4/KGuThzrFRp
	O8wq3+rIgueEiwNHmatclrh/Nsktcf9qrTGsaJ8EvtSNoMmIhK1ERlAz4XO2SMlUilNX+bU308
	l4nT8/4oIDLdcZfyzahw220uFb4ggUDS61Cf4edKqduWKGx1piSGlnEN7VSTyBRHlQeIU7/g9C
	a3s=
X-IronPort-AV: E=Sophos;i="5.72,303,1580745600"; d="scan'208";a="137829743"
Received: from mail-co1nam11lp2175.outbound.protection.outlook.com (HELO
	NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.175])
	by ob1.hgst.iphmx.com with ESMTP; 25 Mar 2020 14:29:31 +0800
Received: from CO2PR04MB2343.namprd04.prod.outlook.com (2603:10b6:102:12::9)
	by CO2PR04MB2199.namprd04.prod.outlook.com (2603:10b6:102:d::7) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22;
	Wed, 25 Mar 2020 06:29:29 +0000
Received: from CO2PR04MB2343.namprd04.prod.outlook.com
	([fe80::c1a:6c0f:8207:580b]) by CO2PR04MB2343.namprd04.prod.outlook.com
	([fe80::c1a:6c0f:8207:580b%7]) with mapi id 15.20.2835.023;
	Wed, 25 Mar 2020 06:29:29 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Bob Liu <bob.liu@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Thread-Topic: [RFC PATCH v2 3/3] dm zoned: add regular device info to metadata
Thread-Index: AQHWAcvtLt+lRR39/UysINFCEirB8Q==
Date: Wed, 25 Mar 2020 06:29:29 +0000
Message-ID: <CO2PR04MB23438E0AB35CC46732F96085E7CE0@CO2PR04MB2343.namprd04.prod.outlook.com>
References: <20200324110255.8385-1-bob.liu@oracle.com>
	<20200324110255.8385-4-bob.liu@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d0cd7955-1e98-4968-c47d-08d7d085df96
x-ms-traffictypediagnostic: CO2PR04MB2199:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO2PR04MB219975D6E4981D51AC95EF3CE7CE0@CO2PR04MB2199.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1122;
x-forefront-prvs: 0353563E2B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(346002)(366004)(396003)(136003)(39860400002)(376002)(30864003)(66476007)(7696005)(66446008)(9686003)(4326008)(91956017)(53546011)(55016002)(66556008)(64756008)(2906002)(316002)(76116006)(52536014)(6506007)(66946007)(478600001)(5660300002)(54906003)(8936002)(33656002)(86362001)(26005)(110136005)(8676002)(81166006)(186003)(81156014)(71200400001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CO2PR04MB2199;
	H:CO2PR04MB2343.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2HeNcHp9vz3uWreNPjkcOK1VgHwSV2Ple2mimfMw5xrcpJ4lmB8n6jpZwiME8v/LHW0NKCuDU1V4+143NDy0YeQmnR4rMo0tQh3DJE9YJOGvnl7AazdIGRfh6oBr7lR4O8630y3vG8VqcNNOuyPPuH68NnZHywSGHwMS2NR5cZVxSVqnRQGBHAUwazSNWLLL4kVwFHfouHXV8YKpjPt9FRNiUbw9aeMU5Z3WJKW9WA+euNy3Tq9H5BZ0U+fz8+23XgwHBX8t9Otstj63SFyd/irFNme2ocNvF/ohVLHyM3a31CWDfvCLgrq+YJNt29SNwbuRu1Nj1Pq8fLmvt84AKRvnc6nQ7xS501rQiOgNj8UQFu1Cku7/xLbUJTCUQAw8zUKWfR4zrKBp3JbXrTGSQ3LnAqDytaT2Cz3BN9QFUUUA+ZwqY5O6zh+hC7cMghBi
x-ms-exchange-antispam-messagedata: qNDkmdMFACK+QaRdJaYwR3tFNZmbmReyeces2DecE+2mUHg0yyIE2Z1jvdlh4MLc/f5B5mKz9n/qahrho3VDwBl+JuyILwd4H51rmMp2ZtnXqKxKGkUtH1mZQKPk7eP+werK2WWx/VYhdPFbjHmLCg==
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0cd7955-1e98-4968-c47d-08d7d085df96
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2020 06:29:29.5272 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RPV5NpGXGcUVrVSD0zzO5gbqNmB+XALnMKcp4kiOhyIhj3gBpVd9o70Dqp6zQTcfPkpZr0kjneQ4i22f/oBqIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR04MB2199
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02P6TlLY022780
X-loop: dm-devel@redhat.com
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Fomichev <Dmitry.Fomichev@wdc.com>, Dmitry
Subject: Re: [dm-devel] [RFC PATCH v2 3/3] dm zoned: add regular device info
	to metadata
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

On 2020/03/24 20:04, Bob Liu wrote:
> This patch implemented metadata support for regular device by:
>  - Emulated zone information for regular device.
>  - Store metadata at the beginning of regular device.
> 
>      | --- zoned device --- | -- regular device ||
>      ^                      ^
>      |                      |Metadata
> zone 0
> 
> Signed-off-by: Bob Liu <bob.liu@oracle.com>
> ---
>  drivers/md/dm-zoned-metadata.c | 135 +++++++++++++++++++++++++++++++----------
>  drivers/md/dm-zoned-target.c   |   6 +-
>  drivers/md/dm-zoned.h          |   3 +-
>  3 files changed, 108 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index e0e8be0..a96158a 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -131,6 +131,7 @@ struct dmz_sb {
>   */
>  struct dmz_metadata {
>  	struct dmz_dev		*zoned_dev;
> +	struct dmz_dev		*regu_dmz_dev;
>  
>  	sector_t		zone_bitmap_size;
>  	unsigned int		zone_nr_bitmap_blocks;
> @@ -187,6 +188,15 @@ struct dmz_metadata {
>  /*
>   * Various accessors
>   */
> +static inline struct dmz_dev *zmd_mdev(struct dmz_metadata *zmd)
> +{
> +	/* Metadata always stores in regular device if there is. */
> +	if (zmd->regu_dmz_dev)
> +		return zmd->regu_dmz_dev;
> +	else
> +		return zmd->zoned_dev;

OK. I think we will be better off using an array of pointers to struct_dmz_dev
in dmz_target, i.e., a filed "struct dmz_dev	*dev[2]". Doing so, we can be sure
to always have the device holding metatdata in entry 0, which will always be
true for the single drive case too.
With this, you will not need all these dance with "which device has metadata" ?
It always will be dmz->dev[0].

> +}
> +
>  unsigned int dmz_id(struct dmz_metadata *zmd, struct dm_zone *zone)
>  {
>  	return ((unsigned int)(zone - zmd->zones));
> @@ -194,12 +204,33 @@ unsigned int dmz_id(struct dmz_metadata *zmd, struct dm_zone *zone)
>  
>  sector_t dmz_start_sect(struct dmz_metadata *zmd, struct dm_zone *zone)
>  {
> -	return (sector_t)dmz_id(zmd, zone) << zmd->zoned_dev->zone_nr_sectors_shift;

With the array of dev trick, most of the changes below are simplified or go away.

> +	int dmz_real_id;
> +
> +	dmz_real_id = dmz_id(zmd, zone);
> +	if (dmz_real_id >= zmd->zoned_dev->nr_zones) {
> +		/* Regular dev. */
> +		dmz_real_id -= zmd->zoned_dev->nr_zones;
> +		WARN_ON(!zmd->regu_dmz_dev);
> +
> +		return (sector_t)dmz_real_id << zmd->zoned_dev->zone_nr_sectors_shift;
> +	}
> +	return (sector_t)dmz_real_id << zmd->zoned_dev->zone_nr_sectors_shift;
>  }
>  
>  sector_t dmz_start_block(struct dmz_metadata *zmd, struct dm_zone *zone)
>  {
> -	return (sector_t)dmz_id(zmd, zone) << zmd->zoned_dev->zone_nr_blocks_shift;
> +	int dmz_real_id;
> +
> +	dmz_real_id = dmz_id(zmd, zone);
> +	if (dmz_real_id >= zmd->zoned_dev->nr_zones) {
> +		/* Regular dev. */
> +		dmz_real_id -= zmd->zoned_dev->nr_zones;
> +		WARN_ON(!zmd->regu_dmz_dev);
> +
> +		return (sector_t)dmz_real_id << zmd->zoned_dev->zone_nr_blocks_shift;
> +	}
> +
> +	return (sector_t)dmz_real_id << zmd->zoned_dev->zone_nr_blocks_shift;
>  }
>  
>  unsigned int dmz_nr_chunks(struct dmz_metadata *zmd)
> @@ -403,8 +434,10 @@ static struct dmz_mblock *dmz_get_mblock_slow(struct dmz_metadata *zmd,
>  	struct dmz_mblock *mblk, *m;
>  	sector_t block = zmd->sb[zmd->mblk_primary].block + mblk_no;
>  	struct bio *bio;
> +	struct dmz_dev *mdev;
>  
> -	if (dmz_bdev_is_dying(zmd->zoned_dev))
> +	mdev = zmd_mdev(zmd);
> +	if (dmz_bdev_is_dying(mdev))
>  		return ERR_PTR(-EIO);
>  
>  	/* Get a new block and a BIO to read it */
> @@ -440,7 +473,7 @@ static struct dmz_mblock *dmz_get_mblock_slow(struct dmz_metadata *zmd,
>  
>  	/* Submit read BIO */
>  	bio->bi_iter.bi_sector = dmz_blk2sect(block);
> -	bio_set_dev(bio, zmd->zoned_dev->bdev);
> +	bio_set_dev(bio, mdev->bdev);
>  	bio->bi_private = mblk;
>  	bio->bi_end_io = dmz_mblock_bio_end_io;
>  	bio_set_op_attrs(bio, REQ_OP_READ, REQ_META | REQ_PRIO);
> @@ -555,7 +588,7 @@ static struct dmz_mblock *dmz_get_mblock(struct dmz_metadata *zmd,
>  		       TASK_UNINTERRUPTIBLE);
>  	if (test_bit(DMZ_META_ERROR, &mblk->state)) {
>  		dmz_release_mblock(zmd, mblk);
> -		dmz_check_bdev(zmd->zoned_dev);
> +		dmz_check_bdev(zmd_mdev(zmd));
>  		return ERR_PTR(-EIO);
>  	}
>  
> @@ -581,8 +614,10 @@ static int dmz_write_mblock(struct dmz_metadata *zmd, struct dmz_mblock *mblk,
>  {
>  	sector_t block = zmd->sb[set].block + mblk->no;
>  	struct bio *bio;
> +	struct dmz_dev *mdev;
>  
> -	if (dmz_bdev_is_dying(zmd->zoned_dev))
> +	mdev = zmd_mdev(zmd);
> +	if (dmz_bdev_is_dying(mdev))
>  		return -EIO;
>  
>  	bio = bio_alloc(GFP_NOIO, 1);
> @@ -594,7 +629,7 @@ static int dmz_write_mblock(struct dmz_metadata *zmd, struct dmz_mblock *mblk,
>  	set_bit(DMZ_META_WRITING, &mblk->state);
>  
>  	bio->bi_iter.bi_sector = dmz_blk2sect(block);
> -	bio_set_dev(bio, zmd->zoned_dev->bdev);
> +	bio_set_dev(bio, mdev->bdev);
>  	bio->bi_private = mblk;
>  	bio->bi_end_io = dmz_mblock_bio_end_io;
>  	bio_set_op_attrs(bio, REQ_OP_WRITE, REQ_META | REQ_PRIO);
> @@ -612,8 +647,10 @@ static int dmz_rdwr_block(struct dmz_metadata *zmd, int op, sector_t block,
>  {
>  	struct bio *bio;
>  	int ret;
> +	struct dmz_dev *mdev;
>  
> -	if (dmz_bdev_is_dying(zmd->zoned_dev))
> +	mdev = zmd_mdev(zmd);
> +	if (dmz_bdev_is_dying(mdev))
>  		return -EIO;
>  
>  	bio = bio_alloc(GFP_NOIO, 1);
> @@ -621,14 +658,14 @@ static int dmz_rdwr_block(struct dmz_metadata *zmd, int op, sector_t block,
>  		return -ENOMEM;
>  
>  	bio->bi_iter.bi_sector = dmz_blk2sect(block);
> -	bio_set_dev(bio, zmd->zoned_dev->bdev);
> +	bio_set_dev(bio, mdev->bdev);
>  	bio_set_op_attrs(bio, op, REQ_SYNC | REQ_META | REQ_PRIO);
>  	bio_add_page(bio, page, DMZ_BLOCK_SIZE, 0);
>  	ret = submit_bio_wait(bio);
>  	bio_put(bio);
>  
>  	if (ret)
> -		dmz_check_bdev(zmd->zoned_dev);
> +		dmz_check_bdev(mdev);
>  	return ret;
>  }
>  
> @@ -661,7 +698,7 @@ static int dmz_write_sb(struct dmz_metadata *zmd, unsigned int set)
>  
>  	ret = dmz_rdwr_block(zmd, REQ_OP_WRITE, block, mblk->page);
>  	if (ret == 0)
> -		ret = blkdev_issue_flush(zmd->zoned_dev->bdev, GFP_NOIO, NULL);
> +		ret = blkdev_issue_flush(zmd_mdev(zmd)->bdev, GFP_NOIO, NULL);
>  
>  	return ret;
>  }
> @@ -695,15 +732,20 @@ static int dmz_write_dirty_mblocks(struct dmz_metadata *zmd,
>  			       TASK_UNINTERRUPTIBLE);
>  		if (test_bit(DMZ_META_ERROR, &mblk->state)) {
>  			clear_bit(DMZ_META_ERROR, &mblk->state);
> -			dmz_check_bdev(zmd->zoned_dev);
> +			dmz_check_bdev(zmd_mdev(zmd));
>  			ret = -EIO;
>  		}
>  		nr_mblks_submitted--;
>  	}
>  
>  	/* Flush drive cache (this will also sync data) */
> -	if (ret == 0)
> -		ret = blkdev_issue_flush(zmd->zoned_dev->bdev, GFP_NOIO, NULL);
> +	if (ret == 0) {
> +		/* Flush metadata device */
> +		ret = blkdev_issue_flush(zmd_mdev(zmd)->bdev, GFP_NOIO, NULL);
> +		if ((ret == 0) && zmd->regu_dmz_dev)
> +			/* Flush data device. */
> +			ret = blkdev_issue_flush(zmd->zoned_dev->bdev, GFP_NOIO, NULL);
> +	}
>  
>  	return ret;
>  }
> @@ -760,7 +802,7 @@ int dmz_flush_metadata(struct dmz_metadata *zmd)
>  	 */
>  	dmz_lock_flush(zmd);
>  
> -	if (dmz_bdev_is_dying(zmd->zoned_dev)) {
> +	if (dmz_bdev_is_dying(zmd_mdev(zmd))) {
>  		ret = -EIO;
>  		goto out;
>  	}
> @@ -772,7 +814,7 @@ int dmz_flush_metadata(struct dmz_metadata *zmd)
>  
>  	/* If there are no dirty metadata blocks, just flush the device cache */
>  	if (list_empty(&write_list)) {
> -		ret = blkdev_issue_flush(zmd->zoned_dev->bdev, GFP_NOIO, NULL);
> +		ret = blkdev_issue_flush(zmd_mdev(zmd)->bdev, GFP_NOIO, NULL);
>  		goto err;
>  	}
>  
> @@ -821,7 +863,7 @@ int dmz_flush_metadata(struct dmz_metadata *zmd)
>  		list_splice(&write_list, &zmd->mblk_dirty_list);
>  		spin_unlock(&zmd->mblk_lock);
>  	}
> -	if (!dmz_check_bdev(zmd->zoned_dev))
> +	if (!dmz_check_bdev(zmd_mdev(zmd)))
>  		ret = -EIO;
>  	goto out;
>  }
> @@ -832,10 +874,11 @@ int dmz_flush_metadata(struct dmz_metadata *zmd)
>  static int dmz_check_sb(struct dmz_metadata *zmd, struct dmz_super *sb)
>  {
>  	unsigned int nr_meta_zones, nr_data_zones;
> -	struct dmz_dev *dev = zmd->zoned_dev;
> +	struct dmz_dev *dev;
>  	u32 crc, stored_crc;
>  	u64 gen;
>  
> +	dev = zmd_mdev(zmd);
>  	gen = le64_to_cpu(sb->gen);
>  	stored_crc = le32_to_cpu(sb->crc);
>  	sb->crc = 0;
> @@ -1131,8 +1174,11 @@ static int dmz_init_zone(struct blk_zone *blkz, unsigned int idx, void *data)
>  		zmd->nr_useable_zones++;
>  		if (dmz_is_rnd(zone)) {
>  			zmd->nr_rnd_zones++;
> -			if (!zmd->sb_zone) {
> -				/* Super block zone */
> +			if (!zmd->sb_zone && !zmd->regu_dmz_dev) {
> +				/*
> +				 * Super block zone goes to regular
> +				 * device by default.
> +				 */
>  				zmd->sb_zone = zone;
>  			}
>  		}
> @@ -1157,7 +1203,8 @@ static void dmz_drop_zones(struct dmz_metadata *zmd)
>  static int dmz_init_zones(struct dmz_metadata *zmd)
>  {
>  	struct dmz_dev *dev = zmd->zoned_dev;
> -	int ret;
> +	int ret, i;
> +	unsigned int total_nr_zones;
>  
>  	/* Init */
>  	zmd->zone_bitmap_size = dev->zone_nr_blocks >> 3;
> @@ -1167,7 +1214,10 @@ static int dmz_init_zones(struct dmz_metadata *zmd)
>  					DMZ_BLOCK_SIZE_BITS);
>  
>  	/* Allocate zone array */
> -	zmd->zones = kcalloc(dev->nr_zones, sizeof(struct dm_zone), GFP_KERNEL);
> +	total_nr_zones = dev->nr_zones;
> +	if (zmd->regu_dmz_dev)
> +		total_nr_zones += zmd->regu_dmz_dev->nr_zones;
> +	zmd->zones = kcalloc(total_nr_zones, sizeof(struct dm_zone), GFP_KERNEL);
>  	if (!zmd->zones)
>  		return -ENOMEM;
>  
> @@ -1186,6 +1236,25 @@ static int dmz_init_zones(struct dmz_metadata *zmd)
>  		return ret;
>  	}
>  
> +	if (zmd->regu_dmz_dev) {
> +		/* Emulate zone information for regular device zone. */
> +		for (i = 0; i < zmd->regu_dmz_dev->nr_zones; i++) {
> +			struct dm_zone *zone = &zmd->zones[i + dev->nr_zones];
> +
> +			INIT_LIST_HEAD(&zone->link);
> +			atomic_set(&zone->refcount, 0);
> +			zone->chunk = DMZ_MAP_UNMAPPED;
> +
> +			set_bit(DMZ_RND, &zone->flags);
> +			zmd->nr_rnd_zones++;
> +			zmd->nr_useable_zones++;
> +			zone->wp_block = 0;
> +			if (!zmd->sb_zone)
> +				/* Super block zone */
> +				zmd->sb_zone = zone;
> +		}
> +	}
> +
>  	return 0;
>  }
>  
> @@ -1313,13 +1382,13 @@ static void dmz_get_zone_weight(struct dmz_metadata *zmd, struct dm_zone *zone);
>   */
>  static int dmz_load_mapping(struct dmz_metadata *zmd)
>  {
> -	struct dmz_dev *dev = zmd->zoned_dev;
>  	struct dm_zone *dzone, *bzone;
>  	struct dmz_mblock *dmap_mblk = NULL;
>  	struct dmz_map *dmap;
>  	unsigned int i = 0, e = 0, chunk = 0;
>  	unsigned int dzone_id;
>  	unsigned int bzone_id;
> +	struct dmz_dev *dev = zmd_mdev(zmd);
>  
>  	/* Metadata block array for the chunk mapping table */
>  	zmd->map_mblk = kcalloc(zmd->nr_map_blocks,
> @@ -1345,7 +1414,7 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
>  		if (dzone_id == DMZ_MAP_UNMAPPED)
>  			goto next;
>  
> -		if (dzone_id >= dev->nr_zones) {
> +		if (dzone_id >= dev->target->nr_zones) {
>  			dmz_dev_err(dev, "Chunk %u mapping: invalid data zone ID %u",
>  				    chunk, dzone_id);
>  			return -EIO;
> @@ -1366,7 +1435,7 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
>  		if (bzone_id == DMZ_MAP_UNMAPPED)
>  			goto next;
>  
> -		if (bzone_id >= dev->nr_zones) {
> +		if (bzone_id >= dev->target->nr_zones) {
>  			dmz_dev_err(dev, "Chunk %u mapping: invalid buffer zone ID %u",
>  				    chunk, bzone_id);
>  			return -EIO;
> @@ -1398,7 +1467,7 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
>  	 * fully initialized. All remaining zones are unmapped data
>  	 * zones. Finish initializing those here.
>  	 */
> -	for (i = 0; i < dev->nr_zones; i++) {
> +	for (i = 0; i < dev->target->nr_zones; i++) {
>  		dzone = dmz_get(zmd, i);
>  		if (dmz_is_meta(dzone))
>  			continue;
> @@ -1632,7 +1701,7 @@ struct dm_zone *dmz_get_chunk_mapping(struct dmz_metadata *zmd, unsigned int chu
>  		/* Allocate a random zone */
>  		dzone = dmz_alloc_zone(zmd, DMZ_ALLOC_RND);
>  		if (!dzone) {
> -			if (dmz_bdev_is_dying(zmd->zoned_dev)) {
> +			if (dmz_bdev_is_dying(zmd_mdev(zmd))) {
>  				dzone = ERR_PTR(-EIO);
>  				goto out;
>  			}
> @@ -1733,7 +1802,7 @@ struct dm_zone *dmz_get_chunk_buffer(struct dmz_metadata *zmd,
>  	/* Allocate a random zone */
>  	bzone = dmz_alloc_zone(zmd, DMZ_ALLOC_RND);
>  	if (!bzone) {
> -		if (dmz_bdev_is_dying(zmd->zoned_dev)) {
> +		if (dmz_bdev_is_dying(zmd_mdev(zmd))) {
>  			bzone = ERR_PTR(-EIO);
>  			goto out;
>  		}
> @@ -2360,7 +2429,8 @@ static void dmz_cleanup_metadata(struct dmz_metadata *zmd)
>  /*
>   * Initialize the zoned metadata.
>   */
> -int dmz_ctr_metadata(struct dmz_dev *dev, struct dmz_metadata **metadata)
> +int dmz_ctr_metadata(struct dmz_dev *dev, struct dmz_dev *regu_dmz_dev,
> +		struct dmz_metadata **metadata)
>  {
>  	struct dmz_metadata *zmd;
>  	unsigned int i, zid;
> @@ -2372,6 +2442,7 @@ int dmz_ctr_metadata(struct dmz_dev *dev, struct dmz_metadata **metadata)
>  		return -ENOMEM;
>  
>  	zmd->zoned_dev = dev;
> +	zmd->regu_dmz_dev = regu_dmz_dev;
>  	zmd->mblk_rbtree = RB_ROOT;
>  	init_rwsem(&zmd->mblk_sem);
>  	mutex_init(&zmd->mblk_flush_lock);
> @@ -2440,9 +2511,9 @@ int dmz_ctr_metadata(struct dmz_dev *dev, struct dmz_metadata **metadata)
>  		     bdev_zoned_model(dev->bdev) == BLK_ZONED_HA ?
>  		     "aware" : "managed");
>  	dmz_dev_info(dev, "  %llu 512-byte logical sectors",
> -		     (u64)dev->capacity);
> +		     (u64)dev->capacity  + (u64)regu_dmz_dev->capacity);
>  	dmz_dev_info(dev, "  %u zones of %llu 512-byte logical sectors",
> -		     dev->nr_zones, (u64)dev->zone_nr_sectors);
> +		     dev->nr_zones + regu_dmz_dev->nr_zones, (u64)dev->zone_nr_sectors);
>  	dmz_dev_info(dev, "  %u metadata zones",
>  		     zmd->nr_meta_zones * 2);
>  	dmz_dev_info(dev, "  %u data zones for %u chunks",
> @@ -2488,7 +2559,7 @@ void dmz_dtr_metadata(struct dmz_metadata *zmd)
>   */
>  int dmz_resume_metadata(struct dmz_metadata *zmd)
>  {
> -	struct dmz_dev *dev = zmd->zoned_dev;
> +	struct dmz_dev *dev = zmd_mdev(zmd);
>  	struct dm_zone *zone;
>  	sector_t wp_block;
>  	unsigned int i;
> diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
> index cae4bfe..41dbb9d 100644
> --- a/drivers/md/dm-zoned-target.c
> +++ b/drivers/md/dm-zoned-target.c
> @@ -803,7 +803,7 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  
>  	/* Initialize metadata */
>  	dev = dmz->zoned_dev;
> -	ret = dmz_ctr_metadata(dev, &dmz->metadata);
> +	ret = dmz_ctr_metadata(dev, dmz->regu_dmz_dev, &dmz->metadata);
>  	if (ret) {
>  		ti->error = "Metadata initialization failed";
>  		goto err_dev;
> @@ -852,8 +852,8 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  	}
>  	mod_delayed_work(dmz->flush_wq, &dmz->flush_work, DMZ_FLUSH_PERIOD);
>  
> -	/* Initialize reclaim */
> -	ret = dmz_ctr_reclaim(dev, dmz->metadata, &dmz->reclaim);
> +	/* Initialize reclaim, only reclaim from regular device. */
> +	ret = dmz_ctr_reclaim(dmz->regu_dmz_dev, dmz->metadata, &dmz->reclaim);
>  	if (ret) {
>  		ti->error = "Zone reclaim initialization failed";
>  		goto err_fwq;
> diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
> index a3535bc..7aa1a30 100644
> --- a/drivers/md/dm-zoned.h
> +++ b/drivers/md/dm-zoned.h
> @@ -206,7 +206,8 @@ struct dmz_reclaim;
>  /*
>   * Functions defined in dm-zoned-metadata.c
>   */
> -int dmz_ctr_metadata(struct dmz_dev *dev, struct dmz_metadata **zmd);
> +int dmz_ctr_metadata(struct dmz_dev *dev, struct dmz_dev *regu_dmz_dev,
> +		struct dmz_metadata **zmd);
>  void dmz_dtr_metadata(struct dmz_metadata *zmd);
>  int dmz_resume_metadata(struct dmz_metadata *zmd);
>  
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

