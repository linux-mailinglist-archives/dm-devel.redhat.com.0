Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B6C63526B
	for <lists+dm-devel@lfdr.de>; Wed, 23 Nov 2022 09:26:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669191969;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0Q1+AHEhVDcTQlRAphzX9sWtQT9m6svnnW3cLuODAjU=;
	b=RZlwCy1RO03mbdx2qM3aSpfB35NeZ3haMK0Yz5D2QJ+xZqlGV+5AlRrjg2XfUyDRPRACHf
	D3TYXsBa8IINjhWrnooPgfuvTOC2qLbCE4FNnOYsdtlYOvwYeZgQzAxmU58RCUXZu7tm1e
	EafMq+4r7TVZAOxqrJndi3pAWx0ajPQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-524-XtecYtCNPhO_ULXmG7TLIg-1; Wed, 23 Nov 2022 03:26:06 -0500
X-MC-Unique: XtecYtCNPhO_ULXmG7TLIg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DAE0E8279A7;
	Wed, 23 Nov 2022 08:26:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 983DE4B3FCF;
	Wed, 23 Nov 2022 08:25:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7EF7D1946597;
	Wed, 23 Nov 2022 08:25:58 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 995F21946587
 for <dm-devel@listman.corp.redhat.com>; Wed, 23 Nov 2022 06:21:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8A57C492B0C; Wed, 23 Nov 2022 06:21:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8171C492B07
 for <dm-devel@redhat.com>; Wed, 23 Nov 2022 06:21:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 628B329DD991
 for <dm-devel@redhat.com>; Wed, 23 Nov 2022 06:21:13 +0000 (UTC)
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-206-yv0BDbXCO9uoU5pj4ndXxw-1; Wed, 23 Nov 2022 01:21:11 -0500
X-MC-Unique: yv0BDbXCO9uoU5pj4ndXxw-1
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20221123061346epoutp0286a659cb73d2ff769079c5923297dca7~qIgc9jiq_1821418214epoutp028
 for <dm-devel@redhat.com>; Wed, 23 Nov 2022 06:13:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20221123061346epoutp0286a659cb73d2ff769079c5923297dca7~qIgc9jiq_1821418214epoutp028
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTP id
 20221123061345epcas5p32825de06abfc15b772f3e9db9375f0d3~qIgcbof_M0072800728epcas5p3c;
 Wed, 23 Nov 2022 06:13:45 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.174]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4NH9mm12ZWz4x9Q1; Wed, 23 Nov
 2022 06:13:44 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
 epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 5D.60.39477.71ABD736; Wed, 23 Nov 2022 15:13:43 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20221123061041epcas5p4413569a46ee730cd3033a9025c8f134a~qIdwfmK_k1387613876epcas5p4R;
 Wed, 23 Nov 2022 06:10:41 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20221123061041epsmtrp18e13c583f63f524392e30d1f5cc61af2~qIdweb_Fy1974919749epsmtrp1I;
 Wed, 23 Nov 2022 06:10:41 +0000 (GMT)
