Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 431367225B8
	for <lists+dm-devel@lfdr.de>; Mon,  5 Jun 2023 14:30:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685968205;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=eW6grThDnHSfeuOL8IGPvqwfVpF8yCDsT2KJnC3HxPM=;
	b=aYmd647Mxorazqs6kQ0uEqaSLpCwEnnLFWr/n8KE9sqQlxv64NDwJpH2XjIhLDoa6NbR03
	+fLRsVRHTNXQKJPOSxUCwvn/JTkTTJlUrJSSIlehtyw2G4rn+ZWIuaNPXjKkiMUoRo628H
	bWrW7l3o6xCv/y9m7wbPfBpbeFz9ovI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-489-LGZ-fmwlOMeicmpWVNvl-w-1; Mon, 05 Jun 2023 08:30:03 -0400
X-MC-Unique: LGZ-fmwlOMeicmpWVNvl-w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0150D801224;
	Mon,  5 Jun 2023 12:30:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DD7CE2026D6A;
	Mon,  5 Jun 2023 12:30:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5795C1946A42;
	Mon,  5 Jun 2023 12:29:56 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B7A611946F08
 for <dm-devel@listman.corp.redhat.com>; Mon,  5 Jun 2023 12:29:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9AA7B1121315; Mon,  5 Jun 2023 12:29:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 92A8F1121314
 for <dm-devel@redhat.com>; Mon,  5 Jun 2023 12:29:45 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D608101A53A
 for <dm-devel@redhat.com>; Mon,  5 Jun 2023 12:29:45 +0000 (UTC)
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-550-tmesyVdvPsK4SV4Jv6OUOQ-1; Mon, 05 Jun 2023 08:29:43 -0400
X-MC-Unique: tmesyVdvPsK4SV4Jv6OUOQ-1
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20230605122939epoutp02b4a07d5659cd7f871b1514e6de7ecec4~lwyB8kj_g0553505535epoutp02c
 for <dm-devel@redhat.com>; Mon,  5 Jun 2023 12:29:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20230605122939epoutp02b4a07d5659cd7f871b1514e6de7ecec4~lwyB8kj_g0553505535epoutp02c
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTP id
 20230605122938epcas5p44ce472b062119d34b73bea811b4495fa~lwyAwaV4G1407614076epcas5p4F;
 Mon,  5 Jun 2023 12:29:38 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.182]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4QZXww5kP3z4x9Pr; Mon,  5 Jun
 2023 12:29:36 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
 epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 4B.F6.44881.035DD746; Mon,  5 Jun 2023 21:29:36 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
 20230605122239epcas5p236a716d16fa1d1a2dfff856158deb5af~lwr6aRzdQ2830028300epcas5p2a;
 Mon,  5 Jun 2023 12:22:39 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230605122239epsmtrp2f271b064dcc3e26955698db8682ab4eb~lwr6X1iFE0879508795epsmtrp2W;
 Mon,  5 Jun 2023 12:22:39 +0000 (GMT)
