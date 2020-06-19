Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 30DC12008DA
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jun 2020 14:39:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592570364;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Io69KGAvEMPG5swmlvDJYyq7TcvQjmnlSS9j7rqHRG0=;
	b=DMYTkAp7leLR8VZt2CRtvGOLFSofJ/CJpxTjqCnIvD3kGFjG21dT6gKijf2kVg+q2FNtTe
	KlfEGdgI7BFKKUCh4O78ujC18vbHkl/WcHsVWLtKTDvyDgE8AXWSDTVqO2WNeeJZs+ggc8
	UpG5t9rVl4wdbZEbB+BFHWqxo2VtRZc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-uwp8ULscN-yEjP7psMpy_g-1; Fri, 19 Jun 2020 08:39:22 -0400
X-MC-Unique: uwp8ULscN-yEjP7psMpy_g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0FDF64AF1;
	Fri, 19 Jun 2020 12:39:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B02615BAD6;
	Fri, 19 Jun 2020 12:39:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6F2E4833D0;
	Fri, 19 Jun 2020 12:39:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05JCbD6N027936 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 08:37:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7D58D105543A; Fri, 19 Jun 2020 12:37:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 78B841055435
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 12:37:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6D428316EB
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 12:37:10 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-502-MWtiLHCkMuKZF_D4QBoYQw-1; Fri, 19 Jun 2020 08:37:07 -0400
X-MC-Unique: MWtiLHCkMuKZF_D4QBoYQw-1
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id B9C83E38B2E8B870AC1E;
	Fri, 19 Jun 2020 20:36:59 +0800 (CST)
Received: from code-website.localdomain (10.175.127.227) by
	DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server
	id 14.3.487.0; Fri, 19 Jun 2020 20:36:52 +0800
From: yangerkun <yangerkun@huawei.com>
To: <snitzer@redhat.com>, <bgurney@redhat.com>, <agk@redhat.com>,
	<bmr@redhat.com>
Date: Fri, 19 Jun 2020 20:38:01 +0800
Message-ID: <20200619123803.1441373-3-yangerkun@huawei.com>
In-Reply-To: <20200619123803.1441373-1-yangerkun@huawei.com>
References: <20200619123803.1441373-1-yangerkun@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05JCbD6N027936
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 19 Jun 2020 08:38:54 -0400
Cc: dm-devel@redhat.com, yangerkun@huawei.com
Subject: [dm-devel] [PATCH v3 2/4] dm dust: update doc after message results
	report to user directly
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Since some type of message will report the results to user directly,
we should update the doc too.

Signed-off-by: yangerkun <yangerkun@huawei.com>
---
 .../admin-guide/device-mapper/dm-dust.rst         | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/Documentation/admin-guide/device-mapper/dm-dust.rst b/Documentation/admin-guide/device-mapper/dm-dust.rst
index b6e7e7ead831..84149c08b68f 100644
--- a/Documentation/admin-guide/device-mapper/dm-dust.rst
+++ b/Documentation/admin-guide/device-mapper/dm-dust.rst
@@ -69,10 +69,11 @@ Create the dm-dust device:
         $ sudo dmsetup create dust1 --table '0 33552384 dust /dev/vdb1 0 4096'
 
 Check the status of the read behavior ("bypass" indicates that all I/O
-will be passed through to the underlying device)::
+will be passed through to the underlying device, "verbose" indicates that
+we will log everythings like bad blocks added, removed, or "remapped")::
 
         $ sudo dmsetup status dust1
-        0 33552384 dust 252:17 bypass
+        0 33552384 dust 252:17 bypass verbose
 
         $ sudo dd if=/dev/mapper/dust1 of=/dev/null bs=512 count=128 iflag=direct
         128+0 records in
@@ -164,7 +165,7 @@ following message command::
 A message will print with the number of bad blocks currently
 configured on the device::
 
-        kernel: device-mapper: dust: countbadblocks: 895 badblock(s) found
+        countbadblocks: 895 badblock(s) found
 
 Querying for specific bad blocks
 --------------------------------
@@ -176,11 +177,11 @@ following message command::
 
 The following message will print if the block is in the list::
 
-        device-mapper: dust: queryblock: block 72 found in badblocklist
+        block 72 found in badblocklist
 
 The following message will print if the block is not in the list::
 
-        device-mapper: dust: queryblock: block 72 not found in badblocklist
+        block 72 not found in badblocklist
 
 The "queryblock" message command will work in both the "enabled"
 and "disabled" modes, allowing the verification of whether a block
@@ -198,12 +199,12 @@ following message command::
 
 After clearing the bad block list, the following message will appear::
 
-        kernel: device-mapper: dust: clearbadblocks: badblocks cleared
+        badblocks cleared
 
 If there were no bad blocks to clear, the following message will
 appear::
 
-        kernel: device-mapper: dust: clearbadblocks: no badblocks found
+        no badblocks found
 
 Message commands list
 ---------------------
-- 
2.25.4


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

