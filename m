Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id C154F1659CB
	for <lists+dm-devel@lfdr.de>; Thu, 20 Feb 2020 10:06:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582189599;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1WineCnSXYadjqijy15xlM3FPnNzP4CYpziveEipMQc=;
	b=U/4bU7HVoqhMHvDziM55kyqWTOy2VG4h+hRvqLyGb4Pd0EA1X3SWrE7Ms7jvQKW5Lu3Aq/
	WhY0ai/rMrCWtHqe6bPhoeDhT+BMKOSzfQMq3rKq7i1676uudXizo7NTotqN6a78Vn5t9X
	ofnLWb6IhtaFAGAP7zYfq2BMPgVt2dc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-NXM0jR1SMZSIlCs4JtNw3g-1; Thu, 20 Feb 2020 04:06:37 -0500
X-MC-Unique: NXM0jR1SMZSIlCs4JtNw3g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61BC88010F9;
	Thu, 20 Feb 2020 09:06:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 380055DA76;
	Thu, 20 Feb 2020 09:06:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B50543F5CF;
	Thu, 20 Feb 2020 09:06:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01DEji5X011447 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 13 Feb 2020 09:45:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2D2EF2026D67; Thu, 13 Feb 2020 14:45:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 287652093CE9
	for <dm-devel@redhat.com>; Thu, 13 Feb 2020 14:45:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F6808012C4
	for <dm-devel@redhat.com>; Thu, 13 Feb 2020 14:45:41 +0000 (UTC)
Received: from os.inf.tu-dresden.de (os.inf.tu-dresden.de [141.76.48.99])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-99-Cs21cFAYO_GIBlbtoyn3hA-1; Thu, 13 Feb 2020 09:45:38 -0500
Received: from [2002:8d4c:3001:48::120:84] (helo=jupiter)
	by os.inf.tu-dresden.de with esmtpsa
	(TLS1.3:TLS_AES_256_GCM_SHA384:256) (Exim 4.93.0.3)
	id 1j2FKe-0000pY-M0; Thu, 13 Feb 2020 15:19:08 +0100
From: Maksym Planeta <mplaneta@os.inf.tu-dresden.de>
To: mplaneta@os.inf.tu-dresden.de, Zhou Wang <wangzhou1@hisilicon.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com, Song Liu <song@kernel.org>,
	Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-erofs@lists.ozlabs.org
Date: Thu, 13 Feb 2020 15:18:23 +0100
Message-Id: <20200213141823.2174236-1-mplaneta@os.inf.tu-dresden.de>
MIME-Version: 1.0
X-MC-Unique: Cs21cFAYO_GIBlbtoyn3hA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01DEji5X011447
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 20 Feb 2020 04:05:51 -0500
Subject: [dm-devel] [PATCH] Remove WQ_CPU_INTENSIVE flag from unbound wq's
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The documentation [1] says that WQ_CPU_INTENSIVE is "meaningless" for
unbound wq. I remove this flag from places where unbound queue is
allocated. This is supposed to improve code readability.

1. https://www.kernel.org/doc/html/latest/core-api/workqueue.html#flags

Signed-off-by: Maksym Planeta <mplaneta@os.inf.tu-dresden.de>
---
 drivers/crypto/hisilicon/qm.c | 3 +--
 drivers/md/dm-crypt.c         | 2 +-
 drivers/md/dm-verity-target.c | 2 +-
 drivers/md/raid5.c            | 2 +-
 fs/erofs/zdata.c              | 2 +-
 5 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/crypto/hisilicon/qm.c b/drivers/crypto/hisilicon/qm.c
index b57da5ef8b5b..4a39cb2c6a0b 100644
--- a/drivers/crypto/hisilicon/qm.c
+++ b/drivers/crypto/hisilicon/qm.c
@@ -1148,8 +1148,7 @@ struct hisi_qp *hisi_qm_create_qp(struct hisi_qm *qm, u8 alg_type)
 	qp->qp_id = qp_id;
 	qp->alg_type = alg_type;
 	INIT_WORK(&qp->work, qm_qp_work_func);
-	qp->wq = alloc_workqueue("hisi_qm", WQ_UNBOUND | WQ_HIGHPRI |
-				 WQ_CPU_INTENSIVE | WQ_MEM_RECLAIM, 0);
+	qp->wq = alloc_workqueue("hisi_qm", WQ_UNBOUND | WQ_HIGHPRI | WQ_MEM_RECLAIM, 0);
 	if (!qp->wq) {
 		ret = -EFAULT;
 		goto err_free_qp_mem;
diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index c6a529873d0f..44d56325fa27 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -3032,7 +3032,7 @@ static int crypt_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 						  1, devname);
 	else
 		cc->crypt_queue = alloc_workqueue("kcryptd/%s",
-						  WQ_CPU_INTENSIVE | WQ_MEM_RECLAIM | WQ_UNBOUND,
+						  WQ_MEM_RECLAIM | WQ_UNBOUND,
 						  num_online_cpus(), devname);
 	if (!cc->crypt_queue) {
 		ti->error = "Couldn't create kcryptd queue";
diff --git a/drivers/md/dm-verity-target.c b/drivers/md/dm-verity-target.c
index 0d61e9c67986..20f92c7ea07e 100644
--- a/drivers/md/dm-verity-target.c
+++ b/drivers/md/dm-verity-target.c
@@ -1190,7 +1190,7 @@ static int verity_ctr(struct dm_target *ti, unsigned argc, char **argv)
 	}
 
 	/* WQ_UNBOUND greatly improves performance when running on ramdisk */
-	v->verify_wq = alloc_workqueue("kverityd", WQ_CPU_INTENSIVE | WQ_MEM_RECLAIM | WQ_UNBOUND, num_online_cpus());
+	v->verify_wq = alloc_workqueue("kverityd", WQ_MEM_RECLAIM | WQ_UNBOUND, num_online_cpus());
 	if (!v->verify_wq) {
 		ti->error = "Cannot allocate workqueue";
 		r = -ENOMEM;
diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
index ba00e9877f02..cd93a1731b82 100644
--- a/drivers/md/raid5.c
+++ b/drivers/md/raid5.c
@@ -8481,7 +8481,7 @@ static int __init raid5_init(void)
 	int ret;
 
 	raid5_wq = alloc_workqueue("raid5wq",
-		WQ_UNBOUND|WQ_MEM_RECLAIM|WQ_CPU_INTENSIVE|WQ_SYSFS, 0);
+		WQ_UNBOUND|WQ_MEM_RECLAIM|WQ_SYSFS, 0);
 	if (!raid5_wq)
 		return -ENOMEM;
 
diff --git a/fs/erofs/zdata.c b/fs/erofs/zdata.c
index 80e47f07d946..b2a679f720e9 100644
--- a/fs/erofs/zdata.c
+++ b/fs/erofs/zdata.c
@@ -43,7 +43,7 @@ void z_erofs_exit_zip_subsystem(void)
 static inline int z_erofs_init_workqueue(void)
 {
 	const unsigned int onlinecpus = num_possible_cpus();
-	const unsigned int flags = WQ_UNBOUND | WQ_HIGHPRI | WQ_CPU_INTENSIVE;
+	const unsigned int flags = WQ_UNBOUND | WQ_HIGHPRI;
 
 	/*
 	 * no need to spawn too many threads, limiting threads could minimum
-- 
2.24.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

