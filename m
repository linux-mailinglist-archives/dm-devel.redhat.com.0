Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id C58F3219D98
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:21:38 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-M80zLQywOkGFGYombexucA-1; Thu, 09 Jul 2020 06:21:33 -0400
X-MC-Unique: M80zLQywOkGFGYombexucA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DC4D19253C4;
	Thu,  9 Jul 2020 10:21:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 72BE31A888;
	Thu,  9 Jul 2020 10:21:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 92AF9180954D;
	Thu,  9 Jul 2020 10:21:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AGw8I029367 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:16:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 695BF1000DAE; Thu,  9 Jul 2020 10:16:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 64DED114B2F6
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:16:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 38B4A800A13
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:16:58 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-371-CQ8IE7KgPh-W_cpU2DjcLQ-1;
	Thu, 09 Jul 2020 06:16:55 -0400
X-MC-Unique: CQ8IE7KgPh-W_cpU2DjcLQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 0A249B07D;
	Thu,  9 Jul 2020 10:16:53 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:15:54 +0200
Message-Id: <20200709101620.6786-10-mwilck@suse.com>
In-Reply-To: <20200709101620.6786-1-mwilck@suse.com>
References: <20200709101620.6786-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AGw8I029367
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 09/35] libmultipath: use bitfields in
	group_by_match()
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

This makes "bitmap" a proper bitmap, and decreases memory consumption.
Unit tests for pgpolicy.c still pass.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/pgpolicies.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/libmultipath/pgpolicies.c b/libmultipath/pgpolicies.c
index 02cafdc..0e55109 100644
--- a/libmultipath/pgpolicies.c
+++ b/libmultipath/pgpolicies.c
@@ -196,20 +196,20 @@ int group_by_match(struct multipath * mp, vector paths,
 		   bool (*path_match_fn)(struct path *, struct path *))
 {
 	int i, j;
-	int * bitmap;
+	struct bitfield *bitmap;
 	struct path * pp;
 	struct pathgroup * pgp;
 	struct path * pp2;
 
 	/* init the bitmap */
-	bitmap = (int *)MALLOC(VECTOR_SIZE(paths) * sizeof (int));
+	bitmap = alloc_bitfield(VECTOR_SIZE(paths));
 
 	if (!bitmap)
 		goto out;
 
 	for (i = 0; i < VECTOR_SIZE(paths); i++) {
 
-		if (bitmap[i])
+		if (is_bit_set_in_bitfield(i, bitmap))
 			continue;
 
 		pp = VECTOR_SLOT(paths, i);
@@ -227,11 +227,11 @@ int group_by_match(struct multipath * mp, vector paths,
 		if (store_path(pgp->paths, pp))
 			goto out1;
 
-		bitmap[i] = 1;
+		set_bit_in_bitfield(i, bitmap);
 
 		for (j = i + 1; j < VECTOR_SIZE(paths); j++) {
 
-			if (bitmap[j])
+			if (is_bit_set_in_bitfield(j, bitmap))
 				continue;
 
 			pp2 = VECTOR_SLOT(paths, j);
@@ -240,7 +240,7 @@ int group_by_match(struct multipath * mp, vector paths,
 				if (store_path(pgp->paths, pp2))
 					goto out1;
 
-				bitmap[j] = 1;
+				set_bit_in_bitfield(j, bitmap);
 			}
 		}
 	}
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

