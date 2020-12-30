Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3496F2E7995
	for <lists+dm-devel@lfdr.de>; Wed, 30 Dec 2020 14:15:29 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-J2ocBKBENdK5iaB8bRzr0A-1; Wed, 30 Dec 2020 08:15:25 -0500
X-MC-Unique: J2ocBKBENdK5iaB8bRzr0A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 879B9100C604;
	Wed, 30 Dec 2020 13:15:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 382AF2CD63;
	Wed, 30 Dec 2020 13:15:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 79D2C180954D;
	Wed, 30 Dec 2020 13:15:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BUD4gjS008550 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 30 Dec 2020 08:04:43 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CCC412026D3A; Wed, 30 Dec 2020 13:04:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C7F832026D76
	for <dm-devel@redhat.com>; Wed, 30 Dec 2020 13:04:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 98CCD185A794
	for <dm-devel@redhat.com>; Wed, 30 Dec 2020 13:04:40 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-530-8rcq-qmZN9qaGyqfH_J8Mw-1;
	Wed, 30 Dec 2020 08:04:37 -0500
X-MC-Unique: 8rcq-qmZN9qaGyqfH_J8Mw-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0E00922A83;
	Wed, 30 Dec 2020 13:04:34 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Wed, 30 Dec 2020 08:04:22 -0500
Message-Id: <20201230130422.3637448-10-sashal@kernel.org>
In-Reply-To: <20201230130422.3637448-1-sashal@kernel.org>
References: <20201230130422.3637448-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0BUD4gjS008550
X-loop: dm-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, Hyeongseok Kim <hyeongseok@gmail.com>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>,
	Sami Tolvanen <samitolvanen@google.com>
Subject: [dm-devel] [PATCH AUTOSEL 4.19 10/10] dm verity: skip verity work
	if I/O error when system is shutting down
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

From: Hyeongseok Kim <hyeongseok@gmail.com>

[ Upstream commit 252bd1256396cebc6fc3526127fdb0b317601318 ]

If emergency system shutdown is called, like by thermal shutdown,
a dm device could be alive when the block device couldn't process
I/O requests anymore. In this state, the handling of I/O errors
by new dm I/O requests or by those already in-flight can lead to
a verity corruption state, which is a misjudgment.

So, skip verity work in response to I/O error when system is shutting
down.

Signed-off-by: Hyeongseok Kim <hyeongseok@gmail.com>
Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
Signed-off-by: Mike Snitzer <snitzer@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/md/dm-verity-target.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm-verity-target.c b/drivers/md/dm-verity-target.c
index e3599b43f9eb9..599be2d2b0ae9 100644
--- a/drivers/md/dm-verity-target.c
+++ b/drivers/md/dm-verity-target.c
@@ -533,6 +533,15 @@ static int verity_verify_io(struct dm_verity_io *io)
 	return 0;
 }
 
+/*
+ * Skip verity work in response to I/O error when system is shutting down.
+ */
+static inline bool verity_is_system_shutting_down(void)
+{
+	return system_state == SYSTEM_HALT || system_state == SYSTEM_POWER_OFF
+		|| system_state == SYSTEM_RESTART;
+}
+
 /*
  * End one "io" structure with a given error.
  */
@@ -560,7 +569,8 @@ static void verity_end_io(struct bio *bio)
 {
 	struct dm_verity_io *io = bio->bi_private;
 
-	if (bio->bi_status && !verity_fec_is_enabled(io->v)) {
+	if (bio->bi_status &&
+	    (!verity_fec_is_enabled(io->v) || verity_is_system_shutting_down())) {
 		verity_finish_io(io, bio->bi_status);
 		return;
 	}
-- 
2.27.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

