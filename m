Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B12612C4283
	for <lists+dm-devel@lfdr.de>; Wed, 25 Nov 2020 15:56:45 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-L_JB7GADMUCrfxtOCLYKRQ-1; Wed, 25 Nov 2020 09:56:40 -0500
X-MC-Unique: L_JB7GADMUCrfxtOCLYKRQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE5441926DAC;
	Wed, 25 Nov 2020 14:56:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A380E19D61;
	Wed, 25 Nov 2020 14:56:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 386684E58F;
	Wed, 25 Nov 2020 14:56:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0APCVftV000599 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 25 Nov 2020 07:31:41 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5C4D91004145; Wed, 25 Nov 2020 12:31:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 581411134CC8
	for <dm-devel@redhat.com>; Wed, 25 Nov 2020 12:31:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDFE2800BFF
	for <dm-devel@redhat.com>; Wed, 25 Nov 2020 12:31:37 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-34-J2fYUESWMCm8TdxKhhQmwA-1;
	Wed, 25 Nov 2020 07:31:35 -0500
X-MC-Unique: J2fYUESWMCm8TdxKhhQmwA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 6A34EAF0E;
	Wed, 25 Nov 2020 12:31:33 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id 3DD711E130F; Wed, 25 Nov 2020 13:31:33 +0100 (CET)
Date: Wed, 25 Nov 2020 13:31:33 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20201125123133.GI16944@quack2.suse.cz>
References: <20201124132751.3747337-1-hch@lst.de>
	<20201124132751.3747337-6-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20201124132751.3747337-6-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org, Mike Snitzer <snitzer@redhat.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jan Kara <jack@suse.com>, Josef Bacik <josef@toxicpanda.com>,
	Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
	Richard Weinberger <richard@nod.at>, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	Tejun Heo <tj@kernel.org>, xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [dm-devel] [PATCH 05/45] mtip32xx: remove the call to
	fsync_bdev on removal
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue 24-11-20 14:27:11, Christoph Hellwig wrote:
> del_gendisk already calls fsync_bdev for every partition, no need
> to do this twice.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Makes sense to me. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  drivers/block/mtip32xx/mtip32xx.c | 15 ---------------
>  drivers/block/mtip32xx/mtip32xx.h |  2 --
>  2 files changed, 17 deletions(-)
> 
> diff --git a/drivers/block/mtip32xx/mtip32xx.c b/drivers/block/mtip32xx/mtip32xx.c
> index 153e2cdecb4d40..53ac59d19ae530 100644
> --- a/drivers/block/mtip32xx/mtip32xx.c
> +++ b/drivers/block/mtip32xx/mtip32xx.c
> @@ -3687,7 +3687,6 @@ static int mtip_block_initialize(struct driver_data *dd)
>  	/* Enable the block device and add it to /dev */
>  	device_add_disk(&dd->pdev->dev, dd->disk, NULL);
>  
> -	dd->bdev = bdget_disk(dd->disk, 0);
>  	/*
>  	 * Now that the disk is active, initialize any sysfs attributes
>  	 * managed by the protocol layer.
> @@ -3721,9 +3720,6 @@ static int mtip_block_initialize(struct driver_data *dd)
>  	return rv;
>  
>  kthread_run_error:
> -	bdput(dd->bdev);
> -	dd->bdev = NULL;
> -
>  	/* Delete our gendisk. This also removes the device from /dev */
>  	del_gendisk(dd->disk);
>  
> @@ -3804,14 +3800,6 @@ static int mtip_block_remove(struct driver_data *dd)
>  	blk_mq_tagset_busy_iter(&dd->tags, mtip_no_dev_cleanup, dd);
>  	blk_mq_unquiesce_queue(dd->queue);
>  
> -	/*
> -	 * Delete our gendisk structure. This also removes the device
> -	 * from /dev
> -	 */
> -	if (dd->bdev) {
> -		bdput(dd->bdev);
> -		dd->bdev = NULL;
> -	}
>  	if (dd->disk) {
>  		if (test_bit(MTIP_DDF_INIT_DONE_BIT, &dd->dd_flag))
>  			del_gendisk(dd->disk);
> @@ -4206,9 +4194,6 @@ static void mtip_pci_remove(struct pci_dev *pdev)
>  	} while (atomic_read(&dd->irq_workers_active) != 0 &&
>  		time_before(jiffies, to));
>  
> -	if (!dd->sr)
> -		fsync_bdev(dd->bdev);
> -
>  	if (atomic_read(&dd->irq_workers_active) != 0) {
>  		dev_warn(&dd->pdev->dev,
>  			"Completion workers still active!\n");
> diff --git a/drivers/block/mtip32xx/mtip32xx.h b/drivers/block/mtip32xx/mtip32xx.h
> index e22a7f0523bf30..88f4206310e4c8 100644
> --- a/drivers/block/mtip32xx/mtip32xx.h
> +++ b/drivers/block/mtip32xx/mtip32xx.h
> @@ -463,8 +463,6 @@ struct driver_data {
>  
>  	int isr_binding;
>  
> -	struct block_device *bdev;
> -
>  	struct list_head online_list; /* linkage for online list */
>  
>  	struct list_head remove_list; /* linkage for removing list */
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

