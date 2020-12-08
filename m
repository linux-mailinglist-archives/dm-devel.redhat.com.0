Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 478B42D28BC
	for <lists+dm-devel@lfdr.de>; Tue,  8 Dec 2020 11:23:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607422979;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Bf3JtLvimu9WWYlo5QGeMYJUn8rIuhsy43X38M6K70M=;
	b=e38+xgz4mKm3wT+J6wQx0+1exeWiov1Sjr/8WXdAc7zaBdK3z3fcq2oPx0T5X2QQqPhIwx
	WUtPVa7kcToHv3CZmjX4OA/Xzr+BbK4lx/dULzw5q+IbcSqiR9s95ARIAFZoSCxHm32FM1
	97pm1Bznz6lThMUcx7BCaILoETtzlJ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-nL3uB9hnOjm3zeljUu8HmA-1; Tue, 08 Dec 2020 05:22:56 -0500
X-MC-Unique: nL3uB9hnOjm3zeljUu8HmA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99328809DD3;
	Tue,  8 Dec 2020 10:22:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FC6D5D9DD;
	Tue,  8 Dec 2020 10:22:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1D9EC4E590;
	Tue,  8 Dec 2020 10:22:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B8AMYPP031855 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 8 Dec 2020 05:22:34 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id F1B131346F; Tue,  8 Dec 2020 10:22:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-12-237.pek2.redhat.com [10.72.12.237])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F6B260636;
	Tue,  8 Dec 2020 10:22:15 +0000 (UTC)
Date: Tue, 8 Dec 2020 18:22:11 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20201208102211.GC1202995@T590>
References: <20201207131918.2252553-1-hch@lst.de>
	<20201207131918.2252553-4-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20201207131918.2252553-4-hch@lst.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Sagi Grimberg <sagi@grimberg.me>,
	Mike Snitzer <snitzer@redhat.com>, Oleksii Kurochko <olkuroch@cisco.com>,
	Dongsheng Yang <dongsheng.yang@easystack.cn>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	linux-nvme@lists.infradead.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Ilya Dryomov <idryomov@gmail.com>, ceph-devel@vger.kernel.org
Subject: Re: [dm-devel] [PATCH 3/6] block: add a hard-readonly flag to
	struct gendisk
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

On Mon, Dec 07, 2020 at 02:19:15PM +0100, Christoph Hellwig wrote:
> Commit 20bd1d026aac ("scsi: sd: Keep disk read-only when re-reading
> partition") addressed a long-standing problem with user read-only
> policy being overridden as a result of a device-initiated revalidate.
> The commit has since been reverted due to a regression that left some
> USB devices read-only indefinitely.
> 
> To fix the underlying problems with revalidate we need to keep track
> of hardware state and user policy separately.
> 
> The gendisk has been updated to reflect the current hardware state set
> by the device driver. This is done to allow returning the device to
> the hardware state once the user clears the BLKROSET flag.
> 
> The resulting semantics are as follows:
> 
>  - If BLKROSET sets a given partition read-only, that partition will
>    remain read-only even if the underlying storage stack initiates a
>    revalidate. However, the BLKRRPART ioctl will cause the partition
>    table to be dropped and any user policy on partitions will be lost.
> 
>  - If BLKROSET has not been set, both the whole disk device and any
>    partitions will reflect the current write-protect state of the
>    underlying device.
> 
> Based on a patch from Martin K. Petersen <martin.petersen@oracle.com>.
> 
> Reported-by: Oleksii Kurochko <olkuroch@cisco.com>
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=201221
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Hannes Reinecke <hare@suse.de>
> ---
>  block/blk-core.c        |  2 +-
>  block/genhd.c           | 33 +++++++++++++++++++--------------
>  block/partitions/core.c |  3 +--
>  include/linux/genhd.h   |  6 ++++--
>  4 files changed, 25 insertions(+), 19 deletions(-)
> 
> diff --git a/block/blk-core.c b/block/blk-core.c
> index ad041e903b0a8f..ecd68415c6acad 100644
> --- a/block/blk-core.c
> +++ b/block/blk-core.c
> @@ -693,7 +693,7 @@ static inline bool should_fail_request(struct block_device *part,
>  
>  static inline bool bio_check_ro(struct bio *bio)
>  {
> -	if (op_is_write(bio_op(bio)) && bio->bi_bdev->bd_read_only) {
> +	if (op_is_write(bio_op(bio)) && bdev_read_only(bio->bi_bdev))
>  		char b[BDEVNAME_SIZE];
>  
>  		if (op_is_flush(bio->bi_opf) && !bio_sectors(bio))
> diff --git a/block/genhd.c b/block/genhd.c
> index c87013879b8650..878f94727aaa96 100644
> --- a/block/genhd.c
> +++ b/block/genhd.c
> @@ -1425,27 +1425,32 @@ static void set_disk_ro_uevent(struct gendisk *gd, int ro)
>  	kobject_uevent_env(&disk_to_dev(gd)->kobj, KOBJ_CHANGE, envp);
>  }
>  
> -void set_disk_ro(struct gendisk *disk, int flag)
> +/**
> + * set_disk_ro - set a gendisk read-only
> + * @disk:	gendisk to operate on
> + * @ready_only:	%true to set the disk read-only, %false set the disk read/write
> + *
> + * This function is used to indicate whether a given disk device should have its
> + * read-only flag set. set_disk_ro() is typically used by device drivers to
> + * indicate whether the underlying physical device is write-protected.
> + */
> +void set_disk_ro(struct gendisk *disk, bool read_only)
>  {
> -	struct disk_part_iter piter;
> -	struct block_device *part;
> -
> -	if (disk->part0->bd_read_only != flag) {
> -		set_disk_ro_uevent(disk, flag);
> -		disk->part0->bd_read_only = flag;
> +	if (read_only) {
> +		if (test_and_set_bit(GD_READ_ONLY, &disk->state))
> +			return;
> +	} else {
> +		if (!test_and_clear_bit(GD_READ_ONLY, &disk->state))
> +			return;
>  	}
> -
> -	disk_part_iter_init(&piter, disk, DISK_PITER_INCL_EMPTY);
> -	while ((part = disk_part_iter_next(&piter)))
> -		part->bd_read_only = flag;
> -	disk_part_iter_exit(&piter);
> +	set_disk_ro_uevent(disk, read_only);
>  }
> -
>  EXPORT_SYMBOL(set_disk_ro);
>  
>  int bdev_read_only(struct block_device *bdev)
>  {
> -	return bdev->bd_read_only;
> +	return bdev->bd_read_only ||
> +		test_bit(GD_READ_ONLY, &bdev->bd_disk->state);
>  }
>  EXPORT_SYMBOL(bdev_read_only);

Maybe one inline version can be added for fast path(bio_check_ro()), and the approach
is good:

Reviewed-by: Ming Lei <ming.lei@redhat.com>

-- 
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

