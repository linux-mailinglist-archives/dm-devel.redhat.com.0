Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 01D3526D7C6
	for <lists+dm-devel@lfdr.de>; Thu, 17 Sep 2020 11:36:39 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-uYVbeS8ONaa-mnOlLF3tEw-1; Thu, 17 Sep 2020 05:36:36 -0400
X-MC-Unique: uYVbeS8ONaa-mnOlLF3tEw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5BDF6100855F;
	Thu, 17 Sep 2020 09:36:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B2717CD21;
	Thu, 17 Sep 2020 09:36:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 34D428C7CD;
	Thu, 17 Sep 2020 09:36:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08H9aOZr012260 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 17 Sep 2020 05:36:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C87912156A34; Thu, 17 Sep 2020 09:36:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C31AE2156A23
	for <dm-devel@redhat.com>; Thu, 17 Sep 2020 09:36:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0AF9E858287
	for <dm-devel@redhat.com>; Thu, 17 Sep 2020 09:36:19 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-164-CF3-s69pMlOkQzrjnW3lDA-1;
	Thu, 17 Sep 2020 05:36:16 -0400
X-MC-Unique: CF3-s69pMlOkQzrjnW3lDA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id ED480B13B;
	Thu, 17 Sep 2020 09:36:48 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id E128D1E12E1; Thu, 17 Sep 2020 11:36:14 +0200 (CEST)
Date: Thu, 17 Sep 2020 11:36:14 +0200
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200917093614.GF7347@quack2.suse.cz>
References: <20200910144833.742260-1-hch@lst.de>
	<20200910144833.742260-9-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200910144833.742260-9-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>, Minchan Kim <minchan@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org, cgroups@vger.kernel.org,
	drbd-dev@tron.linbit.com, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [dm-devel] [PATCH 08/12] bdi: remove BDI_CAP_SYNCHRONOUS_IO
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu 10-09-20 16:48:28, Christoph Hellwig wrote:
> BDI_CAP_SYNCHRONOUS_IO is only checked in the swap code, and used to
> decided if ->rw_page can be used on a block device.  Just check up for
> the method instead.  The only complication is that zram needs a second
> set of block_device_operations as it can switch between modes that
> actually support ->rw_page and those who don't.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

