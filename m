Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 67D6D2D2852
	for <lists+dm-devel@lfdr.de>; Tue,  8 Dec 2020 11:00:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607421625;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/M6+CkOAmzT4JFpXVG/L28+I7cGfmGwfJ+vkWobVAFQ=;
	b=VIq6qao5Q3pPuISYBYQ4DrzTJtoe55tg80KRhB3cFArXbsUuMdS5jzGioUyJTnoFu089YW
	Yaaqgt3EkIgyBCwOlf7bvZanURliT0cr8EQGzk36rALjlFXkXj6IdNJlamLqBU+wwhLvzf
	ne/OjCO58ZkE1XKxcWZMNK1UwyZdoMk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-863wPjpqNiOX1UK8P33XgA-1; Tue, 08 Dec 2020 05:00:23 -0500
X-MC-Unique: 863wPjpqNiOX1UK8P33XgA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 463A61966321;
	Tue,  8 Dec 2020 10:00:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C1FC45D9E2;
	Tue,  8 Dec 2020 10:00:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C0964180954D;
	Tue,  8 Dec 2020 10:00:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B89xxn7030543 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 8 Dec 2020 04:59:59 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 943E46E51D; Tue,  8 Dec 2020 09:59:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-12-237.pek2.redhat.com [10.72.12.237])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F1AF2B394;
	Tue,  8 Dec 2020 09:59:40 +0000 (UTC)
Date: Tue, 8 Dec 2020 17:59:35 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20201208095935.GA1202995@T590>
References: <20201207131918.2252553-1-hch@lst.de>
	<20201207131918.2252553-2-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20201207131918.2252553-2-hch@lst.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Sagi Grimberg <sagi@grimberg.me>,
	Mike Snitzer <snitzer@redhat.com>, Oleksii Kurochko <olkuroch@cisco.com>,
	Dongsheng Yang <dongsheng.yang@easystack.cn>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	linux-nvme@lists.infradead.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Ilya Dryomov <idryomov@gmail.com>, ceph-devel@vger.kernel.org
Subject: Re: [dm-devel] [PATCH 1/6] dm: use bdev_read_only to check if a
 device is read-only
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

On Mon, Dec 07, 2020 at 02:19:13PM +0100, Christoph Hellwig wrote:
> dm-thin and dm-cache also work on partitions, so use the proper
> interface to check if the device is read-only.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Hannes Reinecke <hare@suse.de>
> ---
>  drivers/md/dm-cache-metadata.c | 2 +-
>  drivers/md/dm-thin-metadata.c  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/md/dm-cache-metadata.c b/drivers/md/dm-cache-metadata.c
> index af6d4f898e4c1d..89a73204dbf47f 100644
> --- a/drivers/md/dm-cache-metadata.c
> +++ b/drivers/md/dm-cache-metadata.c
> @@ -449,7 +449,7 @@ static int __check_incompat_features(struct cache_disk_superblock *disk_super,
>  	/*
>  	 * Check for read-only metadata to skip the following RDWR checks.
>  	 */
> -	if (get_disk_ro(cmd->bdev->bd_disk))
> +	if (bdev_read_only(cmd->bdev))
>  		return 0;
>  
>  	features = le32_to_cpu(disk_super->compat_ro_flags) & ~DM_CACHE_FEATURE_COMPAT_RO_SUPP;
> diff --git a/drivers/md/dm-thin-metadata.c b/drivers/md/dm-thin-metadata.c
> index 6ebb2127f3e2e0..e75b20480e460e 100644
> --- a/drivers/md/dm-thin-metadata.c
> +++ b/drivers/md/dm-thin-metadata.c
> @@ -636,7 +636,7 @@ static int __check_incompat_features(struct thin_disk_superblock *disk_super,
>  	/*
>  	 * Check for read-only metadata to skip the following RDWR checks.
>  	 */
> -	if (get_disk_ro(pmd->bdev->bd_disk))
> +	if (bdev_read_only(pmd->bdev))
>  		return 0;
>  
>  	features = le32_to_cpu(disk_super->compat_ro_flags) & ~THIN_FEATURE_COMPAT_RO_SUPP;
> -- 
> 2.29.2
> 

Reviewed-by: Ming Lei <ming.lei@redhat.com>

-- 
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

