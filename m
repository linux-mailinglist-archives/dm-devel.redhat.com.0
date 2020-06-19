Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 0B823203257
	for <lists+dm-devel@lfdr.de>; Mon, 22 Jun 2020 10:47:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592815657;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=a/Z8SAlq6mbpoUDz3AC91+ulnMwlPL/RUzRuyGiAo8k=;
	b=PhEHtGPO3K7pj00X7a3HhFyyk1dfDBis3b8KF4PUvkPhaivZvnENeXN9UyvykgXFAXJWGp
	YIUuWlN1K/tgmlVKl+pz8dKdp8f8ZTECgAkSFrRVfwwvCQYFp/c1+p2QYPhZXxp+mWyODS
	XPtHGvg11pjVbSMHnftZvhulGyU0WHk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-Gb203lv3MYml-Vb-2L9SIA-1; Mon, 22 Jun 2020 04:47:34 -0400
X-MC-Unique: Gb203lv3MYml-Vb-2L9SIA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C05D3805726;
	Mon, 22 Jun 2020 08:47:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 70E4D1002391;
	Mon, 22 Jun 2020 08:47:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2CCBE180954D;
	Mon, 22 Jun 2020 08:47:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05JGg0BY028868 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 12:42:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 38D52107262; Fri, 19 Jun 2020 16:42:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 34573107267
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 16:41:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E46D38007AC
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 16:41:56 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-238-uOO3qgzcNWqZ0MQQMtUT3A-1; Fri, 19 Jun 2020 12:41:54 -0400
X-MC-Unique: uOO3qgzcNWqZ0MQQMtUT3A-1
Received: by mail-wm1-f68.google.com with SMTP id l17so9025975wmj.0
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 09:41:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=JZ1Uio63dmuNEhXDmZNkCOwutdIAFTQ3JpFVR/jATEY=;
	b=moTOVSs0d0D/xvypTs5hV8yphtx+laKm42GFgQJoPnoVmqWPH6FRSwE7ELn8W+Zkrv
	yDWD4vXYDeuJyjiQDX+C9jzTXjzmwXfpXQl/yttNo6Tr9qOXntodcHUimDGNlyjDYXL0
	nOmd7LiZRKU0kLiPoHFSlVfhz2jwfqzMjs1nXf1r03/DqhS9Tg6Fvr0JK2FgwCJEhbdf
	AXYnwVD/UNfcWDUmwSoCyPi66EICAhwb/snkfRYvJCKD3WUCNyT3t6bSgj8n1HAk0/jb
	LpBJFJI1cCWPVt//GYHjuDdPsGwnl1uAgzldtBNtTPvgQPmr0tksFwDn0NZZ79zTNCIT
	SP9A==
X-Gm-Message-State: AOAM530jtG/zckWPYJY4VyzgPjPORy06mzFBADGU/2/lD3bMGZdR8/DC
	j8ocrsK8OL98kA7oEMhU4AtyNa3KxBs=
X-Google-Smtp-Source: ABdhPJwNIN4u822IVaJlHewCqFRluApyx6KfWP+jRlqlnOMB4gXpoDBtiWzMavMuYgAQXAIV9fEX2g==
X-Received: by 2002:a1c:9d09:: with SMTP id g9mr4496560wme.31.1592584912929;
	Fri, 19 Jun 2020 09:41:52 -0700 (PDT)
Received: from localhost.localdomain (88-144-169-85.host.pobb.as13285.net.
	[88.144.169.85])
	by smtp.gmail.com with ESMTPSA id j4sm7521901wma.7.2020.06.19.09.41.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 19 Jun 2020 09:41:52 -0700 (PDT)
From: Ignat Korchagin <ignat@cloudflare.com>
To: agk@redhat.com, snitzer@redhat.com, dm-devel@redhat.com, dm-crypt@saout.de,
	linux-kernel@vger.kernel.org
