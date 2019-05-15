Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D65F01F680
	for <lists+dm-devel@lfdr.de>; Wed, 15 May 2019 16:26:23 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DB44C81F2F;
	Wed, 15 May 2019 14:26:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AEF5C60CC0;
	Wed, 15 May 2019 14:26:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0F90618089CB;
	Wed, 15 May 2019 14:26:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4FENlpY031678 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 15 May 2019 10:23:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6F8191001E98; Wed, 15 May 2019 14:23:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AD351001E85
	for <dm-devel@redhat.com>; Wed, 15 May 2019 14:23:45 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 58FD081F0F
	for <dm-devel@redhat.com>; Wed, 15 May 2019 14:23:29 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id y3so244639wmm.2
	for <dm-devel@redhat.com>; Wed, 15 May 2019 07:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=2lBBa4mFrf4BDSerLLwmpoWld8SlPCYkgjPWqmg5mOc=;
	b=UiVR3IVBbV+4Nax7B39QUpAwWFybvr6mYmvlrkDaMuDgRRga6m6yznLo6mkfnVfEk9
	2DggL5Cefte84qm5Swikm+MamHqLASEbjXh6cGi3jdK2k1RMnDO8QxjcCk9oGFn+2z83
	3Zcy7fczV1sdy9gSbSgy8dNfD9N0A/zWR8eVIY5EbX41DNcAwCqnIb0/Wp5XGKMANhp0
	HmLhLiaIuczUHP+/uXDpgIOss1ovDy+SQ9Dpplb+86bV6CF9uIxs5wems+EkL4LmpDN3
	6UNYabpW7M97evD+i584PuP1/AcJBuG+/E+PRecjW3FjIuQjZOMj+Fh7JwC3+/6wyzuW
	hySw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=2lBBa4mFrf4BDSerLLwmpoWld8SlPCYkgjPWqmg5mOc=;
	b=eEsVPXxoi+tCcOS7u8aL5l0omwkYG5UTULvESKTZfB9Oj3bQuaHMPCp2cB0rmbNb+x
	RwreYPSMgGvn07aDIgbydkimziqk/uDtMy7TPBywp/h1aGdQbJEbOUsvg7XNK8lzEfso
	ZrUoX5rPDqpelyywbEuXQmmqpReNPXdkjlsuGxBS9ZXo3TB64vjmGJYc1tSltr3/jSmc
	eQgya6SG9PNGytk8BQbXkLiMnNmZWM6B1+2FdrwGdn9TAPzqiySIXMBunql7WNdVHhvz
	av2HP2O/Yd2Bg5GXjfd0w9Q63AM5r3EYPk/90p+5rPbsljQhLi/mQfcQcIhRq6X7JA+9
	VSBQ==
X-Gm-Message-State: APjAAAU27C0foOe4MoouseOaPnI51RdWrZx1AOCdihiDuRqSFk+k1sgy
	Z1HRz9TngQyNgYEaJPCFkr4FVTiq
X-Google-Smtp-Source: APXvYqz11kw4GPNbhOOX44hNIbrEI0IhUe6f1TJiqnfaUTKfealZzRze/ikRU3+lPplFAlNwtHSzGg==
X-Received: by 2002:a1c:f50a:: with SMTP id t10mr22577489wmh.86.1557930207709; 
	Wed, 15 May 2019 07:23:27 -0700 (PDT)
Received: from merlot.mazyland.net (nat-pool-brq-t.redhat.com. [213.175.37.10])
	by smtp.googlemail.com with ESMTPSA id
	x18sm2430257wrw.14.2019.05.15.07.23.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 May 2019 07:23:26 -0700 (PDT)
From: Milan Broz <gmazyland@gmail.com>
To: dm-devel@redhat.com
Date: Wed, 15 May 2019 16:22:30 +0200
Message-Id: <20190515142231.30590-1-gmazyland@gmail.com>
In-Reply-To: <alpine.LNX.2.21.9999.1905141138180.19368@nlopc43.ioq.uni-jena.de>
References: <alpine.LNX.2.21.9999.1905141138180.19368@nlopc43.ioq.uni-jena.de>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 15 May 2019 14:23:29 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Wed, 15 May 2019 14:23:29 +0000 (UTC) for IP:'209.85.128.65'
	DOMAIN:'mail-wm1-f65.google.com' HELO:'mail-wm1-f65.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM,
	SPF_PASS) 209.85.128.65 mail-wm1-f65.google.com 209.85.128.65
	mail-wm1-f65.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: Milan Broz <gmazyland@gmail.com>
Subject: [dm-devel] [PATCH 1/2] dm-crypt: print device name in integrity
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Wed, 15 May 2019 14:26:22 +0000 (UTC)

This message should better identify the device with the integrity failure.

Signed-off-by: Milan Broz <gmazyland@gmail.com>
---
 drivers/md/dm-crypt.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index 7f6462f74ac8..36dfa36505ed 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -1143,9 +1143,11 @@ static int crypt_convert_block_aead(struct crypt_config *cc,
 		r = crypto_aead_decrypt(req);
 	}
 
-	if (r == -EBADMSG)
-		DMERR_LIMIT("INTEGRITY AEAD ERROR, sector %llu",
+	if (r == -EBADMSG) {
+		char b[BDEVNAME_SIZE];
+		DMERR_LIMIT("%s: INTEGRITY AEAD ERROR, sector %llu", bio_devname(ctx->bio_in, b),
 			    (unsigned long long)le64_to_cpu(*sector));
+	}
 
 	if (!r && cc->iv_gen_ops && cc->iv_gen_ops->post)
 		r = cc->iv_gen_ops->post(cc, org_iv, dmreq);
@@ -1788,7 +1790,8 @@ static void kcryptd_async_done(struct crypto_async_request *async_req,
 		error = cc->iv_gen_ops->post(cc, org_iv_of_dmreq(cc, dmreq), dmreq);
 
 	if (error == -EBADMSG) {
-		DMERR_LIMIT("INTEGRITY AEAD ERROR, sector %llu",
+		char b[BDEVNAME_SIZE];
+		DMERR_LIMIT("%s: INTEGRITY AEAD ERROR, sector %llu", bio_devname(ctx->bio_in, b),
 			    (unsigned long long)le64_to_cpu(*org_sector_of_dmreq(cc, dmreq)));
 		io->error = BLK_STS_PROTECTION;
 	} else if (error < 0)
-- 
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
