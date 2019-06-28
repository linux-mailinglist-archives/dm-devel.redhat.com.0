Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDA3596F0
	for <lists+dm-devel@lfdr.de>; Fri, 28 Jun 2019 11:10:32 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5B742356EC;
	Fri, 28 Jun 2019 09:10:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 36F775C237;
	Fri, 28 Jun 2019 09:10:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D623A206D1;
	Fri, 28 Jun 2019 09:10:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5S2low7008133 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 27 Jun 2019 22:47:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 92A9060BEC; Fri, 28 Jun 2019 02:47:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 298B260BE0;
	Fri, 28 Jun 2019 02:47:43 +0000 (UTC)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8E548308338F;
	Fri, 28 Jun 2019 02:47:42 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id c13so1901422pgg.3;
	Thu, 27 Jun 2019 19:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=e0i3Rlp+FEbUJhkhWAZBPL2tU941VCIWNuEjNlTE+Qg=;
	b=gCjdgOOBpTvhJUHulQ9Wu8i/A+YsYsUq5BjUvz9WlOao8jX8QDKoHCEnlWGsldi7Nl
	mNudiXz3WUZ803+YmW2EgYWHL6MiSGcx0atP2uzxiCDYECT6p8eKu1o4vuac+8z9nVp3
	4GrLF3sAAR/5yvAlMs82jTxBi2zMgAseXfVrA96E57nAJprPWkvUnbqfErhpAyH9AG6b
	t3Hm2UvgowsMbsBeBrb07/aEY6k/bfkruH7l6htHfy22JcKgmjdE5AMBgdSS40g+Lp5M
	zL0H2z0q8RQCEFLMvfzaipH9OzmBwJPqosqZ9PnR1Arh2FgNh8uQZsgsup4CqsX7AOtu
	Beng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=e0i3Rlp+FEbUJhkhWAZBPL2tU941VCIWNuEjNlTE+Qg=;
	b=at+i7jPV+tS4yiOuCH2f1OEISBeivsBLGu8uTAI/gEH/SBTXJFJd6M/fTZ5rKMAKz6
	oNSacCDhuhI71pEN4LhDn1bd4WReFt/UDoUMY7wiRdRQsF5d5a57ztwC26s/3gRin6ot
	RmwkiyxvO+gMykvxMYWCC9m64lFrlL02Ysww//zfZYUcw7mzgBTc7yv8KiU268c1rQwt
	1fYfoDQqdqCKKPv/EsqqPHYhryZEuiZvKIKFNb3nf5g2pxnNu7F4qtGZoLxxDQih18yN
	sl3DYJbhAUUlw+aVKQDcP7Jd4jGygT4hT4QMnbMw/QFNX7w3w7VqS/MJXsZVzZ8xynHB
	wnIA==
X-Gm-Message-State: APjAAAXvcLsc6m4ETlQ0U7kQqPs9YNpJo8lc7GMvBYVTHSnL9FcEz/7s
	1nwlikqNlkpVdcn0umD2s+1SNkZE858MhQ==
X-Google-Smtp-Source: APXvYqzbPyWwYsHhNeg3FlZ1r9AxTg2ADMfw3rml0sxo0zpoP7ldk/yfSBD8FZkApai8FatRbxT6zQ==
X-Received: by 2002:a17:90a:1aa4:: with SMTP id
	p33mr10252076pjp.27.1561690062014; 
	Thu, 27 Jun 2019 19:47:42 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
	by smtp.googlemail.com with ESMTPSA id
	u65sm10888346pjb.1.2019.06.27.19.47.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jun 2019 19:47:41 -0700 (PDT)
From: Fuqian Huang <huangfq.daxian@gmail.com>
To: 
Date: Fri, 28 Jun 2019 10:47:34 +0800
Message-Id: <20190628024734.15315-1-huangfq.daxian@gmail.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Fri, 28 Jun 2019 02:47:42 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Fri, 28 Jun 2019 02:47:42 +0000 (UTC) for IP:'209.85.215.195'
	DOMAIN:'mail-pg1-f195.google.com'
	HELO:'mail-pg1-f195.google.com' FROM:'huangfq.daxian@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: 1.391 * (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_SORBS_WEB,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.215.195 mail-pg1-f195.google.com 209.85.215.195
	mail-pg1-f195.google.com <huangfq.daxian@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 28 Jun 2019 05:09:36 -0400
Cc: Fuqian Huang <huangfq.daxian@gmail.com>, dm-devel@redhat.com,
	Mike Snitzer <snitzer@redhat.com>,
	Alasdair Kergon <agk@redhat.com>, linux-kernel@vger.kernel.org
Subject: [dm-devel] [PATCH v2 10/27] md: use kzalloc instead of kmalloc and
	memset
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Fri, 28 Jun 2019 09:10:30 +0000 (UTC)

Replace kmalloc followed by a memset with kzalloc

Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
---
 drivers/md/dm-integrity.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/md/dm-integrity.c b/drivers/md/dm-integrity.c
index 44e76cda087a..f5db89b28757 100644
--- a/drivers/md/dm-integrity.c
+++ b/drivers/md/dm-integrity.c
@@ -3358,7 +3358,7 @@ static int create_journal(struct dm_integrity_c *ic, char **error)
 				goto bad;
 			}
 
-			crypt_iv = kmalloc(ivsize, GFP_KERNEL);
+			crypt_iv = kzalloc(ivsize, GFP_KERNEL);
 			if (!crypt_iv) {
 				*error = "Could not allocate iv";
 				r = -ENOMEM;
@@ -3387,7 +3387,6 @@ static int create_journal(struct dm_integrity_c *ic, char **error)
 				sg_set_buf(&sg[i], va, PAGE_SIZE);
 			}
 			sg_set_buf(&sg[i], &ic->commit_ids, sizeof ic->commit_ids);
-			memset(crypt_iv, 0x00, ivsize);
 
 			skcipher_request_set_crypt(req, sg, sg,
 						   PAGE_SIZE * ic->journal_pages + sizeof ic->commit_ids, crypt_iv);
-- 
2.11.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
