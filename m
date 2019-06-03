Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 362AA33151
	for <lists+dm-devel@lfdr.de>; Mon,  3 Jun 2019 15:42:46 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7314E31628F3;
	Mon,  3 Jun 2019 13:42:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6889519C69;
	Mon,  3 Jun 2019 13:42:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F362B206D2;
	Mon,  3 Jun 2019 13:41:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x53DeZDV019373 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 3 Jun 2019 09:40:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 77EB75D71A; Mon,  3 Jun 2019 13:40:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 72CAC5D6A9
	for <dm-devel@redhat.com>; Mon,  3 Jun 2019 13:40:33 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6A34B307D932
	for <dm-devel@redhat.com>; Mon,  3 Jun 2019 13:40:20 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id v22so11144353wml.1
	for <dm-devel@redhat.com>; Mon, 03 Jun 2019 06:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arrikto-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=KCrPZVOl+IOvfoAwyLCTIuF+uG4RmedNxiVU9ClHPCk=;
	b=nTzhpM+75lGpnZT5lnBnbTSXBl186j35IYRkMXmqEjT+850ra96vr5cyL9OpcDYAxJ
	9Ha3lkiCavUips7Tfcrv9TXyxU3aG6WeD1x7/9aDsncE8IGxGwPM/DxdHwd7zlOOjhsG
	e0TJCkw/wUrsrJwBTA8wGmcp4IFVuL/yhI+P0cCGAkT8byJRqCAj3JyXmIY5dBVVfGLu
	nwea/RXh0nGPMc6BD/Wn4Ad08Uwauq1xk3NR29KWj+ypgxdNqUVR2lsFVVbvdhoLF/er
	z+mR9IoiAualldHMCxw5CX/V1hWYIY1+3Q3xik3E0sudwf2YAdYlWoxBMDZXN32sONJt
	KDjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=KCrPZVOl+IOvfoAwyLCTIuF+uG4RmedNxiVU9ClHPCk=;
	b=rG6b+kLvoHVfJbVsheUGiJyZj4aj71KhJox+PoSit6TIQ4NKZPHngPh4aacCRjXITt
	cBU/Wom5CrFqi2rPvVoOJb1IfnvzOEdB4uxc4ugQgaJXNBesBTnjwnCuIy4gvmPa8nZw
	HUcQMQz537qcncSI70pkIX1Cf4WvU3yPyQQFmWQFcyysUv71jcd+sabAJOgk5llroV5W
	yqmopTGw0QJDcijao9BDOdXwXOSsgNiYDhYWiO6vcUiKxtJBLv0QfxQwok1ODJguegCt
	BodpVTLhB04P1rTndXTQ9eCUavff2EKJRlqrGziAEy7qYovPmtsPJBrqUZjxR0mwRb2x
	kaUA==
X-Gm-Message-State: APjAAAUbK9zrupjukiBigx7eBjngtI+LU0GvOxsGPJv6fnwP6Us7iN0C
	UNt5V9U/9AZUn2SuU1vFZuYgMA==
X-Google-Smtp-Source: APXvYqzBztbBXA45EKI91kwpvrsbYuB5M2Vf3zOhgsmB0OAwsvhf8SdMFpg3L4/MYOH2bLt3ht/S5w==
X-Received: by 2002:a05:600c:245:: with SMTP id 5mr2234852wmj.21.1559569219157;
	Mon, 03 Jun 2019 06:40:19 -0700 (PDT)
Received: from snf-864.vm.snf.arr ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id
	a62sm16555347wmf.19.2019.06.03.06.40.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Jun 2019 06:40:18 -0700 (PDT)
