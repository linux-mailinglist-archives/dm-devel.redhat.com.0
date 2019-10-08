Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B27CF460
	for <lists+dm-devel@lfdr.de>; Tue,  8 Oct 2019 09:58:23 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 653077BDDA;
	Tue,  8 Oct 2019 07:58:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 014AA1001956;
	Tue,  8 Oct 2019 07:58:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 870494EE68;
	Tue,  8 Oct 2019 07:58:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x987vWDe009932 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 8 Oct 2019 03:57:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7B53F60127; Tue,  8 Oct 2019 07:57:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 766CE600CE
	for <dm-devel@redhat.com>; Tue,  8 Oct 2019 07:57:30 +0000 (UTC)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 45125970F6
	for <dm-devel@redhat.com>; Tue,  8 Oct 2019 07:57:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id EF4B0B1C9;
	Tue,  8 Oct 2019 07:57:27 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: dm-devel@redhat.com
Date: Tue,  8 Oct 2019 09:57:19 +0200
Message-Id: <20191008075719.30926-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.39]); Tue, 08 Oct 2019 07:57:29 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Tue, 08 Oct 2019 07:57:29 +0000 (UTC) for IP:'195.135.220.15'
	DOMAIN:'mx2.suse.de' HELO:'mx1.suse.de' FROM:'pvorel@suse.cz'
	RCPT:''
X-RedHat-Spam-Score: -2.3  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 195.135.220.15 mx2.suse.de 195.135.220.15
	mx2.suse.de <pvorel@suse.cz>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Christoph Hellwig <hch@infradead.org>, Petr Vorel <pvorel@suse.cz>,
	Baruch Even <baruch@ev-en.org>
Subject: [dm-devel] [RFC PATCH 1/1] kpartx: Use solaris_x86_slice definition
	from kernel
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Tue, 08 Oct 2019 07:58:22 +0000 (UTC)

solaris_x86_slice defined in kernel uses byte order fixed types.
As we already use kernel headers in kpart sources and we're not able
to find original 32-bit x86 Solaris sources, it's better to stick with
struct definition from kernel.

129e6fe6 used __kernel_daddr_t instead of one of these: long / int / daddr_t,
which is IMHO wrong and tried to address only s_start struct member.

Fixes: 129e6fe6 ("kpartx: Use __kernel_daddr_t for solaris_x86_slice.s_start")

Cc: Christoph Hellwig <hch@infradead.org>
Cc: Baruch Even <baruch@ev-en.org>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 kpartx/solaris.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/kpartx/solaris.c b/kpartx/solaris.c
index e7826c62..7e3db9c6 100644
--- a/kpartx/solaris.c
+++ b/kpartx/solaris.c
@@ -7,10 +7,10 @@
 #define SOLARIS_X86_VTOC_SANE	(0x600DDEEEUL)
 
 struct solaris_x86_slice {
-	unsigned short	s_tag;		/* ID tag of partition */
-	unsigned short	s_flag;		/* permission flags */
-	__kernel_daddr_t s_start;	/* start sector no of partition */
-	long		s_size;		/* # of blocks in partition */
+	__le16 s_tag;		/* ID tag of partition */
+	__le16 s_flag;		/* permission flags */
+	__le32 s_start;		/* start sector no of partition */
+	__le32 s_size;		/* # of blocks in partition */
 };
 
 struct solaris_x86_vtoc {
-- 
2.23.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
