Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 880E62D706
	for <lists+dm-devel@lfdr.de>; Wed, 29 May 2019 09:53:18 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9E2887FDFF;
	Wed, 29 May 2019 07:53:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA9851017E3F;
	Wed, 29 May 2019 07:52:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2E54C1806B14;
	Wed, 29 May 2019 07:52:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4T1XgX2002298 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 28 May 2019 21:33:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 73B3660BE0; Wed, 29 May 2019 01:33:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 93C1379012;
	Wed, 29 May 2019 01:33:38 +0000 (UTC)
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0B0DD307D963;
	Wed, 29 May 2019 01:33:38 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id d126so488972pfd.2;
	Tue, 28 May 2019 18:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:mime-version:content-disposition
	:user-agent; bh=zKrr4VP4HF8/3gxRsVG1U8oxmyUqmlQMzF2rdcl+ZUM=;
	b=fCodE0k1SR/XgnrXwksZ/0NgsCpj7/T3qew3IBA9J/yxjzYxeyS9vTXtiaCyi17Pju
	nMAJAz/T6F6KbEodURtPN+bvEVMPnyd3ofqkUwrqM7Mb+qj2HxUMosooMW93nCWtkF0F
	USPZMB13X14sL75tYkeeqMsfZ6jZrG0YPVJElRNzfPI7d0gtAjcxLtydQn+zGAmUKKrk
	mA3sQuIuK8iM5LdXbvbj8r7ohMC9CEvOW1M+RvIVkFPti5TnNnq5wksXC5gX0kuAl96W
	zDMUn1be8VFlWVppg75/cEJ5VY/DDJO4Z0vd6onGf2N9R02DcgziwRutZcUsmT+H9ZUy
	n8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=zKrr4VP4HF8/3gxRsVG1U8oxmyUqmlQMzF2rdcl+ZUM=;
	b=ERjjrdqa/ym/xyxp+OVDAVXIxF3JoGMnHS2Zc9V5EDjEAkDtw+nszR0jKqschZZG3P
	fzQuFmIEDU2CvXu0sIQgx3jIkrAto7CrXugcQd9nEl+P+/u4mt8FI0gKd+Kyse91Hoxr
	Z9W2swvreAAypyMQTIYLEcVglJR+bv6ALWEjtLJR2q01816g27stzgNYOaPtJqcHujCF
	KDaOLFk7VKxODSgKrRDlQ0nH9ugDHSNuZbWx+O7/rMD5bAnK9t9qYOR7yLEoC1yoxLdV
	kIABZWnyOW0ywnCeJp+ZgjN5utU+WsOd7vjxm7T7kSRjmtXY2+mYtrICgD/oNehCx535
	fMUg==
X-Gm-Message-State: APjAAAVgmwjPa4La+oS5JUL+dJCbgJ2N3MkZFIlTyNs+TYw7yi3UkU9r
	v2Bbajq0D7MoZwak5DCf42DYacIB
X-Google-Smtp-Source: APXvYqzjPYA3TCWsvkoDa9t1uozb9hmBqywF2OndUSgMrFkdKfbQ5TGa8smbi6UBhouA2hDLcUae0g==
X-Received: by 2002:a63:520a:: with SMTP id g10mr10490754pgb.136.1559093617233;
	Tue, 28 May 2019 18:33:37 -0700 (PDT)
Received: from zhanggen-UX430UQ ([66.42.35.75])
	by smtp.gmail.com with ESMTPSA id
	k6sm15981806pfi.86.2019.05.28.18.33.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 May 2019 18:33:36 -0700 (PDT)
Date: Wed, 29 May 2019 09:33:20 +0800
From: Gen Zhang <blackgod016574@gmail.com>
To: agk@redhat.com, snitzer@redhat.com, dm-devel@redhat.com
Message-ID: <20190529013320.GA3307@zhanggen-UX430UQ>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Wed, 29 May 2019 01:33:38 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Wed, 29 May 2019 01:33:38 +0000 (UTC) for IP:'209.85.210.196'
	DOMAIN:'mail-pf1-f196.google.com'
	HELO:'mail-pf1-f196.google.com' FROM:'blackgod016574@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: 0.143  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_PASS) 209.85.210.196 mail-pf1-f196.google.com 209.85.210.196
	mail-pf1-f196.google.com <blackgod016574@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 29 May 2019 03:51:19 -0400
Cc: linux-kernel@vger.kernel.org
Subject: [dm-devel] [PATCH] dm-init: fix 2 incorrect use of kstrndup()
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Wed, 29 May 2019 07:53:17 +0000 (UTC)

In drivers/md/dm-init.c, kstrndup() is incorrectly used twice.

It should be: char *kstrndup(const char *s, size_t max, gfp_t gfp);

Signed-off-by: Gen Zhang <blackgod016574@gmail.com>
---
diff --git a/drivers/md/dm-init.c b/drivers/md/dm-init.c
index 352e803..526e261 100644
--- a/drivers/md/dm-init.c
+++ b/drivers/md/dm-init.c
@@ -140,8 +140,8 @@ static char __init *dm_parse_table_entry(struct dm_device *dev, char *str)
 		return ERR_PTR(-EINVAL);
 	}
 	/* target_args */
-	dev->target_args_array[n] = kstrndup(field[3], GFP_KERNEL,
-					     DM_MAX_STR_SIZE);
+	dev->target_args_array[n] = kstrndup(field[3], DM_MAX_STR_SIZE,
+						GFP_KERNEL);
 	if (!dev->target_args_array[n])
 		return ERR_PTR(-ENOMEM);
 
@@ -275,7 +275,7 @@ static int __init dm_init_init(void)
 		DMERR("Argument is too big. Limit is %d\n", DM_MAX_STR_SIZE);
 		return -EINVAL;
 	}
-	str = kstrndup(create, GFP_KERNEL, DM_MAX_STR_SIZE);
+	str = kstrndup(create, DM_MAX_STR_SIZE, GFP_KERNEL);
 	if (!str)
 		return -ENOMEM;
 
---

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
