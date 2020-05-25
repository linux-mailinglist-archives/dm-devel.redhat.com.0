Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id C85B41E1226
	for <lists+dm-devel@lfdr.de>; Mon, 25 May 2020 17:56:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590422178;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lZR93DjauUJPcaX+WHhgxQpI/Qf/5rVLsMGcppTn83w=;
	b=MuHjarYinXRBaw1tddh8VzXR4ESi/6wNw7YP6UkxjFG4V+7ULb470oqv/62EKLANzhT1Xb
	JguZt9rhEDyg27MRo3aYPC4PRM185NBl3XOi/V9V+Nkj6hWtdxLH27LPjDO96NbLNrmzAv
	eqAGZXAu8gzlvWFvZpvtAK/urUMh220=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-iyVILNsONiqlAX3cvKQ4Rw-1; Mon, 25 May 2020 11:56:16 -0400
X-MC-Unique: iyVILNsONiqlAX3cvKQ4Rw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47DB418FE864;
	Mon, 25 May 2020 15:56:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EFFD75C1C5;
	Mon, 25 May 2020 15:56:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0DB301809543;
	Mon, 25 May 2020 15:55:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04PCSHvG009875 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 25 May 2020 08:28:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D891A2026971; Mon, 25 May 2020 12:28:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B8CDE2026DFD
	for <dm-devel@redhat.com>; Mon, 25 May 2020 12:28:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F4C88007C8
	for <dm-devel@redhat.com>; Mon, 25 May 2020 12:28:14 +0000 (UTC)
Received: from forwardcorp1j.mail.yandex.net (forwardcorp1j.mail.yandex.net
	[5.45.199.163]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-281-ag4opJZ0MRy32ODTDqD_Ow-1; Mon, 25 May 2020 08:28:11 -0400
X-MC-Unique: ag4opJZ0MRy32ODTDqD_Ow-1
Received: from mxbackcorp1j.mail.yandex.net (mxbackcorp1j.mail.yandex.net
	[IPv6:2a02:6b8:0:1619::162])
	by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 9EE2C2E1382;
	Mon, 25 May 2020 15:28:09 +0300 (MSK)
Received: from vla1-81430ab5870b.qloud-c.yandex.net
	(vla1-81430ab5870b.qloud-c.yandex.net
	[2a02:6b8:c0d:35a1:0:640:8143:ab5])
	by mxbackcorp1j.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
	DQMsTfsjhQ-S7TS4oeT; Mon, 25 May 2020 15:28:09 +0300
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
	[2a02:6b8:b081:603::1:c])
	by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA
	id 2d5hQC4EbC-S7Xq4M1X; Mon, 25 May 2020 15:28:07 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20200525113014.345997-1-hch@lst.de>
	<20200525113014.345997-2-hch@lst.de>
From: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
Message-ID: <fafb94a9-cdce-5ea0-e73f-9463766a9f19@yandex-team.ru>
Date: Mon, 25 May 2020 15:28:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200525113014.345997-2-hch@lst.de>
Content-Language: en-CA
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 25 May 2020 11:55:47 -0400
Cc: linux-nvdimm@lists.01.org, linux-bcache@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Minchan Kim <minchan@kernel.org>, dm-devel@redhat.com,
	drbd-dev@tron.linbit.com, Nitin Gupta <ngupta@vflare.org>
Subject: Re: [dm-devel] [PATCH 01/16] block: add disk/bio-based accounting
	helpers
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
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

On 25/05/2020 14.29, Christoph Hellwig wrote:
> Add two new helpers to simplify I/O accounting for bio based drivers.
> Currently these drivers use the generic_start_io_acct and
> generic_end_io_acct helpers which have very cumbersome calling
> conventions, don't actually return the time they started accounting,
> and try to deal with accounting for partitions, which can't happen
> for bio based drivers.  The new helpers will be used to subsequently
> replace uses of the old helpers.
> 
> The main function is the bio based wrappes in blkdev.h, but for zram
> which wants to account rw_page based I/O lower level routines are
> provided as well.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   block/blk-core.c       | 34 ++++++++++++++++++++++++++++++++++
>   include/linux/blkdev.h | 26 ++++++++++++++++++++++++++
>   2 files changed, 60 insertions(+)
> 
> diff --git a/block/blk-core.c b/block/blk-core.c
> index 77e57c2e8d602..8973104f88d90 100644
> --- a/block/blk-core.c
> +++ b/block/blk-core.c
> @@ -1432,6 +1432,40 @@ void blk_account_io_start(struct request *rq, bool new_io)
>   	part_stat_unlock();
>   }
>   
> +unsigned long disk_start_io_acct(struct gendisk *disk, unsigned int sectors,
> +		unsigned int op)
> +{
> +	struct hd_struct *part = &disk->part0;
> +	const int sgrp = op_stat_group(op);
> +	unsigned long now = READ_ONCE(jiffies);
> +
> +	part_stat_lock();
> +	update_io_ticks(part, now, false);
> +	part_stat_inc(part, ios[sgrp]);
> +	part_stat_add(part, sectors[sgrp], sectors);
> +	part_stat_local_inc(part, in_flight[op_is_write(op)]);
> +	part_stat_unlock();
> +
> +	return now;
> +}
> +EXPORT_SYMBOL(disk_start_io_acct);
> +
> +void disk_end_io_acct(struct gendisk *disk, unsigned int op,
> +		unsigned long start_time)
> +{
> +	struct hd_struct *part = &disk->part0;
> +	const int sgrp = op_stat_group(op);
> +	unsigned long now = READ_ONCE(jiffies);
> +	unsigned long duration = now - start_time;

I think it would be better to leave this jiffies legacy nonsense in
callers and pass here request duration in nanoseconds.

So rewriting them to nanoseconds later wouldn't touch generic code.

> +
> +	part_stat_lock();
> +	update_io_ticks(part, now, true);
> +	part_stat_add(part, nsecs[sgrp], jiffies_to_nsecs(duration));
> +	part_stat_local_dec(part, in_flight[op_is_write(op)]);
> +	part_stat_unlock();
> +}
> +EXPORT_SYMBOL(disk_end_io_acct);
> +
>   /*
>    * Steal bios from a request and add them to a bio list.
>    * The request must not have been partially completed before.
> diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
> index 7d10f4e632325..76d01a8a13b80 100644
> --- a/include/linux/blkdev.h
> +++ b/include/linux/blkdev.h
> @@ -1892,4 +1892,30 @@ static inline void blk_wake_io_task(struct task_struct *waiter)
>   		wake_up_process(waiter);
>   }
>   
> +unsigned long disk_start_io_acct(struct gendisk *disk, unsigned int sectors,
> +		unsigned int op);
> +void disk_end_io_acct(struct gendisk *disk, unsigned int op,
> +		unsigned long start_time);
> +
> +/**
> + * bio_start_io_acct - start I/O accounting for bio based drivers
> + * @bio:	bio to start account for
> + *
> + * Returns the start time that should be passed back to bio_end_io_acct().
> + */
> +static inline unsigned long bio_start_io_acct(struct bio *bio)
> +{
> +	return disk_start_io_acct(bio->bi_disk, bio_sectors(bio), bio_op(bio));
> +}
> +
> +/**
> + * bio_end_io_acct - end I/O accounting for bio based drivers
> + * @bio:	bio to end account for
> + * @start:	start time returned by bio_start_io_acct()
> + */
> +static inline void bio_end_io_acct(struct bio *bio, unsigned long start_time)
> +{
> +	return disk_end_io_acct(bio->bi_disk, bio_op(bio), start_time);
> +}
> +
>   #endif
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

