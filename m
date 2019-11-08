Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 0FDD2F4073
	for <lists+dm-devel@lfdr.de>; Fri,  8 Nov 2019 07:37:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573195043;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=xLXXooEPnk993S4J/Gug2uB18ksRB39SwDMrtErQFew=;
	b=Alm7IN5+6+6RlGj04kXiAlfLD4KMeI5wIFkBVF9TLEX8fGWVQKoZphijVsLDrkrbclLkbX
	pRpwb3+vju9Pqo5OHDx14MhAjn0+3jBUiUFUj2hWkczuPULv6VgKwWyEnNps/ja9tlavPV
	GqLkWOOHsP/pPsqkdiJw8akIT536MZk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-wDA6BzwENISOc-gsJrDCbw-1; Fri, 08 Nov 2019 01:37:20 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F5DD800054;
	Fri,  8 Nov 2019 06:37:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9080610016DA;
	Fri,  8 Nov 2019 06:37:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1445C4BB65;
	Fri,  8 Nov 2019 06:37:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA86axwv014585 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 8 Nov 2019 01:36:59 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AEA4C5D6B7; Fri,  8 Nov 2019 06:36:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx22.extmail.prod.ext.phx2.redhat.com
	[10.5.110.63])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 58F685D6A5;
	Fri,  8 Nov 2019 06:36:54 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6B66018CB8E0;
	Fri,  8 Nov 2019 06:36:29 +0000 (UTC)
IronPort-SDR: Ukog4tvE5x1Ic4VJ+Eezolox3Zypc8gwYUPlxGlgXbP6+ISk1Oerzhrn5y6P7GyFW50EAvPQi/
	L043C54npfa5A9peu7k7D+/vPnh1yS27XGW4zLAt/UawsLI2g7N7fMXm7g6WvpCj6OaVmedw9Y
	hqFXdDq3BTV+8uaYpopHYZRIu7tfEMqm+neEmDwb8zMPUn7eVaTgOb6jB3ftR06I0YFku9RbB3
	zRVmpb9QfgNKC5klRT4QBE2z/tbLy3nhbFTZJri0NA6kvj/IESYtH/JEJH7ynPBYf87VLkudj+
	yyI=
X-IronPort-AV: E=Sophos;i="5.68,280,1569254400"; d="scan'208";a="123198174"
Received: from mail-co1nam04lp2057.outbound.protection.outlook.com (HELO
	NAM04-CO1-obe.outbound.protection.outlook.com) ([104.47.45.57])
	by ob1.hgst.iphmx.com with ESMTP; 08 Nov 2019 14:36:21 +0800
Received: from BYAPR04MB5816.namprd04.prod.outlook.com (20.179.59.16) by
	BYAPR04MB4597.namprd04.prod.outlook.com (52.135.237.151) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2430.20; Fri, 8 Nov 2019 06:36:18 +0000
Received: from BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::4176:5eda:76a2:3c40]) by
	BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::4176:5eda:76a2:3c40%7]) with mapi id 15.20.2430.023;
	Fri, 8 Nov 2019 06:36:18 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>, "dm-devel@redhat.com"
	<dm-devel@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH] dm-zoned: reduce overhead of backing device checks
