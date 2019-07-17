Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D68CF6BB51
	for <lists+dm-devel@lfdr.de>; Wed, 17 Jul 2019 13:25:13 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 35A7730A5A5E;
	Wed, 17 Jul 2019 11:25:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AEB1F19C70;
	Wed, 17 Jul 2019 11:25:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2B7574E58F;
	Wed, 17 Jul 2019 11:24:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6HBOdl6026988 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 17 Jul 2019 07:24:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B2EB26013C; Wed, 17 Jul 2019 11:24:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC4906012C
	for <dm-devel@redhat.com>; Wed, 17 Jul 2019 11:24:34 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E90693083362
	for <dm-devel@redhat.com>; Wed, 17 Jul 2019 11:24:32 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id v15so21793065wml.0
	for <dm-devel@redhat.com>; Wed, 17 Jul 2019 04:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arrikto-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=ZH7Jb+P219eaSp+ASWaxhuB7xyjl+438PdiLqu2XSlU=;
	b=e+eVOGzRAmnTKcp5Vrtl/bxK73iuYsm/f1C9BQGKKIoRTaxpG4o04jirRz2FAmhj6O
	ZUr8g5+VF0T4Mt3Vvhni16V/yi5v4KoYAXW+J1UBm9XvZaE3qOPFS9bd1ORYEzlj6jc9
	3zjhAw7Wxmsyol8lpA5ax1AyBNkHE01sr9M4QB4As9mn5YphGq/2SH2Oj+JCpWkaagle
	Dcs8b/LcrZGaY7FXX2w+xwpThnQSyVy8mZwJzZQwMRoSJdB9dcGvHeMT7XytteoN0Jw4
	5QtnwUjNbkVDhpFDWmv3oAC0aB0JapXgNvBRuQf0PcBKxAcyq6NJbrtYrZemMrrsSIhs
	iWyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZH7Jb+P219eaSp+ASWaxhuB7xyjl+438PdiLqu2XSlU=;
	b=S1JQ5WRX4MWrjkb11d0It7Jaat67/G+nuQjcZmAR0v0ptjwwCDog/eN3on8N3+VSPF
	Dggr1T6DZfgLXSIOIkR3EC5w8JzcJgplJ0NfMLptGbFdsbdwykgpNO2nzl2h+cObeOcS
	QfgQlU+StK0nRjKtlIX0ZaGGC4e6jVJ9tWrWyljgCScGeK5iRRKD/zvKmeDOrGTFITUl
	BM5TVpfmqqfStjJW0Xa+NX68vmQqrg7qrIKHAeA5ZIzpxPsiu2pTedN9hOzeqtpoU+ru
	1/Kl2t0JOjj5FvEeDw7h/2jQc/c8h1J09gIGtwHy70usIgAmpj083wNXRcgycxKC7UaR
	BFEQ==
X-Gm-Message-State: APjAAAW1gSHK7X96M+hJ6nA/5/9lhxGKlSs1NHnJfKZqgIPHVgPxnJx1
	R/XF/82ToNihnKgKSYiPHHQzbw==
X-Google-Smtp-Source: APXvYqwC1M6fQt7wIofoeyXRdU2fIXXw2K6zLpEbeac50/oLT6MYhkn5hF9SCKgGAa4cvCvf2Svbnw==
X-Received: by 2002:a05:600c:21d4:: with SMTP id
	x20mr33239751wmj.61.1563362671558; 
	Wed, 17 Jul 2019 04:24:31 -0700 (PDT)
Received: from snf-864.vm.snf.arr ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id
	o26sm36420898wro.53.2019.07.17.04.24.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Jul 2019 04:24:30 -0700 (PDT)
From: Nikos Tsironis <ntsironis@arrikto.com>
To: snitzer@redhat.com, agk@redhat.com, dm-devel@redhat.com
Date: Wed, 17 Jul 2019 14:24:10 +0300
Message-Id: <20190717112410.3017-1-ntsironis@arrikto.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Wed, 17 Jul 2019 11:24:33 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Wed, 17 Jul 2019 11:24:33 +0000 (UTC) for IP:'209.85.128.65'
	DOMAIN:'mail-wm1-f65.google.com' HELO:'mail-wm1-f65.google.com'
	FROM:'ntsironis@arrikto.com' RCPT:''
X-RedHat-Spam-Score: 0  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.128.65 mail-wm1-f65.google.com 209.85.128.65
	mail-wm1-f65.google.com <ntsironis@arrikto.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: ntsironis@arrikto.com
Subject: [dm-devel] [PATCH v2] dm kcopyd: Increase default sub-job size to
	512KB
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Wed, 17 Jul 2019 11:25:12 +0000 (UTC)

Currently, kcopyd has a sub-job size of 64KB and a maximum number of 8
sub-jobs. As a result, for any kcopyd job, we have a maximum of 512KB of
I/O in flight.

