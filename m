Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E9C77209
	for <lists+dm-devel@lfdr.de>; Fri, 26 Jul 2019 21:20:44 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D509030C62A8;
	Fri, 26 Jul 2019 19:20:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 416551CB;
	Fri, 26 Jul 2019 19:20:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D62E8264C9;
	Fri, 26 Jul 2019 19:20:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6QJJhHY016753 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 26 Jul 2019 15:19:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5652C608D0; Fri, 26 Jul 2019 19:19:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5063860A9D
	for <dm-devel@redhat.com>; Fri, 26 Jul 2019 19:19:41 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6BB193082141
	for <dm-devel@redhat.com>; Fri, 26 Jul 2019 19:19:40 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id z1so55467141wru.13
	for <dm-devel@redhat.com>; Fri, 26 Jul 2019 12:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=QbHOcKSlr8k5VDAwU1Vqf8fnF/9n1fx4X2nsFEqase8=;
	b=FMiXJtK+lLiLJbU48LSNMvY2EUpDPT66E7cK85CX5qRw2Wm3KbldGv41OGbVFE6ieL
	h62MPOzQApOuF3KqyQyBg4qGca08jb0j/kXx5YaRKAv/q539PRZkHCNYwX9lWOslPjGx
	bE2bfLdhakZv3PY/FqF+h9HXuwPBDxDjdnSmdHIcTPB/7XqyRnjBopIVx2xWGcGJ0ByR
	nOJGn2y8K0E+eCUwllAsjVBFBvIwWSoZmCrAk6Jlc+DNm4rc/2kFs1auq95u3+TGYI+7
	/1DRIj6rfoHW8NStGfLOEjKtHF0ESpOWRjqnhvWlw074Xc01lIXyEm5eg4JSTfA5xpvd
	3JZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=QbHOcKSlr8k5VDAwU1Vqf8fnF/9n1fx4X2nsFEqase8=;
	b=dzZPauDwITC4fqb/fNN3nzztyt9rop1MA0FX7+SNs7e0As+fBZM3GjDUSQXEmLbKnQ
	+N8uZTepg7OTWBTIFED8tnhcGuAC71zX5jDVhyUsqFvgZ5+cWa8CI/hxINxJwE8JZCqI
	R2ETRoRMEzabUsM9Q2bl/whUQSctOYkgzY9UWC3wggd05IQhgkhFnchGz6yg/sBPFUau
	v4+a47xkq8t/U2IPyaas0WlfxfntWoozYqaNQ3rZJrD2A3MKXBOga3fIH22aBpLtzx1V
	CgYqyFkeC+p+hYLL0IEhl69NXd5dkkp91jHid9LIgnhmkPZndaJRjT6RN5ovPQMuDUAK
	NqLQ==
X-Gm-Message-State: APjAAAX5fRjIDHjSYEB866JUyBx5UnWO7NxhY1cNslZRuQUvmn4ve7Re
	jIABc35u0uNmWvqHe+GX9Tu914g=
X-Google-Smtp-Source: APXvYqyb4s1hHmKhlf6WIdIQbC6kDLx/PGwHkrJcKO6iTWAeieuwDfEF0lNiiurtoCkAYoGc75wbEg==
X-Received: by 2002:a5d:63c8:: with SMTP id c8mr21457468wrw.21.1564168778679; 
	Fri, 26 Jul 2019 12:19:38 -0700 (PDT)
Received: from localhost (118.red-88-12-24.staticip.rima-tde.net.
	[88.12.24.118]) by smtp.gmail.com with ESMTPSA id
	b2sm70320498wrp.72.2019.07.26.12.19.38
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 26 Jul 2019 12:19:38 -0700 (PDT)
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
To: 
Date: Fri, 26 Jul 2019 21:19:29 +0200
Message-Id: <20190726191930.23630-2-xose.vazquez@gmail.com>
In-Reply-To: <20190726191930.23630-1-xose.vazquez@gmail.com>
References: <20190726191930.23630-1-xose.vazquez@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Fri, 26 Jul 2019 19:19:40 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Fri, 26 Jul 2019 19:19:40 +0000 (UTC) for IP:'209.85.221.68'
	DOMAIN:'mail-wr1-f68.google.com' HELO:'mail-wr1-f68.google.com'
	FROM:'xose.vazquez@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.221.68 mail-wr1-f68.google.com 209.85.221.68
	mail-wr1-f68.google.com <xose.vazquez@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: DM-DEVEL ML <dm-devel@redhat.com>,
	Xose Vazquez Perez <xose.vazquez@gmail.com>
Subject: [dm-devel] [PATCH] multipath-tools: delete examples from
	mpathpersist output
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Fri, 26 Jul 2019 19:20:43 +0000 (UTC)

The manual page is more complete and detailed.

Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>
Cc: DM-DEVEL ML <dm-devel@redhat.com>
Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
---
 mpathpersist/main.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/mpathpersist/main.c b/mpathpersist/main.c
index 5ad06a9..c451855 100644
--- a/mpathpersist/main.c
+++ b/mpathpersist/main.c
@@ -844,12 +844,7 @@ static void usage(void)
 			"    --reserve|-R               PR Out: Reserve\n"
 			"    --transport-id=TIDS|-X TIDS  TransportIDs can be mentioned\n"
 			"                                 in several forms\n"
-			"    --alloc-length=LEN|-l LEN  PR In: maximum allocation length\n"
-			" Examples:\n"
-			"     mpathpersist --out --register --param-sark=123abc --prout-type=5 /dev/mapper/mpath9\n"
-			"     mpathpersist -i -k /dev/mapper/mpath9\n"
-			"     mpathpersist --out --reserve --param-sark=123abc --prout-type=8 -d /dev/mapper/mpath9\n"
-			"     mpathpersist -i -s -d /dev/mapper/mpath9\n");
+			"    --alloc-length=LEN|-l LEN  PR In: maximum allocation length\n");
 }
 
 void
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