Thread-Index: AQHVlQEOxz9YsJl2vUuOoQbEJqnK3A==
Date: Fri, 8 Nov 2019 06:36:18 +0000
Message-ID: <BYAPR04MB5816753ABD46229FBD99F526E77B0@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <20191107001941.30991-1-dmitry.fomichev@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.255.47.8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c4c29ab8-bccb-4dce-d269-08d76415f628
x-ms-traffictypediagnostic: BYAPR04MB4597:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR04MB459712715A813B6B66AB9223E77B0@BYAPR04MB4597.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:186;
x-forefront-prvs: 0215D7173F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(346002)(39860400002)(396003)(366004)(136003)(376002)(189003)(199004)(66946007)(450100002)(2906002)(26005)(66476007)(102836004)(6506007)(316002)(186003)(6246003)(8936002)(52536014)(76176011)(74316002)(25786009)(99286004)(9686003)(6116002)(3846002)(5660300002)(55016002)(8676002)(7696005)(110136005)(53546011)(305945005)(229853002)(6436002)(14444005)(33656002)(64756008)(66446008)(76116006)(91956017)(7736002)(14454004)(476003)(256004)(478600001)(81166006)(486006)(71200400001)(71190400001)(81156014)(446003)(66066001)(66556008)(2501003)(86362001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB4597;
	H:BYAPR04MB5816.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LV54/Azxa938DmUUAPBSRXCwfTJnvCOrA9dz/NLM68W1oxSqbknCWXCfKmvKJaH0ioh/eRzqOtg+kXf0jABl6F925kC+4H0bnztId5hhiZxLDK0R0AqAVaVCevmuxwwgaV6cW5p9+aeD+ljruvq7y37F+8YGCbMJ7p0mRxX6vb+LApITCT6a7iMlTj2Qk4jrd4oOdc2oWTq4uPBwNcQHaszg0tHgcazsD8JnWpLEEMImZGeDo3W8czdhwcCvP3cZ9OQQxYg5hxSAHZVplNwTM3wJtq4QJONDMHqmKVm6X/U+cdAV9s0SfWb3ZLpSBQjEBbfEDnGTyH53xcPPBJs5PRgWmD+VOYyJN+a+uCkNr++VpC4DtEnC+pphmwiir71cqHD5fV5sNIyw5p8N0e2IbyXYT7iPfHLqqNUSnS+2R3qUBI7vDGMTqCIzZBr8McdH
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4c29ab8-bccb-4dce-d269-08d76415f628
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2019 06:36:18.1516 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y+17BOcGAGhtO59xDzpfeV0wTb7Fwulrd1eNg15DPoyV4movlEM74jCNtY33LAk8MsMUuM0MdDFpvjFONyc1zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4597
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.63]); Fri, 08 Nov 2019 06:36:46 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.63]);
	Fri, 08 Nov 2019 06:36:46 +0000 (UTC) for IP:'216.71.153.144'
	DOMAIN:'esa5.hgst.iphmx.com' HELO:'esa5.hgst.iphmx.com'
	FROM:'Damien.LeMoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.299  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.153.144 esa5.hgst.iphmx.com
	216.71.153.144 esa5.hgst.iphmx.com
	<prvs=208d19533=Damien.LeMoal@wdc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.63
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xA86axwv014585
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] dm-zoned: reduce overhead of backing device
	checks
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
X-MC-Unique: wDA6BzwENISOc-gsJrDCbw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2019/11/07 9:19, Dmitry Fomichev wrote:
> Commit 75d66ffb48efb3 added backing device health checks and as a part
> of these checks, check_events() block ops template call is invoked
> in dm-zoned mapping path as well as in reclaim and flush path. Calling
> check_events() with ATA or SCSI backing devices introduces a blocking
> scsi_test_unit_ready() call being made in sd_check_events().
> Even though the overhead of calling scsi_test_unit_ready() is small
> for ATA zoned devices, it is much larger for SCSI and it affects
> performance in a very negative way.
> 
> This commit fixes this performance regression by executing
> check_events() only in case of any I/O errors. The function
> dmz_bdev_is_dying() is modified to call only blk_queue_dying(),
> while calls to check_events() are made in a new helper function,
> dmz_check_bdev().

Looks good to me.

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

