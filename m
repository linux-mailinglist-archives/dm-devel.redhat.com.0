Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B9366D5233
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 21:30:24 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 79D3E30ADBA7;
	Sat, 12 Oct 2019 19:30:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CF125D784;
	Sat, 12 Oct 2019 19:30:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4DCB31803517;
	Sat, 12 Oct 2019 19:30:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CJTpDS031049 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 15:29:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A51FB60603; Sat, 12 Oct 2019 19:29:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx30.extmail.prod.ext.phx2.redhat.com
	[10.5.110.71])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F8F560A35
	for <dm-devel@redhat.com>; Sat, 12 Oct 2019 19:29:49 +0000 (UTC)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 23E931DB0
	for <dm-devel@redhat.com>; Sat, 12 Oct 2019 19:29:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id BEDBDB22E;
	Sat, 12 Oct 2019 19:29:46 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: dm-devel@redhat.com
Date: Sat, 12 Oct 2019 21:29:37 +0200
Message-Id: <20191012192938.17652-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.71]); Sat, 12 Oct 2019 19:29:48 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.71]);
	Sat, 12 Oct 2019 19:29:48 +0000 (UTC) for IP:'195.135.220.15'
	DOMAIN:'mx2.suse.de' HELO:'mx1.suse.de' FROM:'pvorel@suse.cz'
	RCPT:''
X-RedHat-Spam-Score: -2.3  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 195.135.220.15 mx2.suse.de 195.135.220.15
	mx2.suse.de <pvorel@suse.cz>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.71
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Christoph Hellwig <hch@infradead.org>, Petr Vorel <pvorel@suse.cz>,
	Baruch Even <baruch@ev-en.org>
Subject: [dm-devel] [RFC PATCH v2 1/2] kpartx: Use fixed size types in
	struct solaris_x86_slice
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Sat, 12 Oct 2019 19:30:22 +0000 (UTC)

struct solaris_x86_slice defined in kernel uses fixed size types
(with specified byte order). We're not able to find original 32-bit
x86 Solaris sources, but expect struct definition in kernel is correct,
therefore use it as a source of size of struct items. (just don't use
original kernel byte order fixed types __le{16,32}, but normal user
space fixed size types)

129e6fe6 used __kernel_daddr_t instead of one of these: long / int / daddr_t,
which is IMHO wrong and tried to address only s_start struct member.

Fixes: 129e6fe6 ("kpartx: Use __kernel_daddr_t for solaris_x86_slice.s_start")

Cc: Christoph Hellwig <hch@infradead.org>
Cc: Baruch Even <baruch@ev-en.org>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
changes v1->v2:
* use user space types __le{16,32} => uint{16,32}_t

 kpartx/solaris.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/kpartx/solaris.c b/kpartx/solaris.c
index e7826c62..0fda10ad 100644
--- a/kpartx/solaris.c
+++ b/kpartx/solaris.c
@@ -1,16 +1,16 @@
 #include "kpartx.h"
+#include <stdint.h>
 #include <stdio.h>
-#include <linux/types.h>
 #include <time.h>		/* time_t */
 
 #define SOLARIS_X86_NUMSLICE	8
 #define SOLARIS_X86_VTOC_SANE	(0x600DDEEEUL)
 
 struct solaris_x86_slice {
-	unsigned short	s_tag;		/* ID tag of partition */
-	unsigned short	s_flag;		/* permission flags */
-	__kernel_daddr_t s_start;	/* start sector no of partition */
-	long		s_size;		/* # of blocks in partition */
+	uint16_t s_tag;		/* ID tag of partition */
+	uint16_t s_flag;	/* permission flags */
+	uint32_t s_start;	/* start sector no of partition */
+	uint32_t s_size;	/* # of blocks in partition */
 };
 
 struct solaris_x86_vtoc {
-- 
2.23.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
