Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2CB8284D
	for <lists+dm-devel@lfdr.de>; Tue,  6 Aug 2019 01:57:30 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 958CE309539F;
	Mon,  5 Aug 2019 23:57:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 789A6600CC;
	Mon,  5 Aug 2019 23:57:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 39E382551C;
	Mon,  5 Aug 2019 23:57:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x75Nuewa000610 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 5 Aug 2019 19:56:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0A1C35D712; Mon,  5 Aug 2019 23:56:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D60F45D6D0;
	Mon,  5 Aug 2019 23:56:35 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 58363C06512C;
	Mon,  5 Aug 2019 23:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1565049388; x=1596585388;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=zlcTIMvmJArkGaT1+dczaT7GOQuTI/MKk3DApvLv4Us=;
	b=qotYhGqW+0zO6AmGV54XUqvFCZ6rXSdJHU4Dpv7v8JPcRaeU4UjlWt7C
	7Btj4nd/+ljAYSY8iu9kC2lIq828kVaHnnas4SlzUYpLL8/T6zZ1aws/7
	HIEXNoV7qVaUH2X7W43QFjx8CaepEYsJl7mREjuIKTnSGD2QFaLvopqQL
	VMHsjICsCgCLtPqmX8LThRkNHe8Yh2Dx9WgI51E1N9Mvi0SeeBMRJbmEI
	6B4QpdwY8Yls3UbrENo7OBwSrLFntjGkgjorWcOkGH/Ac5saxNSdyeX2E
	XhnE1WXuW/yQxSnfQGCbibe8ULXTBsC9sEMrUQn+ns0pxJutVwMEH094d A==;
IronPort-SDR: wdNzoUOCM4lA+GAuOPoMpwdmHDiSts6DSBJDDWqn/p9mQALyLpmEILP7Rkq+TI523qzyMsdA48
	fpKMYG2sT2WUMW89l2YE6mjZk4ZNBknVxc5xJejon8fCti5obrqkuY1tdMGyU/wOL2SC/K+uY9
	oB1cYVOy5b4fw8UFynw5m2gAJrFNusp0FSS/Waf+SPPV/CxWy6zzwFFo2Gjvbw2apPmhQ1wraC
	j6PocnOOGbYAE1qBH4ggSQQCtw8NQ6ecv7O7F5yb6zydRoeiK0hNUjDtfF9MvG+2x9GZJuxLnr
	QyY=
X-IronPort-AV: E=Sophos;i="5.64,350,1559491200"; d="scan'208";a="119698847"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 06 Aug 2019 07:56:05 +0800
IronPort-SDR: msdYIdK/D//1DqZhw+IjLBHmGpKaahLPIDB+4MK6lhMREuQp4K0ZhI0twa6rV5A6zpGEnGf8aX
	GtsHBCr7+ZFuDZ3Y9eMEphFeODb/1x7zUI4eNnqhPoEV/dbcmQSVmxsXHnLH188r2NyBok/mez
	yJA/5xIiqUUxiRhpWL6kkHJSRKG/GdqQ/kp+N6b4ZMvEJB+gOwy/eSPpluH09GBIBnwSd7RgAr
	nQ+5Z5kH++oUcjvCslFQBbYEKHHK72GzKpcrfNH6aWjOs/FQlczjEY5d77Hi4bMpJGbEx4P1J+
	ysVYq1Hkz5xAVME3Ev0Lgtu4
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	05 Aug 2019 16:53:56 -0700
IronPort-SDR: iuH6wxvp5myKACjKUudr/X2+s9KYBTdUG2I8P02xVh04kTdzJWni4C+ficj/8Oz6pfRWobnFz0
	jfWJGjjwNqUSDGG2gLMUlO0oh/KheYqrE1K0ABQaLoZe/NeOIfxmKQqtzsrFRzvVbRsECkvMLh
	IMtp7fErls3a/+u08uZytyjREwjkDyZ8Ez6066yyCyiGUKh5TTKRqFG6tcd7qZBVYqil2oAeG6
	JU4FoOtvIGLHayZnLB5UXL3qnP1+45tK4SRzI8cPXAGCrhgXeSJNKctQ9s8vAx0E4RgbsWHGB8
	N3g=
Received: from dhcp-10-88-173-43.hgst.com (HELO localhost.localdomain)
	([10.88.173.43])
	by uls-op-cesaip02.wdc.com with ESMTP; 05 Aug 2019 16:56:04 -0700
From: Dmitry Fomichev <dmitry.fomichev@wdc.com>
To: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Mon,  5 Aug 2019 16:56:03 -0700
Message-Id: <20190805235603.18337-1-dmitry.fomichev@wdc.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.31]); Mon, 05 Aug 2019 23:56:27 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Mon, 05 Aug 2019 23:56:27 +0000 (UTC) for IP:'216.71.153.141'
	DOMAIN:'esa3.hgst.iphmx.com' HELO:'esa3.hgst.iphmx.com'
	FROM:'dmitry.fomichev@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.399  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.153.141 esa3.hgst.iphmx.com 216.71.153.141
	esa3.hgst.iphmx.com <prvs=1134ccef6=dmitry.fomichev@wdc.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Damien Le Moal <damien.lemoal@wdc.com>
Subject: [dm-devel] [PATCH] dm kcopyd: always complete failed jobs
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Mon, 05 Aug 2019 23:57:28 +0000 (UTC)

This patch fixes a problem in dm-kcopyd that may leave jobs in
complete queue indefinitely in the event of backing storage failure.

This behavior has been observed while running 100% write file fio
workload against an XFS volume created on top of a dm-zoned target
device. If the underlying storage of dm-zoned goes to offline state
under I/O, kcopyd sometimes never issues the end copy callback and
dm-zoned reclaim work hangs indefinitely waiting for that completion.

This behavior was traced down to the error handling code in
process_jobs() function that places the failed job to complete_jobs
queue, but doesn't wake up the job handler. In case of backing device
failure, all outstanding jobs may end up going to complete_jobs queue
via this code path and then stay there forever because there are no
more successful I/O jobs to wake up the job handler.

This patch adds a wake() call to always wake up kcopyd job wait queue
for all I/O jobs that fail before dm_io() gets called for that job.

The patch also sets the write error status in all sub jobs that are
failed because their master job has failed.

Fixes: b73c67c2cbb00 ("dm kcopyd: add sequential write feature")
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
---
 drivers/md/dm-kcopyd.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm-kcopyd.c b/drivers/md/dm-kcopyd.c
index df2011de7be2..1bbe4a34ef4c 100644
--- a/drivers/md/dm-kcopyd.c
+++ b/drivers/md/dm-kcopyd.c
@@ -566,8 +566,10 @@ static int run_io_job(struct kcopyd_job *job)
 	 * no point in continuing.
 	 */
 	if (test_bit(DM_KCOPYD_WRITE_SEQ, &job->flags) &&
-	    job->master_job->write_err)
+	    job->master_job->write_err) {
+		job->write_err = job->master_job->write_err;
 		return -EIO;
+	}
 
 	io_job_start(job->kc->throttle);
 
@@ -619,6 +621,7 @@ static int process_jobs(struct list_head *jobs, struct dm_kcopyd_client *kc,
 			else
 				job->read_err = 1;
 			push(&kc->complete_jobs, job);
+			wake(kc);
 			break;
 		}
 
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
