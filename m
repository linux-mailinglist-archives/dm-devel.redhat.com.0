Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 97668511697
	for <lists+dm-devel@lfdr.de>; Wed, 27 Apr 2022 14:15:33 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-311-ivGhztoyNZK85FJ3Kd9UwQ-1; Wed, 27 Apr 2022 08:15:31 -0400
X-MC-Unique: ivGhztoyNZK85FJ3Kd9UwQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 942DB3C0E19F;
	Wed, 27 Apr 2022 12:15:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 39AEB111D3CF;
	Wed, 27 Apr 2022 12:15:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D5A901947042;
	Wed, 27 Apr 2022 12:15:17 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C201E1947BBE
 for <dm-devel@listman.corp.redhat.com>; Tue, 26 Apr 2022 12:15:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B270B468A44; Tue, 26 Apr 2022 12:15:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE21F4679EE
 for <dm-devel@redhat.com>; Tue, 26 Apr 2022 12:15:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 926B7381D8BB
 for <dm-devel@redhat.com>; Tue, 26 Apr 2022 12:15:58 +0000 (UTC)
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-294-l2C25_rvNOavZ5L5uiqSnw-1; Tue, 26 Apr 2022 08:15:54 -0400
X-MC-Unique: l2C25_rvNOavZ5L5uiqSnw-1
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20220426121551epoutp04f35c1f556ef3533f1e480850be0b488a~pcVWuKQQl2393923939epoutp04t;
 Tue, 26 Apr 2022 12:15:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20220426121551epoutp04f35c1f556ef3533f1e480850be0b488a~pcVWuKQQl2393923939epoutp04t
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTP id
 20220426121550epcas5p45d4f028970d166726a1fe0bc79253a92~pcVV6ylFb0477704777epcas5p4f;
 Tue, 26 Apr 2022 12:15:50 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.179]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4Kngns3Xpfz4x9Pv; Tue, 26 Apr
 2022 12:15:45 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 B8.33.10063.172E7626; Tue, 26 Apr 2022 21:15:45 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
 20220426102042epcas5p201aa0d9143d7bc650ae7858383b69288~paw0RoFuv0811508115epcas5p2r;
 Tue, 26 Apr 2022 10:20:42 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220426102042epsmtrp289cd93d9b6a7708cb4c090ec40bd3351~paw0QFI-I1443114431epsmtrp2j;
 Tue, 26 Apr 2022 10:20:42 +0000 (GMT)
