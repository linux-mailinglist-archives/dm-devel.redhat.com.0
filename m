Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 742712B9508
	for <lists+dm-devel@lfdr.de>; Thu, 19 Nov 2020 15:43:43 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-PuhIUrSSPoKnwbvowimW7Q-1; Thu, 19 Nov 2020 09:43:39 -0500
X-MC-Unique: PuhIUrSSPoKnwbvowimW7Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4BDDA1005CA4;
	Thu, 19 Nov 2020 14:43:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C53CB5D9C6;
	Thu, 19 Nov 2020 14:43:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 341C9180954D;
	Thu, 19 Nov 2020 14:43:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AJEhO3P013786 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 19 Nov 2020 09:43:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 59D702026D12; Thu, 19 Nov 2020 14:43:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 542B22026D5D
	for <dm-devel@redhat.com>; Thu, 19 Nov 2020 14:43:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 375BE85829F
	for <dm-devel@redhat.com>; Thu, 19 Nov 2020 14:43:22 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-482-xxiEUKJRNYC5RTVj0N8Zfg-1;
	Thu, 19 Nov 2020 09:43:17 -0500
X-MC-Unique: xxiEUKJRNYC5RTVj0N8Zfg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 59A0CAC41;
	Thu, 19 Nov 2020 14:43:16 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id 260F01E130B; Thu, 19 Nov 2020 15:43:16 +0100 (CET)
