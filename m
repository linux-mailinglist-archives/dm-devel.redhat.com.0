Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 0178921F449
	for <lists+dm-devel@lfdr.de>; Tue, 14 Jul 2020 16:39:59 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-x9woxJSCMpaSAqtvLjlE2g-1; Tue, 14 Jul 2020 10:39:56 -0400
X-MC-Unique: x9woxJSCMpaSAqtvLjlE2g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C4058027F6;
	Tue, 14 Jul 2020 14:39:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DBA15D9C5;
	Tue, 14 Jul 2020 14:39:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 85AEF93F93;
	Tue, 14 Jul 2020 14:39:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06EEdKSj000317 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 14 Jul 2020 10:39:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DC3632156A30; Tue, 14 Jul 2020 14:39:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D84512157F26
	for <dm-devel@redhat.com>; Tue, 14 Jul 2020 14:39:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1860985A5B2
	for <dm-devel@redhat.com>; Tue, 14 Jul 2020 14:39:17 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-375-C4IMrdibOUC9Fz3cVLsLtA-1;
	Tue, 14 Jul 2020 10:39:13 -0400
X-MC-Unique: C4IMrdibOUC9Fz3cVLsLtA-1
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
	[73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 7A0202253D;
	Tue, 14 Jul 2020 14:39:11 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Tue, 14 Jul 2020 10:38:48 -0400
Message-Id: <20200714143849.4035283-18-sashal@kernel.org>
In-Reply-To: <20200714143849.4035283-1-sashal@kernel.org>
References: <20200714143849.4035283-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06EEdKSj000317
X-loop: dm-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	dm-devel@redhat.com, Christoph Hellwig <hch@lst.de>,
	Mike Snitzer <snitzer@redhat.com>
Subject: [dm-devel] [PATCH AUTOSEL 5.7 18/19] dm: use bio_uninit instead of
	bio_disassociate_blkg
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Christoph Hellwig <hch@lst.de>

[ Upstream commit 382761dc6312965a11f82f2217e16ec421bf17ae ]

bio_uninit is the proper API to clean up a BIO that has been allocated
on stack or inside a structure that doesn't come from the BIO allocator.
Switch dm to use that instead of bio_disassociate_blkg, which really is
an implementation detail.  Note that the bio_uninit calls are also moved
to the two callers of __send_empty_flush, so that they better pair with
the bio_init calls used to initialize them.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Signed-off-by: Mike Snitzer <snitzer@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/md/dm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index db9e461146531..c33aaf29f1379 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1445,9 +1445,6 @@ static int __send_empty_flush(struct clone_info *ci)
 	BUG_ON(bio_has_data(ci->bio));
 	while ((ti = dm_table_get_target(ci->map, target_nr++)))
 		__send_duplicate_bios(ci, ti, ti->num_flush_bios, NULL);
-
-	bio_disassociate_blkg(ci->bio);
-
 	return 0;
 }
 
@@ -1635,6 +1632,7 @@ static blk_qc_t __split_and_process_bio(struct mapped_device *md,
 		ci.bio = &flush_bio;
 		ci.sector_count = 0;
 		error = __send_empty_flush(&ci);
+		bio_uninit(ci.bio);
 		/* dec_pending submits any data associated with flush */
 	} else if (op_is_zone_mgmt(bio_op(bio))) {
 		ci.bio = bio;
@@ -1709,6 +1707,7 @@ static blk_qc_t __process_bio(struct mapped_device *md, struct dm_table *map,
 		ci.bio = &flush_bio;
 		ci.sector_count = 0;
 		error = __send_empty_flush(&ci);
+		bio_uninit(ci.bio);
 		/* dec_pending submits any data associated with flush */
 	} else {
 		struct dm_target_io *tio;
-- 
2.25.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

