Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 872DE528B1E
	for <lists+dm-devel@lfdr.de>; Mon, 16 May 2022 18:54:43 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-iglmVwUsPfe68OfGIt4-vQ-1; Mon, 16 May 2022 12:54:39 -0400
X-MC-Unique: iglmVwUsPfe68OfGIt4-vQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59A6B86B8B1;
	Mon, 16 May 2022 16:54:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 43002401E87;
	Mon, 16 May 2022 16:54:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1708F1947071;
	Mon, 16 May 2022 16:54:36 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7B495194704E
 for <dm-devel@listman.corp.redhat.com>; Mon, 16 May 2022 16:54:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7004C40CF8F5; Mon, 16 May 2022 16:54:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B05440CF8EA
 for <dm-devel@redhat.com>; Mon, 16 May 2022 16:54:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5069A80CDA6
 for <dm-devel@redhat.com>; Mon, 16 May 2022 16:54:34 +0000 (UTC)
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-NNn7Zm52OxC8SBy2uUFfUw-1; Mon, 16 May 2022 12:54:32 -0400
X-MC-Unique: NNn7Zm52OxC8SBy2uUFfUw-1
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20220516165431euoutp02138e2acf3dce0134b962be0925692176~vpCYKkegi2422624226euoutp025
 for <dm-devel@redhat.com>; Mon, 16 May 2022 16:54:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20220516165431euoutp02138e2acf3dce0134b962be0925692176~vpCYKkegi2422624226euoutp025
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220516165430eucas1p121f4df66d6ce57ba399426c27d51d7b1~vpCW2mLfQ3183531835eucas1p1U;
 Mon, 16 May 2022 16:54:30 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id F1.E6.10260.6C182826; Mon, 16
 May 2022 17:54:30 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220516165429eucas1p272c8b4325a488675f08f2d7016aa6230~vpCWbT6kq0201202012eucas1p2O;
 Mon, 16 May 2022 16:54:29 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220516165429eusmtrp199c722809802237e5a9f8a60f6f61fdf~vpCWaWz5_2961829618eusmtrp1O;
 Mon, 16 May 2022 16:54:29 +0000 (GMT)
X-AuditID: cbfec7f5-bf3ff70000002814-50-628281c6ce2b
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 10.99.09522.5C182826; Mon, 16
 May 2022 17:54:29 +0100 (BST)
Received: from localhost (unknown [106.210.248.7]) by eusmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20220516165429eusmtip21e540dfc6bbca12792d8c5e43ca34a89~vpCWHpK430678106781eusmtip2z;
 Mon, 16 May 2022 16:54:29 +0000 (GMT)
From: Pankaj Raghav <p.raghav@samsung.com>
To: axboe@kernel.dk, damien.lemoal@opensource.wdc.com, pankydev8@gmail.com,
 dsterba@suse.com, hch@lst.de