X-AuditID: b6c32a4a-c47ff7000001af51-78-647dd5307c53
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 D3.C5.28392.F83DD746; Mon,  5 Jun 2023 21:22:39 +0900 (KST)
Received: from green245.sa.corp.samsungelectronics.net (unknown
 [107.99.41.245]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20230605122234epsmtip228b80cbb7dc1de7f7d1b0755231f14a3~lwr1f4M562245922459epsmtip2J;
 Mon,  5 Jun 2023 12:22:34 +0000 (GMT)
From: Nitesh Shetty <nj.shetty@samsung.com>
To: Jens Axboe <axboe@kernel.dk>, Jonathan Corbet <corbet@lwn.net>, Alasdair
 Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 dm-devel@redhat.com, Keith Busch <kbusch@kernel.org>, Christoph Hellwig
 <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, James Smart
 <james.smart@broadcom.com>, Chaitanya Kulkarni <kch@nvidia.com>, Alexander
 Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>
Date: Mon,  5 Jun 2023 17:47:20 +0530
Message-Id: <20230605121732.28468-5-nj.shetty@samsung.com>
In-Reply-To: <20230605121732.28468-1-nj.shetty@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01TazBcZxjud846dmOY4xL5rFy221GDuKygnyBMaswZ2ozEn1TT6rLHpdjd
 7K5KKm13o2EisSSadLqUxErdWluXGtdWVhC3iiIZWkGsGNnUdTJ0RNRa2vx73ud9n+e9fPMx
 casqUzYzQSijJUJ+EpfYw6hvd3J09Rj5QuAxo3dEmp5OHF3M3cBR5XgOgfTtywDdXPwHR7q2
 TICGdBZo8rdA1Dqfb4JG2xox1FJ8HUPllR0Yar69hKHr2ocAzYyoMNQ65oJuZ5QwUEtrNwMN
 NRUQqOiHGVN05VEDgUq7XmFIm5eOoQadAqD69SIcVekXGOj+mD0a2OgyQetrBUTQAWpoOIxS
 TfQTVKNq3JQaeFzNoGrLnKmh/hSqpuIyQdWWfEU1j8oJSq3MM6Gy0+cJamlmjEEt/DpCUMq6
 CkDV9qZRKzUHwy0jE/3jab6AlnBoYYxIkCCMC+CGRUS9G+Xt48Fz5fmid7gcIT+ZDuAGvxfu
 GpKQtHUiLuczflLKFhXOl0q57sf8JaIUGc2JF0llAVxaLEgSe4ndpPxkaYowzk1Iy47yPDw8
 vbcKP0mMz9bcwcWvHM5Va0oJORg9lAVYTEh6QeWDGiIL7GFakc0A3nk2yzAGywA+v6E2MQYr
 ABZtTjF2JZMZP+0kmgCsyNjY0V/C4MDLKdMswGQSpAvs3WQaeBuyDIeK1b5tX5zswmHnkgI3
 WFmTH8GnbZ3AgBmkAyxZM/RjMc3Jo/De2JVtI0i6w5wJSwPNIv3gXL8WN5ZYwu7vdNsT4eQh
 mP5LPm7wh+QfLDh5d4EwjhoMu6aLTYzYGj7rqjM1YjZcmW/dqUmF5d+UEUbx1wCqHqmAMREI
 L/Xk4IYhcNIJaprcjfQBeKOnCjM2toDZ6zrMyJvDhsJd/Bb8UXNrx98OPlxV7GAK1r3QmRqv
 pQRQrlBjuYCjem0h1WsLqf5vfQvgFcCOFkuT42ipt9hTSKf+984xouQasP1xnEMbwNTkopsW
 YEygBZCJc23Mm0LTBFbmAv75z2mJKEqSkkRLtcB76+DXcPbeGNHWzxPKonhevh5ePj4+Xr5H
 fHjcfeaOAd0xVmQcX0Yn0rSYluzqMCaLLcea9SH2/QNvaPShsZ3Mw3YFdX+ymvoPMjYGn0S8
 +bQus9GWnZ8pyw88k+ueSh7+nROJ8vZfveYiP3vm+JH7eYknzGZ00fyPI02OdduWJPWGfdtc
 +NfQqWELQtHB+tK3peJ0sdOp8I6ILNGL9g8uZqYx5hQs0pNjM9HnNzvmHJYZjav19m0Bk5/y
 jkuDKwdL1e9PR3MWTs6dK33sGXAiRyl7uWoer9xU4E9az374/G5DSZ9ZdQytcYDhF/auX1ZF
 7Fv7OcReMYDl2y1O4/vTrVdjN80KtRH++VcvNNmyBX1/DwapU8frL7sEve2n8vv+HjwZu9Q5
 e5M8P6Itly9HodPDD7gMaTyf54xLpPx/AQAthoPBBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTYRjG+845OzsK2nHdPlMzRpoYaa3bp86KwDpkVlCIFJajnaY1dW5Z
 2QXNlaVimpbgpl103iYlatk0Z7YsM1u3peW6WbpCoja7WqbWHEH/Pfx+z/v89VI47w0xk4pL
 2MPKE0RSPulMNN7ke8/PNR0WL/h4dTKqvXsbR+l5oziqeZlLog83PwNUaPuJo4G24wCZBlxR
 3/UVSP9JzUG9bU0YainNx1B1zS0MXbswhKF8Qw9Alm4VhvTmeehChoZALfpOApmai0l0rsLC
 RdlPdSSq7BjDkKFAiSHdwBGAGkfO4ejSByuB7pg90IPRDg4aGS4mV3oxpifhjOq1kWSaVC+5
 zINXdQTTUOXPmIzJTL02k2QaNKnMtd40kik7WcBhcpSfSGbIYiYYa2s3yZy8rAVMQ9dB5kv9
 rI1uW5yFYlYat5eVBy6PcY7NqS3HZWM+++tqK8k00OudBZwoSC+GfRkXOVnAmeLROgDLuzq4
 DuEOK0bbcUeeAqvH3nMdJSUG085YsSxAUSQ9D3aNU3Y+lb6MQ+OvAo79AKef47DI6GnPU+it
 sDBfOcEJ2gdqhssmsgsdDNvN2Vz7DqQDYe5rNzt2okPgoNGA2zHvb6XbKnS03WBn0QDhWPeG
 yitqPA/Qqv+U6j91HmBa4M7KFPGSeMVCmSCB3RegEMUrkhMkATsS4+vBxBf4++tAi9YWYAAY
 BQwAUjh/qkvz2oNinotYlHKAlSdulydLWYUBeFAEf4bLw6zO7TxaItrD7mZZGSv/ZzHKaWYa
 Ftl/1/uGdH2w8NQbT7NuUVDMlaMRukZJ+9hqkLohpOwhPsgpzMuWC1tiXqzhnJ62Ifrez225
 O0w9KX2U+JCgu0cT8EiwJmewaqdNWLFkWP3tV2ytxJLU2vquuOGspu7U7nF3imd1C2t+rzuu
 r7y1NrD3u8+SE5lRcdPFNX3pJavMR8fv19m8jCfa3s2OijbYHheJ1EOaj0GZSaEjzVJ1yNy5
 P/iTEzfLuMcEtz301zdFWHxb5Y9dO7g1kybNkYY1gYr+4HE/vwMZHqVeg56l/Snpm79UBQX2
 JEt+L4h8ti/sa7jWN3Ra+a63XkvXLS86Q0WOLktNCnUNni4W8JW+ESX5fEIRK1roj8sVoj92
 6+OjdAMAAA==
X-CMS-MailID: 20230605122239epcas5p236a716d16fa1d1a2dfff856158deb5af
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230605122239epcas5p236a716d16fa1d1a2dfff856158deb5af
References: <20230605121732.28468-1-nj.shetty@samsung.com>
 <CGME20230605122239epcas5p236a716d16fa1d1a2dfff856158deb5af@epcas5p2.samsung.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [dm-devel] [PATCH v12 4/9] fs,
 block: copy_file_range for def_blk_ops for direct block device
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
Cc: Anuj Gupta <anuj20.g@samsung.com>, linux-nvme@lists.infradead.org,
 bvanassche@acm.org, linux-scsi@vger.kernel.org, linux-doc@vger.kernel.org,
 djwong@kernel.org, nitheshshetty@gmail.com, linux-kernel@vger.kernel.org,
 willy@infradead.org, ming.lei@redhat.com, linux-block@vger.kernel.org,
 dlemoal@kernel.org, martin.petersen@oracle.com, linux-fsdevel@vger.kernel.org,
 gost.dev@samsung.com, Nitesh Shetty <nj.shetty@samsung.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

For direct block device opened with O_DIRECT, use copy_file_range to
issue device copy offload, and fallback to generic_copy_file_range incase
device copy offload capability is absent.
Modify checks to allow bdevs to use copy_file_range.

Suggested-by: Ming Lei <ming.lei@redhat.com>
Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
Signed-off-by: Nitesh Shetty <nj.shetty@samsung.com>
---
 block/blk-lib.c        | 26 ++++++++++++++++++++++++++
 block/fops.c           | 20 ++++++++++++++++++++
 fs/read_write.c        |  7 +++++--
 include/linux/blkdev.h |  4 ++++
 4 files changed, 55 insertions(+), 2 deletions(-)

diff --git a/block/blk-lib.c b/block/blk-lib.c
index 99b65af8bfc1..31cfd5026367 100644
--- a/block/blk-lib.c
+++ b/block/blk-lib.c
@@ -534,6 +534,32 @@ ssize_t blkdev_copy_offload(
 }
 EXPORT_SYMBOL_GPL(blkdev_copy_offload);
 
+/* Copy source offset from source block device to destination block
+ * device. Returns the length of bytes copied.
+ */
+ssize_t blkdev_copy_offload_failfast(
+		struct block_device *bdev_in, loff_t pos_in,
+		struct block_device *bdev_out, loff_t pos_out,
+		size_t len, gfp_t gfp_mask)
+{
+	struct request_queue *in_q = bdev_get_queue(bdev_in);
+	struct request_queue *out_q = bdev_get_queue(bdev_out);
+	ssize_t ret = 0;
+
+	if (blkdev_copy_sanity_check(bdev_in, pos_in, bdev_out, pos_out, len))
+		return 0;
+
+	if (blk_queue_copy(in_q) && blk_queue_copy(out_q)) {
+		ret = __blkdev_copy_offload(bdev_in, pos_in, bdev_out, pos_out,
+				len, NULL, NULL, gfp_mask);
+		if (ret < 0)
+			return 0;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(blkdev_copy_offload_failfast);
+
 static int __blkdev_issue_write_zeroes(struct block_device *bdev,
 		sector_t sector, sector_t nr_sects, gfp_t gfp_mask,
 		struct bio **biop, unsigned flags)
diff --git a/block/fops.c b/block/fops.c
index f56811a925a0..9189f3239c9c 100644
--- a/block/fops.c
+++ b/block/fops.c
@@ -599,6 +599,25 @@ static ssize_t blkdev_read_iter(struct kiocb *iocb, struct iov_iter *to)
 	return ret;
 }
 
+static ssize_t blkdev_copy_file_range(struct file *file_in, loff_t pos_in,
+				struct file *file_out, loff_t pos_out,
+				size_t len, unsigned int flags)
+{
+	struct block_device *in_bdev = I_BDEV(bdev_file_inode(file_in));
+	struct block_device *out_bdev = I_BDEV(bdev_file_inode(file_out));
+	ssize_t comp_len = 0;
+
+	if ((file_in->f_iocb_flags & IOCB_DIRECT) &&
+		(file_out->f_iocb_flags & IOCB_DIRECT))
+		comp_len = blkdev_copy_offload_failfast(in_bdev, pos_in,
+				out_bdev, pos_out, len, GFP_KERNEL);
+	if (comp_len != len)
+		comp_len = generic_copy_file_range(file_in, pos_in + comp_len,
+			file_out, pos_out + comp_len, len - comp_len, flags);
+
+	return comp_len;
+}
+
 #define	BLKDEV_FALLOC_FL_SUPPORTED					\
 		(FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE |		\
 		 FALLOC_FL_ZERO_RANGE | FALLOC_FL_NO_HIDE_STALE)
@@ -692,6 +711,7 @@ const struct file_operations def_blk_fops = {
 	.splice_read	= filemap_splice_read,
 	.splice_write	= iter_file_splice_write,
 	.fallocate	= blkdev_fallocate,
+	.copy_file_range = blkdev_copy_file_range,
 };
 
 static __init int blkdev_init(void)
diff --git a/fs/read_write.c b/fs/read_write.c
index b07de77ef126..d27148a2543f 100644
--- a/fs/read_write.c
+++ b/fs/read_write.c
@@ -1447,7 +1447,8 @@ static int generic_copy_file_checks(struct file *file_in, loff_t pos_in,
 		return -EOVERFLOW;
 
 	/* Shorten the copy to EOF */
-	size_in = i_size_read(inode_in);
+	size_in = i_size_read(file_in->f_mapping->host);
+
 	if (pos_in >= size_in)
 		count = 0;
 	else
@@ -1708,7 +1709,9 @@ int generic_file_rw_checks(struct file *file_in, struct file *file_out)
 	/* Don't copy dirs, pipes, sockets... */
 	if (S_ISDIR(inode_in->i_mode) || S_ISDIR(inode_out->i_mode))
 		return -EISDIR;
-	if (!S_ISREG(inode_in->i_mode) || !S_ISREG(inode_out->i_mode))
+
+	if ((!S_ISREG(inode_in->i_mode) || !S_ISREG(inode_out->i_mode)) &&
+		(!S_ISBLK(inode_in->i_mode) || !S_ISBLK(inode_out->i_mode)))
 		return -EINVAL;
 
 	if (!(file_in->f_mode & FMODE_READ) ||
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 69fe977afdc9..a634768a2318 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1057,6 +1057,10 @@ ssize_t blkdev_copy_offload(
 		struct block_device *bdev_in, loff_t pos_in,
 		struct block_device *bdev_out, loff_t pos_out,
 		size_t len, cio_iodone_t end_io, void *private, gfp_t gfp_mask);
+ssize_t blkdev_copy_offload_failfast(
+		struct block_device *bdev_in, loff_t pos_in,
+		struct block_device *bdev_out, loff_t pos_out,
+		size_t len, gfp_t gfp_mask);
 struct bio *bio_map_kern(struct request_queue *q, void *data, unsigned int len,
 		gfp_t gfp_mask);
 void bio_map_kern_endio(struct bio *bio);
-- 
2.35.1.500.gb896f729e2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

