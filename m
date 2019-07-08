Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7849F62B22
	for <lists+dm-devel@lfdr.de>; Mon,  8 Jul 2019 23:37:44 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 006E4317915E;
	Mon,  8 Jul 2019 21:37:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 38CE21001B2B;
	Mon,  8 Jul 2019 21:36:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 99CFE206D2;
	Mon,  8 Jul 2019 21:36:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x68La3eN015376 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 8 Jul 2019 17:36:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 01FF31001B10; Mon,  8 Jul 2019 21:36:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F15DB1001B38
	for <dm-devel@redhat.com>; Mon,  8 Jul 2019 21:36:00 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AFA564623E
	for <dm-devel@redhat.com>; Mon,  8 Jul 2019 21:35:59 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id a10so17607651wrp.9
	for <dm-devel@redhat.com>; Mon, 08 Jul 2019 14:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=X4CRrANVkNIlenJDJU8Z3kkg6XSKoTlMaTUgcMGMnWg=;
	b=k66bMiCdcGNmBoJexuSfeZZ2FXKBLx5m+SClFFJUrOhHK95b7iJH9tQSPnBwtIuPYT
	8qLXNNx9zS6TJ9ZZU+f2kOJQZ/jfB00o714hAhYvblGesGgCyjj4OI9FjprNj3egDC8t
	/gM3pMH2yaMTnUPZJJZNVnRL1FfyYKPxAzdP3jpoPL3XiPM5UfP/IeLnQOFLY2+/nGFk
	e/NFWAJi6nj5jy8+varzBslA0r5+AnTo/xckmccx148YpcyFhbeKfOsATyqUO5HE1Fyc
	RCq8UD7zRYZ6+0rTadDyLmGz9e6jOEWe9d7AbDpAdiUkpkV57xtItNCp5lvOyurycpvu
	m38A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=X4CRrANVkNIlenJDJU8Z3kkg6XSKoTlMaTUgcMGMnWg=;
	b=NWS/P8UMPbj7qOeHFkJ49Den8YnPBG7706Q7zHbDnFAUeQ6y2nMldS11g7HJRedNmR
	vPHvE4MJaQqrNJmjs7a2wOd+KvGrLlTzVoLpLrVybYoXenvNpfNzh4BCVbtgif4vjwsg
	DDOEgJ/NZp2LGKFW4L7Jn5aKN0LnjkIUcBqWD7Je+xw4o7q+JnemOwGR7HswHrGuYhfj
	3awzsuU0nf+J0B12pl7VzuSywe5JzAjAUq3ZMSsvs0HZWH1ZKj8a1VjFZF72b+ujLZp7
	lQVzSmrr+KOa6VjiAOcAXwnI5oLjBNVLKpAIl2LNp3FeDnmhrZ9TAlQQEcBTspPEIfMu
	8J9A==
X-Gm-Message-State: APjAAAVtw5XdF0Z+XHOM+b4Iq438Tt1AZxlmRw435GtpeQ4WVos8uR6b
	a3nfMjpvsi7SroyzenOrEsLUB2qU
X-Google-Smtp-Source: APXvYqwT7h+RoF/T+Wp6DLxv1DY9wSf1opXbrIKfia9b+Mo89vMe8K8OLpDKe51Vs1b9diT1MqICKA==
X-Received: by 2002:adf:f646:: with SMTP id x6mr15910092wrp.18.1562621758130; 
	Mon, 08 Jul 2019 14:35:58 -0700 (PDT)
Received: from x230.suse.de (gw.ms-free.net. [95.85.240.250])
	by smtp.gmail.com with ESMTPSA id t24sm825337wmj.14.2019.07.08.14.35.57
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 08 Jul 2019 14:35:57 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: dm-devel@redhat.com
Date: Mon,  8 Jul 2019 23:35:51 +0200
Message-Id: <20190708213551.26349-1-petr.vorel@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 08 Jul 2019 21:35:59 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Mon, 08 Jul 2019 21:35:59 +0000 (UTC) for IP:'209.85.221.65'
	DOMAIN:'mail-wr1-f65.google.com' HELO:'mail-wr1-f65.google.com'
	FROM:'petr.vorel@gmail.com' RCPT:''
X-RedHat-Spam-Score: 1.228 * (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, PDS_NO_HELO_DNS, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.221.65 mail-wr1-f65.google.com 209.85.221.65
	mail-wr1-f65.google.com <petr.vorel@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.29
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: Petr Vorel <petr.vorel@gmail.com>
Subject: [dm-devel] [PATCH 1/1] kpartx: Use __kernel_daddr_t for
	solaris_x86_slice.s_start
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Mon, 08 Jul 2019 21:37:43 +0000 (UTC)

It was meant to be used daddr_t (which is mostly int, only sparc and
mips have it defined as int), but instead used long.
But musl libc does not define daddr_t as it's deprecated, therefore
use __kernel_daddr_t from <linux/types.h>.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 kpartx/solaris.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/kpartx/solaris.c b/kpartx/solaris.c
index 8c1a971b..e7826c62 100644
--- a/kpartx/solaris.c
+++ b/kpartx/solaris.c
@@ -1,17 +1,15 @@
 #include "kpartx.h"
 #include <stdio.h>
-#include <sys/types.h>
+#include <linux/types.h>
 #include <time.h>		/* time_t */
 
 #define SOLARIS_X86_NUMSLICE	8
 #define SOLARIS_X86_VTOC_SANE	(0x600DDEEEUL)
 
-//typedef int daddr_t;		/* or long - check */
-
 struct solaris_x86_slice {
 	unsigned short	s_tag;		/* ID tag of partition */
 	unsigned short	s_flag;		/* permission flags */
-	long		s_start;	/* start sector no of partition */
+	__kernel_daddr_t s_start;	/* start sector no of partition */
 	long		s_size;		/* # of blocks in partition */
 };
 
-- 
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
