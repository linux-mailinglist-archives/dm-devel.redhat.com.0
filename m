Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C936771B0
	for <lists+dm-devel@lfdr.de>; Sun, 22 Jan 2023 20:04:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674414257;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1UkFPvULBTVmIf5CwRMnOzEkrmeV2C9Uf2hodDjtm0w=;
	b=SC0moZ1zkSCTg4iFmJZwUXMJQWnUdi3Euha+ah2iRa/SYX1RReh2f4zAistI1HMA16Hraq
	laROZaembsExB5E2iZdR2DjfnxKJ9iHbd2uehaB1LjXMilCRgCuWvYVjxPUFmLsrCY1LLH
	uHn1K/N1/9jm5krBq4CV/xlES45voI0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-534-kbEGTYdkOQiZ0-mkNtAELQ-1; Sun, 22 Jan 2023 14:04:13 -0500
X-MC-Unique: kbEGTYdkOQiZ0-mkNtAELQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 858EF857A84;
	Sun, 22 Jan 2023 19:04:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 16BD02026D68;
	Sun, 22 Jan 2023 19:04:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 598F41946595;
	Sun, 22 Jan 2023 19:04:10 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 22199194658D
 for <dm-devel@listman.corp.redhat.com>; Sun, 22 Jan 2023 19:03:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E062739D93; Sun, 22 Jan 2023 19:03:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
 (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CD711175AD;
 Sun, 22 Jan 2023 19:03:56 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id
 30MJ3uqm015484; Sun, 22 Jan 2023 14:03:56 -0500
Received: from localhost (mpatocka@localhost)
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP
 id 30MJ3u4u015480; Sun, 22 Jan 2023 14:03:56 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
 owned process doing -bs
Date: Sun, 22 Jan 2023 14:03:56 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>
Message-ID: <alpine.LRH.2.21.2301221403390.15312@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [dm-devel] [PATCH 3/3] dm-flakey: fix logic when corruping a bio
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: dm-devel@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If "corrupt_bio_byte" is set to corrupt reads and corrupt_bio_flags is
used, dm-flakey would errorneously return all writes as errors. Likewise,
if "corrupt_bio_byte" is set to corrupt writes, dm-flakey would return
errors for all reads.

This patch fixes the logic, so that if fc->corrupt_bio_byte is non-zero,
dm-flakey would not abort reads on writes with an error.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Cc: stable@vger.kernel.org

---
 drivers/md/dm-flakey.c |   23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

Index: bcachefs/drivers/md/dm-flakey.c
===================================================================
--- bcachefs.orig/drivers/md/dm-flakey.c	2023-01-22 17:22:10.000000000 +0100
+++ bcachefs/drivers/md/dm-flakey.c	2023-01-22 17:22:10.000000000 +0100
@@ -365,9 +365,11 @@ static int flakey_map(struct dm_target *
 		/*
 		 * Corrupt matching writes.
 		 */
-		if (fc->corrupt_bio_byte && (fc->corrupt_bio_rw == WRITE)) {
-			if (all_corrupt_bio_flags_match(bio, fc))
-				corrupt_bio_data(bio, fc);
+		if (fc->corrupt_bio_byte) {
+			if ((fc->corrupt_bio_rw == WRITE)) {
+				if (all_corrupt_bio_flags_match(bio, fc))
+					corrupt_bio_data(bio, fc);
+			}
 			goto map_bio;
 		}
 
@@ -393,13 +395,14 @@ static int flakey_end_io(struct dm_targe
 		return DM_ENDIO_DONE;
 
 	if (!*error && pb->bio_submitted && (bio_data_dir(bio) == READ)) {
-		if (fc->corrupt_bio_byte && (fc->corrupt_bio_rw == READ) &&
-		    all_corrupt_bio_flags_match(bio, fc)) {
-			/*
-			 * Corrupt successful matching READs while in down state.
-			 */
-			corrupt_bio_data(bio, fc);
-
+		if (fc->corrupt_bio_byte) {
+			if ((fc->corrupt_bio_rw == READ) &&
+			    all_corrupt_bio_flags_match(bio, fc)) {
+				/*
+				 * Corrupt successful matching READs while in down state.
+				 */
+				corrupt_bio_data(bio, fc);
+			}
 		} else if (!test_bit(DROP_WRITES, &fc->flags) &&
 			   !test_bit(ERROR_WRITES, &fc->flags)) {
 			/*
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

