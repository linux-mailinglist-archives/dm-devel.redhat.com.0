Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D590B4CC93
	for <lists+dm-devel@lfdr.de>; Thu, 20 Jun 2019 13:04:12 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2DDD5223881;
	Thu, 20 Jun 2019 11:03:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B00B1001E73;
	Thu, 20 Jun 2019 11:03:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 153EA1806B0F;
	Thu, 20 Jun 2019 11:02:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5KB0lx6026373 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 20 Jun 2019 07:00:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 21E8F608D0; Thu, 20 Jun 2019 11:00:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 193AF60605
	for <dm-devel@redhat.com>; Thu, 20 Jun 2019 11:00:44 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2ABDE30860CC
	for <dm-devel@redhat.com>; Thu, 20 Jun 2019 11:00:34 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id c6so2724690wml.0
	for <dm-devel@redhat.com>; Thu, 20 Jun 2019 04:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=b8Fgt7qDUFVrSLZx2cDd5aSRrn31LgQjC8P725nvaqA=;
	b=N0a83eYw87xAGgHPFV3KvvUV9frtllxka0fmiFgzABCtCqR8jlieNJyor7gZerRkAe
	z/1AoWNivsyGWuICm26NstHyB91acOBpKXW11Sm/4GeOW2NXnUPXNxjifTzYXXHJi1y6
	n+N06/9+YOiEUxJWpNFPYfuofu+Hel13R5RMWCsDg5ZtwAYbnwQL8QlSqb9fSY/Mz6EE
	O941+TgQS3JMjCfRbsIP4jPgr6nfU5cr4qLp2dz3zew4Oj7Tjc6iHe3Ga1Dl/11S9xa8
	Q1PbexyfH4eqIdydgejdY84vfugcBHG07O9HDTI9CQL7+WvX9VofP2GWTo2dwH2DjWcv
	G5ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=b8Fgt7qDUFVrSLZx2cDd5aSRrn31LgQjC8P725nvaqA=;
	b=G68ZegWLIWTJCBpHVM6VSyNE4U8XsIpawr2yOgPq1Fjd34QpCMmW9Rwtr/7/QF4QUS
	zJB1xubDWGQlAm2BaVXgwF3gjsnhA3J7z9odZNzXpoCR9tpa7g/JwlIgikDHK6JENsm9
	ISSV6s4p0FOtq9rzHKWCeMbeWCHyIZ3DdWfPd5A5cjG+hRxV59f5t19r3s1PEBPXt0Rt
	vukkbIKr3c1r/YPW0YJvBn4+f0jay5dgdSuSN7jkXWaZWq3Q6TFG6a4M2t6osZe9ZAMy
	s3+6BrwV9Imn0PxDfA7I9Bo7jUfr0dyqSzOdtIMm2CRtBhssqOPJ8B2hBC89jEG/y3Zc
	LQUQ==
X-Gm-Message-State: APjAAAWaCl56XBG2NqBPLAV1pLt0L0N/Cix9EG/fahzGLKutJCTAzIHG
	Bl+ahTG+oZYrzOmAxUm6jJ8cq5o/EWk=
X-Google-Smtp-Source: APXvYqw1WU99o5Sn5ZNqTPJBBAREe31ohvaSi325KnBraJBZejBWFr8lm6Po1QbCS5JcJQHdXG1xSw==
X-Received: by 2002:a05:600c:1008:: with SMTP id
	c8mr2477081wmc.133.1561028430092; 
	Thu, 20 Jun 2019 04:00:30 -0700 (PDT)
Received: from merlot.mazyland.net ([2001:718:801:22c:e1af:7feb:5010:33ea])
	by smtp.googlemail.com with ESMTPSA id
	t1sm29857796wra.74.2019.06.20.04.00.29
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 20 Jun 2019 04:00:29 -0700 (PDT)
From: Milan Broz <gmazyland@gmail.com>
To: dm-devel@redhat.com
Date: Thu, 20 Jun 2019 13:00:19 +0200
Message-Id: <20190620110019.8057-1-gmazyland@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Thu, 20 Jun 2019 11:00:34 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Thu, 20 Jun 2019 11:00:34 +0000 (UTC) for IP:'209.85.128.67'
	DOMAIN:'mail-wm1-f67.google.com' HELO:'mail-wm1-f67.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: 1.391 * (DKIM_ADSP_CUSTOM_MED, DKIM_INVALID, DKIM_SIGNED,
	FREEMAIL_FROM, NML_ADSP_CUSTOM_MED, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.67 mail-wm1-f67.google.com 209.85.128.67
	mail-wm1-f67.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Milan Broz <gmazyland@gmail.com>
Subject: [dm-devel] [PATCH] dm-verity: Use message limit for data block
	corruption message.
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Thu, 20 Jun 2019 11:04:11 +0000 (UTC)

The dm-verity already uses DMERR_LIMIT on other places, so it
should also limit repeated data block corruption messages.

Signed-off-by: Milan Broz <gmazyland@gmail.com>
---
 drivers/md/dm-verity-target.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/dm-verity-target.c b/drivers/md/dm-verity-target.c
index 720d06531aa3..08f83e160ad5 100644
--- a/drivers/md/dm-verity-target.c
+++ b/drivers/md/dm-verity-target.c
@@ -235,7 +235,7 @@ static int verity_handle_err(struct dm_verity *v, enum verity_block_type type,
 		BUG();
 	}
 
-	DMERR("%s: %s block %llu is corrupted", v->data_dev->name, type_str,
+	DMERR_LIMIT("%s: %s block %llu is corrupted", v->data_dev->name, type_str,
 		block);
 
 	if (v->corrupted_errs == DM_VERITY_MAX_CORRUPTED_ERRS)
-- 
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
