Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AE51670C362
	for <lists+dm-devel@lfdr.de>; Mon, 22 May 2023 18:30:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684773003;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yduiWFpEWgF0Ir5v6l7Gu976eMQ9uL0OnHDI1BLJkfM=;
	b=bNKp/lhUu4VrFS9i5lr6OsPSyG5dRUXEgI7kG+ReicVfnGXwcOfK5YJwU7+BgYbmUWzTbS
	5vXbPjsuX5hvgPH1jWy83AurYeg2fJv52zoRUqQ+0QZNOBZdzPqPCzFjJvzPEJENA9sbKF
	leN/7tUPLnth554YgiqVwy+x3qAtSu8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-mKGwq5E9NviPI7vVQVw9Vg-1; Mon, 22 May 2023 12:29:33 -0400
X-MC-Unique: mKGwq5E9NviPI7vVQVw9Vg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C45E23C14114;
	Mon, 22 May 2023 16:29:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9E88C2166B27;
	Mon, 22 May 2023 16:29:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CF76919452D3;
	Mon, 22 May 2023 16:29:25 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C980F194658C
 for <dm-devel@listman.corp.redhat.com>; Mon, 22 May 2023 11:10:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AD6DB7C2A; Mon, 22 May 2023 11:10:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A58A47C52
 for <dm-devel@redhat.com>; Mon, 22 May 2023 11:10:46 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82E601C0A584
 for <dm-devel@redhat.com>; Mon, 22 May 2023 11:10:46 +0000 (UTC)
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-V_S-2C9MMH-K44OEBWTqeA-1; Mon, 22 May 2023 07:10:44 -0400
X-MC-Unique: V_S-2C9MMH-K44OEBWTqeA-1
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20230522111041epoutp0457f7c8919a38630f9d45dd2cd1121869~hcrFG7mIL1562815628epoutp04Y
 for <dm-devel@redhat.com>; Mon, 22 May 2023 11:10:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20230522111041epoutp0457f7c8919a38630f9d45dd2cd1121869~hcrFG7mIL1562815628epoutp04Y
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTP id
 20230522111040epcas5p398b8e98bf0206ff5cd5e529783610c34~hcrEbIqZc1165311653epcas5p35;
 Mon, 22 May 2023 11:10:40 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.183]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4QPvrG2BVwz4x9Px; Mon, 22 May
 2023 11:10:38 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 E3.39.16380.EAD4B646; Mon, 22 May 2023 20:10:38 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
 20230522104617epcas5p25ef0cfacfb4e2d4e8d7a0661f7181e7d~hcVyGEL0Q0438604386epcas5p2d;
 Mon, 22 May 2023 10:46:17 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230522104617epsmtrp28412315ea425dc05b2486615125c4a03~hcVyE4GGj3249732497epsmtrp2G;
 Mon, 22 May 2023 10:46:17 +0000 (GMT)
