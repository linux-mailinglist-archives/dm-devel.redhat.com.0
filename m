Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 2473E15A6B8
	for <lists+dm-devel@lfdr.de>; Wed, 12 Feb 2020 11:44:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581504259;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fOvaBRSu8k3n+alAbSPf/dMOtcc30uMAYCXGjHo15WI=;
	b=i63KKfO5nn1wlEPJKCD5w7YePOdFcMmP6RY4i/PBC9WMIe4OFgRwqbt0pimUwzkPUiJTMG
	ntFBkxX4bflVu4IX2WhTX1HyD0dfkNijRp47ISxWa/slJTKey2n4dsownsdC+BFZYYykSs
	KIXOp5f8MYKN8B16w5zcz0CCHPNE4dY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-Oj5DCrrNOmKx1kaoCbhn4w-1; Wed, 12 Feb 2020 05:44:17 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6EFF7A62C;
	Wed, 12 Feb 2020 10:44:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA4B210027A9;
	Wed, 12 Feb 2020 10:44:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 56BE918089C8;
	Wed, 12 Feb 2020 10:43:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01CAhYJL014080 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 Feb 2020 05:43:34 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6696B2166B29; Wed, 12 Feb 2020 10:43:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 628B52166B28
	for <dm-devel@redhat.com>; Wed, 12 Feb 2020 10:43:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA7751017E46
	for <dm-devel@redhat.com>; Wed, 12 Feb 2020 10:43:31 +0000 (UTC)
Received: from szilassi.eckner.net (szilassi.eckner.net [193.30.121.109])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-212-wYukIMdJPz6Hek-uHY4UsQ-1; Wed, 12 Feb 2020 05:43:29 -0500
Received: from nlopc43.ioq.uni-jena.de
	([2001:638:1558:8c70:d6be:d9ff:fe9c:1bda])
	(AUTH: PLAIN erich@eckner.net, ) by szilassi.eckner.net with ESMTPSA
	id 000000000072163B.000000005E43D6CE.00074063;
	Wed, 12 Feb 2020 11:43:26 +0100
From: device-mapper@eckner.net
To: dm-devel@redhat.com
Date: Wed, 12 Feb 2020 11:43:10 +0100
Message-Id: <20200212104310.1014996-1-device-mapper@eckner.net>
Mime-Version: 1.0
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
X-MC-Unique: wYukIMdJPz6Hek-uHY4UsQ-1
X-MC-Unique: Oj5DCrrNOmKx1kaoCbhn4w-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01CAhYJL014080
X-loop: dm-devel@redhat.com
Cc: Erich Eckner <git@eckner.net>
Subject: [dm-devel] [PATCH] dm-integrity: print device name in integrity
	error message.
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Erich Eckner <git@eckner.net>

Similar to f710126cfc89c8df477002a26dee8407eb0b4acd, this message should
also better identify the device with the integrity failure.
---
 drivers/md/dm-integrity.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm-integrity.c b/drivers/md/dm-integrity.c
index b225b3e445fa..92f16315ee1b 100644
--- a/drivers/md/dm-integrity.c
+++ b/drivers/md/dm-integrity.c
@@ -1563,7 +1563,9 @@ static void integrity_metadata(struct work_struct *w)
 						checksums_ptr - checksums, !dio->write ? TAG_CMP : TAG_WRITE);
 			if (unlikely(r)) {
 				if (r > 0) {
-					DMERR_LIMIT("Checksum failed at sector 0x%llx",
+					char b[BDEVNAME_SIZE];
+					DMERR_LIMIT("%s: Checksum failed at sector 0x%llx",
+						    bio_devname(bio, b),
 						    (unsigned long long)(sector - ((r + ic->tag_size - 1) / ic->tag_size)));
 					r = -EILSEQ;
 					atomic64_inc(&ic->number_of_mismatches);
-- 
2.25.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

