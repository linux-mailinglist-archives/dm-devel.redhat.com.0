Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DB4568795
	for <lists+dm-devel@lfdr.de>; Wed,  6 Jul 2022 14:00:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657108839;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NIn7Wz+7rMXww23G9/dNGhLq/KknZs0ANRPBGzUNvNE=;
	b=V/3wsIBCK6rz1mnUhAqfU8YM7MJa0cCDY9pNrOo7PMzYTkH25c9aLl5XARmwgqDkwkSlbF
	uMiIyjvN2+mF+V/REkwMSzg8WCjeKySw1PHDR/pYb4jlzEqa7bYOQYf5xxJk5nEpL2wsnt
	fRhp75BC6zNIVOrfsGECOOAgFIDtj7U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-197-f0JlI_pWNoGtEVeNQwNgQA-1; Wed, 06 Jul 2022 08:00:35 -0400
X-MC-Unique: f0JlI_pWNoGtEVeNQwNgQA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A2CF3C0F386;
	Wed,  6 Jul 2022 12:00:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 30FEE40B40D7;
	Wed,  6 Jul 2022 12:00:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DAF4D194706B;
	Wed,  6 Jul 2022 12:00:29 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0F304194704E
 for <dm-devel@listman.corp.redhat.com>; Wed,  6 Jul 2022 12:00:28 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E548F2166B29; Wed,  6 Jul 2022 12:00:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E12672166B26
 for <dm-devel@redhat.com>; Wed,  6 Jul 2022 12:00:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C155685A581
 for <dm-devel@redhat.com>; Wed,  6 Jul 2022 12:00:27 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-411-MWTpovv2NfuaMATbJvZ5sw-1; Wed, 06 Jul 2022 08:00:26 -0400
X-MC-Unique: MWTpovv2NfuaMATbJvZ5sw-1
X-IronPort-AV: E=Sophos;i="5.92,249,1650902400"; d="scan'208";a="317105203"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jul 2022 19:59:22 +0800
IronPort-SDR: 8VjFx2lLOUNL2StUnvIqp+2RUjzob+dDCLdcxB5a16PVoJXI/SJghcDWMNrZiKKyPiyB2OC5b0
 7hHO0O8e9tlQbMXCfJTfa6utvIUMA/LMIN9e79X4EyD2A6tjJMQCsYsBR1F9G54Sm9tTQqxv5D
 Wteq7rDyO32cBPxVPb+wAaAHOqfRWo3ivtPl340tC4SYCKZyflt0nkZhhlwPFSKZFEPCnF489/
 /LvdHuzH1gmUWRJRY5PY1PvkyeQ3u1anEcxDvHOTgsW0l+azcNxZWqcphQiltTas2Tln725YZQ
 jo5L0iuXqQokYGXs40pm70ba
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Jul 2022 04:21:09 -0700
IronPort-SDR: SDZAhpIb3IrYrKrCvoZLdKqVGWQaRx4uHjOiJbzKxTGvEGuUlDTce2hgYuuH/P7/oVCktRghk4
 ojdE4P4Gd+kMJyba/TzhXIhnqrfLdDpSZSWVXFsXEe64hcmfmAtbj54zgtzCFYJmmuICXkf8Ln
 SKWBGKevG8zRB+r8cJ+mCVX3fLk1RYfDY37M0FSgwH5xr+D/MIaFaHiW0ixNAry1oOszAWPlKf
 Iwkq4wk8qX6UNVYz02Nm89WPXGV6BD6q2WELu8ESL41NIqL9nocx6EOSA+x1oFLZvZ8ef4Z+zc
 OaQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Jul 2022 04:59:23 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LdJ495wQHz1Rwnl
 for <dm-devel@redhat.com>; Wed,  6 Jul 2022 04:59:21 -0700 (PDT)
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id yF_3qpW0gjTn for <dm-devel@redhat.com>;
 Wed,  6 Jul 2022 04:59:20 -0700 (PDT)
Received: from [10.225.163.110] (unknown [10.225.163.110])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LdJ471s4bz1RtVk;
 Wed,  6 Jul 2022 04:59:19 -0700 (PDT)
