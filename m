Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4E4C92019E6
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jun 2020 20:02:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592589756;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SozOk+JFLH0bQ3XotFmFfl7xZaqQAFEqKp2flRc+woU=;
	b=cqTHZwxS82LkI2q2MbwNzjJAL6OPEuupxZlwj6Ihb7HiupCXkvAWYDAMtTu2/yNpj4F2aD
	WzG1y4Pivh0H7G57qsoL7mwn6UMHyH4E/35r/VRlBgH9TyzFQLZWRXt8caF+XO5jAJTAL+
	7s4IxjdOzmpKaGaMPnHfiK/3a5gXszY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-rnwULjk1PbCJqSMuhe3EWQ-1; Fri, 19 Jun 2020 14:02:33 -0400
X-MC-Unique: rnwULjk1PbCJqSMuhe3EWQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16E5D1800D42;
	Fri, 19 Jun 2020 18:02:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 984F760BF4;
	Fri, 19 Jun 2020 18:02:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D1015833A3;
	Fri, 19 Jun 2020 18:02:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05JI05b3009240 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 14:00:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5B5F910023A0; Fri, 19 Jun 2020 18:00:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from bgurney.remote.csb (ovpn-115-194.rdu2.redhat.com
	[10.10.115.194])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 872D2100238D;
	Fri, 19 Jun 2020 17:59:56 +0000 (UTC)
From: Bryan Gurney <bgurney@redhat.com>
To: dm-devel@redhat.com, snitzer@redhat.com, agk@redhat.com
Date: Fri, 19 Jun 2020 13:59:53 -0400
Message-Id: <1592589593-26739-1-git-send-email-bgurney@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: Bryan Gurney <bgurney@redhat.com>
Subject: [dm-devel] [PATCH] dm dust: update documentation to reflect
	__func__ output
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The dm-dust messages "queryblock" and "clearbadblocks" now print
the function name in the DMEMIT output.  Update the documentation
to match the appearance of the actual output.

Signed-off-by: Bryan Gurney <bgurney@redhat.com>
---
 Documentation/admin-guide/device-mapper/dm-dust.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/device-mapper/dm-dust.rst b/Documentation/admin-guide/device-mapper/dm-dust.rst
index 5c66a71e3442..75bc396ebeb1 100644
--- a/Documentation/admin-guide/device-mapper/dm-dust.rst
+++ b/Documentation/admin-guide/device-mapper/dm-dust.rst
@@ -177,11 +177,11 @@ following message command::
 
 The following message will print if the block is in the list::
 
-        block 72 found in badblocklist
+        dust_query_block: block 72 found in badblocklist
 
 The following message will print if the block is not in the list::
 
-        block 72 not found in badblocklist
+        dust_query_block: block 72 not found in badblocklist
 
 The "queryblock" message command will work in both the "enabled"
 and "disabled" modes, allowing the verification of whether a block
@@ -199,12 +199,12 @@ following message command::
 
 After clearing the bad block list, the following message will appear::
 
-        badblocks cleared
+        dust_clear_badblocks: badblocks cleared
 
 If there were no bad blocks to clear, the following message will
 appear::
 
-        no badblocks found
+        dust_clear_badblocks: no badblocks found
 Listing the bad block list
 --------------------------
 
-- 
2.25.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

