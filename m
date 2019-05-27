Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C382B136
	for <lists+dm-devel@lfdr.de>; Mon, 27 May 2019 11:19:26 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 588DD821C3;
	Mon, 27 May 2019 09:19:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D1402E199;
	Mon, 27 May 2019 09:19:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 733AE206D4;
	Mon, 27 May 2019 09:19:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4R0oppW003555 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 26 May 2019 20:50:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 61BAE5C238; Mon, 27 May 2019 00:50:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ADFE05C221;
	Mon, 27 May 2019 00:50:46 +0000 (UTC)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A4FA9308620A;
	Mon, 27 May 2019 00:50:45 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id h17so8104693pgv.0;
	Sun, 26 May 2019 17:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:mime-version:content-disposition
	:user-agent; bh=uVUGPkKOm4c0zQwgwv2vysCn0/MC1yfp3I0q+dsnZwI=;
	b=C15dORW1EPCALRsmlfoMQo0CT92qaJrPU+p74DaxQuW1CToHewJ8mh9CxUrA4SiLsM
	JeK/6NQNNgWwAioV+nRlxRVyLJd9E0jPI56z5J6UqMhJwqqJQXoJZzuIgSVnp3LaV9BR
	EQL8TFpOhBCHx1kEkZG47rV0CnBmpQEPqCNzNeD0sWEwqZP9inL8CQZ5Z7nVEuKr77RJ
	kR4uNcEcs/i4+pkcECytsjUjgS8WKkEnlWYpV9KIHXvOoRmSNf6UgjxL3a91fM/TOF9Q
	VCvjUuzO32b79Watq+saR6qexEzzfbA4Zcsa22fgf7kYIzQwc6o0XySjI4Uhrcrno4DH
	DCPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=uVUGPkKOm4c0zQwgwv2vysCn0/MC1yfp3I0q+dsnZwI=;
	b=irTjwqWq/2YP8tY0MBqPVtmy2dddJj/IU9QLtXiNXIoP/kM4UZjF1TquCHEJSxyovD
	A2fjZtz2sOF0f4io+nFcZoYjF6SsKlWT5I0/uxX37EDUr/+BszFlO59rvjciEUDN5qNx
	iTOKKUAuR4Lg0h0V1lxb3Y9Bt2VsnMYq2VuFchpwjOJncu+fbPj6mejZCJQ/eqlRFMoY
	vrw9VoFnC7Sx6TiDbMisy4Nxa+4LMs8Mf+2F4bOdFo3xxTTa265LZFjb3qtDD1VruBKG
	D6Pj32WEpv5gOHObKyyt8X0aZTGxQWUz3OmFjfB0WVKl0gssuzoHTSUZIIPKhcserfYy
	0wzA==
X-Gm-Message-State: APjAAAV+gZ1Hs3JPYvu3yfGHZYPtyBQbzdorn0YFavMEOd9SC9gRErHL
	WsYKQYbNhZ5LRsjEZji45ZIOBHJF
X-Google-Smtp-Source: APXvYqxr93AB+wl4Igg+5Pdms/MkJKL6oa8z6q+FSRrbvkwXX55+UN4MyDZH2K91TMr+M/hJ8HL69A==
X-Received: by 2002:a63:950d:: with SMTP id
	p13mr123027116pgd.269.1558918244895; 
	Sun, 26 May 2019 17:50:44 -0700 (PDT)
Received: from zhanggen-UX430UQ ([66.42.35.75])
	by smtp.gmail.com with ESMTPSA id g8sm7685137pgq.33.2019.05.26.17.50.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 26 May 2019 17:50:44 -0700 (PDT)
Date: Mon, 27 May 2019 08:50:34 +0800
From: Gen Zhang <blackgod016574@gmail.com>
To: agk@redhat.com, snitzer@redhat.com
Message-ID: <20190527005034.GA16907@zhanggen-UX430UQ>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Mon, 27 May 2019 00:50:45 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Mon, 27 May 2019 00:50:45 +0000 (UTC) for IP:'209.85.215.196'
	DOMAIN:'mail-pg1-f196.google.com'
	HELO:'mail-pg1-f196.google.com' FROM:'blackgod016574@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: 0.143  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_PASS) 209.85.215.196 mail-pg1-f196.google.com 209.85.215.196
	mail-pg1-f196.google.com <blackgod016574@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 27 May 2019 05:18:07 -0400
Cc: dm-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [dm-devel] [PATCH] dm-region-hash: fix a missing-check bug in
	__rh_alloc()
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Mon, 27 May 2019 09:19:24 +0000 (UTC)

In function __rh_alloc(), the pointer nreg is allocated a memory space
via kmalloc(). And it is used in the following codes. However, when 
there is a memory allocation error, kmalloc() fails. Thus null pointer
dereference may happen. And it will cause the kernel to crash. Therefore,
we should check the return value and handle the error.
Further, in __rh_find(), we should also check the return value and
handle the error.

Signed-off-by: Gen Zhang <blackgod016574@gmail.com>
---
diff --git a/drivers/md/dm-region-hash.c b/drivers/md/dm-region-hash.c
index 1f76045..2fa1641 100644
--- a/drivers/md/dm-region-hash.c
+++ b/drivers/md/dm-region-hash.c
@@ -290,8 +290,11 @@ static struct dm_region *__rh_alloc(struct dm_region_hash *rh, region_t region)
 	struct dm_region *reg, *nreg;
 
 	nreg = mempool_alloc(&rh->region_pool, GFP_ATOMIC);
-	if (unlikely(!nreg))
+	if (unlikely(!nreg)) {
 		nreg = kmalloc(sizeof(*nreg), GFP_NOIO | __GFP_NOFAIL);
+		if (!nreg)
+			return NULL;
+	}
 
 	nreg->state = rh->log->type->in_sync(rh->log, region, 1) ?
 		      DM_RH_CLEAN : DM_RH_NOSYNC;
@@ -329,6 +332,8 @@ static struct dm_region *__rh_find(struct dm_region_hash *rh, region_t region)
 	if (!reg) {
 		read_unlock(&rh->hash_lock);
 		reg = __rh_alloc(rh, region);
+		if (!reg)
+			return NULL;
 		read_lock(&rh->hash_lock);
 	}
 
---

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
