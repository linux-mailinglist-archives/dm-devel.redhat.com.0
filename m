Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id F3C87201CF5
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jun 2020 23:14:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592601247;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lO7dF7MI65rtdlHVz9zywjOeTV+GOWxBOXag/6R6WBc=;
	b=hIFEKQmyjzT6w96fLXlBjQ+4x65f+tJ8lAi0CcHk7en6mgJXxDubBi6QD9raudt6WSnMaa
	tUb43RcXWGRr5KLAVscmV/adwNThQWYAz7Kg6SPBMtaNKAOjAOUS87W6O663Efuj/qtSuC
	2cpRPIloIzI6wR7b3dM366iWW01HxYA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-IfrffdaQNCOdoaP-6B7UFw-1; Fri, 19 Jun 2020 17:14:04 -0400
X-MC-Unique: IfrffdaQNCOdoaP-6B7UFw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67432801503;
	Fri, 19 Jun 2020 21:13:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 13AA6709D7;
	Fri, 19 Jun 2020 21:13:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6B6531809547;
	Fri, 19 Jun 2020 21:13:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05JLDILi006385 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 17:13:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2912D5C240; Fri, 19 Jun 2020 21:13:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from bgurney.remote.csb (ovpn-115-194.rdu2.redhat.com
	[10.10.115.194])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C64A55C1D0;
	Fri, 19 Jun 2020 21:13:12 +0000 (UTC)
From: Bryan Gurney <bgurney@redhat.com>
To: dm-devel@redhat.com, snitzer@redhat.com, agk@redhat.com
Date: Fri, 19 Jun 2020 17:13:04 -0400
Message-Id: <1592601184-4168-1-git-send-email-bgurney@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: yangerkun <yangerkun@huawei.com>, Bryan Gurney <bgurney@redhat.com>
Subject: [dm-devel] [PATCH v4 4/4] dm dust: introduce listbadblocks in the
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
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: yangerkun <yangerkun@huawei.com>

From: yangerkun <yangerkun@huawei.com>

Since we support the listbadblocks command, introduce the detail in the
doc.

[Bryan: formatting and wording fixes]

Signed-off-by: yangerkun <yangerkun@huawei.com>
Signed-off-by: Bryan Gurney <bgurney@redhat.com>
---
 .../admin-guide/device-mapper/dm-dust.rst       | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/admin-guide/device-mapper/dm-dust.rst b/Documentation/admin-guide/device-mapper/dm-dust.rst
index cf8079e368de..e35ec8cd2f88 100644
--- a/Documentation/admin-guide/device-mapper/dm-dust.rst
+++ b/Documentation/admin-guide/device-mapper/dm-dust.rst
@@ -206,6 +206,22 @@ appear::
 
         dust_clear_badblocks: no badblocks found
 
+Listing the bad block list
+--------------------------
+
+To list all bad blocks in the bad block list (using an example device
+with blocks 1 and 2 in the bad block list), run the following message
+command::
+
+        $ sudo dmsetup message dust1 0 listbadblocks
+        1
+        2
+
+If there are no bad blocks in the bad block list, the command will
+execute with no output::
+
+        $ sudo dmsetup message dust1 0 listbadblocks
+
 Message commands list
 ---------------------
 
@@ -224,6 +240,7 @@ Single argument message commands::
 
         countbadblocks
         clearbadblocks
+        listbadblocks
         disable
         enable
         quiet
-- 
2.25.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