X-AuditID: b6c32a4a-259fb70000019a35-93-637dba17073c
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 AF.C2.18644.169BD736; Wed, 23 Nov 2022 15:10:41 +0900 (KST)
Received: from test-zns.sa.corp.samsungelectronics.net (unknown
 [107.110.206.5]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20221123061037epsmtip1c482a1a6bc4b461f55d5956fc9d20346~qIdtgYz_41981819818epsmtip1j;
 Wed, 23 Nov 2022 06:10:37 +0000 (GMT)
From: Nitesh Shetty <nj.shetty@samsung.com>
To: axboe@kernel.dk, agk@redhat.com, snitzer@kernel.org,
 dm-devel@redhat.com, kbusch@kernel.org, hch@lst.de, sagi@grimberg.me,
 james.smart@broadcom.com, kch@nvidia.com, damien.lemoal@opensource.wdc.com,
 naohiro.aota@wdc.com, jth@kernel.org, viro@zeniv.linux.org.uk
Date: Wed, 23 Nov 2022 11:28:26 +0530
Message-Id: <20221123055827.26996-10-nj.shetty@samsung.com>
In-Reply-To: <20221123055827.26996-1-nj.shetty@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01TbUxTZxTOvbe9Lc6yS2XwAhNLFxJAgVYLe1EQtiG5m8tCsoQluqRr2ruW
 UdraluEcKkw+WiZUBw52MYLD4QRHJxQGxRIGCsiGbDOV2ciXw2Ww8DUIU5Gxlgub/573ec45
 zznnzeFi/CJOIDddY6T0GplaiG9htfaEh0UC+3G5aPx5aB3oxeAnZ1Yx2DBiweHK4BAGHbNV
 bHivqx2FVxpuorDj4gIKb67N4HBiycWCn3XfReBDJ41Ch2snvO64xYJ37OdxWF33kAPP9jWz
 YdtkHgJbV6oxuPhVPgc2/jnHgv2uIDi02sdO8ifpsUGcbKdHOOTQ6DUWeWcwi2yqN+Nk86WT
 ZMe9XJwsOTXrDigYY5NznU6cLLXVI+RiUzBZ1PUpSjZNzqCp3ocy4lWUTEHpBZRGrlWka5QJ
 woNvS1+TxsSKxJHiOPiyUKCRZVIJwuQ3UyNT0tXu8YWCD2XqLDeVKjMYhNH74/XaLCMlUGkN
 xgQhpVOodRJdlEGWacjSKKM0lHGvWCTaHeMOfC9D9aAiUWcRHM1z2tBcpCWwGPHiAkIC2juK
 sGJkC5dPdCBgwFzA9gh84i8EtFxQMMIiAhZ6avDNjM6RJygj2BHwgLZymEcBCqw1i6xihMvF
 iZ3ghzWuh/clSlFg6uha98CIKhTM1D3leEptIxJAy3UT6sEsIhSULny7bsEj9oHh06fZnkKA
 iAaWMR8P7eWmf/zZjjIhPuDWF5MsD8aIHeBUS9V6fUBUeQF7+RLGtJoMnI96OAzeBqb7bBs4
 EExZCjdwNrhS/jXOJOcjgB6mEUZIBAUDFszTBEaEA6s9mqG3g3MDjShj7A1KViZRhueBtgub
 +CVw1bq5rgBw9++8DUwC5/lcDrPfUgTcPi09gwjoZ+ahn5mH/t+5BsHqkQBKZ8hUUoYY3W4N
 lf3fJ8u1mU3I+kVEvNGGTIzPR3UjKBfpRgAXE/ryTr6eI+fzFLKPjlF6rVSfpaYM3UiMe99n
 scAX5Fr3SWmMUrEkTiSJjY2VxO2JFQv9ebWVEXI+oZQZqQyK0lH6zTyU6xWYi+IGxaB/fU9K
 il+jX+eqXTKSNuY7aA79Rf+7ZnZ+AY8yVe8vOtrvl5F97PYTe+3UcOX7ywf8KKskbGGrT+P0
 1qvehTd+06nIX8E3w6M3DoQpTCcevdtrumTrNU84g/NFOZXXziX8FNJg7Xtn7+euiv7lXWmu
 XRkVR9K6Lz/m7Qi3PJZfDJH9cegfUgk+eDrV3FobVCZ5sXLP9hap7svwj/lBCtV3kcvlFWn5
 fckwKf5wWUROk+2w3uholAaXFB5XcilRkklde+TV+/RbIwdda/Ro2bh23wnxc73m5lfKVr8P
 nU6le5yXHSXmacfSnK05D69pSLRMxGfOC6V1ATP3Q6RClkElE0dgeoPsX8rOOwiaBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRmVeSWpSXmKPExsWy7bCSnG7iztpkg3+/2CzWnzrGbNE04S+z
 xeq7/WwWv8+eZ7bY+242q8XNAzuZLFauPspksXvhRyaLo//fslk8/HKLxWLSoWuMFk+vzmKy
 2HtL22LP3pMsFpd3zWGzmL/sKbvFxOObWS12PGlktNj2ez6zxeelLewW616/Z7E4cUva4vzf
 46wO4h6z7p9l89g56y67x/l7G1k8Lp8t9di0qpPNY/OSeo/dNxvYPHqb3wEVtN5n9Xi/7yqb
 R9+WVYwenzfJebQf6Gby2PTkLVMAXxSXTUpqTmZZapG+XQJXxqPp9gX9ChWNV7cwNTBulepi
 5OSQEDCR2Hf3F1MXIxeHkMAORokPTw8zQSQkJZb9PcIMYQtLrPz3nB2iqJlJYn3zEdYuRg4O
 NgFtidP/OUDiIgILmCQu33vFDOIwCyxlkph95S4bSLewgK3E1j0dYFNZBFQl+j5uAIvzClhL
 XO/pARskIaAv0X9fECTMCRQ+c3EXE0hYSMBKYs8yHYhqQYmTM5+wgNjMAvISzVtnM09gFJiF
 JDULSWoBI9MqRsnUguLc9NxiwwKjvNRyveLE3OLSvHS95PzcTYzgKNbS2sG4Z9UHvUOMTByM
 hxglOJiVRHjrPWuShXhTEiurUovy44tKc1KLDzFKc7AoifNe6DoZLySQnliSmp2aWpBaBJNl
 4uCUamCaKZEc/lmw8aPhTY/S/88qjky+J3slqSjhIGu1lPTm46dS+SZK8gu0e/T/r1CcnFDj
 yTlXYMWpHV42iQ5erNl/vc1OTpizWEP08A0tY3bLRK5Nnj/P5Rh3JwHdlDQvw3L/gXvnn1Vm
 cract0j5f/bTiUnBv7eZycwNU2fdGrEpMe29Y8jMh2IFRlOVHcWOXypuNfzw6c/+L1Pe6T34
 9Xhfc/2zGsY3HxkaW83Z9Qyj1ITzhHnqTn+/k7rPui5H8tNG6atmezWE7n1nZE4OrQ6ITfqt
 pSsvxvR22S/vhqDbPZv6kkum6jBFJL1wFcvaGHpj7ttCxsyNUfUWYvfyo1Ly9rUwiJ6u33Kb
 JzVGiaU4I9FQi7moOBEAOVdKqlEDAAA=
X-CMS-MailID: 20221123061041epcas5p4413569a46ee730cd3033a9025c8f134a
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20221123061041epcas5p4413569a46ee730cd3033a9025c8f134a
References: <20221123055827.26996-1-nj.shetty@samsung.com>
 <CGME20221123061041epcas5p4413569a46ee730cd3033a9025c8f134a@epcas5p4.samsung.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mailman-Approved-At: Wed, 23 Nov 2022 08:25:56 +0000
Subject: [dm-devel] [PATCH v5 09/10] dm kcopyd: use copy offload support
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: p.raghav@samsung.com, joshi.k@samsung.com, gost.dev@samsung.com,
 anuj20.g@samsung.com, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, Nitesh Shetty <nj.shetty@samsung.com>,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 nitheshshetty@gmail.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Introduce copy_jobs to use copy-offload, if supported by underlying devices
otherwise fall back to existing method.

run_copy_jobs() calls block layer copy offload API, if both source and
destination request queue are same and support copy offload.
On successful completion, destination regions copied count is made zero,
failed regions are processed via existing method.

Signed-off-by: Nitesh Shetty <nj.shetty@samsung.com>
Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
---
 drivers/md/dm-kcopyd.c | 56 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 50 insertions(+), 6 deletions(-)

diff --git a/drivers/md/dm-kcopyd.c b/drivers/md/dm-kcopyd.c
index 4d3bbbea2e9a..2f9985f671ac 100644
--- a/drivers/md/dm-kcopyd.c
+++ b/drivers/md/dm-kcopyd.c
@@ -74,18 +74,20 @@ struct dm_kcopyd_client {
 	atomic_t nr_jobs;
 
 /*
- * We maintain four lists of jobs:
+ * We maintain five lists of jobs:
  *
- * i)   jobs waiting for pages
- * ii)  jobs that have pages, and are waiting for the io to be issued.
- * iii) jobs that don't need to do any IO and just run a callback
- * iv) jobs that have completed.
+ * i)	jobs waiting to try copy offload
+ * ii)   jobs waiting for pages
+ * iii)  jobs that have pages, and are waiting for the io to be issued.
+ * iv) jobs that don't need to do any IO and just run a callback
+ * v) jobs that have completed.
  *
- * All four of these are protected by job_lock.
+ * All five of these are protected by job_lock.
  */
 	spinlock_t job_lock;
 	struct list_head callback_jobs;
 	struct list_head complete_jobs;
+	struct list_head copy_jobs;
 	struct list_head io_jobs;
 	struct list_head pages_jobs;
 };
@@ -579,6 +581,43 @@ static int run_io_job(struct kcopyd_job *job)
 	return r;
 }
 
