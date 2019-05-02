Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 5476512452
	for <lists+dm-devel@lfdr.de>; Thu,  2 May 2019 23:49:34 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 016B23092648;
	Thu,  2 May 2019 21:49:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 425795C1B4;
	Thu,  2 May 2019 21:49:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 96E6441F3D;
	Thu,  2 May 2019 21:49:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x42Ln8HC013621 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 2 May 2019 17:49:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 124B7423D; Thu,  2 May 2019 21:49:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BBBE18EED
	for <dm-devel@redhat.com>; Thu,  2 May 2019 21:49:05 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7E0073098576
	for <dm-devel@redhat.com>; Thu,  2 May 2019 21:49:04 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id e9so5404326wrc.1
	for <dm-devel@redhat.com>; Thu, 02 May 2019 14:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6+Pb/VtB05jbzfckIpSqa+Gj+xtWi4SxQY5bYPCi5n4=;
	b=j6uGMqOi83PcmGTzClsglXni2OK+k0B0/KSEGBMhB64qD48ytXSzrNCbA17rlYBN3e
	PdPBlyMJ87sTO2ozbgl0sGwZtlYCJB7AaZVg/7aWLNDe3pwz4ytoOqQWPBeL8zVUpVGG
	Lh11Hof48vlnqMBiyHW/fnbS8dY4lD2PAHhlebmuNCWicXZHqje6UoZmrJqETOeJGDA9
	Lt7lBIjA48IdmlxleNFA7ta5Fbayyq/e48hoWUakyCW/1xVol4A600mwbfDQ9uRmYw/x
	gCZhWSRlCPVUKqyuMnV0Lqe4x9HarMM44XwBezyo/l4/Q68DNaE4m5zWrsQqWsZGSv6q
	cRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6+Pb/VtB05jbzfckIpSqa+Gj+xtWi4SxQY5bYPCi5n4=;
	b=BHMTPO919+3lVRCMCa6M54bLwytdDZP9Yw0mFgLNYWwLPQHKg4in7j3PRSPTCdoy1B
	9DLILNDhywMhVdcgabt63bLP6VdEYEbNA48R8BgbKs4/8yM60tLpokmNrJ/g0DjfGBmK
	QLZ+9ikgFQNVXTx0lptN4SI4uIMpTkAbTFq4N82Zjsa86aAECX76WmvwR28AlteC9Pcx
	BojzjgpEMJsJ0L/jW9MeYA4qY6ag/kdlapdtTxXebTL+sN8pxG3hwBMRCESsBeF7A80Q
	KV67jtbuiRl7nMd26Tll3bRwjYma9380jJKIwDf8Rtj7pw7C4ia39boWjb5LBJBK6Io6
	+oSg==
X-Gm-Message-State: APjAAAX+EruYgDp+BrfMqfxOKLqL9nxh5RRWgMuRy7oGVhcC+Um3sHB/
	f6xGzowAlvnkgN8Tgvm4zg==
X-Google-Smtp-Source: APXvYqy004Yo889KeZmRXRk7zL62SmHZ6KP56kJCs40xbA22EzXHzjoX9rBfNNJcInEjTNdjZA5MWQ==
X-Received: by 2002:a05:6000:c2:: with SMTP id
	q2mr4190103wrx.324.1556833743046; 
	Thu, 02 May 2019 14:49:03 -0700 (PDT)
Received: from localhost (101.red-83-33-153.dynamicip.rima-tde.net.
	[83.33.153.101]) by smtp.gmail.com with ESMTPSA id
	c131sm295247wma.31.2019.05.02.14.49.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 02 May 2019 14:49:02 -0700 (PDT)
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
To: 
Date: Thu,  2 May 2019 23:49:01 +0200
Message-Id: <20190502214901.3170-1-xose.vazquez@gmail.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Thu, 02 May 2019 21:49:04 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Thu, 02 May 2019 21:49:04 +0000 (UTC) for IP:'209.85.221.49'
	DOMAIN:'mail-wr1-f49.google.com' HELO:'mail-wr1-f49.google.com'
	FROM:'xose.vazquez@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.11  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	SPF_PASS) 209.85.221.49 mail-wr1-f49.google.com 209.85.221.49
	mail-wr1-f49.google.com <xose.vazquez@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: DM-DEVEL ML <dm-devel@redhat.com>,
	Xose Vazquez Perez <xose.vazquez@gmail.com>
Subject: [dm-devel] [PATCH] multipath-tools: document missing mpathpersist
	flags in help output
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Thu, 02 May 2019 21:49:32 +0000 (UTC)

Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>
Cc: DM-DEVEL ML <dm-devel@redhat.com>
Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
---
 mpathpersist/main.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/mpathpersist/main.c b/mpathpersist/main.c
index 10cba45..5a2cf9a 100644
--- a/mpathpersist/main.c
+++ b/mpathpersist/main.c
@@ -15,6 +15,7 @@
 #include <pthread.h>
 #include <ctype.h>
 #include <string.h>
+#include "version.h"
 
 static const char * pr_type_strs[] = {
 	"obsolete [0]",
@@ -687,6 +688,7 @@ void mpath_print_buf_readfullstat( struct prin_resp *pr_buff)
 
 static void usage(void)
 {
+	fprintf(stderr, VERSION_STRING);
 	fprintf(stderr,
 			"Usage: mpathpersist [OPTIONS] [DEVICE]\n"
 			" Options:\n"
@@ -706,10 +708,8 @@ static void usage(void)
 			"    --param-aptpl|-Z           PR Out parameter 'APTPL'\n"
 			"    --read-keys|-k             PR In: Read Keys\n"
 			"    --param-rk=RK|-K RK        PR Out parameter reservation key\n"
-			"    --param-sark=SARK|-S SARK  PR Out parameter service "
-			"action\n"
-			"                               reservation key (SARK is in "
-			"hex)\n"
+			"    --param-sark=SARK|-S SARK  PR Out parameter service action\n"
+			"                               reservation key (SARK is in hex)\n"
 			"    --preempt|-P               PR Out: Preempt\n"
 			"    --preempt-abort|-A         PR Out: Preempt and Abort\n"
 			"    --prout-type=TYPE|-T TYPE  PR Out command type\n"
@@ -721,11 +721,14 @@ static void usage(void)
 			"    --release|-L               PR Out: Release\n"
 			"    --report-capabilities|-c   PR In: Report Capabilities\n"
 			"    --reserve|-R               PR Out: Reserve\n"
-			"    --transport-id=TIDS|-X TIDS  TransportIDs can be mentioned \n"
-			"                               in several forms\n"
+			"    --transport-id=TIDS|-X TIDS  TransportIDs can be mentioned\n"
+			"                                 in several forms\n"
+			"    --alloc-length=LEN|-l LEN  PR In: maximum allocation length\n"
 			" Examples:\n"
 			"     mpathpersist --out --register --param-sark=123abc --prout-type=5 /dev/mapper/mpath9\n"
-			"     mpathpersist -i -k /dev/mapper/mpath9\n"	);
+			"     mpathpersist -i -k /dev/mapper/mpath9\n"
+			"     mpathpersist --out --reserve --param-sark=123abc --prout-type=8 -d /dev/mapper/mpath9\n"
+			"     mpathpersist -i -s -d /dev/mapper/mpath9\n");
 }
 
 void
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
