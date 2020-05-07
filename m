Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id F3FAB1CD39D
	for <lists+dm-devel@lfdr.de>; Mon, 11 May 2020 10:18:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589185137;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gy0PFCkC5AYehxNmzOIAlqQQNDphOSJ+n/oJ1RdDnqg=;
	b=Mm3wqkYXYmeDbbp+xw2fkxJ+Ty3BzBVdyxnPGcR3fMAYKtRa3yxd98UWzjJPeump7xYnyL
	Tu9yz5s/6BF2KpFnzl1quXKTacdDiyHqQaeYn8JL95uwtH6DGqJeRqSJuRvpFTUAUpFBsl
	wg4jcgLPozWw3nk+u3XHQzB2iWgJJHY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-cxEQKXZtNTuzzyvTotM_6w-1; Mon, 11 May 2020 04:18:55 -0400
X-MC-Unique: cxEQKXZtNTuzzyvTotM_6w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A3F8EC1A2;
	Mon, 11 May 2020 08:18:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 61F5670943;
	Mon, 11 May 2020 08:18:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 618611809554;
	Mon, 11 May 2020 08:18:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 047NDg2E032035 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 7 May 2020 19:13:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B0B1B2156A2E; Thu,  7 May 2020 23:13:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ACE042166B28
	for <dm-devel@redhat.com>; Thu,  7 May 2020 23:13:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CBFE5101A526
	for <dm-devel@redhat.com>; Thu,  7 May 2020 23:13:34 +0000 (UTC)
Received: from wout1-smtp.messagingengine.com
	(wout1-smtp.messagingengine.com [64.147.123.24]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-148-ILd2aChmNg-_hqCySGIhyg-1;
	Thu, 07 May 2020 19:13:32 -0400
X-MC-Unique: ILd2aChmNg-_hqCySGIhyg-1
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 376B7D28;
	Thu,  7 May 2020 19:06:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
	by compute4.internal (MEProxy); Thu, 07 May 2020 19:06:03 -0400
X-ME-Sender: <xms:WpS0Xm8chMSlePsvAajlUfAQ-1T6roEGtDNKPsy6wg6E-QlG1MK6Bg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrkedugdduiecutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
	fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepmfhjvghtihhlucfq
	rhgsvghkkhcuoehkjhesohhrsggvkhhkrdgtohhmqeenucggtffrrghtthgvrhhnpeegke
	dtudfhveevteeugfdvueekgedugeeihfektdefhfelueeuudfhvdeludejtdenucfkphep
	vdegrdduleefrdejrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
	hmrghilhhfrhhomhepkhhjsehorhgsvghkkhdrtghomh
X-ME-Proxy: <xmx:WpS0XkE-4GmzHRk9FXTPnrNr1Kc2TDaAqLFZHSb2cUwjhodEvKlg8A>
	<xmx:WpS0Xlj4xhAmsPWDB6434B3j5aleF_yM1HeXBV5QairIRPeZ1-smEA>
	<xmx:WpS0XpuPcbL8LMRuK0UEr6KTly44YCwZUM4P7FwNpvG-5O6EPBxF_g>
	<xmx:WpS0XseQwdx3jd36EBLKzkjooNgW8oFCt98aUjKrlWlxSR-VwG13GQ>
Received: from firelink.nyc.rr.com (cpe-24-193-7-101.nyc.res.rr.com
	[24.193.7.101])
	by mail.messagingengine.com (Postfix) with ESMTPA id BA0FF3280067;
	Thu,  7 May 2020 19:06:01 -0400 (EDT)
From: Kjetil Orbekk <kj@orbekk.com>
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com, linux-block@vger.kernel.org
Date: Thu,  7 May 2020 19:05:33 -0400
Message-Id: <20200507230532.5733-1-kj@orbekk.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 047NDg2E032035
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 11 May 2020 04:18:30 -0400
Cc: Kjetil Orbekk <kj@orbekk.com>, harshads@google.com,
	Khazhismel Kumykov <khazhy@google.com>
Subject: [dm-devel] [PATCH] dm: track io errors per mapped device
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Khazhismel Kumykov <khazhy@google.com>

This will track ioerr_cnt on all dm targets and expose it as
<device>/dm/ioerr_cnt.

Signed-off-by: Khazhismel Kumykov <khazhy@google.com>
[kj@orbekk.com: added support for bio based devices in dm.c]
Signed-off-by: Kjetil Orbekk <kj@orbekk.com>
---
 drivers/md/dm-core.h  |  2 ++
 drivers/md/dm-rq.c    |  4 ++++
 drivers/md/dm-sysfs.c |  8 ++++++++
 drivers/md/dm.c       | 10 ++++++++++
 drivers/md/dm.h       |  1 +
 5 files changed, 25 insertions(+)

diff --git a/drivers/md/dm-core.h b/drivers/md/dm-core.h
index c4ef1fceead6..c6cc0f9e4d9a 100644
--- a/drivers/md/dm-core.h
+++ b/drivers/md/dm-core.h
@@ -108,6 +108,8 @@ struct mapped_device {
 
 	struct dm_stats stats;
 
+	atomic_t ioerr_cnt;
+
 	/* for blk-mq request-based DM support */
 	struct blk_mq_tag_set *tag_set;
 	bool init_tio_pdu:1;
diff --git a/drivers/md/dm-rq.c b/drivers/md/dm-rq.c
index 3f8577e2c13b..1c1fe96ca7a4 100644
--- a/drivers/md/dm-rq.c
+++ b/drivers/md/dm-rq.c
@@ -171,6 +171,8 @@ static void dm_end_request(struct request *clone, blk_status_t error)
 	tio->ti->type->release_clone_rq(clone, NULL);
 
 	rq_end_stats(md, rq);
+	if (error)
+		atomic_inc(&md->ioerr_cnt);
 	blk_mq_end_request(rq, error);
 	rq_completed(md);
 }
@@ -268,6 +270,8 @@ static void dm_softirq_done(struct request *rq)
 		struct mapped_device *md = tio->md;
 
 		rq_end_stats(md, rq);
+		if (tio->error)
+			atomic_inc(&md->ioerr_cnt);
 		blk_mq_end_request(rq, tio->error);
 		rq_completed(md);
 		return;
diff --git a/drivers/md/dm-sysfs.c b/drivers/md/dm-sysfs.c
index a05fcd50e1b9..5d59790b4b17 100644
--- a/drivers/md/dm-sysfs.c
+++ b/drivers/md/dm-sysfs.c
@@ -74,6 +74,12 @@ static ssize_t dm_attr_name_show(struct mapped_device *md, char *buf)
 	return strlen(buf);
 }
 