This upper limit to the amount of in-flight I/O under-utilizes fast
devices and results in decreased throughput, e.g., when writing to a
snapshotted thin LV with I/O size less than the pool's block size (so
COW is performed using kcopyd).

Increase kcopyd's default sub-job size to 512KB, so we have a maximum of
4MB of I/O in flight for each kcopyd job. This results in an up to 96%
improvement of bandwidth when writing to a snapshotted thin LV, with I/O
sizes less than the pool's block size.

Also, add dm_mod.kcopyd_subjob_size_kb module parameter to allow users
to fine tune the sub-job size of kcopyd. The default value of this
parameter is 512KB and the maximum allowed value is 1024KB.

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
 drivers/md/dm-kcopyd.c | 34 ++++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

Changes in v2:
  - Add dm_mod.kcopyd_subjob_size_kb module parameter

v1: https://www.redhat.com/archives/dm-devel/2019-June/msg00003.html

diff --git a/drivers/md/dm-kcopyd.c b/drivers/md/dm-kcopyd.c
index 671c24332802..df2011de7be2 100644
--- a/drivers/md/dm-kcopyd.c
+++ b/drivers/md/dm-kcopyd.c
@@ -28,10 +28,27 @@
 
 #include "dm-core.h"
 
-#define SUB_JOB_SIZE	128
 #define SPLIT_COUNT	8
 #define MIN_JOBS	8
-#define RESERVE_PAGES	(DIV_ROUND_UP(SUB_JOB_SIZE << SECTOR_SHIFT, PAGE_SIZE))
+
+#define DEFAULT_SUB_JOB_SIZE_KB 512
+#define MAX_SUB_JOB_SIZE_KB     1024
+
+static unsigned kcopyd_subjob_size_kb = DEFAULT_SUB_JOB_SIZE_KB;
+
+module_param(kcopyd_subjob_size_kb, uint, S_IRUGO | S_IWUSR);
+MODULE_PARM_DESC(kcopyd_subjob_size_kb, "Sub-job size for dm-kcopyd clients");
+
+static unsigned dm_get_kcopyd_subjob_size(void)
+{
+	unsigned sub_job_size_kb;
+
+	sub_job_size_kb = __dm_get_module_param(&kcopyd_subjob_size_kb,
+						DEFAULT_SUB_JOB_SIZE_KB,
+						MAX_SUB_JOB_SIZE_KB);
+
+	return sub_job_size_kb << 1;
+}
 
 /*-----------------------------------------------------------------
  * Each kcopyd client has its own little pool of preallocated
@@ -41,6 +58,7 @@ struct dm_kcopyd_client {
 	struct page_list *pages;
 	unsigned nr_reserved_pages;
 	unsigned nr_free_pages;
+	unsigned sub_job_size;
 
 	struct dm_io_client *io_client;
 
@@ -693,8 +711,8 @@ static void segment_complete(int read_err, unsigned long write_err,
 		progress = job->progress;
 		count = job->source.count - progress;
 		if (count) {
-			if (count > SUB_JOB_SIZE)
-				count = SUB_JOB_SIZE;
+			if (count > kc->sub_job_size)
+				count = kc->sub_job_size;
 
 			job->progress += count;
 		}
@@ -821,7 +839,7 @@ void dm_kcopyd_copy(struct dm_kcopyd_client *kc, struct dm_io_region *from,
 	job->master_job = job;
 	job->write_offset = 0;
 
-	if (job->source.count <= SUB_JOB_SIZE)
+	if (job->source.count <= kc->sub_job_size)
 		dispatch_job(job);
 	else {
 		job->progress = 0;
@@ -888,6 +906,7 @@ int kcopyd_cancel(struct kcopyd_job *job, int block)
 struct dm_kcopyd_client *dm_kcopyd_client_create(struct dm_kcopyd_throttle *throttle)
 {
 	int r;
+	unsigned reserve_pages;
 	struct dm_kcopyd_client *kc;
 
 	kc = kzalloc(sizeof(*kc), GFP_KERNEL);
@@ -912,9 +931,12 @@ struct dm_kcopyd_client *dm_kcopyd_client_create(struct dm_kcopyd_throttle *thro
 		goto bad_workqueue;
 	}
 
+	kc->sub_job_size = dm_get_kcopyd_subjob_size();
+	reserve_pages = DIV_ROUND_UP(kc->sub_job_size << SECTOR_SHIFT, PAGE_SIZE);
+
 	kc->pages = NULL;
 	kc->nr_reserved_pages = kc->nr_free_pages = 0;
-	r = client_reserve_pages(kc, RESERVE_PAGES);
+	r = client_reserve_pages(kc, reserve_pages);
 	if (r)
 		goto bad_client_pages;
 
-- 
2.11.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
