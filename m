Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF9CD5231
	for <lists+dm-devel@lfdr.de>; Sat, 12 Oct 2019 21:30:23 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 77F87307D931;
	Sat, 12 Oct 2019 19:30:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA2CD19C58;
	Sat, 12 Oct 2019 19:30:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4902D4A486;
	Sat, 12 Oct 2019 19:30:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9CJTpsq031048 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 15:29:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A4DA060A97; Sat, 12 Oct 2019 19:29:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F5ED608A5
	for <dm-devel@redhat.com>; Sat, 12 Oct 2019 19:29:49 +0000 (UTC)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D055E301D671
	for <dm-devel@redhat.com>; Sat, 12 Oct 2019 19:29:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 9CDBDB23F;
	Sat, 12 Oct 2019 19:29:47 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: dm-devel@redhat.com
Date: Sat, 12 Oct 2019 21:29:38 +0200
Message-Id: <20191012192938.17652-2-pvorel@suse.cz>
In-Reply-To: <20191012192938.17652-1-pvorel@suse.cz>
References: <20191012192938.17652-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.47]); Sat, 12 Oct 2019 19:29:49 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Sat, 12 Oct 2019 19:29:49 +0000 (UTC) for IP:'195.135.220.15'
	DOMAIN:'mx2.suse.de' HELO:'mx1.suse.de' FROM:'pvorel@suse.cz'
	RCPT:''
X-RedHat-Spam-Score: -2.3  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 195.135.220.15 mx2.suse.de 195.135.220.15
	mx2.suse.de <pvorel@suse.cz>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.47
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Christoph Hellwig <hch@infradead.org>, Petr Vorel <pvorel@suse.cz>,
	Baruch Even <baruch@ev-en.org>
Subject: [dm-devel] [RFC PATCH v2 2/2] kpartx: Use fixed size types in
	struct solaris_x86_vtoc
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Sat, 12 Oct 2019 19:30:21 +0000 (UTC)

Some of the items in struct solaris_x86_vtoc defined in kernel uses
fixed size types (with specified byte order). We're not able to find
original 32-bit x86 Solaris sources, but expect struct definition in
kernel is correct, therefore use it as a source of size of struct items.

With one exception: keep timestamp[SOLARIS_X86_NUMSLICE] as time_t
(kernel uses unsigned int).

Cc: Christoph Hellwig <hch@infradead.org>
Cc: Baruch Even <baruch@ev-en.org>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
changes v1->v2:
new commit.

 kpartx/solaris.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/kpartx/solaris.c b/kpartx/solaris.c
index 0fda10ad..6b1795d8 100644
--- a/kpartx/solaris.c
+++ b/kpartx/solaris.c
@@ -14,13 +14,13 @@ struct solaris_x86_slice {
 };
 
 struct solaris_x86_vtoc {
-	unsigned long v_bootinfo[3];	/* info for mboot */
-	unsigned long v_sanity;		/* to verify vtoc sanity */
-	unsigned long v_version;	/* layout version */
+	unsigned int v_bootinfo[3];	/* info for mboot */
+	uint32_t v_sanity;		/* to verify vtoc sanity */
+	uint32_t v_version;		/* layout version */
 	char	v_volume[8];		/* volume name */
-	unsigned short	v_sectorsz;	/* sector size in bytes */
-	unsigned short	v_nparts;	/* number of partitions */
-	unsigned long v_reserved[10];	/* free space */
+	uint16_t	v_sectorsz;	/* sector size in bytes */
+	uint16_t	v_nparts;	/* number of partitions */
+	unsigned int v_reserved[10];	/* free space */
 	struct solaris_x86_slice
 		v_slice[SOLARIS_X86_NUMSLICE];   /* slice headers */
 	time_t	timestamp[SOLARIS_X86_NUMSLICE]; /* timestamp */
@@ -44,7 +44,7 @@ read_solaris_pt(int fd, struct slice all, struct slice *sp, int ns) {
 		return -1;
 
 	if(v->v_version != 1) {
-		fprintf(stderr, "Cannot handle solaris version %ld vtoc\n",
+		fprintf(stderr, "Cannot handle solaris version %d vtoc\n",
 		       v->v_version);
 		return 0;
 	}
-- 
2.23.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
