Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA9A16AB4
	for <lists+dm-devel@lfdr.de>; Tue,  7 May 2019 20:53:24 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 55EB7C05D3FD;
	Tue,  7 May 2019 18:53:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2948B17253;
	Tue,  7 May 2019 18:53:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B43B518089CB;
	Tue,  7 May 2019 18:53:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x47IrHoi001456 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 7 May 2019 14:53:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B0A7F608CA; Tue,  7 May 2019 18:53:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AAD0717998
	for <dm-devel@redhat.com>; Tue,  7 May 2019 18:53:14 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0449FC058CA8
	for <dm-devel@redhat.com>; Tue,  7 May 2019 18:53:14 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id e11so10716055wrs.0
	for <dm-devel@redhat.com>; Tue, 07 May 2019 11:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HpicCrYYCzFXy4XwRKbgNzm7LuKv1hekt/ACkogI8xs=;
	b=ConRg/gfsa9TPrfTJM54C22GviX7/5r3zza5Oq1tnKzwQZYXHugJSiPk8fn+8CWfud
	ZDR/hX+oof14t/5oFIfn13lK3IO4+N1F9ZnFsiMrVIuKd4ipUjKw0rFMkhNDvgkpBHs6
	z+PdG83JWbTz2f0pPC3TnGyHHSSFv6FU/q8be0r1KfvaWNgDDjabirvKu4CeiKeMtrnF
	vFmqa0wEX/jwTze0IHIVFz48acH8JLLF8O5oVFqUXCopfa8fB72EgrZ8KfPsLpMbKKNR
	O19RWMMh5AxF1larS0UQW6lu/wbxx8V8mH2KS9mhBqAcjuvTIOekYgHoeQShjAObi2xM
	Xc5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HpicCrYYCzFXy4XwRKbgNzm7LuKv1hekt/ACkogI8xs=;
	b=MXh9MOzwEY2MhHGGy60tEWE5yjlVNa58c1vHJhBCxIHFyRRS5PTCgNYLCaTg9p911+
	j34vGw/2TW5e1fkx+mR1hIUiCRV4hfityQmX2htViYc0lt3CMEeJy4WLAl3miZGqzVFg
	hMHoVX4sgCvEi4lNyQQu15A+cgZJ+0iTVhXqFJWTkEy6lFNIke8XdpLMMMLGJjj9rHBU
	8jV461jPAelyX8FRz1k83BKOn51dQgGveq2LB1dJMk68LiXOp3JemT7YD3L4tMj4SK4V
	rZ8qweYs+wruuvnshZpD/mQhWQPqhjyQVCeCtWKQWRqaTEc7lT/zxX5IUxwoCF+KnpZV
	xvoQ==
X-Gm-Message-State: APjAAAVs1IED29LG2vywA/0tzzZVqUNyzunJfAijpkiiFbq+w9TyRidh
	ogN2NJIkpHeoXB6HdZaxMA==
X-Google-Smtp-Source: APXvYqwzJR46xJuquUOy9lbTmF1muIISALQOMJah7lkCGnWJeiKdpko8aJBNZQSiv1vF4TF8V0wMSA==
X-Received: by 2002:adf:ef8f:: with SMTP id d15mr8027437wro.330.1557255192410; 
	Tue, 07 May 2019 11:53:12 -0700 (PDT)
Received: from localhost (118.red-88-12-24.staticip.rima-tde.net.
	[88.12.24.118]) by smtp.gmail.com with ESMTPSA id
	d11sm10013843wmb.39.2019.05.07.11.53.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 07 May 2019 11:53:11 -0700 (PDT)
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
To: 
Date: Tue,  7 May 2019 20:53:09 +0200
Message-Id: <20190507185309.21050-1-xose.vazquez@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 07 May 2019 18:53:14 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]);
	Tue, 07 May 2019 18:53:14 +0000 (UTC) for IP:'209.85.221.67'
	DOMAIN:'mail-wr1-f67.google.com' HELO:'mail-wr1-f67.google.com'
	FROM:'xose.vazquez@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.111  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_PASS) 209.85.221.67 mail-wr1-f67.google.com 209.85.221.67
	mail-wr1-f67.google.com <xose.vazquez@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.32
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: DM-DEVEL ML <dm-devel@redhat.com>,
	Xose Vazquez Perez <xose.vazquez@gmail.com>
Subject: [dm-devel] [PATCH] multipath-tools: format correctly maintainer
	info in hwtable
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Tue, 07 May 2019 18:53:23 +0000 (UTC)

Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>
Cc: DM-DEVEL ML <dm-devel@redhat.com>
Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
---
 libmultipath/hwtable.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/libmultipath/hwtable.c b/libmultipath/hwtable.c
index 1d96433..1fade7e 100644
--- a/libmultipath/hwtable.c
+++ b/libmultipath/hwtable.c
@@ -38,7 +38,7 @@
 	 *
 	 * COMPANY_NAME
 	 *
-	 * Maintainer: XXX <email>
+	 * Maintainer: NAME <email>
 	 */
 	{
 		/* Product Name */
@@ -708,7 +708,7 @@ static struct hwentry default_hw[] = {
                 /*
 		 * DE Series
 		 *
-		 * Maintainer: ng-eseries-upstream-maintainers@netapp.com
+		 * Maintainer: NetApp RDAC team <ng-eseries-upstream-maintainers@netapp.com>
 		 */
                 .vendor        = "LENOVO",
                 .product       = "DE_Series",
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
