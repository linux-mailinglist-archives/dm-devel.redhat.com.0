Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 5FC982008E6
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jun 2020 14:40:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592570409;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XT9kVvN7cKUg1UhT2KMHjAMjpJ1PzeWUZSZUHvbK0jQ=;
	b=Y4m+Voo2oLVjE9YZTOWoYGqV/5T3pu34lryonZxd0je5F0LI9nQ5HKL+p7GTbv8fu+zRwL
	KBd+pxlXMJocQbw+OrEISLyd+YZhBuZmcmIZz0nj9AXjYe2I1P1QjyxzGxJBjnnQYmMbEB
	8wLgVW4rv/N3L6IbbfYMJXKBvSTJ8iU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-zuaa7QcSMa6trxRiXO830A-1; Fri, 19 Jun 2020 08:39:26 -0400
X-MC-Unique: zuaa7QcSMa6trxRiXO830A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F190564AD2;
	Fri, 19 Jun 2020 12:39:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C9D281002388;
	Fri, 19 Jun 2020 12:39:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 714CC833D3;
	Fri, 19 Jun 2020 12:39:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05I95bPi029509 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 18 Jun 2020 05:05:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DCC192028CD2; Thu, 18 Jun 2020 09:05:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D883F20267F2
	for <dm-devel@redhat.com>; Thu, 18 Jun 2020 09:05:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD6A01033654
	for <dm-devel@redhat.com>; Thu, 18 Jun 2020 09:05:37 +0000 (UTC)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-325-4k5HjnvPMm6vTaudXgleOQ-1; Thu, 18 Jun 2020 05:05:32 -0400
X-MC-Unique: 4k5HjnvPMm6vTaudXgleOQ-1
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 99189FC5DF41890B71E3;
	Thu, 18 Jun 2020 17:05:19 +0800 (CST)
Received: from code-website.localdomain (10.175.127.227) by
	DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server
	id 14.3.487.0; Thu, 18 Jun 2020 17:05:10 +0800
From: yangerkun <yangerkun@huawei.com>
To: <snitzer@redhat.com>, <bgurney@redhat.com>, <agk@redhat.com>,
	<bmr@redhat.com>
Date: Thu, 18 Jun 2020 17:06:20 +0800
Message-ID: <20200618090620.3517530-3-yangerkun@huawei.com>
In-Reply-To: <20200618090620.3517530-1-yangerkun@huawei.com>
References: <20200618090620.3517530-1-yangerkun@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05I95bPi029509
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 19 Jun 2020 08:38:54 -0400
Cc: dm-devel@redhat.com, yangerkun@huawei.com
Subject: [dm-devel] [PATCH v2 2/2] dm dust: introduce list badblocks in the
	rst
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Since we can list bad blocks with command status, introduce the detail
in the doc.

Signed-off-by: yangerkun <yangerkun@huawei.com>
---
 .../admin-guide/device-mapper/dm-dust.rst          | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/admin-guide/device-mapper/dm-dust.rst b/Documentation/admin-guide/device-mapper/dm-dust.rst
index b6e7e7ead831..9267d9330482 100644
--- a/Documentation/admin-guide/device-mapper/dm-dust.rst
+++ b/Documentation/admin-guide/device-mapper/dm-dust.rst
@@ -205,6 +205,20 @@ appear::
 
         kernel: device-mapper: dust: clearbadblocks: no badblocks found
 
+Listing the bad blocks
+----------------------
+
+After we have add some bad blocks(like block 1 and 2), run the following
+command can help us to check the bad blocks::
+
+        $ sudo dmsetup status dust1
+        0 33552384 dust 252:17 bypass verbose badblocks list: 1 2
+
+And if there is no bad blocks, we will get following results::
+
+        $ sudo dmsetup status dust1
+        0 33552384 dust 252:17 bypass verbose badblocks list: null
+
 Message commands list
 ---------------------
 
-- 
2.25.4


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