Date: Mon, 16 May 2022 18:54:11 +0200
Message-Id: <20220516165416.171196-9-p.raghav@samsung.com>
In-Reply-To: <20220516165416.171196-1-p.raghav@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOKsWRmVeSWpSXmKPExsWy7djPc7rHGpuSDBbOYbFYfbefzeL32fPM
 FnvfzWa1uPCjkcni5oGdTBYrVx9lsug58IHFYu8tbYtLj1ewW+zZe5LF4vKuOWwW85c9Zbf4
 vLSF3WLNzacsDnwe/06sYfPYOesuu8fls6Uem5fUe+y+2QAUab3P6vF+31U2j74tqxg91m+5
 yuLxeZNcAFcUl01Kak5mWWqRvl0CV8aTlz1sBb8UK9Y1LWVtYLwk1cXIySEhYCLx/t4jti5G
 Lg4hgRWMEs3PTzJDOF8YJXae/QjlfGaUOHVyMwtMy9s9y1hBbCGB5YwSU9oDIIqeM0p8nL2Q
 vYuRg4NNQEuisZMdpEZEIEti2omHjCA1zAK/GSWebp0NNkhYIEHi4dfPbCA2i4CqxJSlH5hB
 bF4BK4lXWz8yQSyTl5h56TvYTE4Ba4nVXdwQJYISJ2c+ARvDDFTSvHU2M0R5P6fEtfsuELaL
 xNW/N9kgbGGJV8e3sEPYMhKnJ/dA/VIt8fTGb7AnJQRaGCX6d65nA9klAbSr70wOiMksoCmx
 fpc+RLmjxKVvn5khKvgkbrwVhLiAT2LStulQYV6JjjYhiGoliZ0/n0AtlZC43DQHaqmHxIvb
 z5kmMCrOQvLLLCS/zELYu4CReRWjeGppcW56arFxXmq5XnFibnFpXrpecn7uJkZgWjv97/jX
 HYwrXn3UO8TIxMF4iFGCg1lJhNegoiFJiDclsbIqtSg/vqg0J7X4EKM0B4uSOG9y5oZEIYH0
 xJLU7NTUgtQimCwTB6dUA1PIs2txJho7X3dNXd5ne1NHszu45Jj28nV6HP5NJt0LkuM+N8Uc
 XmP96seN289vWXwWPHgzwyZWZkXebc/6ufo7Zb19rLd4MBda7Y9cu27ezMXb5OTEbj4yNQoN
 CC6Mkco5dCf99O2ge+dzgzx/F334dGD1dq4rMuZhlwv23swKKZzmMFcpbMKcPbefPZPbU3Bt
 83umz38Uiz9uikjX/9Ry/0mNx3ITgVezV5xZZv0j96qpgcvjm0rCPiwKqZJ7C98w7j24cPKd
 Vjkel0V2kyPKKn/+KQnbs9npS9j34tMumqYiM38dVlErsmj75LJxYVuz72WNb6JaaRbWCo8+
 bBaZVbLmc1uRwuZe00N/DrxUYinOSDTUYi4qTgQAh4MYLNoDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBIsWRmVeSWpSXmKPExsVy+t/xe7pHG5uSDO4/VLJYfbefzeL32fPM
 FnvfzWa1uPCjkcni5oGdTBYrVx9lsug58IHFYu8tbYtLj1ewW+zZe5LF4vKuOWwW85c9Zbf4
 vLSF3WLNzacsDnwe/06sYfPYOesuu8fls6Uem5fUe+y+2QAUab3P6vF+31U2j74tqxg91m+5
 yuLxeZNcAFeUnk1RfmlJqkJGfnGJrVK0oYWRnqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqR
 vl2CXsaTlz1sBb8UK9Y1LWVtYLwk1cXIySEhYCLxds8y1i5GLg4hgaWMElMnbmOFSEhI3F7Y
 xAhhC0v8udbFBlH0lFHixNOLQAkODjYBLYnGTnaQGhGBAok5/VtYQGqYBVqZJCZsnQGWEBaI
 k/gy4xXYIBYBVYkpSz8wg9i8AlYSr7Z+ZIJYIC8x89J3dpCZnALWEqu7uEHCQkAlX5/cYoco
 F5Q4OfMJC4jNDFTevHU28wRGgVlIUrOQpBYwMq1iFEktLc5Nzy021CtOzC0uzUvXS87P3cQI
 jMJtx35u3sE479VHvUOMTByMhxglOJiVRHgNKhqShHhTEiurUovy44tKc1KLDzGaAp09kVlK
 NDkfmAbySuINzQxMDU3MLA1MLc2MlcR5PQs6EoUE0hNLUrNTUwtSi2D6mDg4pRqYPKzOeRUL
 LBJl9456Up96aNMnUXWvvStEGHjfLvhwO3Wl/xazncqeV+r/NtTH+KyP1zlWdHN6k+5it+Dq
 K3/XWUe9emaT85jdwfhfQ5vkl0WfYtWNV6zetWmH1NMTzxqKd75zePjG7++/7zHeATvv/mrL
 2D1r2ofERz/clbfdmrHQfTH/L8c5czUWvujZmyvmYB2/h0Ntwe72ZT9CBY7PnXFq1yenf8Kd
 pRPmfnmYZzP75CY2M0Wu3y686VJtYpO5Z55Q7AqVe/BfmzN494FLVYfi/l4rfDr1g9bKG4vi
 8w4KvwrvTAiYsF3h7FuL16YK10/z3bFIDBCeGl4bURm7w+a3gX03W7Yue0yg1aW9nEosxRmJ
 hlrMRcWJAGnHloFLAwAA
X-CMS-MailID: 20220516165429eucas1p272c8b4325a488675f08f2d7016aa6230
X-Msg-Generator: CA
X-RootMTR: 20220516165429eucas1p272c8b4325a488675f08f2d7016aa6230
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220516165429eucas1p272c8b4325a488675f08f2d7016aa6230
References: <20220516165416.171196-1-p.raghav@samsung.com>
 <CGME20220516165429eucas1p272c8b4325a488675f08f2d7016aa6230@eucas1p2.samsung.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: [dm-devel] [PATCH v4 08/13] btrfs:zoned: make sb for npo2 zone
 devices align with sb log offsets
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
Cc: p.raghav@samsung.com, gost.dev@samsung.com, jiangbo.365@bytedance.com,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, dm-devel@redhat.com,
 linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Superblocks for zoned devices are fixed as 2 zones at 0, 512GB and 4TB.
These are fixed at these locations so that recovery tools can reliably
retrieve the superblocks even if one of the mirror gets corrupted.

power of 2 zone sizes align at these offsets irrespective of their
value but non power of 2 zone sizes will not align.

To make sure the first zone at mirror 1 and mirror 2 align, write zero
operation is performed to move the write pointer of the first zone to
the expected offset. This operation is performed only after a zone reset
of the first zone, i.e., when the second zone that contains the sb is FULL.

Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
---
 fs/btrfs/zoned.c | 68 ++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 63 insertions(+), 5 deletions(-)

