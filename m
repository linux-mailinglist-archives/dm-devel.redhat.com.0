Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 70BAE316695
	for <lists+dm-devel@lfdr.de>; Wed, 10 Feb 2021 13:26:20 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-ACGyyOJlNEuekwJNfH7rNA-1; Wed, 10 Feb 2021 07:26:17 -0500
X-MC-Unique: ACGyyOJlNEuekwJNfH7rNA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1292108C28F;
	Wed, 10 Feb 2021 12:26:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D70955D71B;
	Wed, 10 Feb 2021 12:26:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A26E618095C9;
	Wed, 10 Feb 2021 12:25:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11ACPWRd002133 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 10 Feb 2021 07:25:32 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6D2AA2026D16; Wed, 10 Feb 2021 12:25:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6672F2026D13
	for <dm-devel@redhat.com>; Wed, 10 Feb 2021 12:25:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0EBDA185A793
	for <dm-devel@redhat.com>; Wed, 10 Feb 2021 12:25:28 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-479-CgODZqB4OBWVtfdozCTFDg-1;
	Wed, 10 Feb 2021 07:25:23 -0500
X-MC-Unique: CgODZqB4OBWVtfdozCTFDg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A3CA9AC43;
	Wed, 10 Feb 2021 12:25:21 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 10 Feb 2021 13:24:57 +0100
Message-Id: <20210210122457.3415-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 11ACPWRd002133
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH] multipath-tools tests: fix stringop-overflow
	build errors with gcc 11
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

gcc-11 throws an error compiling alias.c and dmevents.c:

In file included from ../libmultipath/checkers.h:4,
                 from ../libmultipath/prio.h:7,
                 from ../libmultipath/structs.h:8,
                 from dmevents.c:29:
../multipathd/dmevents.c: In function 'dmevent_loop':
../multipathd/dmevents.c:357:17: error: '__sigsetjmp' accessing 200 bytes in a region of size 72 [-Werror=stringop-overflow=]
  357 |                 pthread_cleanup_push(cleanup_lock, &waiter->vecs->lock);
      |                 ^~~~~~~~~~~~~~~~~~~~
../multipathd/dmevents.c:357:17: note: referencing argument 1 of type 'struct __jmp_buf_tag *'
/usr/include/pthread.h:734:12: note: in a call to function '__sigsetjmp'
  734 | extern int __sigsetjmp (struct __jmp_buf_tag *__env, int __savemask) __THROWNL;
      |            ^~~~~~~~~~~

The reason seems to be a mismatch between the __sigsetjmp() prototype
in <setjmp.h> and <pthread.h>. Until this is fixed in the toolchain,
work around it by including <pthread.h> first.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 tests/alias.c    | 1 +
 tests/dmevents.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/tests/alias.c b/tests/alias.c
index 0311faa..5e0bfea 100644
--- a/tests/alias.c
+++ b/tests/alias.c
@@ -1,3 +1,4 @@
+#include <pthread.h>
 #include <stdint.h>
 #include <setjmp.h>
 #include <stdio.h>
diff --git a/tests/dmevents.c b/tests/dmevents.c
index b7c5122..29eaa6d 100644
--- a/tests/dmevents.c
+++ b/tests/dmevents.c
@@ -16,6 +16,7 @@
  *
  */
 
+#include <pthread.h>
 #include <stdint.h>
 #include <stdbool.h>
 #include <stdarg.h>
-- 
2.29.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