X-AuditID: b6c32a4b-56fff70000013ffc-f1-646b4daeecd1
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 F9.EF.28392.9F74B646; Mon, 22 May 2023 19:46:17 +0900 (KST)
Received: from green245.sa.corp.samsungelectronics.net (unknown
 [107.99.41.245]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20230522104613epsmtip2850c4d13d3f6f140a1f07f20cf27405b~hcVuSFeXT1863318633epsmtip2D;
 Mon, 22 May 2023 10:46:13 +0000 (GMT)
From: Nitesh Shetty <nj.shetty@samsung.com>
To: Jens Axboe <axboe@kernel.dk>, Alasdair Kergon <agk@redhat.com>, Mike
 Snitzer <snitzer@kernel.org>, dm-devel@redhat.com, Keith Busch
 <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg
 <sagi@grimberg.me>, James Smart <james.smart@broadcom.com>, Chaitanya
 Kulkarni <kch@nvidia.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, "Matthew Wilcox (Oracle)"
 <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>
Date: Mon, 22 May 2023 16:11:35 +0530
Message-Id: <20230522104146.2856-5-nj.shetty@samsung.com>
In-Reply-To: <20230522104146.2856-1-nj.shetty@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01TazBcZxj2nbN7dtFNT5Dx0SjZjCbu1q2f1CaUdk5HTbWZTttMRLe7Jyh2
 t7skojONS9WILLopE8tI0mTcVlyWqttiFnWpUJQ0Oi7NrE41LGEiySiKpc2/53ne933eyzcf
 G7doYNmyY8QJtEwsiOMSZozGLqdjbtVhsSJPVRsH1Qz8hKPimioCpeVt4Eg9lUugR10rABUs
 P8fRbMcppDUUMdGDzmYMtX2vxFCFugdDdbls1HrrMYZ6thYJpNRNADQ3rsKQdtIFtWn7GWis
 pZhA01VbTHSjdI6Fsu83EaisdxNDumvpGGrSpwLUuH4DR9WPlhiob/IVNLzRy0Trz4qJwFep
 sV9DKdXMPYJqVk2xqOHpOgZVoBwgqPpyZ2rsXiKlqcwiKM2KkkX1XV9nUPV3LlOtD1IISpFu
 IKjHc5MMaql9nKByGipBuOWZ2IBoWiCiZQ60WCgRxYij+NzQ05HBkb5+njw3nj96nesgFsTT
 fG7Iu+Fub8fEbV+K63BBEJe4LYUL5HKux8kAmSQxgXaIlsgT+FxaKoqT+kjd5YJ4eaI4yl1M
 J5zgeXp6+W4nfhobPZBazJCO+yZ1tv/BTAGFrleAKRuSPvC3glvYFWDGtiBbAczZULKMZAVA
 /WYZYSSrABanrDP2S9b+adsLtACouXp3j2RgcEnRuJ3FZhOkC/x5i72jW5F6HC62LOA7BCd7
 cZhX2o/vWFmSEXB0MQPsYAbpCHsKZnd1DukPR7uXdo0g6QFzZw7uyKbkCfjXiGov5SDsL9Tv
 ToST9jD9h6Jdf0hOmsLV9hVgrA2BPfX2xqkt4d+9DSwjtoWrBi1hxBdhxXflhLH2awBV91XA
 GDgFMwZy8R0fnHSCNS0eRtkO5g9UY8a+B6BiXY8ZdQ5sKtnHR2FVzc09fxs48TR1D1OwTzPN
 MB5LAWDmjIKVBxxUL+yjemEf1f+tbwK8EtjQUnl8FC33lXqL6Yv/PbNQEq8Bu9/HObQJPJxd
 dtcBjA10ALJxrhXn/RyhyIIjElxKpmWSSFliHC3XAd/te3+L2x4SSrb/nzghkufj7+nj5+fn
 4+/tx+Nac47x+4UWZJQggY6laSkt26/D2Ka2KRj/rWtpa3/KDGan1UFDJ5M2ztt6lj//+ID2
 sy8GDWGtgxqt48JHfKVJ/ptrNszjrz1VWrdwYq1yz3RFdGd/MzIhPJxp/mH32epu8fKqfd0H
 591DM1wM0meKhyUhwUcj3nC+/V6R6fGFvPzmzaagQr5W+KTWrjl0mDZYumbVmphYfJVcMmdt
 opkPTlo59wkl+GXmrvmR4frBw+pDPXfsGlwvq/svRKQVgMyRso4jT8TNl9S+AV63O+xTVySu
 Q0Ffcjp/f6eDFzhvEzrkbXK2OXmxvyT25XSPWn2gpc6cee76tNZJ2RT2+UulNd1TPwZ7F2Uj
 x9EsnrVSh+b9wr0q7LwFRJs5lyGPFvCccZlc8C8ddNtQxwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0xTZxjG951zOD00NjmWJv2QRJI6JVblUjv3bXGyJUv2kc0pJsuILtMG
 joBQLqeA1ynSZJcSC2sjWUsN0jhWi4EA2oCUyiqlhYZ0rAPXouAWGF5iCy4ZGARmYUv875ff
 87zPXy9DimepTUxhSQXHl6iKZbSQctyVJe968VFRXvrjv+SofXiQRJb2GzSqqV8mUeuDOho9
 vfscoIa5FyR6eCcT9UUa41Cov4dATquBQNdbPQTqqGNQb/M8gTyrz2hkcI8DNDNmJlBfeAdy
 9g1RKHjbQqPJG6txqKllRoBq73XT6CfvCoHcRi2BuqcvAuRYaiJR29MohXzhJBRY9sahpUUL
 /f5mHPztY2yeGqFxj/mBAAcmOyjcYBimcZdNjoMjlbjT/h2NO58bBNj3wxKFu65dwL2hahpf
 0kZoPD8TpnDUNUZj/U07OJhwWLg3jysurOL4tH3HhAXDFy1U2dhbp/pdf8RVA9NOHYhnIKuE
 /7x00jEWs90ADujIdZ8IW5YH/uMEeH1lVqADwlcdLQGtrUFKBxiGZndA/yoT8xJ2joTtN60g
 dkCyEyR03MuJcQJ7BPrDfwtiTLFboafh4dqoiH0H/joQXduBbBqsm9oY0/Hsu/DRqJmMafGr
 Sn2LYr29EQ6Zpqn19WSovdVI1gPW/Fpkfi26Cgg7SOTKNOp8tSajTFHCnUzVqNSaypL81NxS
 dSdY+wW5vBs47XOpbkAwwA0gQ8okomx9bp5YlKc6fYbjS4/ylcWcxg2SGEomFf2iGzoqZvNV
 FVwRx5Vx/P8pwcRvqiYO9Ewabf4N58vn+dqklS3SmjesjjOskl7I6mFMRc2PqJlGsVZ+bdW1
 +6uXad+/Nz34pPCT1IqmrqWOzy7nBEb3R7K+JU9OLIo+lIx+uWhDy3p+5EQmilwgoumB8wJT
 RnRXq14ycdVn2/NnVQ7l+kD0xW1925vjxwz54UsCn10sDVUVKL2GbYla3jvuwSm9Fn63Ybz6
 5wXhlrZtpb+n79++/f6ROhuQHDgVUO/NjViFYt/btSltidIhqbffmZVdvi+4efbxNyfOGkPN
 5c8yj2fbHIOmK6WKz5PNY4WXPSn+Q17FcWWoyMhOuYyKuXOOGl/gx4KvN3y6oJT7t6bJKE2B
 KkNO8hrVv4+iC4d6AwAA
X-CMS-MailID: 20230522104617epcas5p25ef0cfacfb4e2d4e8d7a0661f7181e7d
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230522104617epcas5p25ef0cfacfb4e2d4e8d7a0661f7181e7d
References: <20230522104146.2856-1-nj.shetty@samsung.com>
 <CGME20230522104617epcas5p25ef0cfacfb4e2d4e8d7a0661f7181e7d@epcas5p2.samsung.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mailman-Approved-At: Mon, 22 May 2023 16:29:19 +0000
Subject: [dm-devel] [PATCH v11 4/9] fs,
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
Cc: linux-block@vger.kernel.org, martin.petersen@oracle.com,
 linux-scsi@vger.kernel.org, linux-mm@kvack.org, gost.dev@samsung.com,
 anuj20.g@samsung.com, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, ming.lei@redhat.com,
 James.Bottomley@HansenPartnership.com, linux-fsdevel@vger.kernel.org,
 dlemoal@kernel.org, Nitesh Shetty <nj.shetty@samsung.com>, joshi.k@samsung.com,
 nitheshshetty@gmail.com, bvanassche@acm.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
 block/blk-lib.c        | 23 +++++++++++++++++++++++
 block/fops.c           | 20 ++++++++++++++++++++
 fs/read_write.c        | 11 +++++++++--
 include/linux/blkdev.h |  3 +++
 mm/filemap.c           | 11 ++++++++---
 5 files changed, 63 insertions(+), 5 deletions(-)

diff --git a/block/blk-lib.c b/block/blk-lib.c
index ba32545eb8d5..7d6ef85692a6 100644
--- a/block/blk-lib.c
+++ b/block/blk-lib.c
@@ -523,6 +523,29 @@ int blkdev_issue_copy(struct block_device *bdev_in, loff_t pos_in,
 }
 EXPORT_SYMBOL_GPL(blkdev_issue_copy);
 
+/* Returns the length of bytes copied */
+int blkdev_copy_offload(struct block_device *bdev_in, loff_t pos_in,
+		      struct block_device *bdev_out, loff_t pos_out, size_t len,
+		      gfp_t gfp_mask)
+{
+	struct request_queue *in_q = bdev_get_queue(bdev_in);
+	struct request_queue *out_q = bdev_get_queue(bdev_out);
+	int ret = 0;
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
+EXPORT_SYMBOL_GPL(blkdev_copy_offload);
+
 static int __blkdev_issue_write_zeroes(struct block_device *bdev,
 		sector_t sector, sector_t nr_sects, gfp_t gfp_mask,
 		struct bio **biop, unsigned flags)
diff --git a/block/fops.c b/block/fops.c
index ab750e8a040f..df8985675ed1 100644
--- a/block/fops.c
+++ b/block/fops.c
@@ -614,6 +614,25 @@ static ssize_t blkdev_read_iter(struct kiocb *iocb, struct iov_iter *to)
 	return ret;
 }
 
+static ssize_t blkdev_copy_file_range(struct file *file_in, loff_t pos_in,
+				struct file *file_out, loff_t pos_out,
+				size_t len, unsigned int flags)
+{
+	struct block_device *in_bdev = I_BDEV(bdev_file_inode(file_in));
+	struct block_device *out_bdev = I_BDEV(bdev_file_inode(file_out));
+	int comp_len = 0;
+
+	if ((file_in->f_iocb_flags & IOCB_DIRECT) &&
+		(file_out->f_iocb_flags & IOCB_DIRECT))
+		comp_len = blkdev_copy_offload(in_bdev, pos_in, out_bdev,
+				 pos_out, len, GFP_KERNEL);
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
@@ -697,6 +716,7 @@ const struct file_operations def_blk_fops = {
 	.splice_read	= generic_file_splice_read,
 	.splice_write	= iter_file_splice_write,
 	.fallocate	= blkdev_fallocate,
+	.copy_file_range = blkdev_copy_file_range,
 };
 
 static __init int blkdev_init(void)
diff --git a/fs/read_write.c b/fs/read_write.c
index a21ba3be7dbe..47e848fcfd42 100644
--- a/fs/read_write.c
+++ b/fs/read_write.c
@@ -20,6 +20,7 @@
 #include <linux/compat.h>
 #include <linux/mount.h>
 #include <linux/fs.h>
+#include <linux/blkdev.h>
 #include "internal.h"
 
 #include <linux/uaccess.h>
@@ -1447,7 +1448,11 @@ static int generic_copy_file_checks(struct file *file_in, loff_t pos_in,
 		return -EOVERFLOW;
 
 	/* Shorten the copy to EOF */
-	size_in = i_size_read(inode_in);
+	if (S_ISBLK(inode_in->i_mode))
+		size_in = bdev_nr_bytes(I_BDEV(file_in->f_mapping->host));
+	else
+		size_in = i_size_read(inode_in);
+
 	if (pos_in >= size_in)
 		count = 0;
 	else
@@ -1708,7 +1713,9 @@ int generic_file_rw_checks(struct file *file_in, struct file *file_out)
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
index a95c26faa8b6..a9bb7e3a8c79 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1054,6 +1054,9 @@ int blkdev_issue_secure_erase(struct block_device *bdev, sector_t sector,
 int blkdev_issue_copy(struct block_device *bdev_in, loff_t pos_in,
 		      struct block_device *bdev_out, loff_t pos_out, size_t len,
 		      cio_iodone_t end_io, void *private, gfp_t gfp_mask);
+int blkdev_copy_offload(struct block_device *bdev_in, loff_t pos_in,
+		      struct block_device *bdev_out, loff_t pos_out, size_t len,
+		      gfp_t gfp_mask);
 struct bio *bio_map_kern(struct request_queue *q, void *data, unsigned int len,
 		gfp_t gfp_mask);
 void bio_map_kern_endio(struct bio *bio);
diff --git a/mm/filemap.c b/mm/filemap.c
index 570bc8c3db87..289f0c8229ec 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -48,6 +48,7 @@
 #include <asm/pgalloc.h>
 #include <asm/tlbflush.h>
 #include "internal.h"
+#include <linux/blkdev.h>
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/filemap.h>
@@ -2855,7 +2856,7 @@ ssize_t filemap_splice_read(struct file *in, loff_t *ppos,
 {
 	struct folio_batch fbatch;
 	struct kiocb iocb;
-	size_t total_spliced = 0, used, npages;
+	size_t total_spliced = 0, used, npages, size_in;
 	loff_t isize, end_offset;
 	bool writably_mapped;
 	int i, error = 0;
@@ -2863,6 +2864,10 @@ ssize_t filemap_splice_read(struct file *in, loff_t *ppos,
 	init_sync_kiocb(&iocb, in);
 	iocb.ki_pos = *ppos;
 
+	if (S_ISBLK(file_inode(in)->i_mode))
+		size_in = bdev_nr_bytes(I_BDEV(in->f_mapping->host));
+	else
+		size_in = i_size_read(file_inode(in));
 	/* Work out how much data we can actually add into the pipe */
 	used = pipe_occupancy(pipe->head, pipe->tail);
 	npages = max_t(ssize_t, pipe->max_usage - used, 0);
@@ -2873,7 +2878,7 @@ ssize_t filemap_splice_read(struct file *in, loff_t *ppos,
 	do {
 		cond_resched();
 
-		if (*ppos >= i_size_read(file_inode(in)))
+		if (*ppos >= size_in)
 			break;
 
 		iocb.ki_pos = *ppos;
@@ -2889,7 +2894,7 @@ ssize_t filemap_splice_read(struct file *in, loff_t *ppos,
 		 * part of the page is not copied back to userspace (unless
 		 * another truncate extends the file - this is desired though).
 		 */
-		isize = i_size_read(file_inode(in));
+		isize = size_in;
 		if (unlikely(*ppos >= isize))
 			break;
 		end_offset = min_t(loff_t, isize, *ppos + len);
-- 
2.35.1.500.gb896f729e2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

