Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B403740982
	for <lists+dm-devel@lfdr.de>; Wed, 28 Jun 2023 08:45:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687934720;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+pBFxvfV7PreEjGZwUYL66F8WJ8T2KnqI+UCKmxMAzE=;
	b=OUJuZF6Clwd3PDCDGL9bGtAeWSBR6q2BMOuTY6jjHj6Dxaab40FflogXVKmJRrj8weTFrf
	HVc2xNQK5mwaE+AMdH6pz4/bzBNznsjOs7h2PoH+Ah3a/XRDeRb1z6qkQ1yvoKzprn7DST
	DbD6XvxNA5HmNKVX+T4x6hTkWaDNQII=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-228-04A5ez-7M0SD5XiLlkk9gw-1; Wed, 28 Jun 2023 02:45:15 -0400
X-MC-Unique: 04A5ez-7M0SD5XiLlkk9gw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 687ED1C05156;
	Wed, 28 Jun 2023 06:45:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 12E76C09A07;
	Wed, 28 Jun 2023 06:44:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E3C9C19465B2;
	Wed, 28 Jun 2023 06:44:57 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A0CFF1946586
 for <dm-devel@listman.corp.redhat.com>; Wed, 28 Jun 2023 06:44:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8BE1BC1ED98; Wed, 28 Jun 2023 06:44:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 83050C09A07
 for <dm-devel@redhat.com>; Wed, 28 Jun 2023 06:44:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 643291006A71
 for <dm-devel@redhat.com>; Wed, 28 Jun 2023 06:44:56 +0000 (UTC)
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-398-F5DTW6yEMuiWhmRoLaQU2A-1; Wed, 28 Jun 2023 02:44:54 -0400
X-MC-Unique: F5DTW6yEMuiWhmRoLaQU2A-1
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20230628064450epoutp02a431eb4a4285cac7af945d9c5b03c068~sv6iMiEQT2756127561epoutp02f
 for <dm-devel@redhat.com>; Wed, 28 Jun 2023 06:44:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20230628064450epoutp02a431eb4a4285cac7af945d9c5b03c068~sv6iMiEQT2756127561epoutp02f
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20230628064450epcas5p27072c59c3f70a29396a8ecdc75477e06~sv6hUlEmG1602616026epcas5p2A;
 Wed, 28 Jun 2023 06:44:50 +0000 (GMT)
