Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D383329B
	for <lists+dm-devel@lfdr.de>; Mon,  3 Jun 2019 16:48:35 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 922403107B23;
	Mon,  3 Jun 2019 14:48:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 49E44600CC;
	Mon,  3 Jun 2019 14:47:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9F9C81806B1A;
	Mon,  3 Jun 2019 14:47:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x53EkBek032207 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 3 Jun 2019 10:46:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DAE105D739; Mon,  3 Jun 2019 14:46:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 43E845B684;
	Mon,  3 Jun 2019 14:46:09 +0000 (UTC)
Date: Mon, 3 Jun 2019 10:46:08 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: "zhangyi (F)" <yi.zhang@huawei.com>, Josef Bacik <jbacik@fb.com>
Message-ID: <20190603144608.GA22116@redhat.com>
References: <1559571534-16467-1-git-send-email-yi.zhang@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1559571534-16467-1-git-send-email-yi.zhang@huawei.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, agk@redhat.com, houtao1@huawei.com
Subject: Re: [dm-devel] dm log writes: make sure the log super sectors are
 written in order
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Mon, 03 Jun 2019 14:48:34 +0000 (UTC)

On Mon, Jun 03 2019 at 10:18am -0400,
zhangyi (F) <yi.zhang@huawei.com> wrote:

> Currently, although we submit super bios in log-write thread orderly
> (the super.nr_entries is incremented by each logged entry), the
> submit_bio() cannot make sure that each super sector is written to log
> device in order. So the submitting bio of each super sector may be
> out-of-order, and then the final nr_entries maybe small than the real
> entries submitted.
> 
> This problem can be reproduced by the xfstests generic/455 with ext4,
> which may complained below after running the test:
> 
>   QA output created by 455
>  -Silence is golden
>  +mark 'end' does not exist
> 
> This patch serialize submitting super secotrs to make sure each super
> sectors are written to log disk in order.
> 
> Signed-off-by: zhangyi (F) <yi.zhang@huawei.com>

This doesn't feel right.

You raised 2 things you're trying to address:
1) IO is out of order
2) accounting (nr_entries) isn't correct

I'll need to reviewer closer but serializing "super" bios doesn't seem
like the best fix.

Josef, any chance you can weigh in on this?  AFAIK you are still "the
man" for dm-log-writes ;)

Mike


> ---
>  drivers/md/dm-log-writes.c | 56 ++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 54 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/md/dm-log-writes.c b/drivers/md/dm-log-writes.c
> index 9ea2b02..37088c7 100644
> --- a/drivers/md/dm-log-writes.c
> +++ b/drivers/md/dm-log-writes.c
> @@ -60,6 +60,7 @@
>  
>  #define WRITE_LOG_VERSION 1ULL
>  #define WRITE_LOG_MAGIC 0x6a736677736872ULL
> +#define WRITE_LOG_SUPER_SECTOR 0
>  
>  /*
>   * The disk format for this is braindead simple.
> @@ -115,6 +116,8 @@ struct log_writes_c {
>  	struct list_head logging_blocks;
>  	wait_queue_head_t wait;
>  	struct task_struct *log_kthread;
> +	bool submitting_super;
> +	wait_queue_head_t wait_super;
>  };
>  
>  struct pending_block {
> @@ -180,6 +183,34 @@ static void log_end_io(struct bio *bio)
>  	bio_put(bio);
>  }
>  
> +static void log_end_super(struct bio *bio)
> +{
> +	struct log_writes_c *lc = bio->bi_private;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&lc->blocks_lock, flags);
> +	if (bio->bi_status) {
> +		DMERR("Error writing super block, error=%d",
> +		      bio->bi_status);
> +		lc->logging_enabled = false;
> +	}
> +
> +	WARN_ON(!lc->submitting_super);
> +	lc->submitting_super = false;
> +	spin_unlock_irqrestore(&lc->blocks_lock, flags);
> +
> +	/*
> +	 * Wake up log-write kthread that previous super sector has
> +	 * been written to disk.
> +	 */
> +	if (waitqueue_active(&lc->wait_super))
> +		wake_up(&lc->wait_super);
> +
> +	bio_free_pages(bio);
> +	put_io_block(lc);
> +	bio_put(bio);
> +}
> +
>  /*
>   * Meant to be called if there is an error, it will free all the pages
>   * associated with the block.
> @@ -215,7 +246,8 @@ static int write_metadata(struct log_writes_c *lc, void *entry,
>  	bio->bi_iter.bi_size = 0;
>  	bio->bi_iter.bi_sector = sector;
>  	bio_set_dev(bio, lc->logdev->bdev);
> -	bio->bi_end_io = log_end_io;
> +	bio->bi_end_io = (sector == WRITE_LOG_SUPER_SECTOR) ?
> +			  log_end_super : log_end_io;
>  	bio->bi_private = lc;
>  	bio_set_op_attrs(bio, REQ_OP_WRITE, 0);
>  
> @@ -418,7 +450,25 @@ static int log_super(struct log_writes_c *lc)
>  	super.nr_entries = cpu_to_le64(lc->logged_entries);
>  	super.sectorsize = cpu_to_le32(lc->sectorsize);
>  
> -	if (write_metadata(lc, &super, sizeof(super), NULL, 0, 0)) {
> +	/*
> +	 * Super sector should be writen in-order, or else the
> +	 * nr_entries could be small than the real submitted entries.
> +	 * So wait previous super sector submitted here.
> +	 */
> +	if (!lc->submitting_super)
> +		goto write_super;
> +
> +	spin_lock_irq(&lc->blocks_lock);
> +	if (!lc->submitting_super) {
> +		spin_unlock_irq(&lc->blocks_lock);
> +		goto write_super;
> +	}
> +	spin_unlock_irq(&lc->blocks_lock);
> +	wait_event(lc->wait_super, !lc->submitting_super);
> +write_super:
> +	lc->submitting_super = true;
> +	if (write_metadata(lc, &super, sizeof(super), NULL, 0,
> +			   WRITE_LOG_SUPER_SECTOR)) {
>  		DMERR("Couldn't write super");
>  		return -1;
>  	}
> @@ -531,6 +581,7 @@ static int log_writes_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  	INIT_LIST_HEAD(&lc->unflushed_blocks);
>  	INIT_LIST_HEAD(&lc->logging_blocks);
>  	init_waitqueue_head(&lc->wait);
> +	init_waitqueue_head(&lc->wait_super);
>  	atomic_set(&lc->io_blocks, 0);
>  	atomic_set(&lc->pending_blocks, 0);
>  
> @@ -570,6 +621,7 @@ static int log_writes_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  	lc->logging_enabled = true;
>  	lc->end_sector = logdev_last_sector(lc);
>  	lc->device_supports_discard = true;
> +	lc->submitting_super = false;
>  
>  	ti->num_flush_bios = 1;
>  	ti->flush_supported = true;
> -- 
> 2.7.4
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