+static int run_copy_job(struct kcopyd_job *job)
+{
+	int r, i, count = 0;
+	struct range_entry range;
+
+	struct request_queue *src_q, *dest_q;
+
+	for (i = 0; i < job->num_dests; i++) {
+		range.dst = job->dests[i].sector << SECTOR_SHIFT;
+		range.src = job->source.sector << SECTOR_SHIFT;
+		range.len = job->source.count << SECTOR_SHIFT;
+
+		src_q = bdev_get_queue(job->source.bdev);
+		dest_q = bdev_get_queue(job->dests[i].bdev);
+
+		if (src_q != dest_q || !blk_queue_copy(src_q))
+			break;
+
+		r = blkdev_issue_copy(job->source.bdev, job->dests[i].bdev,
+				&range, 1, NULL, NULL, GFP_KERNEL);
+		if (r)
+			break;
+
+		job->dests[i].count = 0;
+		count++;
+	}
+
+	if (count == job->num_dests) {
+		push(&job->kc->complete_jobs, job);
+	} else {
+		push(&job->kc->pages_jobs, job);
+		r = 0;
+	}
+
+	return r;
+}
+
 static int run_pages_job(struct kcopyd_job *job)
 {
 	int r;
@@ -659,6 +698,7 @@ static void do_work(struct work_struct *work)
 	spin_unlock_irq(&kc->job_lock);
 
 	blk_start_plug(&plug);
+	process_jobs(&kc->copy_jobs, kc, run_copy_job);
 	process_jobs(&kc->complete_jobs, kc, run_complete_job);
 	process_jobs(&kc->pages_jobs, kc, run_pages_job);
 	process_jobs(&kc->io_jobs, kc, run_io_job);
@@ -676,6 +716,8 @@ static void dispatch_job(struct kcopyd_job *job)
 	atomic_inc(&kc->nr_jobs);
 	if (unlikely(!job->source.count))
 		push(&kc->callback_jobs, job);
+	else if (job->source.bdev->bd_disk == job->dests[0].bdev->bd_disk)
+		push(&kc->copy_jobs, job);
 	else if (job->pages == &zero_page_list)
 		push(&kc->io_jobs, job);
 	else
@@ -916,6 +958,7 @@ struct dm_kcopyd_client *dm_kcopyd_client_create(struct dm_kcopyd_throttle *thro
 	spin_lock_init(&kc->job_lock);
 	INIT_LIST_HEAD(&kc->callback_jobs);
 	INIT_LIST_HEAD(&kc->complete_jobs);
+	INIT_LIST_HEAD(&kc->copy_jobs);
 	INIT_LIST_HEAD(&kc->io_jobs);
 	INIT_LIST_HEAD(&kc->pages_jobs);
 	kc->throttle = throttle;
@@ -971,6 +1014,7 @@ void dm_kcopyd_client_destroy(struct dm_kcopyd_client *kc)
 
 	BUG_ON(!list_empty(&kc->callback_jobs));
 	BUG_ON(!list_empty(&kc->complete_jobs));
+	WARN_ON(!list_empty(&kc->copy_jobs));
 	BUG_ON(!list_empty(&kc->io_jobs));
 	BUG_ON(!list_empty(&kc->pages_jobs));
 	destroy_workqueue(kc->kcopyd_wq);
-- 
2.35.1.500.gb896f729e2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