Date: Fri, 19 Jun 2020 17:41:32 +0100
Message-Id: <20200619164132.1648-2-ignat@cloudflare.com>
In-Reply-To: <20200619164132.1648-1-ignat@cloudflare.com>
References: <20200619164132.1648-1-ignat@cloudflare.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 22 Jun 2020 04:47:18 -0400
Cc: kernel-team@cloudflare.com, Ignat Korchagin <ignat@cloudflare.com>
Subject: [dm-devel] [RFC PATCH 1/1] Add DM_CRYPT_FORCE_INLINE flag to
	dm-crypt target
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

Sometimes extra thread offloading imposed by dm-crypt hurts IO latency. This is
especially visible on busy systems with many processes/threads. Moreover, most
Crypto API implementaions are async, that is they offload crypto operations on
their own, so this dm-crypt offloading is excessive.

This adds a new flag, which directs dm-crypt not to offload crypto operations
and process everything inline. For cases, where crypto operations cannot happen
inline (hard interrupt context, for example the read path of the NVME driver),
we offload the work to a tasklet rather than a workqueue.

Signed-off-by: Ignat Korchagin <ignat@cloudflare.com>
---
 drivers/md/dm-crypt.c | 55 +++++++++++++++++++++++++++++++++----------
 1 file changed, 43 insertions(+), 12 deletions(-)

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index 000ddfab5ba0..5a9bac4fdffb 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -69,6 +69,7 @@ struct dm_crypt_io {
 	u8 *integrity_metadata;
 	bool integrity_metadata_from_pool;
 	struct work_struct work;
+	struct tasklet_struct tasklet;
 
 	struct convert_context ctx;
 
@@ -127,7 +128,7 @@ struct iv_elephant_private {
  * and encrypts / decrypts at the same time.
  */
 enum flags { DM_CRYPT_SUSPENDED, DM_CRYPT_KEY_VALID,
-	     DM_CRYPT_SAME_CPU, DM_CRYPT_NO_OFFLOAD };
+	     DM_CRYPT_SAME_CPU, DM_CRYPT_NO_OFFLOAD, DM_CRYPT_FORCE_INLINE = (sizeof(unsigned long) * 8 - 1) };
 
 enum cipher_flags {
 	CRYPT_MODE_INTEGRITY_AEAD,	/* Use authenticated mode for cihper */
@@ -1458,13 +1459,18 @@ static void crypt_alloc_req_skcipher(struct crypt_config *cc,
 
 	skcipher_request_set_tfm(ctx->r.req, cc->cipher_tfm.tfms[key_index]);
 
-	/*
-	 * Use REQ_MAY_BACKLOG so a cipher driver internally backlogs
-	 * requests if driver request queue is full.
-	 */
-	skcipher_request_set_callback(ctx->r.req,
-	    CRYPTO_TFM_REQ_MAY_BACKLOG,
-	    kcryptd_async_done, dmreq_of_req(cc, ctx->r.req));
+	if (test_bit(DM_CRYPT_FORCE_INLINE, &cc->flags))
+		/* make sure we zero important fields of the request */
+		skcipher_request_set_callback(ctx->r.req,
+	        0, NULL, NULL);
+	else
+		/*
+		 * Use REQ_MAY_BACKLOG so a cipher driver internally backlogs
+		 * requests if driver request queue is full.
+		 */
+		skcipher_request_set_callback(ctx->r.req,
+	        CRYPTO_TFM_REQ_MAY_BACKLOG,
+	        kcryptd_async_done, dmreq_of_req(cc, ctx->r.req));
 }
 
 static void crypt_alloc_req_aead(struct crypt_config *cc,
@@ -1566,7 +1572,8 @@ static blk_status_t crypt_convert(struct crypt_config *cc,
 			atomic_dec(&ctx->cc_pending);
 			ctx->cc_sector += sector_step;
 			tag_offset++;
-			cond_resched();
+			if (!test_bit(DM_CRYPT_FORCE_INLINE, &cc->flags))
+				cond_resched();
 			continue;
 		/*
 		 * There was a data integrity error.
@@ -1892,6 +1899,11 @@ static void kcryptd_crypt_write_io_submit(struct dm_crypt_io *io, int async)
 
 	clone->bi_iter.bi_sector = cc->start + io->sector;
 
+	if (test_bit(DM_CRYPT_FORCE_INLINE, &cc->flags)) {
+		generic_make_request(clone);
+		return;
+	}
+
 	if (likely(!async) && test_bit(DM_CRYPT_NO_OFFLOAD, &cc->flags)) {
 		generic_make_request(clone);
 		return;
@@ -2031,12 +2043,26 @@ static void kcryptd_crypt(struct work_struct *work)
 		kcryptd_crypt_write_convert(io);
 }
 
+static void kcryptd_crypt_tasklet(unsigned long work)
+{
+	kcryptd_crypt((struct work_struct *)work);
+}
+
 static void kcryptd_queue_crypt(struct dm_crypt_io *io)
 {
 	struct crypt_config *cc = io->cc;
 
-	INIT_WORK(&io->work, kcryptd_crypt);
-	queue_work(cc->crypt_queue, &io->work);
+	if (test_bit(DM_CRYPT_FORCE_INLINE, &cc->flags)) {
+		if (in_irq()) {
+			/* Crypto API will fail hard in hard IRQ context */
+			tasklet_init(&io->tasklet, kcryptd_crypt_tasklet, (unsigned long)&io->work);
+			tasklet_schedule(&io->tasklet);
+		} else
+			kcryptd_crypt(&io->work);
+	} else {
+		INIT_WORK(&io->work, kcryptd_crypt);
+		queue_work(cc->crypt_queue, &io->work);
+	}
 }
 
 static void crypt_free_tfms_aead(struct crypt_config *cc)
@@ -2838,7 +2864,7 @@ static int crypt_ctr_optional(struct dm_target *ti, unsigned int argc, char **ar
 	struct crypt_config *cc = ti->private;
 	struct dm_arg_set as;
 	static const struct dm_arg _args[] = {
-		{0, 6, "Invalid number of feature args"},
+		{0, 7, "Invalid number of feature args"},
 	};
 	unsigned int opt_params, val;
 	const char *opt_string, *sval;
@@ -2868,6 +2894,8 @@ static int crypt_ctr_optional(struct dm_target *ti, unsigned int argc, char **ar
 
 		else if (!strcasecmp(opt_string, "submit_from_crypt_cpus"))
 			set_bit(DM_CRYPT_NO_OFFLOAD, &cc->flags);
+		else if (!strcasecmp(opt_string, "force_inline"))
+			set_bit(DM_CRYPT_FORCE_INLINE, &cc->flags);
 		else if (sscanf(opt_string, "integrity:%u:", &val) == 1) {
 			if (val == 0 || val > MAX_TAG_SIZE) {
 				ti->error = "Invalid integrity arguments";
@@ -3196,6 +3224,7 @@ static void crypt_status(struct dm_target *ti, status_type_t type,
 		num_feature_args += !!ti->num_discard_bios;
 		num_feature_args += test_bit(DM_CRYPT_SAME_CPU, &cc->flags);
 		num_feature_args += test_bit(DM_CRYPT_NO_OFFLOAD, &cc->flags);
+		num_feature_args += test_bit(DM_CRYPT_FORCE_INLINE, &cc->flags);
 		num_feature_args += cc->sector_size != (1 << SECTOR_SHIFT);
 		num_feature_args += test_bit(CRYPT_IV_LARGE_SECTORS, &cc->cipher_flags);
 		if (cc->on_disk_tag_size)
@@ -3208,6 +3237,8 @@ static void crypt_status(struct dm_target *ti, status_type_t type,
 				DMEMIT(" same_cpu_crypt");
 			if (test_bit(DM_CRYPT_NO_OFFLOAD, &cc->flags))
 				DMEMIT(" submit_from_crypt_cpus");
+			if (test_bit(DM_CRYPT_FORCE_INLINE, &cc->flags))
+				DMEMIT(" force_inline");
 			if (cc->on_disk_tag_size)
 				DMEMIT(" integrity:%u:%s", cc->on_disk_tag_size, cc->cipher_auth);
 			if (cc->sector_size != (1 << SECTOR_SHIFT))
-- 
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

