Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 33C70201CF3
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jun 2020 23:12:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592601163;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kfcFHVjdZgP2PUAjsmdddC7IWMGMA4BRt/cSgtIrx+A=;
	b=ViSyzuIuEaUdEK2X1TyeITu3AUrP0u9BWFaBQ42lv5A2p3FMOA4w2n6IW3OxvuH7NNhJbQ
	h3uxV2BAXnthgInKOLIU5Xf6pUZdMVahmcIbRNUUVQoED73tn0wtYF3t3L+4GRtAsmZJmd
	jJ56+2WMcSpMWdH6xhtAUb5lkE9wT6k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-BQ7kY2OPM-SkJYmrbMlUEw-1; Fri, 19 Jun 2020 17:12:40 -0400
X-MC-Unique: BQ7kY2OPM-SkJYmrbMlUEw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F4C3835B44;
	Fri, 19 Jun 2020 21:12:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 934FE5C221;
	Fri, 19 Jun 2020 21:12:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D7C83833C8;
	Fri, 19 Jun 2020 21:12:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05JLCSp5006221 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 17:12:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 89A1619934; Fri, 19 Jun 2020 21:12:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from bgurney.remote.csb (ovpn-115-194.rdu2.redhat.com
	[10.10.115.194])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BA22119D9E;
	Fri, 19 Jun 2020 21:12:21 +0000 (UTC)
From: Bryan Gurney <bgurney@redhat.com>
To: dm-devel@redhat.com, snitzer@redhat.com, agk@redhat.com
Date: Fri, 19 Jun 2020 17:11:44 -0400
Message-Id: <1592601104-3978-1-git-send-email-bgurney@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: yangerkun <yangerkun@huawei.com>, Bryan Gurney <bgurney@redhat.com>
Subject: [dm-devel] [PATCH v4 2/4] dm dust: update doc after message results
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
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: yangerkun <yangerkun@huawei.com>

From: yangerkun <yangerkun@huawei.com>

Since some type of message will report the results to user directly,
we should update the doc too.

[Bryan: update output examples to include function name printing]

Signed-off-by: yangerkun <yangerkun@huawei.com>
Signed-off-by: Bryan Gurney <bgurney@redhat.com>
---
 .../admin-guide/device-mapper/dm-dust.rst         | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/Documentation/admin-guide/device-mapper/dm-dust.rst b/Documentation/admin-guide/device-mapper/dm-dust.rst
index b6e7e7ead831..cf8079e368de 100644
--- a/Documentation/admin-guide/device-mapper/dm-dust.rst
+++ b/Documentation/admin-guide/device-mapper/dm-dust.rst
@@ -69,10 +69,11 @@ Create the dm-dust device:
         $ sudo dmsetup create dust1 --table '0 33552384 dust /dev/vdb1 0 4096'
 
 Check the status of the read behavior ("bypass" indicates that all I/O
-will be passed through to the underlying device)::
+will be passed through to the underlying device; "verbose" indicates that
+bad block additions, removals, and remaps will be verbosely logged)::
 
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
+        dust_query_block: block 72 found in badblocklist
 
 The following message will print if the block is not in the list::
 
-        device-mapper: dust: queryblock: block 72 not found in badblocklist
+        dust_query_block: block 72 not found in badblocklist
 
 The "queryblock" message command will work in both the "enabled"
 and "disabled" modes, allowing the verification of whether a block
@@ -198,12 +199,12 @@ following message command::
 
 After clearing the bad block list, the following message will appear::
 
-        kernel: device-mapper: dust: clearbadblocks: badblocks cleared
+        dust_clear_badblocks: badblocks cleared
 
 If there were no bad blocks to clear, the following message will
 appear::
 
-        kernel: device-mapper: dust: clearbadblocks: no badblocks found
+        dust_clear_badblocks: no badblocks found
 
 Message commands list
 ---------------------
-- 
2.25.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

