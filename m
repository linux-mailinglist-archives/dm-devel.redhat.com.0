Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id A9DCB19FDBE
	for <lists+dm-devel@lfdr.de>; Mon,  6 Apr 2020 20:59:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586199582;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=V7p7RNlqgekUTOQXJmOYg36T22vElvMvj6rkh1EWKLI=;
	b=YO8WYWkvmKT4M+LCbCnDrx78IJnq1gJpqj0QH/eGavmFhwQvQz9Ugbrq+QVD6DphkYIBkx
	DY93+utJTeqIyogIlOoBcW/XNE611ZrB2ahosB/93gyTKSMF9jOPrprZgkF2xh57Zola3R
	B//UqkegI1EVQ6CoFrpgyoslHh/FJ3s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-wJhS-R4vNlyhyhneLxZr3A-1; Mon, 06 Apr 2020 14:59:40 -0400
X-MC-Unique: wJhS-R4vNlyhyhneLxZr3A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3CFF8801F77;
	Mon,  6 Apr 2020 18:59:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 13089A0A6F;
	Mon,  6 Apr 2020 18:59:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3866E18089CF;
	Mon,  6 Apr 2020 18:59:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 036IH6GP003535 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 6 Apr 2020 14:17:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DCAD110F1C1E; Mon,  6 Apr 2020 18:17:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D5BB51004C4A
	for <dm-devel@redhat.com>; Mon,  6 Apr 2020 18:17:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF9A08F6142
	for <dm-devel@redhat.com>; Mon,  6 Apr 2020 18:17:04 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-472-lPjlxO0QNqepp4E6GBGDPA-1;
	Mon, 06 Apr 2020 14:17:02 -0400
X-MC-Unique: lPjlxO0QNqepp4E6GBGDPA-1
Received: from dede-linux.corp.microsoft.com (unknown [131.107.147.242])
	by linux.microsoft.com (Postfix) with ESMTPSA id 11C5820A086B;
	Mon,  6 Apr 2020 11:10:59 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 11C5820A086B
From: deven.desai@linux.microsoft.com
To: agk@redhat.com, axboe@kernel.dk, snitzer@redhat.com, jmorris@namei.org,
	serge@hallyn.com, zohar@linux.ibm.com, linux-integrity@vger.kernel.org, 
	linux-security-module@vger.kernel.org, dm-devel@redhat.com,
	linux-block@vger.kernel.org
Date: Mon,  6 Apr 2020 11:10:45 -0700
Message-Id: <20200406181045.1024164-12-deven.desai@linux.microsoft.com>
In-Reply-To: <20200406181045.1024164-1-deven.desai@linux.microsoft.com>
References: <20200406181045.1024164-1-deven.desai@linux.microsoft.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 036IH6GP003535
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 06 Apr 2020 14:59:16 -0400
Cc: sashal@kernel.org, pasha.tatashin@soleen.com, mdsakib@linux.microsoft.com,
	nramas@linux.microsoft.com, tyhicks@linux.microsoft.com,
	jaskarankhurana@linux.microsoft.com
Subject: [dm-devel] [RESEND PATCH 11/11] cleanup: uapi/linux/audit.h
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Deven Bowers <deven.desai@linux.microsoft.com>

Remove trailing whitespaces and align the integrity #defines in
linux/uapi/audit.h

Signed-off-by: Deven Bowers <deven.desai@linux.microsoft.com>
---
 include/uapi/linux/audit.h | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/include/uapi/linux/audit.h b/include/uapi/linux/audit.h
index 4e0122a0ed0c..d642ade068b5 100644
--- a/include/uapi/linux/audit.h
+++ b/include/uapi/linux/audit.h
@@ -48,7 +48,7 @@
  * 2500 - 2999 future user space (maybe integrity labels and related events)
  *
  * Messages from 1000-1199 are bi-directional. 1200-1299 & 2100 - 2999 are
