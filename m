Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3E89C1F8EDF
	for <lists+dm-devel@lfdr.de>; Mon, 15 Jun 2020 08:58:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592204280;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xLRp1VnWbOMPNeLYEhkp16CS2Dx/ywnU8wyfd+s64Ig=;
	b=Jw8dV9d7MIT1Ubm4vBoJMc4pVFS6sPEjOBmDByoYzzrPbOsYgGjcyoAA86nS75az5ncath
	VP4S6BvzF+4TwB985+9d7rlBtNKWhlSywje5S385+MxuCskrh1F6LwRIqU0/NNGPhQ2fDi
	0uHjEuoojHS5g6P79IxQXMRG/6lCWIg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-l5VxbCnGN769xc7Sh4Z9Zw-1; Mon, 15 Jun 2020 02:57:57 -0400
X-MC-Unique: l5VxbCnGN769xc7Sh4Z9Zw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8117D809880;
	Mon, 15 Jun 2020 06:57:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 626D15C1C5;
	Mon, 15 Jun 2020 06:57:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E3E5C833CA;
	Mon, 15 Jun 2020 06:57:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05CGBVMx027904 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 12 Jun 2020 12:11:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E2B442166B28; Fri, 12 Jun 2020 16:11:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DEBCD2166BA0
	for <dm-devel@redhat.com>; Fri, 12 Jun 2020 16:11:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ABA94858EE6
	for <dm-devel@redhat.com>; Fri, 12 Jun 2020 16:11:28 +0000 (UTC)
Received: from sender4-pp-o92.zoho.com (sender4-pp-o92.zoho.com
	[136.143.188.92]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-101-VQQREMIbNRSzD4SyWc-kbg-1; Fri, 12 Jun 2020 12:11:20 -0400
X-MC-Unique: VQQREMIbNRSzD4SyWc-kbg-1
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zapps768; d=zoho.com; 
	h=from:to:cc:subject:date:message-id; 
	b=vJwJXSqwD1evDm12+N1z4hvQCTPTSLWJGxgC/c2OJlC9xkFqYBUScBdtOV/goP9K5kVLd3ZI0FqP
	T1Mh4XAWe6sIpWT9EUMS3UlgkiqnShLznaL0niRTvEOQhWPKJdFj
Received: from YEHS1XPF1D05WL.lenovo.com (111.197.254.230 [111.197.254.230])
	by mx.zohomail.com with SMTPS id 159197736366961.0283403658716;
	Fri, 12 Jun 2020 08:56:03 -0700 (PDT)
From: Huaisheng Ye <yehs2007@zoho.com>
To: mpatocka@redhat.com, snitzer@redhat.com, agk@redhat.com
Date: Fri, 12 Jun 2020 23:55:44 +0800
Message-Id: <20200612155544.90348-1-yehs2007@zoho.com>
X-ZohoMailClient: External
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 15 Jun 2020 02:57:28 -0400
Cc: dm-devel@redhat.com, linux-kernel@vger.kernel.org,
	Huaisheng Ye <yehs1@lenovo.com>
Subject: [dm-devel] [PATCH] dm writecache: skip writecache_wait when using
	pmem mode
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
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Huaisheng Ye <yehs1@lenovo.com>

The array bio_in_progress is only used with ssd mode. So skip
writecache_wait_for_ios in writecache_discard when pmem mode.

Signed-off-by: Huaisheng Ye <yehs1@lenovo.com>
---
 drivers/md/dm-writecache.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/md/dm-writecache.c b/drivers/md/dm-writecache.c
index 66f3a3b..4367cc7 100644
--- a/drivers/md/dm-writecache.c
+++ b/drivers/md/dm-writecache.c
@@ -849,8 +849,10 @@ static void writecache_discard(struct dm_writecache *wc, sector_t start, sector_
 
 		if (likely(!e->write_in_progress)) {
 			if (!discarded_something) {
-				writecache_wait_for_ios(wc, READ);
-				writecache_wait_for_ios(wc, WRITE);
+				if (!WC_MODE_PMEM(wc)) {
+					writecache_wait_for_ios(wc, READ);
+					writecache_wait_for_ios(wc, WRITE);
+				}
 				discarded_something = true;
 			}
 			writecache_free_entry(wc, e);
-- 
1.8.3.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

