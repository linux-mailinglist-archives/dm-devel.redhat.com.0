Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 56BAE19211B
	for <lists+dm-devel@lfdr.de>; Wed, 25 Mar 2020 07:30:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585117822;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=H67XL+LtGDiHlIP4E42IBQslYsEj1iESOW1RHyjBkm0=;
	b=LLHvc4IiRLIIke4uT3ssr3wy398tkR2IzeCQT59yCcUetSx7UK5AN0cTkKu3z6HdYuQ0c1
	QxfqBBPd/7rvejtfEZtlAsrJkcIb8DlDGSVcxJOYxDdqcKLaMb/8yS6G504xQv9g6lLm8a
	GL2jyzdUV2Py4u+G2jV65zCL8lCy0rk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-dquvPG0-NhWEuPJrt-DScg-1; Wed, 25 Mar 2020 02:30:20 -0400
X-MC-Unique: dquvPG0-NhWEuPJrt-DScg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10353801F7A;
	Wed, 25 Mar 2020 06:30:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 939F75C241;
	Wed, 25 Mar 2020 06:30:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0C74D86382;
	Wed, 25 Mar 2020 06:30:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02P6TwRX022791 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 25 Mar 2020 02:29:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 440332166B2B; Wed, 25 Mar 2020 06:29:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F0422166B2A
	for <dm-devel@redhat.com>; Wed, 25 Mar 2020 06:29:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 40D2B185A78E
	for <dm-devel@redhat.com>; Wed, 25 Mar 2020 06:29:55 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-283-wiR20J1rN9KAAL8XnFyOXw-1; Wed, 25 Mar 2020 02:29:51 -0400
X-MC-Unique: wiR20J1rN9KAAL8XnFyOXw-1
IronPort-SDR: DAp4V0ytFREOV1Rp2Jb9X2+37Hn7N1Q5aSRWo4d6HmZAfdI4Uow6i0Z72lbfYBXI1+RzclT/o8
	IVwwRvJZF5XxNyzDCLTpDCM4bYzc3dbb5usC6N2feea0SubGS4W1jipbDw7Rsyio6drrw3h3VF
	uQPJ3nvRSUQ+Mm7hfCNKu1UK5bU7po47RA67DmjkSAWYcLUtw6aZF7PBvmUSZJMTl1CKHaKDz8
	XkavsWKEPWvQxjq+1HAye1bpd+ZfCuphAVqwknUw6ossLSn8x94YZE8hU9KHgVEXRvDDbj7gxS
	tWs=
X-IronPort-AV: E=Sophos;i="5.72,303,1580745600"; d="scan'208";a="133883430"
Received: from mail-bn8nam11lp2176.outbound.protection.outlook.com (HELO
	NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.176])
	by ob1.hgst.iphmx.com with ESMTP; 25 Mar 2020 14:29:50 +0800
Received: from CO2PR04MB2343.namprd04.prod.outlook.com (2603:10b6:102:12::9)
	by CO2PR04MB2199.namprd04.prod.outlook.com (2603:10b6:102:d::7) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22;
	Wed, 25 Mar 2020 06:29:47 +0000
Received: from CO2PR04MB2343.namprd04.prod.outlook.com
	([fe80::c1a:6c0f:8207:580b]) by CO2PR04MB2343.namprd04.prod.outlook.com
	([fe80::c1a:6c0f:8207:580b%7]) with mapi id 15.20.2835.023;
	Wed, 25 Mar 2020 06:29:47 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Bob Liu <bob.liu@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Thread-Topic: [RFC PATCH v2 1/3] dm zoned: rename dev name to zoned_dev
Thread-Index: AQHWAcvmyYufCdSaQU6tLhoI8l02Uw==
Date: Wed, 25 Mar 2020 06:29:47 +0000
Message-ID: <CO2PR04MB234331E3605FE801A7696FBDE7CE0@CO2PR04MB2343.namprd04.prod.outlook.com>
References: <20200324110255.8385-1-bob.liu@oracle.com>
	<20200324110255.8385-2-bob.liu@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 40d97f1b-5985-419c-fe15-08d7d085ea6b
