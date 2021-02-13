Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6CF0531DC8C
	for <lists+dm-devel@lfdr.de>; Wed, 17 Feb 2021 16:40:43 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-9mVyYzmBNyWtvY0G8jP0IA-1; Wed, 17 Feb 2021 10:40:39 -0500
X-MC-Unique: 9mVyYzmBNyWtvY0G8jP0IA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BFC111020C20;
	Wed, 17 Feb 2021 15:40:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4266E60C62;
	Wed, 17 Feb 2021 15:40:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BB1F16B502;
	Wed, 17 Feb 2021 15:40:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11DBLxdO030554 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 13 Feb 2021 06:21:59 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 18E5C2166B30; Sat, 13 Feb 2021 11:21:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1391F2166B2D
	for <dm-devel@redhat.com>; Sat, 13 Feb 2021 11:21:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 07C3F185A797
	for <dm-devel@redhat.com>; Sat, 13 Feb 2021 11:21:52 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-497-RKC9ytkQM7iIXdIfYJs_9Q-1; Sat, 13 Feb 2021 06:21:47 -0500
X-MC-Unique: RKC9ytkQM7iIXdIfYJs_9Q-1
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: dm-devel@redhat.com
Date: Sat, 13 Feb 2021 12:11:41 +0100
Message-Id: <20210213111146.3080152-2-bigeasy@linutronix.de>
In-Reply-To: <20210213111146.3080152-1-bigeasy@linutronix.de>
References: <20210213111146.3080152-1-bigeasy@linutronix.de>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 11DBLxdO030554
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 17 Feb 2021 10:31:26 -0500
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Mike Snitzer <snitzer@redhat.com>, Alasdair Kergon <agk@redhat.com>,
	Ignat Korchagin <ignat@cloudflare.com>
Subject: [dm-devel] [PATCH 1/6] dm crypt: Use tasklet_setup().
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

tasklet_setup() has the beauty of passing the argument as part of the
structure instead of an integer value which needs casting.

Use tasklet_setup().

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/md/dm-crypt.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index 68be387581a7e..506655e5eecba 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -2211,9 +2211,14 @@ static void kcryptd_crypt(struct work_struct *work)
 		kcryptd_crypt_write_convert(io);
 }
 
-static void kcryptd_crypt_tasklet(unsigned long work)
+static void kcryptd_crypt_tasklet(struct tasklet_struct *t)
 {
-	kcryptd_crypt((struct work_struct *)work);
+	struct dm_crypt_io *io = from_tasklet(io, t, tasklet);
+
+	if (bio_data_dir(io->base_bio) == READ)
+		kcryptd_crypt_read_convert(io);
+	else
+		kcryptd_crypt_write_convert(io);
 }
 
 static void kcryptd_queue_crypt(struct dm_crypt_io *io)
@@ -2228,7 +2233,7 @@ static void kcryptd_queue_crypt(struct dm_crypt_io *io)
 		 * it is being executed with irqs disabled.
 		 */
 		if (in_irq() || irqs_disabled()) {
-			tasklet_init(&io->tasklet, kcryptd_crypt_tasklet, (unsigned long)&io->work);
+			tasklet_setup(&io->tasklet, kcryptd_crypt_tasklet);
 			tasklet_schedule(&io->tasklet);
 			return;
 		}
-- 
2.30.0


--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

