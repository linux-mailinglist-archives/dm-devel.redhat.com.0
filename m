Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6AF45752
	for <lists+dm-devel@lfdr.de>; Fri, 14 Jun 2019 10:18:43 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5CC703091851;
	Fri, 14 Jun 2019 08:18:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DC5E9888;
	Fri, 14 Jun 2019 08:18:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A6CDB4A460;
	Fri, 14 Jun 2019 08:18:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5D27Cc6000600 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 Jun 2019 22:07:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E7F0D643F5; Thu, 13 Jun 2019 02:07:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 573A964036;
	Thu, 13 Jun 2019 02:07:06 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1DF3030C0DF9;
	Thu, 13 Jun 2019 02:06:44 +0000 (UTC)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id DCB5D505A6332EC237C3;
	Thu, 13 Jun 2019 10:06:38 +0800 (CST)
Received: from [127.0.0.1] (10.177.244.145) by DGGEMS405-HUB.china.huawei.com
	(10.3.19.205) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 13 Jun 2019 10:06:29 +0800
To: <josef@toxicpanda.com>, <dm-devel@redhat.com>
References: <1559741228-96463-1-git-send-email-yi.zhang@huawei.com>
From: "zhangyi (F)" <yi.zhang@huawei.com>
Message-ID: <404ad73a-0630-3b1f-1b7a-4f374051cf2a@huawei.com>
Date: Thu, 13 Jun 2019 10:06:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1559741228-96463-1-git-send-email-yi.zhang@huawei.com>
X-Originating-IP: [10.177.244.145]
X-CFilter-Loop: Reflected
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.45]); Thu, 13 Jun 2019 02:06:45 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]);
	Thu, 13 Jun 2019 02:06:45 +0000 (UTC) for IP:'45.249.212.35'
	DOMAIN:'szxga07-in.huawei.com' HELO:'huawei.com'
	FROM:'yi.zhang@huawei.com' RCPT:''
X-RedHat-Spam-Score: -2.302  (RCVD_IN_DNSWL_MED, SPF_HELO_PASS,
	SPF_PASS) 45.249.212.35 szxga07-in.huawei.com
	45.249.212.35 szxga07-in.huawei.com <yi.zhang@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.45
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 14 Jun 2019 04:15:49 -0400
Cc: snitzer@redhat.com, agk@redhat.com, houtao1@huawei.com
Subject: Re: [dm-devel] [PATCH v2] dm log writes: make sure the log super
 sectors are written in order
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Fri, 14 Jun 2019 08:18:42 +0000 (UTC)

Gentle ping.

On 2019/6/5 21:27, zhangyi (F) Wrote:
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
> sectors are written to log disk in order, so that we can prevent the
> latest nr_entries be rewritten by some old super bios.
> 
> Signed-off-by: zhangyi (F) <yi.zhang@huawei.com>
> Suggested-by: Josef Bacik <josef@toxicpanda.com>
> ---
> Changes since v1:
>  - Switch to use completion instead of wait_queue to synchronize
>    submitting super bios.
> 
>  drivers/md/dm-log-writes.c | 25 +++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/md/dm-log-writes.c b/drivers/md/dm-log-writes.c
> index 9ea2b02..4854246 100644
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
> @@ -115,6 +116,7 @@ struct log_writes_c {
>  	struct list_head logging_blocks;
>  	wait_queue_head_t wait;
>  	struct task_struct *log_kthread;
> +	struct completion super_done;
>  };
>  
>  struct pending_block {
> @@ -180,6 +182,15 @@ static void log_end_io(struct bio *bio)
>  	bio_put(bio);
>  }
>  
> +static void log_end_super(struct bio *bio)
> +{
> +	struct log_writes_c *lc = bio->bi_private;
> +
> +	/* Wake up log-write kthread that super has been written */
> +	complete(&lc->super_done);
> +	log_end_io(bio);
> +}
> +
>  /*
>   * Meant to be called if there is an error, it will free all the pages
>   * associated with the block.
> @@ -215,7 +226,8 @@ static int write_metadata(struct log_writes_c *lc, void *entry,
>  	bio->bi_iter.bi_size = 0;
>  	bio->bi_iter.bi_sector = sector;
>  	bio_set_dev(bio, lc->logdev->bdev);
> -	bio->bi_end_io = log_end_io;
> +	bio->bi_end_io = (sector == WRITE_LOG_SUPER_SECTOR) ?
> +			  log_end_super : log_end_io;
>  	bio->bi_private = lc;
>  	bio_set_op_attrs(bio, REQ_OP_WRITE, 0);
>  
> @@ -418,11 +430,19 @@ static int log_super(struct log_writes_c *lc)
>  	super.nr_entries = cpu_to_le64(lc->logged_entries);
>  	super.sectorsize = cpu_to_le32(lc->sectorsize);
>  
> -	if (write_metadata(lc, &super, sizeof(super), NULL, 0, 0)) {
> +	if (write_metadata(lc, &super, sizeof(super), NULL, 0,
> +			   WRITE_LOG_SUPER_SECTOR)) {
>  		DMERR("Couldn't write super");
>  		return -1;
>  	}
>  
> +	/*
> +	 * Super sector should be writen in-order, or else the
> +	 * nr_entries could be rewritten by the old bio and small
> +	 * than the real submitted entries.
> +	 */
> +	wait_for_completion_io(&lc->super_done);
> +
>  	return 0;
>  }
>  
> @@ -531,6 +551,7 @@ static int log_writes_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  	INIT_LIST_HEAD(&lc->unflushed_blocks);
>  	INIT_LIST_HEAD(&lc->logging_blocks);
>  	init_waitqueue_head(&lc->wait);
> +	init_completion(&lc->super_done);
>  	atomic_set(&lc->io_blocks, 0);
>  	atomic_set(&lc->pending_blocks, 0);
>  
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