X-AuditID: b6c32a49-4cbff7000000274f-0d-6267e271bfff
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 A5.DA.08924.A77C7626; Tue, 26 Apr 2022 19:20:42 +0900 (KST)
Received: from test-zns.sa.corp.samsungelectronics.net (unknown
 [107.110.206.5]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20220426102036epsmtip1a53597986c8ac116a03cc60b915b16b8~pawunNcb80427604276epsmtip1D;
 Tue, 26 Apr 2022 10:20:36 +0000 (GMT)
From: Nitesh Shetty <nj.shetty@samsung.com>
To: 
Date: Tue, 26 Apr 2022 15:42:38 +0530
Message-Id: <20220426101241.30100-11-nj.shetty@samsung.com>
In-Reply-To: <20220426101241.30100-1-nj.shetty@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01TaVBbZRTlLXkJzMA8UiofUKf4aMsAskQBPwqUduyU10WL2rGCtZjCIzBA
 EhNibUcHKEUttKXQlomBaSikIq0sssmSoIIQCbJUFgFliYWq4LAUhqVsEhK0/86ce86999xv
 Pg7GbWPbc2KECYxEyI+jCAu8usnF2f2DPwTnvIr6bWCprgWD6oE5FnwwlEHA7JllDE7/8IgF
 szLkbLjS3onB7jErqJnKYcGupWQUPirfQOHA97UoVOdnobDoQTMK/ywsQGD93VkUrup5UD8/
 iMOsxj4EjvcqUKgZdINqTSsOu+tyCaj8cpwN03+tIWDDpAaDhdp1FHYoVgmYqa1gwZqxZAQ2
 DffisGRyGoc/DTrA1KvLbNi5pmUddKK7e47TipF2gs5MmWLTtYohNt05/A1Od7fL6PL7Vwi6
 QpVI3+wvROj6gSSCvvRzM0bLn8wT9LWUKYKuTR1h0bPjgzg93dBLhNiGxQZEM/xIRuLICCNE
 kTFCQSB1/K3wV8N9fL147jw/+ArlKOTHM4HU4RMh7kdi4jZvSDl+yI+TbVIhfKmU8jwQIBHJ
 EhjHaJE0IZBixJFxYm+xh5QfL5UJBR5CJmE/z8vrJZ9N4fux0QtqJSbeOPaRaqiFnYQ8DUhD
 zDmA9Abqlk48DbHgcMl6BMz3PWYbClzyCQJ0GcHGwhwC6tVyYttxJ12JGgt1CFDJk032VBTM
 5qZjaQiHQ5BuoG2DYzDYkDgoWlzc0mCklg06hpVbmh1kMEidDjZocHIvyB+vQw3YkvQHlRO9
 hEECSE+QMWJtoM036XvNUyaJNWj9Ygw3YIzcDVKqcjBDe0Cum4O1pUHcuOhh0Nb9C9uId4AJ
 baUJ24O5KY0pzHnw7ad5qNF8GQFpOp3JHAQeqtdQwxIY6QJK6zyN9PPgtq4ENQ62AtdWxlAj
 bwlq7mxjJ/B1aZ6pvx3oW0w2ZaHBzRHT3a4joEL+HesG4qh4Jo/imTyK/yfnIdh9xI4RS+MF
 jNRHzBMy5/974whRfDmy9atcj9YgQ6MzHo0IykEaEcDBKBvL23ujznEtI/kXLjISUbhEFsdI
 GxGfzXtnYvY7I0Sb31KYEM7z9vPy9vX19fZ72ZdH2Vq2Ccr4XFLAT2BiGUbMSLZ9KMfcPgml
 eHYWew5q94jetKrSZ5Q9LW8o8J0PclCWY6LsfQ0nLtCpJeVBjwtcS2bD5OyPzZaeY1X/GHT6
 4ap5oyJFll+UODlxeqi3SE6NFXOjRhc2OgYEHT1Wbv98PuNyZeeB0TrV/iidgyyt6o2z2Xoc
 63p7punvjurQLo9Z/9XQyrjduSfffb3ZQ5d/fZnSnCJCnZNGVN32v5k5a17wqp/+69BVkDio
 dH4vtOLwVG5smtasc7361hnl5RcXw0qie7POqvvjGX3xjVqXhnt67i5rcOmdr/wX8mcXPps4
 Vpx31N9h7eKtldBT5MlDZZ3moT37dinsUj9xyrmb3Op/5jXbcEZj8buKReHSaD7PFZNI+f8C
 1ZDWMN4EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0xbZRyHfc85PT2AdIcyxwsYiMUZhQAy2fJXkHgh42QkBKPZJmZCtx07
 5Nb0FMb4MIGGGFscl0VlZQ5kjKvOUDotrGVbKTBUZKRWRxNaCRDQJe26jTE2Ltqhyb49+T3P
 xx9DSqtEEUx+sZpXFcsLZXQg9cOwLCq+Ykxx+GXDCA3f/zRKgnn6rgh6Z+po+PL2Kgnea3Mi
 aKxrEsOjiUkS7PMSsHiaRXDjQRUBc4ZNAqavDhBgbmskoLt3hIDFzvMILn/jI2BtNglm7zkp
 aLT+jmDBoSfA4owDs2WcAvvgWRpaOhbEoPvDRMPQLQsJnWMbBPyqX6OhYaxfBKb5KgTDLgcF
 F295KbjujISa2lUxTK6Pid6I4ey/ZXJ69wTNNWg8Ym5APyPmJl19FGefKOUMPZ/RXH/7J9zp
 m52IuzxdSXPVv4yQXNOdezT3ucZDcwM1bhHnW3BSnHfIQWeH5QSmHuUL88t4VWJaXuCx++YW
 Urm5r7x9ZlRciR6malEAg9lkfE7XQmhRICNlTQjbfNXklgjHHeu2/zgUd28sirciDYH/ql5H
 WsQwNBuHf95k/M12lsLdKyuUvyFZrxi7Ll153ISyGbjGm+FvKHYnblsYJPwczKZg498O2p9g
 NhHXuUP8c8C/84URD+Gfpexr+Oaj8q06BI+fmaf8TLLRWHOpmaxHrP4JpX9CtSKiB4XzSqFI
 USQkKXcV88cTBHmRUFqsSDhSUmRAj18SG2tC5p7bCVZEMMiKMEPKtgd/sfOjw9Lgo/ITFbyq
 JFdVWsgLVhTJULKw4Bva8Vwpq5Cr+QKeV/Kq/y3BBERUEh0fprd/nSrKyGmm1Ceidy8HWc7E
 tkztD3sozzr9VJbv02uz2xL4/gOSV9aSrYb5ko+9cwVDatuztS/saEjLDBjYdc6z/DS5Nz27
 QrIculRW8OaPte8Mcs/vWYnLe+a6zn5qT3T9sC4lf2rwW1eE0UVGdTXp0t96nZAoR7uC4tts
 q/qyu+6TXZlLkRsNuYkxTUfwDqP2vcYrh1b6LsQw4VPPHdyW20hr4uD9g2siEr/oMxiTXYYo
 88l9IYv4fN+BoJL6kAcp7t680GxBkvFqTunbG87v/nzXbsnau/t+kOmOML60aVR3XBTSyuNb
 K/Nfsp1t/SpJUnX8g1O25UMOxf6IqzJKOCZPiiVVgvwf4mBy4ZQDAAA=
X-CMS-MailID: 20220426102042epcas5p201aa0d9143d7bc650ae7858383b69288
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220426102042epcas5p201aa0d9143d7bc650ae7858383b69288
References: <20220426101241.30100-1-nj.shetty@samsung.com>
 <CGME20220426102042epcas5p201aa0d9143d7bc650ae7858383b69288@epcas5p2.samsung.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-Mailman-Approved-At: Wed, 27 Apr 2022 12:14:17 +0000
Subject: [dm-devel] [PATCH v4 10/10] fs: add support for copy file range in
 zonefs
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
Cc: djwong@kernel.org, linux-nvme@lists.infradead.org, clm@fb.com,
 dm-devel@redhat.com, osandov@fb.com, Alasdair Kergon <agk@redhat.com>,
 Naohiro Aota <naohiro.aota@wdc.com>, msnitzer@redhat.com, bvanassche@acm.org,
 linux-scsi@vger.kernel.org, gost.dev@samsung.com, nitheshshetty@gmail.com,
 James Smart <james.smart@broadcom.com>, hch@lst.de, chaitanyak@nvidia.com,
 Chaitanya Kulkarni <kch@nvidia.com>, Mike Snitzer <snitzer@kernel.org>,
 josef@toxicpanda.com, linux-block@vger.kernel.org, dsterba@suse.com,
 kbusch@kernel.org, Frederick.Knight@netapp.com,
 Sagi Grimberg <sagi@grimberg.me>, axboe@kernel.dk,
 Johannes Thumshirn <jth@kernel.org>, tytso@mit.edu, martin.petersen@oracle.com,
 linux-kernel@vger.kernel.org, Arnav Dawn <arnav.dawn@samsung.com>,
 jack@suse.com, linux-fsdevel@vger.kernel.org,
 lsf-pc@lists.linux-foundation.org,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Arnav Dawn <arnav.dawn@samsung.com>

copy_file_range is implemented using copy offload,
copy offloading to device is always enabled.
To disable copy offloading mount with "no_copy_offload" mount option.
At present copy offload is only used, if the source and destination files
are on same block device, otherwise copy file range is completed by
generic copy file range.

copy file range implemented as following:
	- write pending writes on the src and dest files
	- drop page cache for dest file if its conv zone
	- copy the range using offload
	- update dest file info

For all failure cases we fallback to generic file copy range
At present this implementation does not support conv aggregation

Signed-off-by: Arnav Dawn <arnav.dawn@samsung.com>
---
 fs/zonefs/super.c  | 178 ++++++++++++++++++++++++++++++++++++++++++++-
 fs/zonefs/zonefs.h |   1 +
 2 files changed, 178 insertions(+), 1 deletion(-)

diff --git a/fs/zonefs/super.c b/fs/zonefs/super.c
index b3b0b71fdf6c..60563b592bf2 100644
--- a/fs/zonefs/super.c
+++ b/fs/zonefs/super.c
@@ -901,6 +901,7 @@ static ssize_t zonefs_file_dio_write(struct kiocb *iocb, struct iov_iter *from)
 	else
 		ret = iomap_dio_rw(iocb, from, &zonefs_iomap_ops,
 				   &zonefs_write_dio_ops, 0, 0);
+
 	if (zi->i_ztype == ZONEFS_ZTYPE_SEQ &&
 	    (ret > 0 || ret == -EIOCBQUEUED)) {
 		if (ret > 0)
@@ -1189,6 +1190,171 @@ static int zonefs_file_release(struct inode *inode, struct file *file)
 	return 0;
 }
 
+static int zonefs_is_file_size_ok(struct inode *src_inode, struct inode *dst_inode,
+			   loff_t src_off, loff_t dst_off, size_t len)
+{
+	loff_t size, endoff;
+
+	size = i_size_read(src_inode);
+	/* Don't copy beyond source file EOF. */
+	if (src_off + len > size) {
+		zonefs_err(src_inode->i_sb, "Copy beyond EOF (%llu + %zu > %llu)\n",
+		     src_off, len, size);
+		return -EOPNOTSUPP;
+	}
+
+	endoff = dst_off + len;
+	if (inode_newsize_ok(dst_inode, endoff))
+		return -EOPNOTSUPP;
+
+
+	return 0;
+}
+static ssize_t __zonefs_send_copy(struct zonefs_inode_info *src_zi, loff_t src_off,
+				struct zonefs_inode_info *dst_zi, loff_t dst_off, size_t len)
+{
+	struct block_device *src_bdev = src_zi->i_vnode.i_sb->s_bdev;
+	struct block_device *dst_bdev = dst_zi->i_vnode.i_sb->s_bdev;
+	struct range_entry *rlist;
+	int ret = -EIO;
+
+	rlist = kmalloc(sizeof(*rlist), GFP_KERNEL);
+	rlist[0].dst = (dst_zi->i_zsector << SECTOR_SHIFT) + dst_off;
+	rlist[0].src = (src_zi->i_zsector << SECTOR_SHIFT) + src_off;
+	rlist[0].len = len;
+	rlist[0].comp_len = 0;
+	ret = blkdev_issue_copy(src_bdev, 1, rlist, dst_bdev, GFP_KERNEL);
+	if (ret) {
+		if (rlist[0].comp_len != len) {
+			ret = rlist[0].comp_len;
+			kfree(rlist);
+			return ret;
+		}
+	}
+	kfree(rlist);
+	return len;
+}
+static ssize_t __zonefs_copy_file_range(struct file *src_file, loff_t src_off,
+				      struct file *dst_file, loff_t dst_off,
+				      size_t len, unsigned int flags)
+{
+	struct inode *src_inode = file_inode(src_file);
+	struct inode *dst_inode = file_inode(dst_file);
+	struct zonefs_inode_info *src_zi = ZONEFS_I(src_inode);
+	struct zonefs_inode_info *dst_zi = ZONEFS_I(dst_inode);
+	struct block_device *src_bdev = src_inode->i_sb->s_bdev;
+	struct block_device *dst_bdev = dst_inode->i_sb->s_bdev;
+	struct super_block *src_sb = src_inode->i_sb;
+	struct zonefs_sb_info *src_sbi = ZONEFS_SB(src_sb);
+	struct super_block *dst_sb = dst_inode->i_sb;
+	struct zonefs_sb_info *dst_sbi = ZONEFS_SB(dst_sb);
+	ssize_t ret = -EIO, bytes;
+
+	if (src_bdev != dst_bdev) {
+		zonefs_err(src_sb, "Copying files across two devices\n");
+			return -EXDEV;
+	}
+
+	/*
+	 * Some of the checks below will return -EOPNOTSUPP,
+	 * which will force a generic copy
+	 */
+
+	if (!(src_sbi->s_mount_opts & ZONEFS_MNTOPT_COPY_FILE)
+		|| !(dst_sbi->s_mount_opts & ZONEFS_MNTOPT_COPY_FILE))
+		return -EOPNOTSUPP;
+
+	/* Start by sync'ing the source and destination files ifor conv zones */
+	if (src_zi->i_ztype == ZONEFS_ZTYPE_CNV) {
+		ret = file_write_and_wait_range(src_file, src_off, (src_off + len));
+		if (ret < 0) {
+			zonefs_err(src_sb, "failed to write source file (%zd)\n", ret);
+			goto out;
+		}
+	}
+	if (dst_zi->i_ztype == ZONEFS_ZTYPE_CNV) {
+		ret = file_write_and_wait_range(dst_file, dst_off, (dst_off + len));
+		if (ret < 0) {
+			zonefs_err(dst_sb, "failed to write destination file (%zd)\n", ret);
+			goto out;
+		}
+	}
+	mutex_lock(&dst_zi->i_truncate_mutex);
+	if (len > dst_zi->i_max_size - dst_zi->i_wpoffset) {
+		/* Adjust length */
+		len -= dst_zi->i_max_size - dst_zi->i_wpoffset;
+		if (len <= 0) {
+			mutex_unlock(&dst_zi->i_truncate_mutex);
+			return -EOPNOTSUPP;
+		}
+	}
+	if (dst_off != dst_zi->i_wpoffset) {
+		mutex_unlock(&dst_zi->i_truncate_mutex);
+		return -EOPNOTSUPP; /* copy not at zone write ptr */
+	}
+	mutex_lock(&src_zi->i_truncate_mutex);
+	ret = zonefs_is_file_size_ok(src_inode, dst_inode, src_off, dst_off, len);
+	if (ret < 0) {
+		mutex_unlock(&src_zi->i_truncate_mutex);
+		mutex_unlock(&dst_zi->i_truncate_mutex);
+		goto out;
+	}
+	mutex_unlock(&src_zi->i_truncate_mutex);
+
+	/* Drop dst file cached pages for a conv zone*/
+	if (dst_zi->i_ztype == ZONEFS_ZTYPE_CNV) {
+		ret = invalidate_inode_pages2_range(dst_inode->i_mapping,
+						    dst_off >> PAGE_SHIFT,
+						    (dst_off + len) >> PAGE_SHIFT);
+		if (ret < 0) {
+			zonefs_err(dst_sb, "Failed to invalidate inode pages (%zd)\n", ret);
+			ret = 0;
+		}
+	}
+	bytes = __zonefs_send_copy(src_zi, src_off, dst_zi, dst_off, len);
+	ret += bytes;
+
+	file_update_time(dst_file);
+	zonefs_update_stats(dst_inode, dst_off + bytes);
+	zonefs_i_size_write(dst_inode, dst_off + bytes);
+	dst_zi->i_wpoffset += bytes;
+	mutex_unlock(&dst_zi->i_truncate_mutex);
+
+
+
+	/*
+	 * if we still have some bytes left, do splice copy
+	 */
+	if (bytes && (bytes < len)) {
+		zonefs_info(src_sb, "Final partial copy of %zu bytes\n", len);
+		bytes = do_splice_direct(src_file, &src_off, dst_file,
+					 &dst_off, len, flags);
+		if (bytes > 0)
+			ret += bytes;
+		else
+			zonefs_info(src_sb, "Failed partial copy (%zd)\n", bytes);
+	}
+
+out:
+
+	return ret;
+}
+
+static ssize_t zonefs_copy_file_range(struct file *src_file, loff_t src_off,
+				    struct file *dst_file, loff_t dst_off,
+				    size_t len, unsigned int flags)
+{
+	ssize_t ret;
+
+	ret = __zonefs_copy_file_range(src_file, src_off, dst_file, dst_off,
+				     len, flags);
+
+	if (ret == -EOPNOTSUPP || ret == -EXDEV)
+		ret = generic_copy_file_range(src_file, src_off, dst_file,
+					      dst_off, len, flags);
+	return ret;
+}
+
 static const struct file_operations zonefs_file_operations = {
 	.open		= zonefs_file_open,
 	.release	= zonefs_file_release,
@@ -1200,6 +1366,7 @@ static const struct file_operations zonefs_file_operations = {
 	.splice_read	= generic_file_splice_read,
 	.splice_write	= iter_file_splice_write,
 	.iopoll		= iocb_bio_iopoll,
+	.copy_file_range = zonefs_copy_file_range,
 };
 
 static struct kmem_cache *zonefs_inode_cachep;
@@ -1262,7 +1429,7 @@ static int zonefs_statfs(struct dentry *dentry, struct kstatfs *buf)
 
 enum {
 	Opt_errors_ro, Opt_errors_zro, Opt_errors_zol, Opt_errors_repair,
-	Opt_explicit_open, Opt_err,
+	Opt_explicit_open, Opt_no_copy_offload, Opt_err,
 };
 
 static const match_table_t tokens = {
@@ -1271,6 +1438,7 @@ static const match_table_t tokens = {
 	{ Opt_errors_zol,	"errors=zone-offline"},
 	{ Opt_errors_repair,	"errors=repair"},
 	{ Opt_explicit_open,	"explicit-open" },
+	{ Opt_no_copy_offload,	"no_copy_offload" },
 	{ Opt_err,		NULL}
 };
 
@@ -1280,6 +1448,7 @@ static int zonefs_parse_options(struct super_block *sb, char *options)
 	substring_t args[MAX_OPT_ARGS];
 	char *p;
 
+	sbi->s_mount_opts |= ZONEFS_MNTOPT_COPY_FILE;
 	if (!options)
 		return 0;
 
@@ -1310,6 +1479,9 @@ static int zonefs_parse_options(struct super_block *sb, char *options)
 		case Opt_explicit_open:
 			sbi->s_mount_opts |= ZONEFS_MNTOPT_EXPLICIT_OPEN;
 			break;
+		case Opt_no_copy_offload:
+			sbi->s_mount_opts &= ~ZONEFS_MNTOPT_COPY_FILE;
+			break;
 		default:
 			return -EINVAL;
 		}
@@ -1330,6 +1502,8 @@ static int zonefs_show_options(struct seq_file *seq, struct dentry *root)
 		seq_puts(seq, ",errors=zone-offline");
 	if (sbi->s_mount_opts & ZONEFS_MNTOPT_ERRORS_REPAIR)
 		seq_puts(seq, ",errors=repair");
+	if (sbi->s_mount_opts & ZONEFS_MNTOPT_COPY_FILE)
+		seq_puts(seq, ",copy_offload");
 
 	return 0;
 }
@@ -1769,6 +1943,8 @@ static int zonefs_fill_super(struct super_block *sb, void *data, int silent)
 	atomic_set(&sbi->s_active_seq_files, 0);
 	sbi->s_max_active_seq_files = bdev_max_active_zones(sb->s_bdev);
 
+	/* set copy support by default */
+	sbi->s_mount_opts |= ZONEFS_MNTOPT_COPY_FILE;
 	ret = zonefs_read_super(sb);
 	if (ret)
 		return ret;
diff --git a/fs/zonefs/zonefs.h b/fs/zonefs/zonefs.h
index 4b3de66c3233..efa6632c4b6a 100644
--- a/fs/zonefs/zonefs.h
+++ b/fs/zonefs/zonefs.h
@@ -162,6 +162,7 @@ enum zonefs_features {
 	(ZONEFS_MNTOPT_ERRORS_RO | ZONEFS_MNTOPT_ERRORS_ZRO | \
 	 ZONEFS_MNTOPT_ERRORS_ZOL | ZONEFS_MNTOPT_ERRORS_REPAIR)
 #define ZONEFS_MNTOPT_EXPLICIT_OPEN	(1 << 4) /* Explicit open/close of zones on open/close */
+#define ZONEFS_MNTOPT_COPY_FILE		(1 << 5) /* enable copy file range offload to kernel */
 
 /*
  * In-memory Super block information.
-- 
2.35.1.500.gb896f729e2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

