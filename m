Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D4B740953
	for <lists+dm-devel@lfdr.de>; Wed, 28 Jun 2023 07:56:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687931795;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ATC5nJStH46N7GJMHYhFlfeIbOWlw02vM7atAzBob0s=;
	b=gwWwiIVspSw9BD1hlw47nj91gf2lE2EkhiMCtShV6t5hSdA0UkVpyFwlpKbzKy8eQTV03w
	d9bWLr8yFyEAK8iDfZ1vNQJM1zJnJr7gz9etSbWb28AOauq/v6xXnfHJGGISlYb0kbVG4L
	TYPx8+lvoeSFKnwIVx/9pgZBnKiPoGE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-CzxC2kMbNo-AALYwX4AeBg-1; Wed, 28 Jun 2023 01:56:33 -0400
X-MC-Unique: CzxC2kMbNo-AALYwX4AeBg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 31EAD185A794;
	Wed, 28 Jun 2023 05:56:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 169F4F5CD3;
	Wed, 28 Jun 2023 05:56:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2087619452C7;
	Wed, 28 Jun 2023 05:56:01 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 08E3C1946588
 for <dm-devel@listman.corp.redhat.com>; Wed, 28 Jun 2023 05:55:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9067A111F3BB; Wed, 28 Jun 2023 05:55:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 88431111F3B6
 for <dm-devel@redhat.com>; Wed, 28 Jun 2023 05:55:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6835A3804501
 for <dm-devel@redhat.com>; Wed, 28 Jun 2023 05:55:38 +0000 (UTC)
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-315-1lDd9EodPhmSWHwcojUKuw-1; Wed, 28 Jun 2023 01:55:36 -0400
X-MC-Unique: 1lDd9EodPhmSWHwcojUKuw-1
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20230628055533epoutp0447eb1f0132a61724c5a096f2440ff707~svPgA0tw81209212092epoutp04Q
 for <dm-devel@redhat.com>; Wed, 28 Jun 2023 05:55:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20230628055533epoutp0447eb1f0132a61724c5a096f2440ff707~svPgA0tw81209212092epoutp04Q
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTP id
 20230628055533epcas5p1d90ddefd97c5688b187733ddf5dbebeb~svPfb10Ik0262002620epcas5p1t;
 Wed, 28 Jun 2023 05:55:33 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.175]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4QrW5b19Byz4x9Pr; Wed, 28 Jun
 2023 05:55:31 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 83.8E.06099.35BCB946; Wed, 28 Jun 2023 14:55:31 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20230627184029epcas5p49a29676fa6dff5f24ddfa5c64e525a51~smCF5to6h2352723527epcas5p4f;
 Tue, 27 Jun 2023 18:40:29 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230627184029epsmtrp181d40cfb5c679e112af496bbca418575~smCF4W4OK1856518565epsmtrp1O;
 Tue, 27 Jun 2023 18:40:29 +0000 (GMT)
X-AuditID: b6c32a4b-d308d700000017d3-c3-649bcb53888e
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
 C8.FC.64355.D1D2B946; Wed, 28 Jun 2023 03:40:29 +0900 (KST)