From: Nikos Tsironis <ntsironis@arrikto.com>
To: snitzer@redhat.com, agk@redhat.com, dm-devel@redhat.com
Date: Mon,  3 Jun 2019 16:40:17 +0300
Message-Id: <20190603134017.9323-1-ntsironis@arrikto.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Mon, 03 Jun 2019 13:40:20 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Mon, 03 Jun 2019 13:40:20 +0000 (UTC) for IP:'209.85.128.67'
	DOMAIN:'mail-wm1-f67.google.com' HELO:'mail-wm1-f67.google.com'
	FROM:'ntsironis@arrikto.com' RCPT:''
X-RedHat-Spam-Score: -0.605  (DKIM_INVALID, DKIM_SIGNED, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.67 mail-wm1-f67.google.com 209.85.128.67
	mail-wm1-f67.google.com <ntsironis@arrikto.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Subject: [dm-devel] [PATCH] dm kcopyd: Increase sub-job size to 512KiB
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Mon, 03 Jun 2019 13:42:44 +0000 (UTC)

Currently, kcopyd has a sub-job size of 64KiB and a maximum number of 8
sub-jobs. As a result, for any kcopyd job, we have a maximum of 512KiB
of I/O in flight.

This upper limit to the amount of in-flight I/O under-utilizes fast
devices and results in decreased throughput, e.g., when writing to a
snapshotted thin LV with I/O size less than the pool's block size (so
COW is performed using kcopyd).

Increase kcopyd's sub-job size to 512KiB, so we have a maximum of 4MiB
of I/O in flight for each kcopyd job. This results in an up to 96%
improvement of bandwidth when writing to a snapshotted thin LV, with I/O
sizes less than the pool's block size.

We evaluate the performance impact of the change by running the
snap_breaking_throughput benchmark, from the device mapper test suite
[1].

The benchmark:

  1. Creates a 1G thin LV
  2. Provisions the thin LV
  3. Takes a snapshot of the thin LV
  4. Writes to the thin LV with:

      dd if=/dev/zero of=/dev/vg/thin_lv oflag=direct bs=<I/O size>

Running this benchmark with various thin pool block sizes and dd I/O
sizes (all combinations triggering the use of kcopyd) we get the
following results:

+-----------------+-------------+------------------+-----------------+
| Pool block size | dd I/O size | BW before (MB/s) | BW after (MB/s) |
+-----------------+-------------+------------------+-----------------+
|       1 MB      |      256 KB |       242        |       280       |
|       1 MB      |      512 KB |       238        |       295       |
|                 |             |                  |                 |
|       2 MB      |      256 KB |       238        |       354       |
|       2 MB      |      512 KB |       241        |       380       |
|       2 MB      |        1 MB |       245        |       394       |
|                 |             |                  |                 |
|       4 MB      |      256 KB |       248        |       412       |
|       4 MB      |      512 KB |       234        |       432       |
|       4 MB      |        1 MB |       251        |       474       |
|       4 MB      |        2 MB |       257        |       504       |
|                 |             |                  |                 |
|       8 MB      |      256 KB |       239        |       420       |
|       8 MB      |      512 KB |       256        |       431       |
|       8 MB      |        1 MB |       264        |       467       |
|       8 MB      |        2 MB |       264        |       502       |
|       8 MB      |        4 MB |       281        |       537       |
+-----------------+-------------+------------------+-----------------+

[1] https://github.com/jthornber/device-mapper-test-suite

Signed-off-by: Nikos Tsironis <ntsironis@arrikto.com>
---
 drivers/md/dm-kcopyd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/dm-kcopyd.c b/drivers/md/dm-kcopyd.c
index 671c24332802..db0a7d1e33b7 100644
--- a/drivers/md/dm-kcopyd.c
+++ b/drivers/md/dm-kcopyd.c
@@ -28,7 +28,7 @@
 
 #include "dm-core.h"
 
-#define SUB_JOB_SIZE	128
+#define SUB_JOB_SIZE	1024
 #define SPLIT_COUNT	8
 #define MIN_JOBS	8
 #define RESERVE_PAGES	(DIV_ROUND_UP(SUB_JOB_SIZE << SECTOR_SHIFT, PAGE_SIZE))
-- 
2.11.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