> 
> Cc: stable@vger.kernel.org
> Fixes: 75d66ffb48efb3 ("dm zoned: properly handle backing device failure")
> Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
> ---
>  drivers/md/dm-zoned-metadata.c | 29 +++++++++++-------
>  drivers/md/dm-zoned-reclaim.c  |  8 ++---
>  drivers/md/dm-zoned-target.c   | 54 ++++++++++++++++++++++++----------
>  drivers/md/dm-zoned.h          |  2 ++
>  4 files changed, 61 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index 595a73110e17..ac1179ca80d9 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -554,6 +554,7 @@ static struct dmz_mblock *dmz_get_mblock(struct dmz_metadata *zmd,
>  		       TASK_UNINTERRUPTIBLE);
>  	if (test_bit(DMZ_META_ERROR, &mblk->state)) {
>  		dmz_release_mblock(zmd, mblk);
> +		dmz_check_bdev(zmd->dev);
>  		return ERR_PTR(-EIO);
>  	}
>  
> @@ -625,6 +626,8 @@ static int dmz_rdwr_block(struct dmz_metadata *zmd, int op, sector_t block,
>  	ret = submit_bio_wait(bio);
>  	bio_put(bio);
>  
> +	if (ret)
> +		dmz_check_bdev(zmd->dev);
>  	return ret;
>  }
>  
> @@ -691,6 +694,7 @@ static int dmz_write_dirty_mblocks(struct dmz_metadata *zmd,
>  			       TASK_UNINTERRUPTIBLE);
>  		if (test_bit(DMZ_META_ERROR, &mblk->state)) {
>  			clear_bit(DMZ_META_ERROR, &mblk->state);
> +			dmz_check_bdev(zmd->dev);
>  			ret = -EIO;
>  		}
>  		nr_mblks_submitted--;
> @@ -768,7 +772,7 @@ int dmz_flush_metadata(struct dmz_metadata *zmd)
>  	/* If there are no dirty metadata blocks, just flush the device cache */
>  	if (list_empty(&write_list)) {
>  		ret = blkdev_issue_flush(zmd->dev->bdev, GFP_NOIO, NULL);
> -		goto out;
> +		goto err;
>  	}
>  
>  	/*
> @@ -778,7 +782,7 @@ int dmz_flush_metadata(struct dmz_metadata *zmd)
>  	 */
>  	ret = dmz_log_dirty_mblocks(zmd, &write_list);
>  	if (ret)
> -		goto out;
> +		goto err;
>  
>  	/*
>  	 * The log is on disk. It is now safe to update in place
> @@ -786,11 +790,11 @@ int dmz_flush_metadata(struct dmz_metadata *zmd)
>  	 */
>  	ret = dmz_write_dirty_mblocks(zmd, &write_list, zmd->mblk_primary);
>  	if (ret)
> -		goto out;
> +		goto err;
>  
>  	ret = dmz_write_sb(zmd, zmd->mblk_primary);
>  	if (ret)
> -		goto out;
> +		goto err;
>  
>  	while (!list_empty(&write_list)) {
>  		mblk = list_first_entry(&write_list, struct dmz_mblock, link);
> @@ -805,16 +809,20 @@ int dmz_flush_metadata(struct dmz_metadata *zmd)
>  
>  	zmd->sb_gen++;
>  out:
> -	if (ret && !list_empty(&write_list)) {
> -		spin_lock(&zmd->mblk_lock);
> -		list_splice(&write_list, &zmd->mblk_dirty_list);
> -		spin_unlock(&zmd->mblk_lock);
> -	}
> -
>  	dmz_unlock_flush(zmd);
>  	up_write(&zmd->mblk_sem);
>  
>  	return ret;
> +
> +err:
> +	if (!list_empty(&write_list)) {
> +		spin_lock(&zmd->mblk_lock);
> +		list_splice(&write_list, &zmd->mblk_dirty_list);
> +		spin_unlock(&zmd->mblk_lock);
> +	}
> +	if (!dmz_check_bdev(zmd->dev))
> +		ret = -EIO;
> +	goto out;
>  }
>  
>  /*
> @@ -1244,6 +1252,7 @@ static int dmz_update_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
>  	if (ret) {
>  		dmz_dev_err(zmd->dev, "Get zone %u report failed",
>  			    dmz_id(zmd, zone));
> +		dmz_check_bdev(zmd->dev);
>  		return ret;
>  	}
>  
> diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
> index d240d7ca8a8a..e7ace908a9b7 100644
> --- a/drivers/md/dm-zoned-reclaim.c
> +++ b/drivers/md/dm-zoned-reclaim.c
> @@ -82,6 +82,7 @@ static int dmz_reclaim_align_wp(struct dmz_reclaim *zrc, struct dm_zone *zone,
>  			    "Align zone %u wp %llu to %llu (wp+%u) blocks failed %d",
>  			    dmz_id(zmd, zone), (unsigned long long)wp_block,
>  			    (unsigned long long)block, nr_blocks, ret);
> +		dmz_check_bdev(zrc->dev);
>  		return ret;
>  	}
>  
> @@ -489,12 +490,7 @@ static void dmz_reclaim_work(struct work_struct *work)
>  	ret = dmz_do_reclaim(zrc);
>  	if (ret) {
>  		dmz_dev_debug(zrc->dev, "Reclaim error %d\n", ret);
> -		if (ret == -EIO)
> -			/*
> -			 * LLD might be performing some error handling sequence
> -			 * at the underlying device. To not interfere, do not
> -			 * attempt to schedule the next reclaim run immediately.
> -			 */
> +		if (!dmz_check_bdev(zrc->dev))
>  			return;
>  	}
>  
> diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
> index 09f5a63e0803..e0b809bb4885 100644
> --- a/drivers/md/dm-zoned-target.c
> +++ b/drivers/md/dm-zoned-target.c
> @@ -85,6 +85,8 @@ static inline void dmz_bio_endio(struct bio *bio, blk_status_t status)
>  
>  	if (status != BLK_STS_OK && bio->bi_status == BLK_STS_OK)
>  		bio->bi_status = status;
> +	if (bio->bi_status != BLK_STS_OK)
> +		bioctx->target->dev->flags |= DMZ_CHECK_BDEV;
>  
>  	if (refcount_dec_and_test(&bioctx->ref)) {
>  		struct dm_zone *zone = bioctx->zone;
> @@ -570,31 +572,51 @@ static int dmz_queue_chunk_work(struct dmz_target *dmz, struct bio *bio)
>  }
>  
>  /*
> - * Check the backing device availability. If it's on the way out,
> + * Check if the backing device is being removed. If it's on the way out,
>   * start failing I/O. Reclaim and metadata components also call this
>   * function to cleanly abort operation in the event of such failure.
>   */
>  bool dmz_bdev_is_dying(struct dmz_dev *dmz_dev)
>  {
> -	struct gendisk *disk;
> +	if (dmz_dev->flags & DMZ_BDEV_DYING)
> +		return true;
>  
> -	if (!(dmz_dev->flags & DMZ_BDEV_DYING)) {
> -		disk = dmz_dev->bdev->bd_disk;
> -		if (blk_queue_dying(bdev_get_queue(dmz_dev->bdev))) {
> -			dmz_dev_warn(dmz_dev, "Backing device queue dying");
> -			dmz_dev->flags |= DMZ_BDEV_DYING;
> -		} else if (disk->fops->check_events) {
> -			if (disk->fops->check_events(disk, 0) &
> -					DISK_EVENT_MEDIA_CHANGE) {
> -				dmz_dev_warn(dmz_dev, "Backing device offline");
> -				dmz_dev->flags |= DMZ_BDEV_DYING;
> -			}
> -		}
> +	if (dmz_dev->flags & DMZ_CHECK_BDEV)
> +		return !dmz_check_bdev(dmz_dev);
> +
> +	if (blk_queue_dying(bdev_get_queue(dmz_dev->bdev))) {
> +		dmz_dev_warn(dmz_dev, "Backing device queue dying");
> +		dmz_dev->flags |= DMZ_BDEV_DYING;
>  	}
>  
>  	return dmz_dev->flags & DMZ_BDEV_DYING;
>  }
>  
> +/*
> + * Check the backing device availability. This detects such events as
> + * backing device going offline due to errors, media removals, etc.
> + * This check is less efficient than dmz_bdev_is_dying() and should
> + * only be performed as a part of error handling.
> + */
> +bool dmz_check_bdev(struct dmz_dev *dmz_dev)
> +{
> +	struct gendisk *disk;
> +
> +	dmz_dev->flags &= ~DMZ_CHECK_BDEV;
> +
> +	if (dmz_bdev_is_dying(dmz_dev))
> +		return false;
> +
> +	disk = dmz_dev->bdev->bd_disk;
> +	if (disk->fops->check_events &&
> +	    disk->fops->check_events(disk, 0) & DISK_EVENT_MEDIA_CHANGE) {
> +		dmz_dev_warn(dmz_dev, "Backing device offline");
> +		dmz_dev->flags |= DMZ_BDEV_DYING;
> +	}
> +
> +	return !(dmz_dev->flags & DMZ_BDEV_DYING);
> +}
> +
>  /*
>   * Process a new BIO.
>   */
> @@ -907,8 +929,8 @@ static int dmz_prepare_ioctl(struct dm_target *ti, struct block_device **bdev)
>  {
>  	struct dmz_target *dmz = ti->private;
>  
> -	if (dmz_bdev_is_dying(dmz->dev))
> -		return -ENODEV;
> +	if (!dmz_check_bdev(dmz->dev))
> +		return -EIO;
>  
>  	*bdev = dmz->dev->bdev;
>  
> diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
> index d8e70b0ade35..5b5e493d479c 100644
> --- a/drivers/md/dm-zoned.h
> +++ b/drivers/md/dm-zoned.h
> @@ -72,6 +72,7 @@ struct dmz_dev {
>  
>  /* Device flags. */
>  #define DMZ_BDEV_DYING		(1 << 0)
> +#define DMZ_CHECK_BDEV		(2 << 0)
>  
>  /*
>   * Zone descriptor.
> @@ -255,5 +256,6 @@ void dmz_schedule_reclaim(struct dmz_reclaim *zrc);
>   * Functions defined in dm-zoned-target.c
>   */
>  bool dmz_bdev_is_dying(struct dmz_dev *dmz_dev);
> +bool dmz_check_bdev(struct dmz_dev *dmz_dev);
>  
>  #endif /* DM_ZONED_H */
> 


-- 
Damien Le Moal
Western Digital Research

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