Received: from green245.sa.corp.samsungelectronics.net (unknown
 [107.99.41.245]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20230627184025epsmtip2fcb01f93c33488654abdf69187defb4a~smCCLPPCC0374003740epsmtip2m;
 Tue, 27 Jun 2023 18:40:25 +0000 (GMT)
From: Nitesh Shetty <nj.shetty@samsung.com>
To: Jens Axboe <axboe@kernel.dk>, Jonathan Corbet <corbet@lwn.net>, Alasdair
 Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 dm-devel@redhat.com, Keith Busch <kbusch@kernel.org>, Christoph Hellwig
 <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni
 <kch@nvidia.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian
 Brauner <brauner@kernel.org>
Date: Wed, 28 Jun 2023 00:06:18 +0530
Message-Id: <20230627183629.26571-5-nj.shetty@samsung.com>
In-Reply-To: <20230627183629.26571-1-nj.shetty@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01TbUxTVxjOubctF5Xu8qXHDgercxsYoJVSDgpzGWZcByYMli1TF2zoTUFK
 27WAE5dZvlkVUHAyChEmupXiioAaEBACCAJBwviSgg60RIXJh4MMh8Iohem/53nO+5z3fd6T
 Q+B2OisOESWLpZUykZTL2sC40ez6oXtYZ4GYpy5novKOVhwlnXmFo7L72Sw02fwcoPMzL3Bk
 akwHqNfERqMNe1H9VAETDTXWYKjuYg6GSstuYyinaQCg8X4thuqNO9EvaZcYqK6+nYF6bxay
 UNGv41bo1GA1C/3WtoShptxkDFWbEgG6sViEI8PkNAPdMb6Nul+1MdHiQiHrYyeqty+IqtHe
 t6K6H1QwqCqdG9XbFUdV6n9kUVWXTlK1Q2oWVZKVy6Qyk6dY1Oy4kUFN3+pnUVnX9ICq6jxB
 /V35DlVpeoaFkAej/SJpkZhWutCyCLk4Sibx5waFhQeEewt5fHe+L/LhushEMbQ/d19wiPun
 UdKV7XBd4kXSuBUpRKRScT0/8lPK42Jpl0i5KtafSyvEUoVA4aESxajiZBIPGR27m8/j7fJe
 KTwSHanpz8QUSzu+++NiEq4GQ84aYE1AUgDVram4Bmwg7MhaAJunLjAs5DmAmmfzr0niqNFq
 3TLxpI5pOagBcKzMTKxXSCoGizNsNYAgWORO2LlMmGscSDUOr9aWADPByTYcts4m4maDPfkN
 vGyYWzUzyB3w39nZVd2G3A3T7uQzzRdB0hNm/2lrlq3JPbC2u4VpKbGF7fkmhhnjpDNMvl6w
 mgGSzdawuGeYZZl0H1T/ngcs2B5OtF1bS8CBT7PT1vAxWHpOx7KYUwDUDmrXDHthakc2bh4C
 J11h+U1Pi7wN/tRhwCyN2TBz0YRZdBtYfWEdb4dXyovXZtgKB/5JXMMUfHrqHrBsLgvA/O5b
 VmeAi/aNQNo3Amlfty4GuB5spRWqGAmt8lZ4yehj/z9zhDymEqx+GbegavBwdMajCWAEaAKQ
 wLkONpsX8sR2NmLR8QRaKQ9XxklpVRPwXln4WZzjGCFf+XOy2HC+wJcnEAqFAl8vIZ+7xaZn
 MFNsR0pEsXQ0TSto5boPI6w5aiw4YcG+vym0Zf7lloRlr8Ann2QKeBzDdXGE1JBqbxzLHps0
 +Ax4O+TOuw+e7+l2GjkJ0i8fYYKYjE0OeypaSrt4R68M47r9Gs2hqasv84b18yOR9zbP8OPj
 9cRXj3WSLlXcHLvixaGqDF25Y0Nowed94ZtqGpNT/MWn7Z6++5D9aHnjCfnB96jFktrtd0dK
 A4ZSpw98MdywpIEOgerks8KUsI2pc3pcMSkhcpz1HId0U+jhR7drAxz9jN9GPBh3Ot74mG08
 4Np77u5fPwT3pH9NqxxDds0FSqeWB49GK78c2l8oCv6AkFTOVnzG/vl9d5/Ct6jD37cntW7r
 Qz2NE0VLNJehihTx3XClSvQfp93ZwLsEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02Re1BMYRjG5zvn7OnUWE5b8VGKda1GyWA+oZhxOTSGMQajho72TBdddnZF
 yWVr3XYbakTU5pZkKzRd1Fab2JbKbVGL1nXG7qSilQyRDZvM9N9vnt/zPv+8FC54TkygouN3
 cpJ4NlZIOhFVjUKvWRNnqUSzOxt9Uem9uzhKy7ThqOR1Bom6G78AlP35B47Mt44A1Goejd41
 BKP6HhUPtd+qwZA2/wSGikruYOiE7hlAFmMuhupNvuji4QICaetbCNRam0ei84UWB5T+XEOi
 K02DGNJlyTGkMacCVDVwHkfXu60Eaja5I4OtiYcG+vPIJR5Ma1sIU5P72oExvCkjmAq1D9P6
 MJEpL1aQTEXBAaauXUYyl45n8Zhj8h6S6bWYCMZ600gyxyuLAVNxP4XpK/dkys2fsHX0FqdF
 Ii42ehcn8Q8Kd4pSGo9h4sFpSU/z03AZaPdSAkcK0nNh1wctTwmcKAFdDaDhlRX/J8bDQpt+
 mF1g0WCHg50FtByDBbIDSkBRJO0L7/+m7LeutBKHipoewt7B6Zc4zHnoYWcXOhS+u/CItDNB
 T4M/e3uHNvl0IDzcnMOz70DaH2a8dbbHjvRCWGfQD8WCvxVr07p/bWfYkmMeXveC8hsqPBPQ
 uSNU7gh1AWDFwI0TS+Mi4yLEAX5SNk6aGB/pF5EQVw6Gfu+zXgMKS21+OoBRQAcghQtd+WP7
 T4sEfBGbvIeTJGyTJMZyUh1wpwjhOP6UWIVIQEeyO7kdHCfmJP8tRjlOkGFBXRV1i1w4g043
 v6AtfP9v9w/OHW76o6YOSbPJ+1RCLS/CmIlXvdhUZvZoyuu1PE4+Z6wOS92Y5IEm53teebNJ
 bMFiWka9LJJdTZvXOcPqXRP4cfBy0EJbmOLgmsXfUkLw0H2d6Qe7QfT8LwE23yO1feEN7JMB
 9erKjLXsA8XiUrXr9S61v9ed0LKkHSrxtVVPVd/fXx3InLpBMr3s1NYf36N2hSzQp2Tzl9/c
 qE1d8dXsZpAHHzo5Q2prKVoxKSpi6Vm9oe129i9r4+UNbP5Zt4ZLm1/Nfqa2FJ6ZCcceFcRk
 4VOTZ55e4qzpX7lbq9Fj/lWOJWNits9Ztlcd+CLY0jdXSEij2AAfXCJl/wBrsHDkagMAAA==
X-CMS-MailID: 20230627184029epcas5p49a29676fa6dff5f24ddfa5c64e525a51
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230627184029epcas5p49a29676fa6dff5f24ddfa5c64e525a51
References: <20230627183629.26571-1-nj.shetty@samsung.com>
 <CGME20230627184029epcas5p49a29676fa6dff5f24ddfa5c64e525a51@epcas5p4.samsung.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [dm-devel] [PATCH v13 4/9] fs,
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
index 09e0d5d51d03..7d8e09a99254 100644
--- a/block/blk-lib.c
+++ b/block/blk-lib.c
@@ -473,6 +473,32 @@ ssize_t blkdev_copy_offload(
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
index a286bf3325c5..a1576304f269 100644
--- a/block/fops.c
+++ b/block/fops.c
@@ -621,6 +621,25 @@ static ssize_t blkdev_read_iter(struct kiocb *iocb, struct iov_iter *to)
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
@@ -714,6 +733,7 @@ const struct file_operations def_blk_fops = {
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
index c176bf6173c5..850168cad080 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1047,6 +1047,10 @@ ssize_t blkdev_copy_offload(
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