diff --git a/fs/btrfs/zoned.c b/fs/btrfs/zoned.c
index 3023c871e..805aeaa76 100644
--- a/fs/btrfs/zoned.c
+++ b/fs/btrfs/zoned.c
@@ -760,11 +760,44 @@ int btrfs_check_mountopts_zoned(struct btrfs_fs_info *info)
 	return 0;
 }
 
+static int fill_sb_wp_offset(struct block_device *bdev, struct blk_zone *zone,
+			     int mirror, u64 *wp_ret)
+{
+	u64 offset = 0;
+	int ret = 0;
+
+	ASSERT(!is_power_of_two_u64(zone->len));
+	ASSERT(zone->wp == zone->start);
+	ASSERT(mirror != 0);
+
+	switch (mirror) {
+	case 1:
+		div64_u64_rem(BTRFS_SB_LOG_FIRST_OFFSET >> SECTOR_SHIFT,
+			      zone->len, &offset);
+		break;
+	case 2:
+		div64_u64_rem(BTRFS_SB_LOG_SECOND_OFFSET >> SECTOR_SHIFT,
+			      zone->len, &offset);
+		break;
+	}
+
+	ret =  blkdev_issue_zeroout(bdev, zone->start, offset, GFP_NOFS, 0);
+	if (ret)
+		return ret;
+
+	zone->wp += offset;
+	zone->cond = BLK_ZONE_COND_IMP_OPEN;
+	*wp_ret = zone->wp << SECTOR_SHIFT;
+
+	return 0;
+}
+
 static int sb_log_location(struct block_device *bdev, struct blk_zone *zones,
-			   int rw, u64 *bytenr_ret)
+			   int rw, int mirror, u64 *bytenr_ret)
 {
 	u64 wp;
 	int ret;
+	bool zones_empty = false;
 
 	if (zones[0].type == BLK_ZONE_TYPE_CONVENTIONAL) {
 		*bytenr_ret = zones[0].start << SECTOR_SHIFT;
@@ -775,13 +808,31 @@ static int sb_log_location(struct block_device *bdev, struct blk_zone *zones,
 	if (ret != -ENOENT && ret < 0)
 		return ret;
 
+	if (ret == -ENOENT)
+		zones_empty = true;
+
 	if (rw == WRITE) {
 		struct blk_zone *reset = NULL;
+		bool is_sb_offset_write_req = false;
+		u32 reset_zone_nr = -1;
 
-		if (wp == zones[0].start << SECTOR_SHIFT)
+		if (wp == zones[0].start << SECTOR_SHIFT) {
 			reset = &zones[0];
-		else if (wp == zones[1].start << SECTOR_SHIFT)
+			reset_zone_nr = 0;
+		} else if (wp == zones[1].start << SECTOR_SHIFT) {
 			reset = &zones[1];
+			reset_zone_nr = 1;
+		}
+
+		/*
+		 * Non po2 zone sizes will not align naturally at
+		 * mirror 1 (512GB) and mirror 2 (4TB). The wp of the
+		 * 1st zone in those superblock mirrors need to be
+		 * moved to align at those offsets.
+		 */
+		is_sb_offset_write_req =
+			(zones_empty || (reset_zone_nr == 0)) && mirror &&
+			!is_power_of_2(zones[0].len);
 
 		if (reset && reset->cond != BLK_ZONE_COND_EMPTY) {
 			ASSERT(sb_zone_is_full(reset));
@@ -795,6 +846,13 @@ static int sb_log_location(struct block_device *bdev, struct blk_zone *zones,
 			reset->cond = BLK_ZONE_COND_EMPTY;
 			reset->wp = reset->start;
 		}
+
+		if (is_sb_offset_write_req) {
+			ret = fill_sb_wp_offset(bdev, &zones[0], mirror, &wp);
+			if (ret)
+				return ret;
+		}
+
 	} else if (ret != -ENOENT) {
 		/*
 		 * For READ, we want the previous one. Move write pointer to
@@ -851,7 +909,7 @@ int btrfs_sb_log_location_bdev(struct block_device *bdev, int mirror, int rw,
 	if (ret != BTRFS_NR_SB_LOG_ZONES)
 		return -EIO;
 
-	return sb_log_location(bdev, zones, rw, bytenr_ret);
+	return sb_log_location(bdev, zones, rw, mirror, bytenr_ret);
 }
 
 int btrfs_sb_log_location(struct btrfs_device *device, int mirror, int rw,
@@ -877,7 +935,7 @@ int btrfs_sb_log_location(struct btrfs_device *device, int mirror, int rw,
 
 	return sb_log_location(device->bdev,
 			       &zinfo->sb_zones[BTRFS_NR_SB_LOG_ZONES * mirror],
-			       rw, bytenr_ret);
+			       rw, mirror, bytenr_ret);
 }
 
 static inline bool is_sb_log_zone(struct btrfs_zoned_device_info *zinfo,
-- 
2.25.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

