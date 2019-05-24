Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBBF291EB
	for <lists+dm-devel@lfdr.de>; Fri, 24 May 2019 09:41:45 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 503A63082207;
	Fri, 24 May 2019 07:40:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31B8C5B683;
	Fri, 24 May 2019 07:39:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7D8C365D03;
	Fri, 24 May 2019 07:38:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4O3DMjf007057 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 23 May 2019 23:13:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5AF965C239; Fri, 24 May 2019 03:13:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BE0EE18236;
	Fri, 24 May 2019 03:13:17 +0000 (UTC)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1DE443078AAC;
	Fri, 24 May 2019 03:13:17 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id g9so3552131plm.6;
	Thu, 23 May 2019 20:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:mime-version:content-disposition
	:user-agent; bh=SADUbUTzsKuL6+0zlFN554wz3Ug1cJN9qaVymCYLya8=;
	b=RkRTYY+3hCLgYqP2p+u+vpPJcIgR7UCLzQVOZl9uOyK1n3lrfRyg3ucE3OwGPk9P+P
	tLqwZbaVRXdBtc+0DB1TZU+dOnf2fVy3XzzMaozUAPfUS7T4BerAEIx3U0BwTrIpAbgu
	qLtLDLrTExsuU55T39GAzXMZXAKwO71fUxxMl2m1lMOO5++FwxOK3wbIu6GyfxRh5N0l
	dfPD8qf2iIcp9eetBCLwPJvPBr60mdgGEuu5OLeNGSZP8Dqd39y6BJssucc2z9/MN2T4
	LoO2I9Qff2ZTZj2Eh7XtljAR7+yoO5T15x39zK54CNISqcbKOuHqo4Hd+/u/uYDWfrhO
	n/NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=SADUbUTzsKuL6+0zlFN554wz3Ug1cJN9qaVymCYLya8=;
	b=tINF+dYlUsyTQ8G/OBgSgMYfFJotPYstuIWI+Py7li7+jKkyWeuqIBeDS+Tpiu5vo/
	9qpeRX0CKVFMC+gEnkt/VgJFLdwkaxj9Mg3C8RKGRJ9gHNVTAjGmNQGu9jhbZ3Iqm+gP
	Y1nBgzOcLxz0016NJk0Ia4pKnoHs23vSRxuSDmQ1Fj1Wh3IR4GQmI1n3vA2q86oC7wg6
	Z9LcJJIRb03VhoOro8oZhneslJ2xSeg/eRbNKtH+uVTT/PHAhm+MkcKTOfgtmfkJEXPe
	W3s3uNEwtVFmR1We9wkfbCO0RnNqj2yit9UV7NY1cP6lXDuaOrw3QI7a7hBtiCz1l3HL
	R+Ug==
X-Gm-Message-State: APjAAAU/exIEA+feOLyiVZG/BciaBrZtokEsJwFdlTdxm43ME9ccW+Xn
	9RnFjZ7zmVRDBNP3Y13OTB/RWIVKqmQ=
X-Google-Smtp-Source: APXvYqwx+3Ni5mzChJHEGu89s31328M3giHbmL30qpfZhaPz2GvtZ7v0kNlaEDRChzrpyQdQ6bnsNw==
X-Received: by 2002:a17:902:b615:: with SMTP id
	b21mr40159692pls.12.1558667596052; 
	Thu, 23 May 2019 20:13:16 -0700 (PDT)
Received: from zhanggen-UX430UQ ([66.42.35.75])
	by smtp.gmail.com with ESMTPSA id
	e10sm909308pfm.137.2019.05.23.20.13.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 May 2019 20:13:15 -0700 (PDT)
Date: Fri, 24 May 2019 11:12:48 +0800
From: Gen Zhang <blackgod016574@gmail.com>
To: agk@redhat.com, snitzer@redhat.com, dm-devel@redhat.com
Message-ID: <20190524031248.GA6295@zhanggen-UX430UQ>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Fri, 24 May 2019 03:13:17 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Fri, 24 May 2019 03:13:17 +0000 (UTC) for IP:'209.85.214.194'
	DOMAIN:'mail-pl1-f194.google.com'
	HELO:'mail-pl1-f194.google.com' FROM:'blackgod016574@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: 0.143  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_PASS) 209.85.214.194 mail-pl1-f194.google.com 209.85.214.194
	mail-pl1-f194.google.com <blackgod016574@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 24 May 2019 03:36:06 -0400
Cc: linux-kernel@vger.kernel.org
Subject: [dm-devel] [PATCH] dm-region-hash: Fix a missing-check bug in
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Fri, 24 May 2019 07:41:43 +0000 (UTC)

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