+static ssize_t dm_attr_ioerr_cnt_show(struct mapped_device *md, char *buf)
+{
+	sprintf(buf, "%d\n", dm_ioerr_cnt(md));
+	return strlen(buf);
+}
+
 static ssize_t dm_attr_uuid_show(struct mapped_device *md, char *buf)
 {
 	if (dm_copy_name_and_uuid(md, NULL, buf))
@@ -99,6 +105,7 @@ static ssize_t dm_attr_use_blk_mq_show(struct mapped_device *md, char *buf)
 }
 
 static DM_ATTR_RO(name);
+static DM_ATTR_RO(ioerr_cnt);
 static DM_ATTR_RO(uuid);
 static DM_ATTR_RO(suspended);
 static DM_ATTR_RO(use_blk_mq);
@@ -106,6 +113,7 @@ static DM_ATTR_RW(rq_based_seq_io_merge_deadline);
 
 static struct attribute *dm_attrs[] = {
 	&dm_attr_name.attr,
+	&dm_attr_ioerr_cnt.attr,
 	&dm_attr_uuid.attr,
 	&dm_attr_suspended.attr,
 	&dm_attr_use_blk_mq.attr,
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index db9e46114653..7a264379473e 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1017,6 +1017,9 @@ static void clone_endio(struct bio *bio)
 			disable_write_zeroes(md);
 	}
 
+	if (error)
+		atomic_inc(&md->ioerr_cnt);
+
 	if (endio) {
 		int r = endio(tio->ti, bio, &error);
 		switch (r) {
@@ -1304,6 +1307,7 @@ static blk_qc_t __map_bio(struct dm_target_io *tio)
 		break;
 	case DM_MAPIO_KILL:
 		free_tio(tio);
+		atomic_inc(&md->ioerr_cnt);
 		dec_pending(io, BLK_STS_IOERR);
 		break;
 	case DM_MAPIO_REQUEUE:
@@ -2014,6 +2018,7 @@ static struct mapped_device *alloc_dev(int minor)
 		goto bad;
 
 	dm_stats_init(&md->stats);
+	atomic_set(&md->ioerr_cnt, 0);
 
 	/* Populate the mapping, nobody knows we exist yet */
 	spin_lock(&_minor_lock);
@@ -2992,6 +2997,11 @@ int dm_noflush_suspending(struct dm_target *ti)
 }
 EXPORT_SYMBOL_GPL(dm_noflush_suspending);
 
+int dm_ioerr_cnt(struct mapped_device *md)
+{
+	return atomic_read(&md->ioerr_cnt);
+}
+
 struct dm_md_mempools *dm_alloc_md_mempools(struct mapped_device *md, enum dm_queue_mode type,
 					    unsigned integrity, unsigned per_io_data_size,
 					    unsigned min_pool_size)
diff --git a/drivers/md/dm.h b/drivers/md/dm.h
index d7c4f6606b5f..fafb9d379ce9 100644
--- a/drivers/md/dm.h
+++ b/drivers/md/dm.h
@@ -82,6 +82,7 @@ void dm_unlock_md_type(struct mapped_device *md);
 void dm_set_md_type(struct mapped_device *md, enum dm_queue_mode type);
 enum dm_queue_mode dm_get_md_type(struct mapped_device *md);
 struct target_type *dm_get_immutable_target_type(struct mapped_device *md);
+int dm_ioerr_cnt(struct mapped_device *md);
 
 int dm_setup_md_queue(struct mapped_device *md, struct dm_table *t);
 
-- 
2.25.4


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

