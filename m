Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 743882C8098
	for <lists+dm-devel@lfdr.de>; Mon, 30 Nov 2020 10:10:09 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-2NOg7TNIMdqs4zZzOVOdyA-1; Mon, 30 Nov 2020 04:10:05 -0500
X-MC-Unique: 2NOg7TNIMdqs4zZzOVOdyA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F1BC102CB29;
	Mon, 30 Nov 2020 09:09:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DEE345D6A8;
	Mon, 30 Nov 2020 09:09:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D385E180954D;
	Mon, 30 Nov 2020 09:09:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AU99XiL009182 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 30 Nov 2020 04:09:34 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B643620296A5; Mon, 30 Nov 2020 09:09:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B0F47200A4F0
	for <dm-devel@redhat.com>; Mon, 30 Nov 2020 09:09:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C84F8185A7BC
	for <dm-devel@redhat.com>; Mon, 30 Nov 2020 09:09:29 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-572-KDJ8HBJiPg2G3WhM8PwePQ-1;
	Mon, 30 Nov 2020 04:09:27 -0500
X-MC-Unique: KDJ8HBJiPg2G3WhM8PwePQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 84675AC6A;
	Mon, 30 Nov 2020 09:09:25 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id 0D4011E131B; Mon, 30 Nov 2020 10:09:25 +0100 (CET)
Date: Mon, 30 Nov 2020 10:09:25 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20201130090925.GB11250@quack2.suse.cz>
References: <20201128161510.347752-1-hch@lst.de>
	<20201128161510.347752-17-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20201128161510.347752-17-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Jan Kara <jack@suse.cz>,
	Mike Snitzer <snitzer@redhat.com>, linux-mm@kvack.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jan Kara <jack@suse.com>, Josef Bacik <josef@toxicpanda.com>,
	Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	Tejun Heo <tj@kernel.org>, linux-bcache@vger.kernel.org
Subject: Re: [dm-devel] [PATCH 16/45] block: switch bdgrab to use igrab
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat 28-11-20 17:14:41, Christoph Hellwig wrote:
> All of the current callers already have a reference, but to prepare for
> additional users ensure bdgrab returns NULL if the block device is beeing
								     ^^^ being

> freed.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Otherwise looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/block_dev.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/block_dev.c b/fs/block_dev.c
> index d707ab376da86e..962fabe8a67b83 100644
> --- a/fs/block_dev.c
> +++ b/fs/block_dev.c
> @@ -894,10 +894,14 @@ static struct block_device *bdget(dev_t dev)
>  /**
>   * bdgrab -- Grab a reference to an already referenced block device
>   * @bdev:	Block device to grab a reference to.
> + *
> + * Returns the block_device with an additional reference when successful,
> + * or NULL if the inode is already beeing freed.
>   */
>  struct block_device *bdgrab(struct block_device *bdev)
>  {
> -	ihold(bdev->bd_inode);
> +	if (!igrab(bdev->bd_inode))
> +		return NULL;
>  	return bdev;
>  }
>  EXPORT_SYMBOL(bdgrab);
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

