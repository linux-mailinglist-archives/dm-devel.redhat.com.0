Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B82886FA80
	for <lists+dm-devel@lfdr.de>; Mon, 22 Jul 2019 09:41:53 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0C5E081F0F;
	Mon, 22 Jul 2019 07:41:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B775E5F7C0;
	Mon, 22 Jul 2019 07:41:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2EF954EA67;
	Mon, 22 Jul 2019 07:41:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6K36psS015686 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jul 2019 23:06:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 60B71619AC; Sat, 20 Jul 2019 03:06:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (ovpn-8-23.pek2.redhat.com [10.72.8.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1A835619AB;
	Sat, 20 Jul 2019 03:06:43 +0000 (UTC)
From: Ming Lei <ming.lei@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Sat, 20 Jul 2019 11:06:35 +0800
Message-Id: <20190720030637.14447-1-ming.lei@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 22 Jul 2019 03:41:30 -0400
Cc: Hannes Reinecke <hare@suse.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	linux-scsi@vger.kernel.org, "James E . J . Bottomley" <jejb@linux.ibm.com>,
	"Ewan D . Milne" <emilne@redhat.com>,
	Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>,
	stable@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
	Bart Van Assche <bvanassche@acm.org>
Subject: [dm-devel] [PATCH V2 0/2] block/scsi/dm-rq: fix leak of request
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Mon, 22 Jul 2019 07:41:52 +0000 (UTC)

Hi,

When one request is dispatched to LLD via dm-rq, if the result is
BLK_STS_*RESOURCE, dm-rq will free the request. However, LLD may allocate
private data for this request, so this way will cause memory leak.

Add .cleanup_rq() callback and implement it in SCSI for fixing the issue,
since SCSI is the only driver which allocates private requst data in
.queue_rq() path.

Another use case of this callback is to free the request and re-submit
bios during cpu hotplug when the hctx is dead, see the following link:

https://lore.kernel.org/linux-block/f122e8f2-5ede-2d83-9ca0-bc713ce66d01@huawei.com/T/#t

V2:
	- run .cleanup_rq() in blk_mq_free_request(), as suggested by Mike 


Ming Lei (2):
  blk-mq: add callback of .cleanup_rq
  scsi: implement .cleanup_rq callback

 block/blk-mq.c          |  3 +++
 drivers/scsi/scsi_lib.c | 28 ++++++++++++++++++++--------
 include/linux/blk-mq.h  |  7 +++++++
 3 files changed, 30 insertions(+), 8 deletions(-)

Cc: Ewan D. Milne <emilne@redhat.com>
Cc: Bart Van Assche <bvanassche@acm.org>
Cc: Hannes Reinecke <hare@suse.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Mike Snitzer <snitzer@redhat.com>
Cc: dm-devel@redhat.com
Cc: <stable@vger.kernel.org>
Fixes: 396eaf21ee17 ("blk-mq: improve DM's blk-mq IO merging via blk_insert_cloned_request feedback")

-- 
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
