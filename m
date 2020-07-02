Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 73E8F21278B
	for <lists+dm-devel@lfdr.de>; Thu,  2 Jul 2020 17:15:52 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-yEGkJY-XM7GhHZH0-6htsQ-1; Thu, 02 Jul 2020 11:15:47 -0400
X-MC-Unique: yEGkJY-XM7GhHZH0-6htsQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA3CE107B7C3;
	Thu,  2 Jul 2020 15:15:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7389D2B4C5;
	Thu,  2 Jul 2020 15:15:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C21391809547;
	Thu,  2 Jul 2020 15:15:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 062FF5dS016251 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 2 Jul 2020 11:15:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 29889207AEE6; Thu,  2 Jul 2020 15:15:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD7D9200A7A2
	for <dm-devel@redhat.com>; Thu,  2 Jul 2020 15:15:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4BE1108C273
	for <dm-devel@redhat.com>; Thu,  2 Jul 2020 15:15:00 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-153-58xIqle3OaSEcZzrCD0GIg-1;
	Thu, 02 Jul 2020 11:14:58 -0400
X-MC-Unique: 58xIqle3OaSEcZzrCD0GIg-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 9DA8768B05; Thu,  2 Jul 2020 17:14:53 +0200 (CEST)
Date: Thu, 2 Jul 2020 17:14:53 +0200
From: Christoph Hellwig <hch@lst.de>
To: Qian Cai <cai@lca.pw>
Message-ID: <20200702151453.GA1799@lst.de>
References: <20200629193947.2705954-1-hch@lst.de>
	<20200629193947.2705954-19-hch@lst.de>
	<20200702141001.GA3834@lca.pw>
MIME-Version: 1.0
In-Reply-To: <20200702141001.GA3834@lca.pw>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-xtensa@linux-xtensa.org,
	linux-m68k@vger.kernel.org, linux-nvdimm@lists.01.org,
	linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org, linux-raid@vger.kernel.org,
	dm-devel@redhat.com, Alexander Potapenko <glider@google.com>,
	kasan-dev@googlegroups.com, drbd-dev@tron.linbit.com,
	Andrey Ryabinin <aryabinin@virtuozzo.com>,
	linux-bcache@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Christoph Hellwig <hch@lst.de>, Dmitry Vyukov <dvyukov@google.com>
Subject: Re: [dm-devel] [PATCH 18/20] block: refator submit_bio_noacct
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Jul 02, 2020 at 10:10:10AM -0400, Qian Cai wrote:
> On Mon, Jun 29, 2020 at 09:39:45PM +0200, Christoph Hellwig wrote:
> > Split out a __submit_bio_noacct helper for the actual de-recursion
> > algorithm, and simplify the loop by using a continue when we can't
> > enter the queue for a bio.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> Reverting this commit and its dependencies,
> 
> 5a6c35f9af41 block: remove direct_make_request
> ff93ea0ce763 block: shortcut __submit_bio_noacct for blk-mq drivers
> 
> fixed the stack-out-of-bounds during boot,
> 
> https://lore.kernel.org/linux-block/000000000000bcdeaa05a97280e4@google.com/

Yikes.  bio_alloc_bioset pokes into bio_list[1] in a totally
undocumented way.  But even with that the problem should only show
up with "block: shortcut __submit_bio_noacct for blk-mq drivers".

Can you try this patch?

diff --git a/block/blk-core.c b/block/blk-core.c
index bf882b8d84450c..9f1bf8658b611a 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -1155,11 +1155,10 @@ static blk_qc_t __submit_bio_noacct(struct bio *bio)
 static blk_qc_t __submit_bio_noacct_mq(struct bio *bio)
 {
 	struct gendisk *disk = bio->bi_disk;
-	struct bio_list bio_list;
+	struct bio_list bio_list[2] = { };
 	blk_qc_t ret = BLK_QC_T_NONE;
 
-	bio_list_init(&bio_list);
-	current->bio_list = &bio_list;
+	current->bio_list = bio_list;
 
 	do {
 		WARN_ON_ONCE(bio->bi_disk != disk);
@@ -1174,7 +1173,7 @@ static blk_qc_t __submit_bio_noacct_mq(struct bio *bio)
 		}
 
 		ret = blk_mq_submit_bio(bio);
-	} while ((bio = bio_list_pop(&bio_list)));
+	} while ((bio = bio_list_pop(&bio_list[0])));
 
 	current->bio_list = NULL;
 	return ret;

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

