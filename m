Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id C8E1A398324
	for <lists+dm-devel@lfdr.de>; Wed,  2 Jun 2021 09:38:09 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110-V0498Yh6OtCCUvaZ6gjFxw-1; Wed, 02 Jun 2021 03:38:06 -0400
X-MC-Unique: V0498Yh6OtCCUvaZ6gjFxw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 293C5107ACE4;
	Wed,  2 Jun 2021 07:38:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9445E1B49E;
	Wed,  2 Jun 2021 07:38:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 34B631801265;
	Wed,  2 Jun 2021 07:37:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1527ZXcc020873 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 2 Jun 2021 03:35:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4C25AF41DA; Wed,  2 Jun 2021 07:35:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47744F51A2
	for <dm-devel@redhat.com>; Wed,  2 Jun 2021 07:35:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF6CC185A79C
	for <dm-devel@redhat.com>; Wed,  2 Jun 2021 07:35:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-364-btAD7Tx6PrW-1MAnddCMkA-1; Wed, 02 Jun 2021 03:35:25 -0400
X-MC-Unique: btAD7Tx6PrW-1MAnddCMkA-1
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loKlS-0025JJ-Ew; Wed, 02 Jun 2021 06:54:07 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  2 Jun 2021 09:53:18 +0300
Message-Id: <20210602065345.355274-4-hch@lst.de>
In-Reply-To: <20210602065345.355274-1-hch@lst.de>
References: <20210602065345.355274-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Spam-Signature: yes
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Justin Sanders <justin@coraid.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Mike Snitzer <snitzer@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	virtualization@lists.linux-foundation.org, dm-devel@redhat.com,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Jack Wang <jinpu.wang@ionos.com>, Tim Waugh <tim@cyberelk.net>,
	linux-s390@vger.kernel.org, Alex Dubov <oakad@yahoo.com>,
	Richard Weinberger <richard@nod.at>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	xen-devel@lists.xenproject.org, Ilya Dryomov <idryomov@gmail.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Heiko Carstens <hca@linux.ibm.com>, Josef Bacik <josef@toxicpanda.com>,
	Denis Efremov <efremov@linux.com>, nbd@other.debian.org,
	linux-block@vger.kernel.org, ceph-devel@vger.kernel.org,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Geoff Levand <geoff@infradead.org>, linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [dm-devel] [PATCH 03/30] blk-mq: add the blk_mq_alloc_disk APIs
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a new API to allocate a gendisk including the request_queue for use
with blk-mq based drivers.  This is to avoid boilerplate code in drivers.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-mq.c         | 19 +++++++++++++++++++
 include/linux/blk-mq.h | 12 ++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/block/blk-mq.c b/block/blk-mq.c
index 6112741e1ff9..1e6036e6fd66 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -3137,6 +3137,25 @@ struct request_queue *blk_mq_init_queue(struct blk_mq_tag_set *set)
 }
 EXPORT_SYMBOL(blk_mq_init_queue);
 
+struct gendisk *__blk_mq_alloc_disk(struct blk_mq_tag_set *set, void *queuedata)
+{
+	struct request_queue *q;
+	struct gendisk *disk;
+
+	q = blk_mq_init_queue_data(set, queuedata);
+	if (IS_ERR(q))
+		return ERR_CAST(q);
+
+	disk = __alloc_disk_node(0, set->numa_node);
+	if (!disk) {
+		blk_cleanup_queue(q);
+		return ERR_PTR(-ENOMEM);
+	}
+	disk->queue = q;
+	return disk;
+}
+EXPORT_SYMBOL(__blk_mq_alloc_disk);
+
 /*
  * Helper for setting up a queue with mq ops, given queue depth, and
  * the passed in mq ops flags.
diff --git a/include/linux/blk-mq.h b/include/linux/blk-mq.h
index 73750b2838d2..f496c6c5b5d2 100644
--- a/include/linux/blk-mq.h
+++ b/include/linux/blk-mq.h
@@ -426,6 +426,18 @@ enum {
 	((policy & ((1 << BLK_MQ_F_ALLOC_POLICY_BITS) - 1)) \
 		<< BLK_MQ_F_ALLOC_POLICY_START_BIT)
 
+#define blk_mq_alloc_disk(set, queuedata)				\
+({									\
+	static struct lock_class_key __key;				\
+	struct gendisk *__disk = __blk_mq_alloc_disk(set, queuedata);	\
+									\
+	if (__disk)							\
+		lockdep_init_map(&__disk->lockdep_map,			\
+			"(bio completion)", &__key, 0);			\
+	__disk;								\
+})
+struct gendisk *__blk_mq_alloc_disk(struct blk_mq_tag_set *set,
+		void *queuedata);
 struct request_queue *blk_mq_init_queue(struct blk_mq_tag_set *);
 struct request_queue *blk_mq_init_queue_data(struct blk_mq_tag_set *set,
 		void *queuedata);
-- 
2.30.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

