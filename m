Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E20E8273DAA
	for <lists+dm-devel@lfdr.de>; Tue, 22 Sep 2020 10:45:24 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-keow9U-fOj6GXmc6tNK4FQ-1; Tue, 22 Sep 2020 04:45:21 -0400
X-MC-Unique: keow9U-fOj6GXmc6tNK4FQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 662FAAF201;
	Tue, 22 Sep 2020 08:45:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 06EA555785;
	Tue, 22 Sep 2020 08:45:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C21411826D2C;
	Tue, 22 Sep 2020 08:45:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08M8ik4T024409 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 22 Sep 2020 04:44:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 25A4C2157F45; Tue, 22 Sep 2020 08:44:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2014D2157F24
	for <dm-devel@redhat.com>; Tue, 22 Sep 2020 08:44:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF50A102F1E7
	for <dm-devel@redhat.com>; Tue, 22 Sep 2020 08:44:35 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-352-0_1Xh0cSOw-JU6jkSdmNyw-1;
	Tue, 22 Sep 2020 04:44:33 -0400
X-MC-Unique: 0_1Xh0cSOw-JU6jkSdmNyw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id AC920ACBF;
	Tue, 22 Sep 2020 08:45:08 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id 7FB371E12E3; Tue, 22 Sep 2020 10:44:31 +0200 (CEST)
Date: Tue, 22 Sep 2020 10:44:31 +0200
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200922084431.GA16464@quack2.suse.cz>
References: <20200921080734.452759-1-hch@lst.de>
	<20200921080734.452759-4-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200921080734.452759-4-hch@lst.de>
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
	Hans de Goede <hdegoede@redhat.com>, Justin Sanders <justin@coraid.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Weinberger <richard@nod.at>, cgroups@vger.kernel.org,
	linux-bcache@vger.kernel.org, Coly Li <colyli@suse.de>,
	linux-block@vger.kernel.org, Song Liu <song@kernel.org>,
	dm-devel@redhat.com, linux-mtd@lists.infradead.org,
	Johannes Thumshirn <Johannes.Thumshirn@wdc.com>,
	drbd-dev@tron.linbit.com, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [dm-devel] [PATCH 03/13] bcache: inherit the optimal I/O size
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

On Mon 21-09-20 10:07:24, Christoph Hellwig wrote:
> Inherit the optimal I/O size setting just like the readahead window,
> as any reason to do larger I/O does not apply to just readahead.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

The patch looks good to me. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  drivers/md/bcache/super.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/md/bcache/super.c b/drivers/md/bcache/super.c
> index 1bbdc410ee3c51..48113005ed86ad 100644
> --- a/drivers/md/bcache/super.c
> +++ b/drivers/md/bcache/super.c
> @@ -1430,6 +1430,8 @@ static int cached_dev_init(struct cached_dev *dc, unsigned int block_size)
>  	dc->disk.disk->queue->backing_dev_info->ra_pages =
>  		max(dc->disk.disk->queue->backing_dev_info->ra_pages,
>  		    q->backing_dev_info->ra_pages);
> +	blk_queue_io_opt(dc->disk.disk->queue,
> +		max(queue_io_opt(dc->disk.disk->queue), queue_io_opt(q)));
>  
>  	atomic_set(&dc->io_errors, 0);
>  	dc->io_disable = false;
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