Message-ID: <e5737383-3b85-e50b-166f-296ef821a47a@opensource.wdc.com>
Date: Wed, 6 Jul 2022 20:59:18 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20220706070350.1703384-1-hch@lst.de>
 <20220706070350.1703384-12-hch@lst.de>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220706070350.1703384-12-hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: Re: [dm-devel] [PATCH 11/16] block: replace blkdev_nr_zones with
 bdev_nr_zones
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: Chaitanya Kulkarni <kch@nvidia.com>, linux-scsi@vger.kernel.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 linux-nvme@lists.infradead.org, linux-block@vger.kernel.org,
 dm-devel@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 7/6/22 16:03, Christoph Hellwig wrote:
> Pass a block_device instead of a request_queue as that is what most
> callers have at hand.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>
> Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

And for the zonefs bits:

Acked-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

> ---
>  block/blk-zoned.c              | 15 ++++++++-------
>  block/ioctl.c                  |  2 +-
>  drivers/block/null_blk/zoned.c |  2 +-
>  drivers/md/dm-zone.c           |  2 +-
>  drivers/md/dm-zoned-target.c   |  5 ++---
>  drivers/nvme/target/zns.c      |  6 +++---
>  fs/zonefs/super.c              | 17 ++++++++---------
>  include/linux/blkdev.h         |  4 ++--
>  8 files changed, 26 insertions(+), 27 deletions(-)
> 
> diff --git a/block/blk-zoned.c b/block/blk-zoned.c
> index 0d431394cf90c..2dec25d8aa3bd 100644
> --- a/block/blk-zoned.c
> +++ b/block/blk-zoned.c
> @@ -108,21 +108,22 @@ void __blk_req_zone_write_unlock(struct request *rq)
>  EXPORT_SYMBOL_GPL(__blk_req_zone_write_unlock);
>  
>  /**
> - * blkdev_nr_zones - Get number of zones
> - * @disk:	Target gendisk
> + * bdev_nr_zones - Get number of zones
> + * @bdev:	Target device
>   *
>   * Return the total number of zones of a zoned block device.  For a block
>   * device without zone capabilities, the number of zones is always 0.
>   */
> -unsigned int blkdev_nr_zones(struct gendisk *disk)
> +unsigned int bdev_nr_zones(struct block_device *bdev)
>  {
> -	sector_t zone_sectors = blk_queue_zone_sectors(disk->queue);
> +	sector_t zone_sectors = bdev_zone_sectors(bdev);
>  
> -	if (!blk_queue_is_zoned(disk->queue))
> +	if (!bdev_is_zoned(bdev))
>  		return 0;
> -	return (get_capacity(disk) + zone_sectors - 1) >> ilog2(zone_sectors);
> +	return (bdev_nr_sectors(bdev) + zone_sectors - 1) >>
> +		ilog2(zone_sectors);
>  }
> -EXPORT_SYMBOL_GPL(blkdev_nr_zones);
> +EXPORT_SYMBOL_GPL(bdev_nr_zones);
>  
>  /**
>   * blkdev_report_zones - Get zones information
> diff --git a/block/ioctl.c b/block/ioctl.c
> index 46949f1b0dba5..60121e89052bc 100644
> --- a/block/ioctl.c
> +++ b/block/ioctl.c
> @@ -495,7 +495,7 @@ static int blkdev_common_ioctl(struct block_device *bdev, fmode_t mode,
>  	case BLKGETZONESZ:
>  		return put_uint(argp, bdev_zone_sectors(bdev));
>  	case BLKGETNRZONES:
> -		return put_uint(argp, blkdev_nr_zones(bdev->bd_disk));
> +		return put_uint(argp, bdev_nr_zones(bdev));
>  	case BLKROGET:
>  		return put_int(argp, bdev_read_only(bdev) != 0);
>  	case BLKSSZGET: /* get block device logical block size */
> diff --git a/drivers/block/null_blk/zoned.c b/drivers/block/null_blk/zoned.c
> index 576ab3ed082a5..e62c52e964259 100644
> --- a/drivers/block/null_blk/zoned.c
> +++ b/drivers/block/null_blk/zoned.c
> @@ -170,7 +170,7 @@ int null_register_zoned_dev(struct nullb *nullb)
>  			return ret;
>  	} else {
>  		blk_queue_chunk_sectors(q, dev->zone_size_sects);
> -		q->nr_zones = blkdev_nr_zones(nullb->disk);
> +		q->nr_zones = bdev_nr_zones(nullb->disk->part0);
>  	}
>  
>  	blk_queue_max_zone_append_sectors(q, dev->zone_size_sects);
> diff --git a/drivers/md/dm-zone.c b/drivers/md/dm-zone.c
> index ae616b87c91ae..6d105abe12415 100644
> --- a/drivers/md/dm-zone.c
> +++ b/drivers/md/dm-zone.c
> @@ -301,7 +301,7 @@ int dm_set_zones_restrictions(struct dm_table *t, struct request_queue *q)
>  	 * correct value to be exposed in sysfs queue/nr_zones.
>  	 */
>  	WARN_ON_ONCE(queue_is_mq(q));
> -	q->nr_zones = blkdev_nr_zones(md->disk);
> +	q->nr_zones = bdev_nr_zones(md->disk->part0);
>  
>  	/* Check if zone append is natively supported */
>  	if (dm_table_supports_zone_append(t)) {
> diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
> index 0ec5d8b9b1a4e..6ba6ef44b00e2 100644
> --- a/drivers/md/dm-zoned-target.c
> +++ b/drivers/md/dm-zoned-target.c
> @@ -793,8 +793,7 @@ static int dmz_fixup_devices(struct dm_target *ti)
>  			}
>  			zone_nr_sectors = blk_queue_zone_sectors(q);
>  			zoned_dev->zone_nr_sectors = zone_nr_sectors;
> -			zoned_dev->nr_zones =
> -				blkdev_nr_zones(zoned_dev->bdev->bd_disk);
> +			zoned_dev->nr_zones = bdev_nr_zones(zoned_dev->bdev);
>  		}
>  	} else {
>  		reg_dev = NULL;
> @@ -805,7 +804,7 @@ static int dmz_fixup_devices(struct dm_target *ti)
>  		}
>  		q = bdev_get_queue(zoned_dev->bdev);
>  		zoned_dev->zone_nr_sectors = blk_queue_zone_sectors(q);
> -		zoned_dev->nr_zones = blkdev_nr_zones(zoned_dev->bdev->bd_disk);
> +		zoned_dev->nr_zones = bdev_nr_zones(zoned_dev->bdev);
>  	}
>  
>  	if (reg_dev) {
> diff --git a/drivers/nvme/target/zns.c b/drivers/nvme/target/zns.c
> index 82b61acf7a72b..c4c99b832daf2 100644
> --- a/drivers/nvme/target/zns.c
> +++ b/drivers/nvme/target/zns.c
> @@ -60,7 +60,7 @@ bool nvmet_bdev_zns_enable(struct nvmet_ns *ns)
>  	if (ns->bdev->bd_disk->queue->conv_zones_bitmap)
>  		return false;
>  
> -	ret = blkdev_report_zones(ns->bdev, 0, blkdev_nr_zones(bd_disk),
> +	ret = blkdev_report_zones(ns->bdev, 0, bdev_nr_zones(ns->bdev),
>  				  validate_conv_zones_cb, NULL);
>  	if (ret < 0)
>  		return false;
> @@ -241,7 +241,7 @@ static unsigned long nvmet_req_nr_zones_from_slba(struct nvmet_req *req)
>  {
>  	unsigned int sect = nvmet_lba_to_sect(req->ns, req->cmd->zmr.slba);
>  
> -	return blkdev_nr_zones(req->ns->bdev->bd_disk) -
> +	return bdev_nr_zones(req->ns->bdev) -
>  		(sect >> ilog2(bdev_zone_sectors(req->ns->bdev)));
>  }
>  
> @@ -386,7 +386,7 @@ static int zmgmt_send_scan_cb(struct blk_zone *z, unsigned i, void *d)
>  static u16 nvmet_bdev_zone_mgmt_emulate_all(struct nvmet_req *req)
>  {
>  	struct block_device *bdev = req->ns->bdev;
> -	unsigned int nr_zones = blkdev_nr_zones(bdev->bd_disk);
> +	unsigned int nr_zones = bdev_nr_zones(bdev);
>  	struct request_queue *q = bdev_get_queue(bdev);
>  	struct bio *bio = NULL;
>  	sector_t sector = 0;
> diff --git a/fs/zonefs/super.c b/fs/zonefs/super.c
> index 053299758deb9..9c0eef1ff32a0 100644
> --- a/fs/zonefs/super.c
> +++ b/fs/zonefs/super.c
> @@ -1394,7 +1394,7 @@ static void zonefs_init_dir_inode(struct inode *parent, struct inode *inode,
>  {
>  	struct super_block *sb = parent->i_sb;
>  
> -	inode->i_ino = blkdev_nr_zones(sb->s_bdev->bd_disk) + type + 1;
> +	inode->i_ino = bdev_nr_zones(sb->s_bdev) + type + 1;
>  	inode_init_owner(&init_user_ns, inode, parent, S_IFDIR | 0555);
>  	inode->i_op = &zonefs_dir_inode_operations;
>  	inode->i_fop = &simple_dir_operations;
> @@ -1540,7 +1540,7 @@ static int zonefs_create_zgroup(struct zonefs_zone_data *zd,
>  	/*
>  	 * The first zone contains the super block: skip it.
>  	 */
> -	end = zd->zones + blkdev_nr_zones(sb->s_bdev->bd_disk);
> +	end = zd->zones + bdev_nr_zones(sb->s_bdev);
>  	for (zone = &zd->zones[1]; zone < end; zone = next) {
>  
>  		next = zone + 1;
> @@ -1635,8 +1635,8 @@ static int zonefs_get_zone_info(struct zonefs_zone_data *zd)
>  	struct block_device *bdev = zd->sb->s_bdev;
>  	int ret;
>  
> -	zd->zones = kvcalloc(blkdev_nr_zones(bdev->bd_disk),
> -			     sizeof(struct blk_zone), GFP_KERNEL);
> +	zd->zones = kvcalloc(bdev_nr_zones(bdev), sizeof(struct blk_zone),
> +			     GFP_KERNEL);
>  	if (!zd->zones)
>  		return -ENOMEM;
>  
> @@ -1648,9 +1648,9 @@ static int zonefs_get_zone_info(struct zonefs_zone_data *zd)
>  		return ret;
>  	}
>  
> -	if (ret != blkdev_nr_zones(bdev->bd_disk)) {
> +	if (ret != bdev_nr_zones(bdev)) {
>  		zonefs_err(zd->sb, "Invalid zone report (%d/%u zones)\n",
> -			   ret, blkdev_nr_zones(bdev->bd_disk));
> +			   ret, bdev_nr_zones(bdev));
>  		return -EIO;
>  	}
>  
> @@ -1816,8 +1816,7 @@ static int zonefs_fill_super(struct super_block *sb, void *data, int silent)
>  	if (ret)
>  		goto cleanup;
>  
> -	zonefs_info(sb, "Mounting %u zones",
> -		    blkdev_nr_zones(sb->s_bdev->bd_disk));
> +	zonefs_info(sb, "Mounting %u zones", bdev_nr_zones(sb->s_bdev));
>  
>  	if (!sbi->s_max_wro_seq_files &&
>  	    !sbi->s_max_active_seq_files &&
> @@ -1833,7 +1832,7 @@ static int zonefs_fill_super(struct super_block *sb, void *data, int silent)
>  	if (!inode)
>  		goto cleanup;
>  
> -	inode->i_ino = blkdev_nr_zones(sb->s_bdev->bd_disk);
> +	inode->i_ino = bdev_nr_zones(sb->s_bdev);
>  	inode->i_mode = S_IFDIR | 0555;
>  	inode->i_ctime = inode->i_mtime = inode->i_atime = current_time(inode);
>  	inode->i_op = &zonefs_dir_inode_operations;
> diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
> index c05e1cc05c265..fa2757ef4a846 100644
> --- a/include/linux/blkdev.h
> +++ b/include/linux/blkdev.h
> @@ -298,7 +298,7 @@ void disk_set_zoned(struct gendisk *disk, enum blk_zoned_model model);
>  #define BLK_ALL_ZONES  ((unsigned int)-1)
>  int blkdev_report_zones(struct block_device *bdev, sector_t sector,
>  			unsigned int nr_zones, report_zones_cb cb, void *data);
> -unsigned int blkdev_nr_zones(struct gendisk *disk);
> +unsigned int bdev_nr_zones(struct block_device *bdev);
>  extern int blkdev_zone_mgmt(struct block_device *bdev, enum req_opf op,
>  			    sector_t sectors, sector_t nr_sectors,
>  			    gfp_t gfp_mask);
> @@ -312,7 +312,7 @@ extern int blkdev_zone_mgmt_ioctl(struct block_device *bdev, fmode_t mode,
>  
>  #else /* CONFIG_BLK_DEV_ZONED */
>  
> -static inline unsigned int blkdev_nr_zones(struct gendisk *disk)
> +static inline unsigned int bdev_nr_zones(struct block_device *bdev)
>  {
>  	return 0;
>  }


-- 
Damien Le Moal
Western Digital Research

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

