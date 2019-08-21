Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4814C97955
	for <lists+dm-devel@lfdr.de>; Wed, 21 Aug 2019 14:30:25 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EFC6D6B;
	Wed, 21 Aug 2019 12:30:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DF816B49B;
	Wed, 21 Aug 2019 12:30:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BA21A180BA9E;
	Wed, 21 Aug 2019 12:30:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7L7gTSR027855 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 21 Aug 2019 03:42:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 73D0D5D6C8; Wed, 21 Aug 2019 07:42:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F0DE5D6B0
	for <dm-devel@redhat.com>; Wed, 21 Aug 2019 07:42:26 +0000 (UTC)
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.45])
	by mx1.redhat.com (Postfix) with ESMTP id 992EB308FC4B
	for <dm-devel@redhat.com>; Wed, 21 Aug 2019 07:42:24 +0000 (UTC)
Received: from localhost.localdomain (broadband-188-32-48-208.ip.moscow.rt.ru
	[188.32.48.208])
	by mail.ispras.ru (Postfix) with ESMTPSA id 1679B540081;
	Wed, 21 Aug 2019 10:42:23 +0300 (MSK)
From: Denis Efremov <efremov@ispras.ru>
To: akpm@linux-foundation.org
Date: Wed, 21 Aug 2019 10:42:00 +0300
Message-Id: <20190821074200.2203-1-efremov@ispras.ru>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.43]); Wed, 21 Aug 2019 07:42:25 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Wed, 21 Aug 2019 07:42:25 +0000 (UTC) for IP:'83.149.199.45'
	DOMAIN:'mail.ispras.ru' HELO:'mail.ispras.ru'
	FROM:'efremov@ispras.ru' RCPT:''
X-RedHat-Spam-Score: 0  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 83.149.199.45 mail.ispras.ru 83.149.199.45
	mail.ispras.ru <efremov@ispras.ru>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 21 Aug 2019 08:29:57 -0400
Cc: Vladimir Shelekhov <vshel@iis.nsk.su>, Jan Kara <jack@suse.cz>,
	Denis Efremov <efremov@ispras.ru>,
	Matthew Wilcox <matthew@wil.cx>, linux-kernel@vger.kernel.org,
	Akinobu Mita <akinobu.mita@gmail.com>, dm-devel@redhat.com,
	Erdem Tumurov <erdemus@gmail.com>, linux-fsdevel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [dm-devel] [PATCH] lib/memweight.c: optimize by inlining
	bitmap_weight()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Wed, 21 Aug 2019 12:30:23 +0000 (UTC)

This patch inlines bitmap_weight() call. Thus, removing the BUG_ON,
and 'longs to bits -> bits to longs' conversion by directly calling
hweight_long().

./scripts/bloat-o-meter lib/memweight.o.old lib/memweight.o.new
add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-10 (-10)
Function                                     old     new   delta
memweight                                    162     152     -10

Co-developed-by: Erdem Tumurov <erdemus@gmail.com>
Co-developed-by: Vladimir Shelekhov <vshel@iis.nsk.su>
Signed-off-by: Erdem Tumurov <erdemus@gmail.com>
Signed-off-by: Vladimir Shelekhov <vshel@iis.nsk.su>
Signed-off-by: Denis Efremov <efremov@ispras.ru>
---
 lib/memweight.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/lib/memweight.c b/lib/memweight.c
index 94dd72ccaa7f..f050b2b4c5e2 100644
--- a/lib/memweight.c
+++ b/lib/memweight.c
@@ -20,11 +20,13 @@ size_t memweight(const void *ptr, size_t bytes)
 
 	longs = bytes / sizeof(long);
 	if (longs) {
-		BUG_ON(longs >= INT_MAX / BITS_PER_LONG);
-		ret += bitmap_weight((unsigned long *)bitmap,
-				longs * BITS_PER_LONG);
+		const unsigned long *bitmap_long =
+			(const unsigned long *)bitmap;
+
 		bytes -= longs * sizeof(long);
-		bitmap += longs * sizeof(long);
+		for (; longs > 0; longs--, bitmap_long++)
+			ret += hweight_long(*bitmap_long);
+		bitmap = (const unsigned char *)bitmap_long;
 	}
 	/*
 	 * The reason that this last loop is distinct from the preceding
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
