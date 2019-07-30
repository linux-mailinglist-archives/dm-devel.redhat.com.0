Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AB37A2A8
	for <lists+dm-devel@lfdr.de>; Tue, 30 Jul 2019 09:56:02 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D328730860D2;
	Tue, 30 Jul 2019 07:55:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A6AC310013A7;
	Tue, 30 Jul 2019 07:55:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 451211972E;
	Tue, 30 Jul 2019 07:55:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6U0iHMG004060 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Jul 2019 20:44:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 767846031A; Tue, 30 Jul 2019 00:44:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from ming.t460p (ovpn-8-17.pek2.redhat.com [10.72.8.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C3F706012C;
	Tue, 30 Jul 2019 00:44:05 +0000 (UTC)
Date: Tue, 30 Jul 2019 08:44:00 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Message-ID: <20190730004359.GA28708@ming.t460p>
References: <20190725020500.4317-1-ming.lei@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725020500.4317-1-ming.lei@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 30 Jul 2019 03:55:28 -0400
Cc: Hannes Reinecke <hare@suse.com>, Bart Van Assche <bvanassche@acm.org>,
	Mike Snitzer <snitzer@redhat.com>, "Ewan D . Milne" <emilne@redhat.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	stable@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [PATCH V4 0/2] block/scsi/dm-rq: fix leak of request
 private data in dm-mpath
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Tue, 30 Jul 2019 07:56:00 +0000 (UTC)

On Thu, Jul 25, 2019 at 10:04:58AM +0800, Ming Lei wrote:
> Hi,
> 
> When one request is dispatched to LLD via dm-rq, if the result is
> BLK_STS_*RESOURCE, dm-rq will free the request. However, LLD may allocate
> private data for this request, so this way will cause memory leak.
> 
> Add .cleanup_rq() callback and implement it in SCSI for fixing the issue,
> since SCSI is the only driver which allocates private requst data in
> .queue_rq() path.
> 
> Another use case of this callback is to free the request and re-submit
> bios during cpu hotplug when the hctx is dead, see the following link:
> 
> https://lore.kernel.org/linux-block/f122e8f2-5ede-2d83-9ca0-bc713ce66d01@huawei.com/T/#t
> 
> V4:
> 	- add more commit log on the new .cleanup_rq callback, as suggested
> 	  by Mike
> 
> V3:
> 	- run .cleanup_rq() from dm-rq because this issue is dm-rq specific,
> 	and even in future it should be still very unusual to free request
> 	in this way. If we call .cleanup_rq() in generic rq free code(fast
> 	path), cost will be introduced unnecessarily, also we have to
> 	consider related race.
> 
> V2:
> 	- run .cleanup_rq() in blk_mq_free_request(), as suggested by Mike 
> 
> 
> 
> Ming Lei (2):
>   blk-mq: add callback of .cleanup_rq
>   scsi: implement .cleanup_rq callback
> 
>  drivers/md/dm-rq.c      |  1 +
>  drivers/scsi/scsi_lib.c | 13 +++++++++++++
>  include/linux/blk-mq.h  | 13 +++++++++++++
>  3 files changed, 27 insertions(+)
> 
> Cc: Ewan D. Milne <emilne@redhat.com>
> Cc: Bart Van Assche <bvanassche@acm.org>
> Cc: Hannes Reinecke <hare@suse.com>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Mike Snitzer <snitzer@redhat.com>
> Cc: dm-devel@redhat.com
> Cc: <stable@vger.kernel.org>
> Fixes: 396eaf21ee17 ("blk-mq: improve DM's blk-mq IO merging via blk_insert_cloned_request feedback")

Hello Jens & guys,

Ping on this fix.


Thanks,
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