- * exclusively user space. 1300-2099 is kernel --> user space 
+ * exclusively user space. 1300-2099 is kernel --> user space
  * communication.
  */
 #define AUDIT_GET		1000	/* Get status */
@@ -78,7 +78,7 @@
 #define AUDIT_LAST_USER_MSG	1199
 #define AUDIT_FIRST_USER_MSG2	2100	/* More user space messages */
 #define AUDIT_LAST_USER_MSG2	2999
- 
+
 #define AUDIT_DAEMON_START      1200    /* Daemon startup record */
 #define AUDIT_DAEMON_END        1201    /* Daemon normal stop record */
 #define AUDIT_DAEMON_ABORT      1202    /* Daemon error stop record */
@@ -139,20 +139,20 @@
 #define AUDIT_MAC_CALIPSO_ADD	1418	/* NetLabel: add CALIPSO DOI entry */
 #define AUDIT_MAC_CALIPSO_DEL	1419	/* NetLabel: del CALIPSO DOI entry */
 
-#define AUDIT_FIRST_KERN_ANOM_MSG   1700
-#define AUDIT_LAST_KERN_ANOM_MSG    1799
-#define AUDIT_ANOM_PROMISCUOUS      1700 /* Device changed promiscuous mode */
-#define AUDIT_ANOM_ABEND            1701 /* Process ended abnormally */
-#define AUDIT_ANOM_LINK		    1702 /* Suspicious use of file links */
-#define AUDIT_ANOM_CREAT	    1703 /* Suspicious file creation */
-#define AUDIT_INTEGRITY_DATA	    1800 /* Data integrity verification */
-#define AUDIT_INTEGRITY_METADATA    1801 /* Metadata integrity verification */
-#define AUDIT_INTEGRITY_STATUS	    1802 /* Integrity enable status */
-#define AUDIT_INTEGRITY_HASH	    1803 /* Integrity HASH type */
-#define AUDIT_INTEGRITY_PCR	    1804 /* PCR invalidation msgs */
-#define AUDIT_INTEGRITY_RULE	    1805 /* policy rule */
-#define AUDIT_INTEGRITY_EVM_XATTR   1806 /* New EVM-covered xattr */
-#define AUDIT_INTEGRITY_POLICY_RULE 1807 /* IMA policy rules */
+#define AUDIT_FIRST_KERN_ANOM_MSG	1700
+#define AUDIT_LAST_KERN_ANOM_MSG	1799
+#define AUDIT_ANOM_PROMISCUOUS		1700 /* Device changed promiscuous mode */
+#define AUDIT_ANOM_ABEND		1701 /* Process ended abnormally */
+#define AUDIT_ANOM_LINK			1702 /* Suspicious use of file links */
+#define AUDIT_ANOM_CREAT		1703 /* Suspicious file creation */
+#define AUDIT_INTEGRITY_DATA		1800 /* Data integrity verification */
+#define AUDIT_INTEGRITY_METADATA	1801 /* Metadata integrity verification */
+#define AUDIT_INTEGRITY_STATUS		1802 /* Integrity enable status */
+#define AUDIT_INTEGRITY_HASH		1803 /* Integrity HASH type */
+#define AUDIT_INTEGRITY_PCR		1804 /* PCR invalidation msgs */
+#define AUDIT_INTEGRITY_RULE		1805 /* policy rule */
+#define AUDIT_INTEGRITY_EVM_XATTR	1806 /* New EVM-covered xattr */
+#define AUDIT_INTEGRITY_POLICY_RULE	1807 /* IMA policy rules */
 #define AUDIT_INTEGRITY_POLICY_LOAD	1808 /* IPE Policy Load */
 #define AUDIT_INTEGRITY_POLICY_ACTIVATE	1809 /* IPE Policy Activation */
 #define AUDIT_INTEGRITY_EVENT		1810 /* IPE Evaluation Event */
-- 
2.26.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