The patch looks good to me. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  drivers/block/brd.c           |  1 -
>  drivers/block/zram/zram_drv.c | 19 +++++++++++++------
>  drivers/nvdimm/btt.c          |  2 --
>  drivers/nvdimm/pmem.c         |  1 -
>  include/linux/backing-dev.h   |  9 ---------
>  mm/swapfile.c                 |  2 +-
>  6 files changed, 14 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/block/brd.c b/drivers/block/brd.c
> index 2723a70eb85593..cc49a921339f77 100644
> --- a/drivers/block/brd.c
> +++ b/drivers/block/brd.c
> @@ -403,7 +403,6 @@ static struct brd_device *brd_alloc(int i)
>  	disk->flags		= GENHD_FL_EXT_DEVT;
>  	sprintf(disk->disk_name, "ram%d", i);
>  	set_capacity(disk, rd_size * 2);
> -	brd->brd_queue->backing_dev_info->capabilities |= BDI_CAP_SYNCHRONOUS_IO;
>  
>  	/* Tell the block layer that this is not a rotational device */
>  	blk_queue_flag_set(QUEUE_FLAG_NONROT, brd->brd_queue);
> diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
> index a356275605b104..1b51bb664f91f5 100644
> --- a/drivers/block/zram/zram_drv.c
> +++ b/drivers/block/zram/zram_drv.c
> @@ -52,6 +52,9 @@ static unsigned int num_devices = 1;
>   */
>  static size_t huge_class_size;
>  
> +static const struct block_device_operations zram_devops;
> +static const struct block_device_operations zram_wb_devops;
> +
>  static void zram_free_page(struct zram *zram, size_t index);
>  static int zram_bvec_read(struct zram *zram, struct bio_vec *bvec,
>  				u32 index, int offset, struct bio *bio);
> @@ -408,8 +411,7 @@ static void reset_bdev(struct zram *zram)
>  	zram->backing_dev = NULL;
>  	zram->old_block_size = 0;
>  	zram->bdev = NULL;
> -	zram->disk->queue->backing_dev_info->capabilities |=
> -				BDI_CAP_SYNCHRONOUS_IO;
> +	zram->disk->fops = &zram_devops;
>  	kvfree(zram->bitmap);
>  	zram->bitmap = NULL;
>  }
> @@ -528,8 +530,7 @@ static ssize_t backing_dev_store(struct device *dev,
>  	 * freely but in fact, IO is going on so finally could cause
>  	 * use-after-free when the IO is really done.
>  	 */
> -	zram->disk->queue->backing_dev_info->capabilities &=
> -			~BDI_CAP_SYNCHRONOUS_IO;
> +	zram->disk->fops = &zram_wb_devops;
>  	up_write(&zram->init_lock);
>  
>  	pr_info("setup backing device %s\n", file_name);
> @@ -1819,6 +1820,13 @@ static const struct block_device_operations zram_devops = {
>  	.owner = THIS_MODULE
>  };
>  
> +static const struct block_device_operations zram_wb_devops = {
> +	.open = zram_open,
> +	.submit_bio = zram_submit_bio,
> +	.swap_slot_free_notify = zram_slot_free_notify,
> +	.owner = THIS_MODULE
> +};
> +
>  static DEVICE_ATTR_WO(compact);
>  static DEVICE_ATTR_RW(disksize);
>  static DEVICE_ATTR_RO(initstate);
> @@ -1946,8 +1954,7 @@ static int zram_add(void)
>  	if (ZRAM_LOGICAL_BLOCK_SIZE == PAGE_SIZE)
>  		blk_queue_max_write_zeroes_sectors(zram->disk->queue, UINT_MAX);
>  
> -	zram->disk->queue->backing_dev_info->capabilities |=
> -			(BDI_CAP_STABLE_WRITES | BDI_CAP_SYNCHRONOUS_IO);
> +	zram->disk->queue->backing_dev_info->capabilities |= BDI_CAP_STABLE_WRITES;
>  	device_add_disk(NULL, zram->disk, zram_disk_attr_groups);
>  
>  	strlcpy(zram->compressor, default_compressor, sizeof(zram->compressor));
> diff --git a/drivers/nvdimm/btt.c b/drivers/nvdimm/btt.c
> index 0d710140bf93be..12ff6f8784ac11 100644
> --- a/drivers/nvdimm/btt.c
> +++ b/drivers/nvdimm/btt.c
> @@ -1537,8 +1537,6 @@ static int btt_blk_init(struct btt *btt)
>  	btt->btt_disk->private_data = btt;
>  	btt->btt_disk->queue = btt->btt_queue;
>  	btt->btt_disk->flags = GENHD_FL_EXT_DEVT;
> -	btt->btt_disk->queue->backing_dev_info->capabilities |=
> -			BDI_CAP_SYNCHRONOUS_IO;
>  
>  	blk_queue_logical_block_size(btt->btt_queue, btt->sector_size);
>  	blk_queue_max_hw_sectors(btt->btt_queue, UINT_MAX);
> diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
> index 140cf3b9000c60..1711fdfd8d2816 100644
> --- a/drivers/nvdimm/pmem.c
> +++ b/drivers/nvdimm/pmem.c
> @@ -475,7 +475,6 @@ static int pmem_attach_disk(struct device *dev,
>  	disk->queue		= q;
>  	disk->flags		= GENHD_FL_EXT_DEVT;
>  	disk->private_data	= pmem;
> -	disk->queue->backing_dev_info->capabilities |= BDI_CAP_SYNCHRONOUS_IO;
>  	nvdimm_namespace_disk_name(ndns, disk->disk_name);
>  	set_capacity(disk, (pmem->size - pmem->pfn_pad - pmem->data_offset)
>  			/ 512);
> diff --git a/include/linux/backing-dev.h b/include/linux/backing-dev.h
> index 52583b6f2ea05d..860ea33571bce5 100644
> --- a/include/linux/backing-dev.h
> +++ b/include/linux/backing-dev.h
> @@ -122,9 +122,6 @@ int bdi_set_max_ratio(struct backing_dev_info *bdi, unsigned int max_ratio);
>   * BDI_CAP_NO_WRITEBACK:   Don't write pages back
>   * BDI_CAP_NO_ACCT_WB:     Don't automatically account writeback pages
>   * BDI_CAP_STRICTLIMIT:    Keep number of dirty pages below bdi threshold.
> - *
> - * BDI_CAP_SYNCHRONOUS_IO: Device is so fast that asynchronous IO would be
> - *			   inefficient.
>   */
>  #define BDI_CAP_NO_ACCT_DIRTY	0x00000001
>  #define BDI_CAP_NO_WRITEBACK	0x00000002
> @@ -132,7 +129,6 @@ int bdi_set_max_ratio(struct backing_dev_info *bdi, unsigned int max_ratio);
>  #define BDI_CAP_STABLE_WRITES	0x00000008
>  #define BDI_CAP_STRICTLIMIT	0x00000010
>  #define BDI_CAP_CGROUP_WRITEBACK 0x00000020
> -#define BDI_CAP_SYNCHRONOUS_IO	0x00000040
>  
>  #define BDI_CAP_NO_ACCT_AND_WRITEBACK \
>  	(BDI_CAP_NO_WRITEBACK | BDI_CAP_NO_ACCT_DIRTY | BDI_CAP_NO_ACCT_WB)
> @@ -174,11 +170,6 @@ static inline int wb_congested(struct bdi_writeback *wb, int cong_bits)
>  long congestion_wait(int sync, long timeout);
>  long wait_iff_congested(int sync, long timeout);
>  
> -static inline bool bdi_cap_synchronous_io(struct backing_dev_info *bdi)
> -{
> -	return bdi->capabilities & BDI_CAP_SYNCHRONOUS_IO;
> -}
> -
>  static inline bool bdi_cap_stable_pages_required(struct backing_dev_info *bdi)
>  {
>  	return bdi->capabilities & BDI_CAP_STABLE_WRITES;
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index 12f59e641b5e29..986fe5aad30e18 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -3237,7 +3237,7 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
>  	if (bdi_cap_stable_pages_required(inode_to_bdi(inode)))
>  		p->flags |= SWP_STABLE_WRITES;
>  
> -	if (bdi_cap_synchronous_io(inode_to_bdi(inode)))
> +	if (p->bdev && p->bdev->bd_disk->fops->rw_page)
>  		p->flags |= SWP_SYNCHRONOUS_IO;
>  
>  	if (p->bdev && blk_queue_nonrot(bdev_get_queue(p->bdev))) {
> -- 
> 2.28.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

