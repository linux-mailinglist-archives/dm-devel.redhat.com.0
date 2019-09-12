Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C5269B0EB3
	for <lists+dm-devel@lfdr.de>; Thu, 12 Sep 2019 14:14:54 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AD68A3082128;
	Thu, 12 Sep 2019 12:14:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D2AB600C8;
	Thu, 12 Sep 2019 12:14:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1799A83541;
	Thu, 12 Sep 2019 12:14:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8CCC0RZ007992 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 12 Sep 2019 08:12:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 97BFD5DC1B; Thu, 12 Sep 2019 12:12:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F6945D9E5
	for <dm-devel@redhat.com>; Thu, 12 Sep 2019 12:11:57 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BCB8279704
	for <dm-devel@redhat.com>; Thu, 12 Sep 2019 12:11:56 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id t3so3281144wmj.1
	for <dm-devel@redhat.com>; Thu, 12 Sep 2019 05:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arrikto-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rTj3IbKWFzci+tuufl/9Ziu3+8CjfFXVRtIUjOpvdwg=;
	b=mnuYMEb+cidMjpZ1BA5YLMo9GeaRWtVUi0o1SdJIb0bLsYGbGPnm5eLZvsHK8sv7le
	pk4CiXDqkilmtfLUxjdU5YM6NR1m907nZZygRFKZihOWZqwZigUQJtKG3E8n5LGXDoIl
	zf/MlDms7K3quwXsZArnXFB277ksTxZHxLF6dvf5nMCWhpxTeNAYv5h9EmyVDpG1D6KO
	Ylfb/d2fV5pC/Oypz2W7xq4rKgjmsVN+wpWCdIT5N3C2BY5HQ8rnRWMCHPQ+/Ci6I7y0
	YkrdcCUptnIFqVTnE7f7WiSrrHu9f4SBRSgc7YPl1antq5gsWGA8aSbjCp/M3U5FuiQJ
	EUcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rTj3IbKWFzci+tuufl/9Ziu3+8CjfFXVRtIUjOpvdwg=;
	b=pxkCK0RZW72/pQ082PbCVY981Ku2mmcJeombIVPhqNLwBdZb3ffTBUkKfTrWlHJZhF
	rWGtlsoyWQMCprRphfGB6rqspL/2yyT82hBbIO67Lvpu1m1+Cx2MQDxnWn9ZqFaWaDja
	a3m7EW4CKYypBLM2xayfvBL/svhYrSASjz2lQ1Ndob+5RAzqB81hBAGCe4H5uusJcHev
	BgaIhThv0JA3/k2ttpHlKmcAMdBawO0RvSAoBBkRVWPQE5aHRRVV+LmPx1JWl82VcYmG
	yARBwncp3MOR5YXtmZuRjpRyAdrKBhqvt1BxwoFQRdKXFea2fLR5TmikVXPjs0QPaTOw
	3vhQ==
X-Gm-Message-State: APjAAAXaQT9UYa5hRheezUHfKBwuKF8fXXUrKcm1D7J1nCNLg7k87Rzp
	EY55Cv1hEKI/ByZsMGB3Io3rUA==
X-Google-Smtp-Source: APXvYqwR/bkK6CTu51znpbRNtJXOyW2KjLcNZS+3zUtkRSWI2A77QZ8S4fTLZfjCWIEMldVcP55zAA==
X-Received: by 2002:a7b:c054:: with SMTP id u20mr7924287wmc.11.1568290315508; 
	Thu, 12 Sep 2019 05:11:55 -0700 (PDT)
Received: from snf-864.vm.snf.arr ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id
	v8sm38636526wra.79.2019.09.12.05.11.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Sep 2019 05:11:55 -0700 (PDT)
From: Nikos Tsironis <ntsironis@arrikto.com>
To: snitzer@redhat.com, agk@redhat.com, dm-devel@redhat.com
Date: Thu, 12 Sep 2019 15:11:37 +0300
Message-Id: <20190912121137.26567-3-ntsironis@arrikto.com>
In-Reply-To: <20190912121137.26567-1-ntsironis@arrikto.com>
References: <20190912121137.26567-1-ntsironis@arrikto.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 12 Sep 2019 12:11:56 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Thu, 12 Sep 2019 12:11:56 +0000 (UTC) for IP:'209.85.128.65'
	DOMAIN:'mail-wm1-f65.google.com' HELO:'mail-wm1-f65.google.com'
	FROM:'ntsironis@arrikto.com' RCPT:''
X-RedHat-Spam-Score: -0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.65 mail-wm1-f65.google.com 209.85.128.65
	mail-wm1-f65.google.com <ntsironis@arrikto.com>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: vkoukis@arrikto.com, ntsironis@arrikto.com, iliastsi@arrikto.com
Subject: [dm-devel] [PATCH 2/2] dm clone: Explicitly include header file for
	kvmalloc()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Thu, 12 Sep 2019 12:14:53 +0000 (UTC)

Signed-off-by: Nikos Tsironis <ntsironis@arrikto.com>
---
 drivers/md/dm-clone-metadata.c | 1 +
 drivers/md/dm-clone-target.c   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/md/dm-clone-metadata.c b/drivers/md/dm-clone-metadata.c
index 50abc2fb4c7a..6bc8c1d1c351 100644
--- a/drivers/md/dm-clone-metadata.c
+++ b/drivers/md/dm-clone-metadata.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2019 Arrikto, Inc. All Rights Reserved.
  */
 
+#include <linux/mm.h>
 #include <linux/err.h>
 #include <linux/slab.h>
 #include <linux/rwsem.h>
diff --git a/drivers/md/dm-clone-target.c b/drivers/md/dm-clone-target.c
index f80250c3103e..cd6f9e9fc98e 100644
--- a/drivers/md/dm-clone-target.c
+++ b/drivers/md/dm-clone-target.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2019 Arrikto, Inc. All Rights Reserved.
  */
 
+#include <linux/mm.h>
 #include <linux/bio.h>
 #include <linux/err.h>
 #include <linux/hash.h>
-- 
2.11.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