x-ms-traffictypediagnostic: CO2PR04MB2199:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO2PR04MB219906512936843F0B46874DE7CE0@CO2PR04MB2199.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:36;
x-forefront-prvs: 0353563E2B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(346002)(366004)(396003)(136003)(39860400002)(376002)(30864003)(66476007)(7696005)(66446008)(9686003)(4326008)(91956017)(53546011)(55016002)(66556008)(64756008)(2906002)(316002)(76116006)(52536014)(6506007)(66946007)(478600001)(5660300002)(54906003)(8936002)(33656002)(86362001)(26005)(110136005)(8676002)(81166006)(186003)(81156014)(71200400001)(559001)(579004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CO2PR04MB2199;
	H:CO2PR04MB2343.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FXu22y89zENsUs5JKMUIf27XAVM32qHzbequmYjevRNxkIbp+ax9kYAj4OaX3xlSbm6qBZiaZfoK+eu/z19MaLAF1oKEdxVZlWaB5yD7MfMJrQDSsvHsWCP3/+UQN8QEH/X2/n7gkqeesfYWyMDmP5vULYsAI+Qfl0zFMXhdK/ACcg6kpF/+ySchEaV2mFI5qwrxugN8rukPFmvj/S9ttiB13yqttT1DOJGDh8KuCjD69LVrzSm2wSS85RJMOCCZZVaKJgUNPtM+4vz/uH3Rt+P54ZV6fliHLjf5n3+Wt1lo7aBFkAOD/sx7FGe/M+OwXb5szxrsZi3E35KjbNy4llaK2FeqxmkvM8q4pQN2d5TLttgk+FOrj3VIjcSa0EMo7qp9WvI9Idd5Y3sYz3aFiyyFvgc9jezRUfzu3re/RA0lQMSbYULHD2fTwQBQaSaY
x-ms-exchange-antispam-messagedata: Dvwz9Q6nEX58h3No1l6ytcV9BiywrVRGbEav7n5i/1Y191aaFjvSvSCPsBoJOGGUgg9fQ5RwERkN5K4hyHpEwAe6cxdMERbx8R/uPtpZspk5jsziK40QCHvYi1CPHPS4sFELfeceaDqXTeujRoB0+w==
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40d97f1b-5985-419c-fe15-08d7d085ea6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2020 06:29:47.6279 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ajQM+Czn0mYZEmvn76sz7pYFLLqdJcGPRP/zL7So+1Lfp3l0pIirfy4LH5sW0nnPeMzvCqOYOPjKMZcKZtO4QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR04MB2199
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02P6TwRX022791
X-loop: dm-devel@redhat.com
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Fomichev <Dmitry.Fomichev@wdc.com>, Dmitry
Subject: Re: [dm-devel] [RFC PATCH v2 1/3] dm zoned: rename dev name to
	zoned_dev
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/03/24 20:03, Bob Liu wrote:
> This is a prepare patch, no function change.
> Since will introduce regular device, rename dev name to zoned_dev to
> make things clear.

zdev would be shorter and as explicit I think.

> 
> Signed-off-by: Bob Liu <bob.liu@oracle.com>
> ---
>  drivers/md/dm-zoned-metadata.c | 112 ++++++++++++++++++++---------------------
>  drivers/md/dm-zoned-target.c   |  62 +++++++++++------------
>  2 files changed, 87 insertions(+), 87 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index 369de15..e0e8be0 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -130,7 +130,7 @@ struct dmz_sb {
>   * In-memory metadata.
>   */
>  struct dmz_metadata {
> -	struct dmz_dev		*dev;
> +	struct dmz_dev		*zoned_dev;
>  
>  	sector_t		zone_bitmap_size;
>  	unsigned int		zone_nr_bitmap_blocks;
> @@ -194,12 +194,12 @@ unsigned int dmz_id(struct dmz_metadata *zmd, struct dm_zone *zone)
>  
>  sector_t dmz_start_sect(struct dmz_metadata *zmd, struct dm_zone *zone)
>  {
> -	return (sector_t)dmz_id(zmd, zone) << zmd->dev->zone_nr_sectors_shift;
> +	return (sector_t)dmz_id(zmd, zone) << zmd->zoned_dev->zone_nr_sectors_shift;
>  }
>  
>  sector_t dmz_start_block(struct dmz_metadata *zmd, struct dm_zone *zone)
>  {
> -	return (sector_t)dmz_id(zmd, zone) << zmd->dev->zone_nr_blocks_shift;
> +	return (sector_t)dmz_id(zmd, zone) << zmd->zoned_dev->zone_nr_blocks_shift;
>  }
>  
>  unsigned int dmz_nr_chunks(struct dmz_metadata *zmd)
> @@ -404,7 +404,7 @@ static struct dmz_mblock *dmz_get_mblock_slow(struct dmz_metadata *zmd,
>  	sector_t block = zmd->sb[zmd->mblk_primary].block + mblk_no;
>  	struct bio *bio;
>  
> -	if (dmz_bdev_is_dying(zmd->dev))
> +	if (dmz_bdev_is_dying(zmd->zoned_dev))
>  		return ERR_PTR(-EIO);
>  
>  	/* Get a new block and a BIO to read it */
> @@ -440,7 +440,7 @@ static struct dmz_mblock *dmz_get_mblock_slow(struct dmz_metadata *zmd,
>  
>  	/* Submit read BIO */
>  	bio->bi_iter.bi_sector = dmz_blk2sect(block);
> -	bio_set_dev(bio, zmd->dev->bdev);
> +	bio_set_dev(bio, zmd->zoned_dev->bdev);
>  	bio->bi_private = mblk;
>  	bio->bi_end_io = dmz_mblock_bio_end_io;
>  	bio_set_op_attrs(bio, REQ_OP_READ, REQ_META | REQ_PRIO);
> @@ -555,7 +555,7 @@ static struct dmz_mblock *dmz_get_mblock(struct dmz_metadata *zmd,
>  		       TASK_UNINTERRUPTIBLE);
>  	if (test_bit(DMZ_META_ERROR, &mblk->state)) {
>  		dmz_release_mblock(zmd, mblk);
> -		dmz_check_bdev(zmd->dev);
> +		dmz_check_bdev(zmd->zoned_dev);
>  		return ERR_PTR(-EIO);
>  	}
>  
> @@ -582,7 +582,7 @@ static int dmz_write_mblock(struct dmz_metadata *zmd, struct dmz_mblock *mblk,
>  	sector_t block = zmd->sb[set].block + mblk->no;
>  	struct bio *bio;
>  
> -	if (dmz_bdev_is_dying(zmd->dev))
> +	if (dmz_bdev_is_dying(zmd->zoned_dev))
>  		return -EIO;
>  
>  	bio = bio_alloc(GFP_NOIO, 1);
> @@ -594,7 +594,7 @@ static int dmz_write_mblock(struct dmz_metadata *zmd, struct dmz_mblock *mblk,
>  	set_bit(DMZ_META_WRITING, &mblk->state);
>  
>  	bio->bi_iter.bi_sector = dmz_blk2sect(block);
> -	bio_set_dev(bio, zmd->dev->bdev);
> +	bio_set_dev(bio, zmd->zoned_dev->bdev);
>  	bio->bi_private = mblk;
>  	bio->bi_end_io = dmz_mblock_bio_end_io;
>  	bio_set_op_attrs(bio, REQ_OP_WRITE, REQ_META | REQ_PRIO);
> @@ -613,7 +613,7 @@ static int dmz_rdwr_block(struct dmz_metadata *zmd, int op, sector_t block,
>  	struct bio *bio;
>  	int ret;
>  
> -	if (dmz_bdev_is_dying(zmd->dev))
> +	if (dmz_bdev_is_dying(zmd->zoned_dev))
>  		return -EIO;
>  
>  	bio = bio_alloc(GFP_NOIO, 1);
> @@ -621,14 +621,14 @@ static int dmz_rdwr_block(struct dmz_metadata *zmd, int op, sector_t block,
>  		return -ENOMEM;
>  
>  	bio->bi_iter.bi_sector = dmz_blk2sect(block);
> -	bio_set_dev(bio, zmd->dev->bdev);
> +	bio_set_dev(bio, zmd->zoned_dev->bdev);
>  	bio_set_op_attrs(bio, op, REQ_SYNC | REQ_META | REQ_PRIO);
>  	bio_add_page(bio, page, DMZ_BLOCK_SIZE, 0);
>  	ret = submit_bio_wait(bio);
>  	bio_put(bio);
>  
>  	if (ret)
> -		dmz_check_bdev(zmd->dev);
> +		dmz_check_bdev(zmd->zoned_dev);
>  	return ret;
>  }
>  
> @@ -661,7 +661,7 @@ static int dmz_write_sb(struct dmz_metadata *zmd, unsigned int set)
>  
>  	ret = dmz_rdwr_block(zmd, REQ_OP_WRITE, block, mblk->page);
>  	if (ret == 0)
> -		ret = blkdev_issue_flush(zmd->dev->bdev, GFP_NOIO, NULL);
> +		ret = blkdev_issue_flush(zmd->zoned_dev->bdev, GFP_NOIO, NULL);
>  
>  	return ret;
>  }
> @@ -695,7 +695,7 @@ static int dmz_write_dirty_mblocks(struct dmz_metadata *zmd,
>  			       TASK_UNINTERRUPTIBLE);
>  		if (test_bit(DMZ_META_ERROR, &mblk->state)) {
>  			clear_bit(DMZ_META_ERROR, &mblk->state);
> -			dmz_check_bdev(zmd->dev);
> +			dmz_check_bdev(zmd->zoned_dev);
>  			ret = -EIO;
>  		}
>  		nr_mblks_submitted--;
> @@ -703,7 +703,7 @@ static int dmz_write_dirty_mblocks(struct dmz_metadata *zmd,
>  
>  	/* Flush drive cache (this will also sync data) */
>  	if (ret == 0)
> -		ret = blkdev_issue_flush(zmd->dev->bdev, GFP_NOIO, NULL);
> +		ret = blkdev_issue_flush(zmd->zoned_dev->bdev, GFP_NOIO, NULL);
>  
>  	return ret;
>  }
> @@ -760,7 +760,7 @@ int dmz_flush_metadata(struct dmz_metadata *zmd)
>  	 */
>  	dmz_lock_flush(zmd);
>  
> -	if (dmz_bdev_is_dying(zmd->dev)) {
> +	if (dmz_bdev_is_dying(zmd->zoned_dev)) {
>  		ret = -EIO;
>  		goto out;
>  	}
> @@ -772,7 +772,7 @@ int dmz_flush_metadata(struct dmz_metadata *zmd)
>  
>  	/* If there are no dirty metadata blocks, just flush the device cache */
>  	if (list_empty(&write_list)) {
> -		ret = blkdev_issue_flush(zmd->dev->bdev, GFP_NOIO, NULL);
> +		ret = blkdev_issue_flush(zmd->zoned_dev->bdev, GFP_NOIO, NULL);
>  		goto err;
>  	}
>  
> @@ -821,7 +821,7 @@ int dmz_flush_metadata(struct dmz_metadata *zmd)
>  		list_splice(&write_list, &zmd->mblk_dirty_list);
>  		spin_unlock(&zmd->mblk_lock);
>  	}
> -	if (!dmz_check_bdev(zmd->dev))
> +	if (!dmz_check_bdev(zmd->zoned_dev))
>  		ret = -EIO;
>  	goto out;
>  }
> @@ -832,7 +832,7 @@ int dmz_flush_metadata(struct dmz_metadata *zmd)
>  static int dmz_check_sb(struct dmz_metadata *zmd, struct dmz_super *sb)
>  {
>  	unsigned int nr_meta_zones, nr_data_zones;
> -	struct dmz_dev *dev = zmd->dev;
> +	struct dmz_dev *dev = zmd->zoned_dev;
>  	u32 crc, stored_crc;
>  	u64 gen;
>  
> @@ -908,7 +908,7 @@ static int dmz_read_sb(struct dmz_metadata *zmd, unsigned int set)
>   */
>  static int dmz_lookup_secondary_sb(struct dmz_metadata *zmd)
>  {
> -	unsigned int zone_nr_blocks = zmd->dev->zone_nr_blocks;
> +	unsigned int zone_nr_blocks = zmd->zoned_dev->zone_nr_blocks;
>  	struct dmz_mblock *mblk;
>  	int i;
>  
> @@ -972,13 +972,13 @@ static int dmz_recover_mblocks(struct dmz_metadata *zmd, unsigned int dst_set)
>  	struct page *page;
>  	int i, ret;
>  
> -	dmz_dev_warn(zmd->dev, "Metadata set %u invalid: recovering", dst_set);
> +	dmz_dev_warn(zmd->zoned_dev, "Metadata set %u invalid: recovering", dst_set);
>  
>  	if (dst_set == 0)
>  		zmd->sb[0].block = dmz_start_block(zmd, zmd->sb_zone);
>  	else {
>  		zmd->sb[1].block = zmd->sb[0].block +
> -			(zmd->nr_meta_zones << zmd->dev->zone_nr_blocks_shift);
> +			(zmd->nr_meta_zones << zmd->zoned_dev->zone_nr_blocks_shift);
>  	}
>  
>  	page = alloc_page(GFP_NOIO);
> @@ -1027,7 +1027,7 @@ static int dmz_load_sb(struct dmz_metadata *zmd)
>  	zmd->sb[0].block = dmz_start_block(zmd, zmd->sb_zone);
>  	ret = dmz_get_sb(zmd, 0);
>  	if (ret) {
> -		dmz_dev_err(zmd->dev, "Read primary super block failed");
> +		dmz_dev_err(zmd->zoned_dev, "Read primary super block failed");
>  		return ret;
>  	}
>  
> @@ -1037,13 +1037,13 @@ static int dmz_load_sb(struct dmz_metadata *zmd)
>  	if (ret == 0) {
>  		sb_good[0] = true;
>  		zmd->sb[1].block = zmd->sb[0].block +
> -			(zmd->nr_meta_zones << zmd->dev->zone_nr_blocks_shift);
> +			(zmd->nr_meta_zones << zmd->zoned_dev->zone_nr_blocks_shift);
>  		ret = dmz_get_sb(zmd, 1);
>  	} else
>  		ret = dmz_lookup_secondary_sb(zmd);
>  
>  	if (ret) {
> -		dmz_dev_err(zmd->dev, "Read secondary super block failed");
> +		dmz_dev_err(zmd->zoned_dev, "Read secondary super block failed");
>  		return ret;
>  	}
>  
> @@ -1053,7 +1053,7 @@ static int dmz_load_sb(struct dmz_metadata *zmd)
>  
>  	/* Use highest generation sb first */
>  	if (!sb_good[0] && !sb_good[1]) {
> -		dmz_dev_err(zmd->dev, "No valid super block found");
> +		dmz_dev_err(zmd->zoned_dev, "No valid super block found");
>  		return -EIO;
>  	}
>  
> @@ -1068,7 +1068,7 @@ static int dmz_load_sb(struct dmz_metadata *zmd)
>  		ret = dmz_recover_mblocks(zmd, 1);
>  
>  	if (ret) {
> -		dmz_dev_err(zmd->dev, "Recovery failed");
> +		dmz_dev_err(zmd->zoned_dev, "Recovery failed");
>  		return -EIO;
>  	}
>  
> @@ -1080,7 +1080,7 @@ static int dmz_load_sb(struct dmz_metadata *zmd)
>  		zmd->mblk_primary = 1;
>  	}
>  
> -	dmz_dev_debug(zmd->dev, "Using super block %u (gen %llu)",
> +	dmz_dev_debug(zmd->zoned_dev, "Using super block %u (gen %llu)",
>  		      zmd->mblk_primary, zmd->sb_gen);
>  
>  	return 0;
> @@ -1093,7 +1093,7 @@ static int dmz_init_zone(struct blk_zone *blkz, unsigned int idx, void *data)
>  {
>  	struct dmz_metadata *zmd = data;
>  	struct dm_zone *zone = &zmd->zones[idx];
> -	struct dmz_dev *dev = zmd->dev;
> +	struct dmz_dev *dev = zmd->zoned_dev;
>  
>  	/* Ignore the eventual last runt (smaller) zone */
>  	if (blkz->len != dev->zone_nr_sectors) {
> @@ -1156,7 +1156,7 @@ static void dmz_drop_zones(struct dmz_metadata *zmd)
>   */
>  static int dmz_init_zones(struct dmz_metadata *zmd)
>  {
> -	struct dmz_dev *dev = zmd->dev;
> +	struct dmz_dev *dev = zmd->zoned_dev;
>  	int ret;
>  
>  	/* Init */
> @@ -1223,16 +1223,16 @@ static int dmz_update_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
>  	 * GFP_NOIO was specified.
>  	 */
>  	noio_flag = memalloc_noio_save();
> -	ret = blkdev_report_zones(zmd->dev->bdev, dmz_start_sect(zmd, zone), 1,
> +	ret = blkdev_report_zones(zmd->zoned_dev->bdev, dmz_start_sect(zmd, zone), 1,
>  				  dmz_update_zone_cb, zone);
>  	memalloc_noio_restore(noio_flag);
>  
>  	if (ret == 0)
>  		ret = -EIO;
>  	if (ret < 0) {
> -		dmz_dev_err(zmd->dev, "Get zone %u report failed",
> +		dmz_dev_err(zmd->zoned_dev, "Get zone %u report failed",
>  			    dmz_id(zmd, zone));
> -		dmz_check_bdev(zmd->dev);
> +		dmz_check_bdev(zmd->zoned_dev);
>  		return ret;
>  	}
>  
> @@ -1254,7 +1254,7 @@ static int dmz_handle_seq_write_err(struct dmz_metadata *zmd,
>  	if (ret)
>  		return ret;
>  
> -	dmz_dev_warn(zmd->dev, "Processing zone %u write error (zone wp %u/%u)",
> +	dmz_dev_warn(zmd->zoned_dev, "Processing zone %u write error (zone wp %u/%u)",
>  		     dmz_id(zmd, zone), zone->wp_block, wp);
>  
>  	if (zone->wp_block < wp) {
> @@ -1287,7 +1287,7 @@ static int dmz_reset_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
>  		return 0;
>  
>  	if (!dmz_is_empty(zone) || dmz_seq_write_err(zone)) {
> -		struct dmz_dev *dev = zmd->dev;
> +		struct dmz_dev *dev = zmd->zoned_dev;
>  
>  		ret = blkdev_zone_mgmt(dev->bdev, REQ_OP_ZONE_RESET,
>  				       dmz_start_sect(zmd, zone),
> @@ -1313,7 +1313,7 @@ static void dmz_get_zone_weight(struct dmz_metadata *zmd, struct dm_zone *zone);
>   */
>  static int dmz_load_mapping(struct dmz_metadata *zmd)
>  {
> -	struct dmz_dev *dev = zmd->dev;
> +	struct dmz_dev *dev = zmd->zoned_dev;
>  	struct dm_zone *dzone, *bzone;
>  	struct dmz_mblock *dmap_mblk = NULL;
>  	struct dmz_map *dmap;
> @@ -1632,7 +1632,7 @@ struct dm_zone *dmz_get_chunk_mapping(struct dmz_metadata *zmd, unsigned int chu
>  		/* Allocate a random zone */
>  		dzone = dmz_alloc_zone(zmd, DMZ_ALLOC_RND);
>  		if (!dzone) {
> -			if (dmz_bdev_is_dying(zmd->dev)) {
> +			if (dmz_bdev_is_dying(zmd->zoned_dev)) {
>  				dzone = ERR_PTR(-EIO);
>  				goto out;
>  			}
> @@ -1733,7 +1733,7 @@ struct dm_zone *dmz_get_chunk_buffer(struct dmz_metadata *zmd,
>  	/* Allocate a random zone */
>  	bzone = dmz_alloc_zone(zmd, DMZ_ALLOC_RND);
>  	if (!bzone) {
> -		if (dmz_bdev_is_dying(zmd->dev)) {
> +		if (dmz_bdev_is_dying(zmd->zoned_dev)) {
>  			bzone = ERR_PTR(-EIO);
>  			goto out;
>  		}
> @@ -1795,7 +1795,7 @@ struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd, unsigned long flags)
>  		atomic_dec(&zmd->unmap_nr_seq);
>  
>  	if (dmz_is_offline(zone)) {
> -		dmz_dev_warn(zmd->dev, "Zone %u is offline", dmz_id(zmd, zone));
> +		dmz_dev_warn(zmd->zoned_dev, "Zone %u is offline", dmz_id(zmd, zone));
>  		zone = NULL;
>  		goto again;
>  	}
> @@ -1943,7 +1943,7 @@ int dmz_copy_valid_blocks(struct dmz_metadata *zmd, struct dm_zone *from_zone,
>  	sector_t chunk_block = 0;
>  
>  	/* Get the zones bitmap blocks */
> -	while (chunk_block < zmd->dev->zone_nr_blocks) {
> +	while (chunk_block < zmd->zoned_dev->zone_nr_blocks) {
>  		from_mblk = dmz_get_bitmap(zmd, from_zone, chunk_block);
>  		if (IS_ERR(from_mblk))
>  			return PTR_ERR(from_mblk);
> @@ -1978,7 +1978,7 @@ int dmz_merge_valid_blocks(struct dmz_metadata *zmd, struct dm_zone *from_zone,
>  	int ret;
>  
>  	/* Get the zones bitmap blocks */
> -	while (chunk_block < zmd->dev->zone_nr_blocks) {
> +	while (chunk_block < zmd->zoned_dev->zone_nr_blocks) {
>  		/* Get a valid region from the source zone */
>  		ret = dmz_first_valid_block(zmd, from_zone, &chunk_block);
>  		if (ret <= 0)
> @@ -2002,11 +2002,11 @@ int dmz_validate_blocks(struct dmz_metadata *zmd, struct dm_zone *zone,
>  			sector_t chunk_block, unsigned int nr_blocks)
>  {
>  	unsigned int count, bit, nr_bits;
> -	unsigned int zone_nr_blocks = zmd->dev->zone_nr_blocks;
> +	unsigned int zone_nr_blocks = zmd->zoned_dev->zone_nr_blocks;
>  	struct dmz_mblock *mblk;
>  	unsigned int n = 0;
>  
> -	dmz_dev_debug(zmd->dev, "=> VALIDATE zone %u, block %llu, %u blocks",
> +	dmz_dev_debug(zmd->zoned_dev, "=> VALIDATE zone %u, block %llu, %u blocks",
>  		      dmz_id(zmd, zone), (unsigned long long)chunk_block,
>  		      nr_blocks);
>  
> @@ -2036,7 +2036,7 @@ int dmz_validate_blocks(struct dmz_metadata *zmd, struct dm_zone *zone,
>  	if (likely(zone->weight + n <= zone_nr_blocks))
>  		zone->weight += n;
>  	else {
> -		dmz_dev_warn(zmd->dev, "Zone %u: weight %u should be <= %u",
> +		dmz_dev_warn(zmd->zoned_dev, "Zone %u: weight %u should be <= %u",
>  			     dmz_id(zmd, zone), zone->weight,
>  			     zone_nr_blocks - n);
>  		zone->weight = zone_nr_blocks;
> @@ -2086,10 +2086,10 @@ int dmz_invalidate_blocks(struct dmz_metadata *zmd, struct dm_zone *zone,
>  	struct dmz_mblock *mblk;
>  	unsigned int n = 0;
>  
> -	dmz_dev_debug(zmd->dev, "=> INVALIDATE zone %u, block %llu, %u blocks",
> +	dmz_dev_debug(zmd->zoned_dev, "=> INVALIDATE zone %u, block %llu, %u blocks",
>  		      dmz_id(zmd, zone), (u64)chunk_block, nr_blocks);
>  
> -	WARN_ON(chunk_block + nr_blocks > zmd->dev->zone_nr_blocks);
> +	WARN_ON(chunk_block + nr_blocks > zmd->zoned_dev->zone_nr_blocks);
>  
>  	while (nr_blocks) {
>  		/* Get bitmap block */
> @@ -2116,7 +2116,7 @@ int dmz_invalidate_blocks(struct dmz_metadata *zmd, struct dm_zone *zone,
>  	if (zone->weight >= n)
>  		zone->weight -= n;
>  	else {
> -		dmz_dev_warn(zmd->dev, "Zone %u: weight %u should be >= %u",
> +		dmz_dev_warn(zmd->zoned_dev, "Zone %u: weight %u should be >= %u",
>  			     dmz_id(zmd, zone), zone->weight, n);
>  		zone->weight = 0;
>  	}
> @@ -2133,7 +2133,7 @@ static int dmz_test_block(struct dmz_metadata *zmd, struct dm_zone *zone,
>  	struct dmz_mblock *mblk;
>  	int ret;
>  
> -	WARN_ON(chunk_block >= zmd->dev->zone_nr_blocks);
> +	WARN_ON(chunk_block >= zmd->zoned_dev->zone_nr_blocks);
>  
>  	/* Get bitmap block */
>  	mblk = dmz_get_bitmap(zmd, zone, chunk_block);
> @@ -2163,7 +2163,7 @@ static int dmz_to_next_set_block(struct dmz_metadata *zmd, struct dm_zone *zone,
>  	unsigned long *bitmap;
>  	int n = 0;
>  
> -	WARN_ON(chunk_block + nr_blocks > zmd->dev->zone_nr_blocks);
> +	WARN_ON(chunk_block + nr_blocks > zmd->zoned_dev->zone_nr_blocks);
>  
>  	while (nr_blocks) {
>  		/* Get bitmap block */
> @@ -2207,7 +2207,7 @@ int dmz_block_valid(struct dmz_metadata *zmd, struct dm_zone *zone,
>  
>  	/* The block is valid: get the number of valid blocks from block */
>  	return dmz_to_next_set_block(zmd, zone, chunk_block,
> -				     zmd->dev->zone_nr_blocks - chunk_block, 0);
> +				     zmd->zoned_dev->zone_nr_blocks - chunk_block, 0);
>  }
>  
>  /*
> @@ -2223,7 +2223,7 @@ int dmz_first_valid_block(struct dmz_metadata *zmd, struct dm_zone *zone,
>  	int ret;
>  
>  	ret = dmz_to_next_set_block(zmd, zone, start_block,
> -				    zmd->dev->zone_nr_blocks - start_block, 1);
> +				    zmd->zoned_dev->zone_nr_blocks - start_block, 1);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -2231,7 +2231,7 @@ int dmz_first_valid_block(struct dmz_metadata *zmd, struct dm_zone *zone,
>  	*chunk_block = start_block;
>  
>  	return dmz_to_next_set_block(zmd, zone, start_block,
> -				     zmd->dev->zone_nr_blocks - start_block, 0);
> +				     zmd->zoned_dev->zone_nr_blocks - start_block, 0);
>  }
>  
>  /*
> @@ -2270,7 +2270,7 @@ static void dmz_get_zone_weight(struct dmz_metadata *zmd, struct dm_zone *zone)
>  	struct dmz_mblock *mblk;
>  	sector_t chunk_block = 0;
>  	unsigned int bit, nr_bits;
> -	unsigned int nr_blocks = zmd->dev->zone_nr_blocks;
> +	unsigned int nr_blocks = zmd->zoned_dev->zone_nr_blocks;
>  	void *bitmap;
>  	int n = 0;
>  
> @@ -2326,7 +2326,7 @@ static void dmz_cleanup_metadata(struct dmz_metadata *zmd)
>  	while (!list_empty(&zmd->mblk_dirty_list)) {
>  		mblk = list_first_entry(&zmd->mblk_dirty_list,
>  					struct dmz_mblock, link);
> -		dmz_dev_warn(zmd->dev, "mblock %llu still in dirty list (ref %u)",
> +		dmz_dev_warn(zmd->zoned_dev, "mblock %llu still in dirty list (ref %u)",
>  			     (u64)mblk->no, mblk->ref);
>  		list_del_init(&mblk->link);
>  		rb_erase(&mblk->node, &zmd->mblk_rbtree);
> @@ -2344,7 +2344,7 @@ static void dmz_cleanup_metadata(struct dmz_metadata *zmd)
>  	/* Sanity checks: the mblock rbtree should now be empty */
>  	root = &zmd->mblk_rbtree;
>  	rbtree_postorder_for_each_entry_safe(mblk, next, root, node) {
> -		dmz_dev_warn(zmd->dev, "mblock %llu ref %u still in rbtree",
> +		dmz_dev_warn(zmd->zoned_dev, "mblock %llu ref %u still in rbtree",
>  			     (u64)mblk->no, mblk->ref);
>  		mblk->ref = 0;
>  		dmz_free_mblock(zmd, mblk);
> @@ -2371,7 +2371,7 @@ int dmz_ctr_metadata(struct dmz_dev *dev, struct dmz_metadata **metadata)
>  	if (!zmd)
>  		return -ENOMEM;
>  
> -	zmd->dev = dev;
> +	zmd->zoned_dev = dev;
>  	zmd->mblk_rbtree = RB_ROOT;
>  	init_rwsem(&zmd->mblk_sem);
>  	mutex_init(&zmd->mblk_flush_lock);
> @@ -2488,7 +2488,7 @@ void dmz_dtr_metadata(struct dmz_metadata *zmd)
>   */
>  int dmz_resume_metadata(struct dmz_metadata *zmd)
>  {
> -	struct dmz_dev *dev = zmd->dev;
> +	struct dmz_dev *dev = zmd->zoned_dev;
>  	struct dm_zone *zone;
>  	sector_t wp_block;
>  	unsigned int i;
> diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
> index 70a1063..28f4d00 100644
> --- a/drivers/md/dm-zoned-target.c
> +++ b/drivers/md/dm-zoned-target.c
> @@ -43,7 +43,7 @@ struct dmz_target {
>  	unsigned long		flags;
>  
>  	/* Zoned block device information */
> -	struct dmz_dev		*dev;
> +	struct dmz_dev		*zoned_dev;
>  
>  	/* For metadata handling */
>  	struct dmz_metadata     *metadata;
> @@ -81,7 +81,7 @@ static inline void dmz_bio_endio(struct bio *bio, blk_status_t status)
>  	if (status != BLK_STS_OK && bio->bi_status == BLK_STS_OK)
>  		bio->bi_status = status;
>  	if (bio->bi_status != BLK_STS_OK)
> -		bioctx->target->dev->flags |= DMZ_CHECK_BDEV;
> +		bioctx->target->zoned_dev->flags |= DMZ_CHECK_BDEV;
>  
>  	if (refcount_dec_and_test(&bioctx->ref)) {
>  		struct dm_zone *zone = bioctx->zone;
> @@ -125,7 +125,7 @@ static int dmz_submit_bio(struct dmz_target *dmz, struct dm_zone *zone,
>  	if (!clone)
>  		return -ENOMEM;
>  
> -	bio_set_dev(clone, dmz->dev->bdev);
> +	bio_set_dev(clone, dmz->zoned_dev->bdev);
>  	clone->bi_iter.bi_sector =
>  		dmz_start_sect(dmz->metadata, zone) + dmz_blk2sect(chunk_block);
>  	clone->bi_iter.bi_size = dmz_blk2sect(nr_blocks) << SECTOR_SHIFT;
> @@ -165,7 +165,7 @@ static void dmz_handle_read_zero(struct dmz_target *dmz, struct bio *bio,
>  static int dmz_handle_read(struct dmz_target *dmz, struct dm_zone *zone,
>  			   struct bio *bio)
>  {
> -	sector_t chunk_block = dmz_chunk_block(dmz->dev, dmz_bio_block(bio));
> +	sector_t chunk_block = dmz_chunk_block(dmz->zoned_dev, dmz_bio_block(bio));
>  	unsigned int nr_blocks = dmz_bio_blocks(bio);
>  	sector_t end_block = chunk_block + nr_blocks;
>  	struct dm_zone *rzone, *bzone;
> @@ -177,8 +177,8 @@ static int dmz_handle_read(struct dmz_target *dmz, struct dm_zone *zone,
>  		return 0;
>  	}
>  
> -	dmz_dev_debug(dmz->dev, "READ chunk %llu -> %s zone %u, block %llu, %u blocks",
> -		      (unsigned long long)dmz_bio_chunk(dmz->dev, bio),
> +	dmz_dev_debug(dmz->zoned_dev, "READ chunk %llu -> %s zone %u, block %llu, %u blocks",
> +		      (unsigned long long)dmz_bio_chunk(dmz->zoned_dev, bio),
>  		      (dmz_is_rnd(zone) ? "RND" : "SEQ"),
>  		      dmz_id(dmz->metadata, zone),
>  		      (unsigned long long)chunk_block, nr_blocks);
> @@ -308,14 +308,14 @@ static int dmz_handle_buffered_write(struct dmz_target *dmz,
>  static int dmz_handle_write(struct dmz_target *dmz, struct dm_zone *zone,
>  			    struct bio *bio)
>  {
> -	sector_t chunk_block = dmz_chunk_block(dmz->dev, dmz_bio_block(bio));
> +	sector_t chunk_block = dmz_chunk_block(dmz->zoned_dev, dmz_bio_block(bio));
>  	unsigned int nr_blocks = dmz_bio_blocks(bio);
>  
>  	if (!zone)
>  		return -ENOSPC;
>  
> -	dmz_dev_debug(dmz->dev, "WRITE chunk %llu -> %s zone %u, block %llu, %u blocks",
> -		      (unsigned long long)dmz_bio_chunk(dmz->dev, bio),
> +	dmz_dev_debug(dmz->zoned_dev, "WRITE chunk %llu -> %s zone %u, block %llu, %u blocks",
> +		      (unsigned long long)dmz_bio_chunk(dmz->zoned_dev, bio),
>  		      (dmz_is_rnd(zone) ? "RND" : "SEQ"),
>  		      dmz_id(dmz->metadata, zone),
>  		      (unsigned long long)chunk_block, nr_blocks);
> @@ -345,7 +345,7 @@ static int dmz_handle_discard(struct dmz_target *dmz, struct dm_zone *zone,
>  	struct dmz_metadata *zmd = dmz->metadata;
>  	sector_t block = dmz_bio_block(bio);
>  	unsigned int nr_blocks = dmz_bio_blocks(bio);
> -	sector_t chunk_block = dmz_chunk_block(dmz->dev, block);
> +	sector_t chunk_block = dmz_chunk_block(dmz->zoned_dev, block);
>  	int ret = 0;
>  
>  	/* For unmapped chunks, there is nothing to do */
> @@ -355,8 +355,8 @@ static int dmz_handle_discard(struct dmz_target *dmz, struct dm_zone *zone,
>  	if (dmz_is_readonly(zone))
>  		return -EROFS;
>  
> -	dmz_dev_debug(dmz->dev, "DISCARD chunk %llu -> zone %u, block %llu, %u blocks",
> -		      (unsigned long long)dmz_bio_chunk(dmz->dev, bio),
> +	dmz_dev_debug(dmz->zoned_dev, "DISCARD chunk %llu -> zone %u, block %llu, %u blocks",
> +		      (unsigned long long)dmz_bio_chunk(dmz->zoned_dev, bio),
>  		      dmz_id(zmd, zone),
>  		      (unsigned long long)chunk_block, nr_blocks);
>  
> @@ -392,7 +392,7 @@ static void dmz_handle_bio(struct dmz_target *dmz, struct dm_chunk_work *cw,
>  
>  	dmz_lock_metadata(zmd);
>  
> -	if (dmz->dev->flags & DMZ_BDEV_DYING) {
> +	if (dmz->zoned_dev->flags & DMZ_BDEV_DYING) {
>  		ret = -EIO;
>  		goto out;
>  	}
> @@ -402,7 +402,7 @@ static void dmz_handle_bio(struct dmz_target *dmz, struct dm_chunk_work *cw,
>  	 * mapping for read and discard. If a mapping is obtained,
>  	 + the zone returned will be set to active state.
>  	 */
> -	zone = dmz_get_chunk_mapping(zmd, dmz_bio_chunk(dmz->dev, bio),
> +	zone = dmz_get_chunk_mapping(zmd, dmz_bio_chunk(dmz->zoned_dev, bio),
>  				     bio_op(bio));
>  	if (IS_ERR(zone)) {
>  		ret = PTR_ERR(zone);
> @@ -427,7 +427,7 @@ static void dmz_handle_bio(struct dmz_target *dmz, struct dm_chunk_work *cw,
>  		ret = dmz_handle_discard(dmz, zone, bio);
>  		break;
>  	default:
> -		dmz_dev_err(dmz->dev, "Unsupported BIO operation 0x%x",
> +		dmz_dev_err(dmz->zoned_dev, "Unsupported BIO operation 0x%x",
>  			    bio_op(bio));
>  		ret = -EIO;
>  	}
> @@ -502,7 +502,7 @@ static void dmz_flush_work(struct work_struct *work)
>  	/* Flush dirty metadata blocks */
>  	ret = dmz_flush_metadata(dmz->metadata);
>  	if (ret)
> -		dmz_dev_debug(dmz->dev, "Metadata flush failed, rc=%d\n", ret);
> +		dmz_dev_debug(dmz->zoned_dev, "Metadata flush failed, rc=%d\n", ret);
>  
>  	/* Process queued flush requests */
>  	while (1) {
> @@ -525,7 +525,7 @@ static void dmz_flush_work(struct work_struct *work)
>   */
>  static int dmz_queue_chunk_work(struct dmz_target *dmz, struct bio *bio)
>  {
> -	unsigned int chunk = dmz_bio_chunk(dmz->dev, bio);
> +	unsigned int chunk = dmz_bio_chunk(dmz->zoned_dev, bio);
>  	struct dm_chunk_work *cw;
>  	int ret = 0;
>  
> @@ -618,20 +618,20 @@ bool dmz_check_bdev(struct dmz_dev *dmz_dev)
>  static int dmz_map(struct dm_target *ti, struct bio *bio)
>  {
>  	struct dmz_target *dmz = ti->private;
> -	struct dmz_dev *dev = dmz->dev;
> +	struct dmz_dev *dev = dmz->zoned_dev;
>  	struct dmz_bioctx *bioctx = dm_per_bio_data(bio, sizeof(struct dmz_bioctx));
>  	sector_t sector = bio->bi_iter.bi_sector;
>  	unsigned int nr_sectors = bio_sectors(bio);
>  	sector_t chunk_sector;
>  	int ret;
>  
> -	if (dmz_bdev_is_dying(dmz->dev))
> +	if (dmz_bdev_is_dying(dmz->zoned_dev))
>  		return DM_MAPIO_KILL;
>  
>  	dmz_dev_debug(dev, "BIO op %d sector %llu + %u => chunk %llu, block %llu, %u blocks",
>  		      bio_op(bio), (unsigned long long)sector, nr_sectors,
> -		      (unsigned long long)dmz_bio_chunk(dmz->dev, bio),
> -		      (unsigned long long)dmz_chunk_block(dmz->dev, dmz_bio_block(bio)),
> +		      (unsigned long long)dmz_bio_chunk(dmz->zoned_dev, bio),
> +		      (unsigned long long)dmz_chunk_block(dmz->zoned_dev, dmz_bio_block(bio)),
>  		      (unsigned int)dmz_bio_blocks(bio));
>  
>  	bio_set_dev(bio, dev->bdev);
> @@ -666,9 +666,9 @@ static int dmz_map(struct dm_target *ti, struct bio *bio)
>  	/* Now ready to handle this BIO */
>  	ret = dmz_queue_chunk_work(dmz, bio);
>  	if (ret) {
> -		dmz_dev_debug(dmz->dev,
> +		dmz_dev_debug(dmz->zoned_dev,
>  			      "BIO op %d, can't process chunk %llu, err %i\n",
> -			      bio_op(bio), (u64)dmz_bio_chunk(dmz->dev, bio),
> +			      bio_op(bio), (u64)dmz_bio_chunk(dmz->zoned_dev, bio),
>  			      ret);
>  		return DM_MAPIO_REQUEUE;
>  	}
> @@ -729,7 +729,7 @@ static int dmz_get_zoned_device(struct dm_target *ti, char *path)
>  
>  	dev->nr_zones = blkdev_nr_zones(dev->bdev->bd_disk);
>  
> -	dmz->dev = dev;
> +	dmz->zoned_dev = dev;
>  
>  	return 0;
>  err:
> @@ -747,8 +747,8 @@ static void dmz_put_zoned_device(struct dm_target *ti)
>  	struct dmz_target *dmz = ti->private;
>  
>  	dm_put_device(ti, dmz->ddev);
> -	kfree(dmz->dev);
> -	dmz->dev = NULL;
> +	kfree(dmz->zoned_dev);
> +	dmz->zoned_dev = NULL;
>  }
>  
>  /*
> @@ -782,7 +782,7 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  	}
>  
>  	/* Initialize metadata */
> -	dev = dmz->dev;
> +	dev = dmz->zoned_dev;
>  	ret = dmz_ctr_metadata(dev, &dmz->metadata);
>  	if (ret) {
>  		ti->error = "Metadata initialization failed";
> @@ -895,7 +895,7 @@ static void dmz_dtr(struct dm_target *ti)
>  static void dmz_io_hints(struct dm_target *ti, struct queue_limits *limits)
>  {
>  	struct dmz_target *dmz = ti->private;
> -	unsigned int chunk_sectors = dmz->dev->zone_nr_sectors;
> +	unsigned int chunk_sectors = dmz->zoned_dev->zone_nr_sectors;
>  
>  	limits->logical_block_size = DMZ_BLOCK_SIZE;
>  	limits->physical_block_size = DMZ_BLOCK_SIZE;
> @@ -924,10 +924,10 @@ static int dmz_prepare_ioctl(struct dm_target *ti, struct block_device **bdev)
>  {
>  	struct dmz_target *dmz = ti->private;
>  
> -	if (!dmz_check_bdev(dmz->dev))
> +	if (!dmz_check_bdev(dmz->zoned_dev))
>  		return -EIO;
>  
> -	*bdev = dmz->dev->bdev;
> +	*bdev = dmz->zoned_dev->bdev;
>  
>  	return 0;
>  }
> @@ -959,7 +959,7 @@ static int dmz_iterate_devices(struct dm_target *ti,
>  			       iterate_devices_callout_fn fn, void *data)
>  {
>  	struct dmz_target *dmz = ti->private;
> -	struct dmz_dev *dev = dmz->dev;
> +	struct dmz_dev *dev = dmz->zoned_dev;
>  	sector_t capacity = dev->capacity & ~(dev->zone_nr_sectors - 1);
>  
>  	return fn(ti, dmz->ddev, 0, capacity, data);
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