Date: Thu, 19 Nov 2020 15:43:16 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20201119144316.GY1981@quack2.suse.cz>
References: <20201118084800.2339180-1-hch@lst.de>
	<20201118084800.2339180-17-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20201118084800.2339180-17-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@redhat.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Richard Weinberger <richard@nod.at>,
	Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
	linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	dm-devel@redhat.com, linux-mtd@lists.infradead.org,
	Jan Kara <jack@suse.com>, Tejun Heo <tj@kernel.org>,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [dm-devel] [PATCH 16/20] block: stop using bdget_disk for
	partition 0
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed 18-11-20 09:47:56, Christoph Hellwig wrote:
> We can just dereference the point in struct gendisk instead.  Also
> remove the now unused export.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good to me. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  block/genhd.c                   |  1 -
>  drivers/block/nbd.c             |  4 +---
>  drivers/block/xen-blkfront.c    | 20 +++++---------------
>  drivers/block/zram/zram_drv.c   | 18 +++---------------
>  drivers/md/dm.c                 |  8 +-------
>  drivers/s390/block/dasd_ioctl.c |  5 ++---
>  6 files changed, 12 insertions(+), 44 deletions(-)
> 
> diff --git a/block/genhd.c b/block/genhd.c
> index a14e2408e3d4e8..ec41d0f18f5ce1 100644
> --- a/block/genhd.c
> +++ b/block/genhd.c
> @@ -907,7 +907,6 @@ struct block_device *bdget_disk(struct gendisk *disk, int partno)
>  
>  	return bdev;
>  }
> -EXPORT_SYMBOL(bdget_disk);
>  
>  /*
>   * print a full list of all partitions - intended for places where the root
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index 014683968ce174..92f84ed0ba9eb6 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -1488,12 +1488,10 @@ static int nbd_open(struct block_device *bdev, fmode_t mode)
>  static void nbd_release(struct gendisk *disk, fmode_t mode)
>  {
>  	struct nbd_device *nbd = disk->private_data;
> -	struct block_device *bdev = bdget_disk(disk, 0);
>  
>  	if (test_bit(NBD_RT_DISCONNECT_ON_CLOSE, &nbd->config->runtime_flags) &&
> -			bdev->bd_openers == 0)
> +			disk->part0->bd_openers == 0)
>  		nbd_disconnect_and_put(nbd);
> -	bdput(bdev);
>  
>  	nbd_config_put(nbd);
>  	nbd_put(nbd);
> diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
> index 79521e33d30ed5..188e0b47534bcf 100644
> --- a/drivers/block/xen-blkfront.c
> +++ b/drivers/block/xen-blkfront.c
> @@ -2153,7 +2153,7 @@ static void blkfront_closing(struct blkfront_info *info)
>  	}
>  
>  	if (info->gd)
> -		bdev = bdget_disk(info->gd, 0);
> +		bdev = bdgrab(info->gd->part0);
>  
>  	mutex_unlock(&info->mutex);
>  
> @@ -2518,7 +2518,7 @@ static int blkfront_remove(struct xenbus_device *xbdev)
>  
>  	disk = info->gd;
>  	if (disk)
> -		bdev = bdget_disk(disk, 0);
> +		bdev = bdgrab(disk->part0);
>  
>  	info->xbdev = NULL;
>  	mutex_unlock(&info->mutex);
> @@ -2595,19 +2595,11 @@ static int blkif_open(struct block_device *bdev, fmode_t mode)
>  static void blkif_release(struct gendisk *disk, fmode_t mode)
>  {
>  	struct blkfront_info *info = disk->private_data;
> -	struct block_device *bdev;
>  	struct xenbus_device *xbdev;
>  
>  	mutex_lock(&blkfront_mutex);
> -
> -	bdev = bdget_disk(disk, 0);
> -
> -	if (!bdev) {
> -		WARN(1, "Block device %s yanked out from us!\n", disk->disk_name);
> +	if (disk->part0->bd_openers)
>  		goto out_mutex;
> -	}
> -	if (bdev->bd_openers)
> -		goto out;
>  
>  	/*
>  	 * Check if we have been instructed to close. We will have
> @@ -2619,7 +2611,7 @@ static void blkif_release(struct gendisk *disk, fmode_t mode)
>  
>  	if (xbdev && xbdev->state == XenbusStateClosing) {
>  		/* pending switch to state closed */
> -		dev_info(disk_to_dev(bdev->bd_disk), "releasing disk\n");
> +		dev_info(disk_to_dev(disk), "releasing disk\n");
>  		xlvbd_release_gendisk(info);
>  		xenbus_frontend_closed(info->xbdev);
>   	}
> @@ -2628,14 +2620,12 @@ static void blkif_release(struct gendisk *disk, fmode_t mode)
>  
>  	if (!xbdev) {
>  		/* sudden device removal */
> -		dev_info(disk_to_dev(bdev->bd_disk), "releasing disk\n");
> +		dev_info(disk_to_dev(disk), "releasing disk\n");
>  		xlvbd_release_gendisk(info);
>  		disk->private_data = NULL;
>  		free_info(info);
>  	}
>  
> -out:
> -	bdput(bdev);
>  out_mutex:
>  	mutex_unlock(&blkfront_mutex);
>  }
> diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
> index 01757f9578dcb8..56024905bd242c 100644
> --- a/drivers/block/zram/zram_drv.c
> +++ b/drivers/block/zram/zram_drv.c
> @@ -1748,7 +1748,7 @@ static ssize_t reset_store(struct device *dev,
>  		struct device_attribute *attr, const char *buf, size_t len)
>  {
>  	struct zram *zram = dev_to_zram(dev);
> -	struct block_device *bdev;
> +	struct block_device *bdev = zram->disk->part0;
>  	unsigned short do_reset;
>  	int ret = 0;
>  
> @@ -1758,17 +1758,12 @@ static ssize_t reset_store(struct device *dev,
>  	if (!do_reset)
>  		return -EINVAL;
>  
> -	bdev = bdget_disk(zram->disk, 0);
> -	if (!bdev)
> -		return -ENOMEM;
> -
>  	mutex_lock(&bdev->bd_mutex);
>  	if (bdev->bd_openers)
>  		ret = -EBUSY;
>  	else
>  		zram_reset_device(zram);
>  	mutex_unlock(&bdev->bd_mutex);
> -	bdput(bdev);
>  
>  	return ret ? ret : len;
>  }
> @@ -1933,15 +1928,8 @@ static int zram_add(void)
>  
>  static int zram_remove(struct zram *zram)
>  {
> -	struct block_device *bdev = bdget_disk(zram->disk, 0);
> -
> -	if (bdev) {
> -		if (bdev->bd_openers) {
> -			bdput(bdev);
> -			return -EBUSY;
> -		}
> -		bdput(bdev);
> -	}
> +	if (zram->disk->part0->bd_openers)
> +		return -EBUSY;
>  
>  	del_gendisk(zram->disk);
>  	zram_debugfs_unregister(zram);
> diff --git a/drivers/md/dm.c b/drivers/md/dm.c
> index c9438feefe55a3..ec48ccae50dd53 100644
> --- a/drivers/md/dm.c
> +++ b/drivers/md/dm.c
> @@ -2375,17 +2375,12 @@ struct dm_table *dm_swap_table(struct mapped_device *md, struct dm_table *table)
>   */
>  static int lock_fs(struct mapped_device *md)
>  {
> -	struct block_device *bdev;
>  	int r;
>  
>  	WARN_ON(md->frozen_sb);
>  
> -	bdev = bdget_disk(md->disk, 0);
> -	if (!bdev)
> -		return -ENOMEM;
> -	md->frozen_sb = freeze_bdev(bdev);
> +	md->frozen_sb = freeze_bdev(md->disk->part0);
>  	if (IS_ERR(md->frozen_sb)) {
> -		bdput(bdev);
>  		r = PTR_ERR(md->frozen_sb);
>  		md->frozen_sb = NULL;
>  		return r;
> @@ -2402,7 +2397,6 @@ static void unlock_fs(struct mapped_device *md)
>  		return;
>  
>  	thaw_bdev(md->frozen_sb->s_bdev, md->frozen_sb);
> -	bdput(md->frozen_sb->s_bdev);
>  	md->frozen_sb = NULL;
>  	clear_bit(DMF_FROZEN, &md->flags);
>  }
> diff --git a/drivers/s390/block/dasd_ioctl.c b/drivers/s390/block/dasd_ioctl.c
> index 304eba1acf163c..9f642440894655 100644
> --- a/drivers/s390/block/dasd_ioctl.c
> +++ b/drivers/s390/block/dasd_ioctl.c
> @@ -220,9 +220,8 @@ dasd_format(struct dasd_block *block, struct format_data_t *fdata)
>  	 * enabling the device later.
>  	 */
>  	if (fdata->start_unit == 0) {
> -		struct block_device *bdev = bdget_disk(block->gdp, 0);
> -		bdev->bd_inode->i_blkbits = blksize_bits(fdata->blksize);
> -		bdput(bdev);
> +		block->gdp->part0->bd_inode->i_blkbits =
> +			blksize_bits(fdata->blksize);
>  	}
>  
>  	rc = base->discipline->format_device(base, fdata, 1);
> -- 
> 2.29.2
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