Received: from epsmgec5p1-new.samsung.com (unknown [182.195.38.177]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4QrXBS6H7Lz4x9Q6; Wed, 28 Jun
 2023 06:44:48 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
 epsmgec5p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
 9E.28.55173.0E6DB946; Wed, 28 Jun 2023 15:44:48 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
 20230627184058epcas5p2226835b15381b856859b162e58572d63~smCgdzRC72124021240epcas5p2b;
 Tue, 27 Jun 2023 18:40:58 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230627184058epsmtrp1a67c7afb9091feee7c469eb5c89a9c8e~smCgcr4Fd1856518565epsmtrp1Y;
 Tue, 27 Jun 2023 18:40:58 +0000 (GMT)
X-AuditID: b6c32a50-df1ff7000001d785-66-649bd6e04566
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 73.18.30535.A3D2B946; Wed, 28 Jun 2023 03:40:58 +0900 (KST)
Received: from green245.sa.corp.samsungelectronics.net (unknown
 [107.99.41.245]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20230627184054epsmtip2c141669cc20c09e0780a9f2f3970ed70~smCc5nDIq0374003740epsmtip2p;
 Tue, 27 Jun 2023 18:40:54 +0000 (GMT)
From: Nitesh Shetty <nj.shetty@samsung.com>
To: Jens Axboe <axboe@kernel.dk>, Jonathan Corbet <corbet@lwn.net>, Alasdair
 Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 dm-devel@redhat.com, Keith Busch <kbusch@kernel.org>, Christoph Hellwig
 <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni
 <kch@nvidia.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian
 Brauner <brauner@kernel.org>
Date: Wed, 28 Jun 2023 00:06:21 +0530
Message-Id: <20230627183629.26571-8-nj.shetty@samsung.com>
In-Reply-To: <20230627183629.26571-1-nj.shetty@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Te0xTVxzeube9LWR116Lu2CprLi4RWKXVgqcoYjKid3HZyPyDzU1Zbe8A
 oY/1gW5mG4g8rOExQBzVWBGC1KogD1MF1BQQKVMTQRhM0JAyM2WoOBFkwigXNv/7vu/3/k4O
 HxdW8ET8JJ2ZMepUKRThz7nYEhwifdBzTCPrfyFD1Z7rOHIO5BPoccsYQCVPJ3HkvZYNUJd3
 EXpwNRo1jx7jor5rlzDUdKoQQw5nG4YK3T0ADd+1Yai5PxSVZVVwUFNzBwd1XT5OIHvlMA8d
 7nUR6HT7NIbcRRkYcnnTAbo4ZcfR+cdPOOhGvxjdft3ORVMTx4nNYrqrext9yTbAo28PXuDQ
 dVUhdNdNC1175hBB11X8RDf2pRF0eV4Rl87NGCXoZ8P9HPrJlbsEnVd/BtB1nfvp57WBdK33
 LyyW3JG8MZFRaRijhNGp9ZokXUIUtW17/Ifx4REyuVSuROspiU6lZaKomI9jpVuSUmaNoSSp
 qhTLrBSrMpmosE0bjXqLmZEk6k3mKIoxaFIMCsMak0prsugS1ugYc6RcJlsbPpv4dXJi3vgw
 MNSL9tlzCkEauLzUCvz4kFTAAvsgbgX+fCHZBOCrO93zZAzAUecRjCXjALpeTmILJZPTExw2
 0Axg8VgrlyWZGOzwXABWwOcTZCjsnOH79CVkGg5rGsuBj+BkBQ4dI0+5vlYBpBKWdQ/NYQ75
 PjzryCZ8WEBGwoLxwrlGkAyD+fcX+2Q/cgNsvN3KZVMWw45SL8eHcfI9mNFwbG5vSHr84K2G
 AYytjYEPO35ktw6Aj9rreSwWwT/zs+bxXugoriLY2oMA2nptgA1Ew0xPPu7rg5PBsPpyGCuv
 hEc85zF27iKYO+Wdd0UAXScWcBA8W32SYPFy2PMyfR7T8MnNXsCalQegx2rFC4DE9sY9tjfu
 sf0/+iTAzwARYzBpExh1uEEu1TF7/3tntV5bC+a+S0isCzhrXq9xA4wP3ADycWqJYNnEUY1Q
 oFF99z1j1McbLSmMyQ3CZw3/GRctVetn/5vOHC9XKGWKiIgIhXJdhJx6VzC49ZBGSCaozEwy
 wxgY40IdxvcTpWFlDaKZ1GSeqrf8s9/Lb+TmnLBetZJnd9d9mXWuovYAlU2lcoIt4gdBXEvc
 6j1xfs5Bc1GZI2PI9cGrd0bUzAmFfjpq/0frbKmXYtafcxxsFd9rJir7JaWSTx7+HSy4yg+q
 2emMu8J7K1JbTFM5Vdc2D10PHabWtu9aFQjGxwQxhcoB93FhZTp52m7/avAbqee3pWFVkQ47
 f98K5TKq1Foz1JpI/vC5MbbE8Kv0+Z57zz59++SqDRHRp3oOl9xq27rpn1/62r7wKAN45kqb
 eKc4c4U6cnp3S8mLgEe77si224V1lUcD+7TqEXfJjpVZ/vdXf4sfQBKxcOiP5V3PvN2dM1EU
 x5SokofgRpPqX9IKRJW3BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRmVeSWpSXmKPExsWy7bCSvK6V7uwUgyctghbrTx1jtlh9t5/N
 4vXhT4wW0z78ZLZ4cqCd0eLyEz6LB/vtLfa+m81qcfPATiaLPYsmMVmsXH2UyWLSoWuMFk+v
 zmKy2HtL22Jh2xIWiz17T7JYXN41h81i/rKn7Bbd13ewWSw//o/J4tDkZiaLHU8aGS22/Z7P
 bLHu9XsWixO3pC3O/z3OavH7xxw2B2mPy1e8PXbOusvucf7eRhaPzSu0PC6fLfXYtKqTzWPz
 knqP3Tcb2DwW901m9ehtfsfm8fHpLRaP9/uusnn0bVnF6LH5dLXH501yHpuevGUKEIjisklJ
 zcksSy3St0vgyuj79pSxYItUxfyOSYwNjLtEuxg5OSQETCR+/vvB0sXIxSEksJtR4tq1S+wQ
 CUmJZX+PMEPYwhIr/z1nhyhqZpK4e+sqkMPBwSagLXH6PwdIXESgi1mic+c7sEnMAtuYJT58
 +AI2SVjAUmLhlUesIDaLgKrEmpXtbCA2r4CVxIRvkxhBBkkI6Ev03xcECXMKWEvsPn+EFSQs
 BFTy/ngARLWgxMmZT1hAbGYBeYnmrbOZJzAKzEKSmoUktYCRaRWjZGpBcW56brFhgVFearle
 cWJucWleul5yfu4mRnDka2ntYNyz6oPeIUYmDsZDjBIczEoivGI/pqcI8aYkVlalFuXHF5Xm
 pBYfYpTmYFES5/32ujdFSCA9sSQ1OzW1ILUIJsvEwSnVwCT5bv3ug4VinW5rP7WddnaO0FBe
 WHRx2bsrulfDX2w+q/XVqdpcz0YkxIJ/ibeZcND5iBrxvmfymkzmLeJz3yyYVJaYz6Zo3CNu
 pSQ+f8OqhP87T0W2nPLU+7rpnu6N0trEhz+mFAcpVFvJmSp4hGXO//1R60XZoYfnNWsFXOS1
 DieIFtz957U1bU+N5wzHA4XRjvfTT6zfd+T6n2m6kyJO2Tt+qHxiEjb3r+gKP6uk4oP13yWM
 LiX1rTZPcIndaiw9oXWVl5Tkgbu81/OOqN65xNBR/i006xW3/qV95dXXJ5zz6g6f4nSb/dvP
 Bwm/pr5adl3llvHvU49M3wfc2+G1p1O9xvLMTmfmK3b3bimxFGckGmoxFxUnAgD68nK/awMA
 AA==
X-CMS-MailID: 20230627184058epcas5p2226835b15381b856859b162e58572d63
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230627184058epcas5p2226835b15381b856859b162e58572d63
References: <20230627183629.26571-1-nj.shetty@samsung.com>
 <CGME20230627184058epcas5p2226835b15381b856859b162e58572d63@epcas5p2.samsung.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [dm-devel] [PATCH v13 7/9] dm: Add support for copy offload
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
Cc: linux-nvme@lists.infradead.org, bvanassche@acm.org,
 linux-scsi@vger.kernel.org, linux-doc@vger.kernel.org, djwong@kernel.org,
 nitheshshetty@gmail.com, linux-kernel@vger.kernel.org, willy@infradead.org,
 ming.lei@redhat.com, linux-block@vger.kernel.org, dlemoal@kernel.org,
 martin.petersen@oracle.com, linux-fsdevel@vger.kernel.org,
 gost.dev@samsung.com, Nitesh Shetty <nj.shetty@samsung.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Before enabling copy for dm target, check if underlying devices and
dm target support copy. Avoid split happening inside dm target.
Fail early if the request needs split, currently splitting copy
request is not supported.

Signed-off-by: Nitesh Shetty <nj.shetty@samsung.com>
---
 drivers/md/dm-table.c         | 41 +++++++++++++++++++++++++++++++++++
 drivers/md/dm.c               |  7 ++++++
 include/linux/device-mapper.h |  5 +++++
 3 files changed, 53 insertions(+)

diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index 7d208b2b1a19..2d08a890d7e1 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -1862,6 +1862,39 @@ static bool dm_table_supports_nowait(struct dm_table *t)
 	return true;
 }
 
+static int device_not_copy_capable(struct dm_target *ti, struct dm_dev *dev,
+				      sector_t start, sector_t len, void *data)
+{
+	struct request_queue *q = bdev_get_queue(dev->bdev);
+
+	return !blk_queue_copy(q);
+}
+
+static bool dm_table_supports_copy(struct dm_table *t)
+{
+	struct dm_target *ti;
+	unsigned int i;
+
+	for (i = 0; i < t->num_targets; i++) {
+		ti = dm_table_get_target(t, i);
+
+		if (!ti->copy_offload_supported)
+			return false;
+
+		/*
+		 * target provides copy support (as implied by setting
+		 * 'copy_offload_supported')
+		 * and it relies on _all_ data devices having copy support.
+		 */
+		if (!ti->type->iterate_devices ||
+		     ti->type->iterate_devices(ti,
+			     device_not_copy_capable, NULL))
+			return false;
+	}
+
+	return true;
+}
+
 static int device_not_discard_capable(struct dm_target *ti, struct dm_dev *dev,
 				      sector_t start, sector_t len, void *data)
 {
@@ -1944,6 +1977,14 @@ int dm_table_set_restrictions(struct dm_table *t, struct request_queue *q,
 		q->limits.discard_misaligned = 0;
 	}
 
+	if (!dm_table_supports_copy(t)) {
+		blk_queue_flag_clear(QUEUE_FLAG_COPY, q);
+		q->limits.max_copy_sectors = 0;
+		q->limits.max_copy_sectors_hw = 0;
+	} else {
+		blk_queue_flag_set(QUEUE_FLAG_COPY, q);
+	}
+
 	if (!dm_table_supports_secure_erase(t))
 		q->limits.max_secure_erase_sectors = 0;
 
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index f0f118ab20fa..6245e16bf066 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1732,6 +1732,13 @@ static blk_status_t __split_and_process_bio(struct clone_info *ci)
 	if (unlikely(ci->is_abnormal_io))
 		return __process_abnormal_io(ci, ti);
 
+	if ((unlikely(op_is_copy(ci->bio->bi_opf)) &&
+			max_io_len(ti, ci->sector) < ci->sector_count)) {
+		DMERR("Error, IO size(%u) > max target size(%llu)\n",
+			ci->sector_count, max_io_len(ti, ci->sector));
+		return BLK_STS_IOERR;
+	}
+
 	/*
 	 * Only support bio polling for normal IO, and the target io is
 	 * exactly inside the dm_io instance (verified in dm_poll_dm_io)
diff --git a/include/linux/device-mapper.h b/include/linux/device-mapper.h
index 69d0435c7ebb..8ffee7e8cd06 100644
--- a/include/linux/device-mapper.h
+++ b/include/linux/device-mapper.h
@@ -396,6 +396,11 @@ struct dm_target {
 	 * bio_set_dev(). NOTE: ideally a target should _not_ need this.
 	 */
 	bool needs_bio_set_dev:1;
+
+	/*
+	 * copy offload is supported
+	 */
+	bool copy_offload_supported:1;
 };
 
 void *dm_per_bio_data(struct bio *bio, size_t data_size);
-- 
2.35.1.500.gb896f729e2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

