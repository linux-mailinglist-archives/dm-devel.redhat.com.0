Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E37D6528B1A
	for <lists+dm-devel@lfdr.de>; Mon, 16 May 2022 18:54:36 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-205-z2ZeOvskMoKP2v-fzFyVnQ-1; Mon, 16 May 2022 12:54:34 -0400
X-MC-Unique: z2ZeOvskMoKP2v-fzFyVnQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 30F55801210;
	Mon, 16 May 2022 16:54:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 125B47AD5;
	Mon, 16 May 2022 16:54:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id ACE561947054;
	Mon, 16 May 2022 16:54:29 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 615C2194704E
 for <dm-devel@listman.corp.redhat.com>; Mon, 16 May 2022 16:54:28 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3EED254EAE2; Mon, 16 May 2022 16:54:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3982254E895
 for <dm-devel@redhat.com>; Mon, 16 May 2022 16:54:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D73429ABA1F
 for <dm-devel@redhat.com>; Mon, 16 May 2022 16:54:27 +0000 (UTC)
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-rWCQyP6WPEGRCdWIMHNqvg-1; Mon, 16 May 2022 12:54:24 -0400
X-MC-Unique: rWCQyP6WPEGRCdWIMHNqvg-1
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20220516165423euoutp02326697203faf46405e5bbb26d238546c~vpCQptFyr2422624226euoutp02y
 for <dm-devel@redhat.com>; Mon, 16 May 2022 16:54:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20220516165423euoutp02326697203faf46405e5bbb26d238546c~vpCQptFyr2422624226euoutp02y
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220516165422eucas1p1162a8ccdd29e06f930ca66dececc3667~vpCPT6nb52560525605eucas1p1W;
 Mon, 16 May 2022 16:54:22 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 33.40.10009.DB182826; Mon, 16
 May 2022 17:54:21 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220516165421eucas1p2515446ac290987bdb9af24ffb835b287~vpCO3QdmY2457324573eucas1p2W;
 Mon, 16 May 2022 16:54:21 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220516165421eusmtrp214587cb0a00813fc775c1106b7d30871~vpCO2blGP1030710307eusmtrp2q;
 Mon, 16 May 2022 16:54:21 +0000 (GMT)
X-AuditID: cbfec7f2-e7fff70000002719-42-628281bd5f1f
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 9B.00.09404.DB182826; Mon, 16
 May 2022 17:54:21 +0100 (BST)
Received: from localhost (unknown [106.210.248.7]) by eusmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20220516165421eusmtip1899df696a585dc3044e16754fe6b8fbb~vpCOd7A2K2383023830eusmtip1Y;
 Mon, 16 May 2022 16:54:21 +0000 (GMT)
From: Pankaj Raghav <p.raghav@samsung.com>
To: axboe@kernel.dk, damien.lemoal@opensource.wdc.com, pankydev8@gmail.com,
 dsterba@suse.com, hch@lst.de
Date: Mon, 16 May 2022 18:54:05 +0200
Message-Id: <20220516165416.171196-3-p.raghav@samsung.com>
In-Reply-To: <20220516165416.171196-1-p.raghav@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAKsWRmVeSWpSXmKPExsWy7djP87p7G5uSDL4+s7RYfbefzeL32fPM
 FnvfzWa1uPCjkcni5oGdTBYrVx9lsug58IHFYu8tbYtLj1ewW+zZe5LF4vKuOWwW85c9Zbe4
 MeEpo8XnpS3sFmtuPmVx4Pf4d2INm8fOWXfZPS6fLfXYtKqTzWPzknqP3TcbgMKt91k93u+7
 yubRt2UVo8f6LVdZPD5vkgvgjuKySUnNySxLLdK3S+DKuLryCXvBV9WKx9OvMjYwXpLrYuTk
 kBAwkWi4cIWxi5GLQ0hgBaPEods9LBDOF0aJ7QfvQTmfGSWWvj7B1MXIAdaycJY3RHw5o8TU
 5ztZIZznjBKvtnWxgBSxCWhJNHayg6wQEciSmHbiIdgKZoHFTBIr90xmAUkIC0RLtF87yQxS
 zyKgKnH1TxVImFfASmLNzAlsEOfJS8y89J0dpIRTwFpidRc3RImgxMmZT8CmMAOVNG+dzQxR
 PptTYv1FZQjbReLS088sELawxKvjW9ghbBmJ/zvnM0HY1RJPb/xmBjlNQqCFUaJ/53o2iB+t
 JfrO5ICYzAKaEut36UOUO0rMO3MPGgp8EjfeCkJcwCcxadt0Zogwr0RHmxBEtZLEzp9PoJZK
 SFxumgN1jIfEhvlrmScwKs5C8sssJL/MQti7gJF5FaN4amlxbnpqsWFearlecWJucWleul5y
 fu4mRmCiO/3v+KcdjHNffdQ7xMjEwXiIUYKDWUmE16CiIUmINyWxsiq1KD++qDQntfgQozQH
 i5I4b3LmhkQhgfTEktTs1NSC1CKYLBMHp1QDE4ss7xpvr42T9+z0TVrJ2ZfcGJW942HcRNaV
 VSJx+8Je1xppmEZOql3Sv3nmbqG3i4XPdLrL2J5RPJVgl3VXoGlDe9WfN79nb09ax3be+veC
 9K+7i0Q/F4oHuNpeMesKDWF4ddU2Nlm/s82ieKNetEnO1I4XVidXzFyxr2vzVqNJP7gvRC7/
 ks3o9eaOaNjFecvNj/en7+G/92/Nsu8nor/7fQ7YLSDmNdV/njB/zSHfEHsZjzb5cpGT85sS
 g1d+P/K8b21ZwrSyuD6Nu8IbQ+/XKX6/NVGoXGo+G1esxQTdH5NLOWzduG1zXxY8vPUl8dCe
 F6oyi32eJ7zb0irZztO16I0ll+ulF5FPag4rKbEUZyQaajEXFScCABLs197jAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAIsWRmVeSWpSXmKPExsVy+t/xu7p7G5uSDG49l7RYfbefzeL32fPM
 FnvfzWa1uPCjkcni5oGdTBYrVx9lsug58IHFYu8tbYtLj1ewW+zZe5LF4vKuOWwW85c9Zbe4
 MeEpo8XnpS3sFmtuPmVx4Pf4d2INm8fOWXfZPS6fLfXYtKqTzWPzknqP3TcbgMKt91k93u+7
 yubRt2UVo8f6LVdZPD5vkgvgjtKzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV
 0rezSUnNySxLLdK3S9DLuLryCXvBV9WKx9OvMjYwXpLrYuTgkBAwkVg4y7uLkYtDSGApo8SU
 L+vZuhg5geISErcXNjFC2MISf651sUEUPWWU+Pd4HQtIM5uAlkRjJztIjYhAgcSc/i0sIDXM
 AmuZJF7/eA/WLCwQKdHe/YQNpJ5FQFXi6p8qkDCvgJXEmpkToHbJS8y89J0dpIRTwFpidRc3
 SFgIqOTrk1vsEOWCEidnPmEBsZmBypu3zmaewCgwC0lqFpLUAkamVYwiqaXFuem5xUZ6xYm5
 xaV56XrJ+bmbGIFRue3Yzy07GFe++qh3iJGJg/EQowQHs5IIr0FFQ5IQb0piZVVqUX58UWlO
 avEhRlOgqycyS4km5wPTQl5JvKGZgamhiZmlgamlmbGSOK9nQUeikEB6YklqdmpqQWoRTB8T
 B6dUA5OogkPBl8x4JzU513Ucmlo7p1Qvud/gsJO9I77jscCcJW6L2CL/PsxWrjV8z6p9xHp1
 UFZhYWP+hdUxu4/tMNVl03BlDJic/Wke9/mTirc1Fuz9/dfgbF+WxM80ltS3y2RDxL++euBh
 OXnF9q2/Qx1UVkaZKPqeuS318s/VMp3g0+4a2TIZRrGFb7ydb6h/+SO3a3dvqN+Zef5MEx0U
 ru4/uCbm26mp8/fPbJ2+8MXm/Jmrrsp685ldbVBc0OMUfi5c3yvChLVAybZjkqJynQ6/4wuN
 1w9eKx+LFgvwKBHOrPn19l6yHG9q+439U9ht96+f+bCl0JFJhvHmk+zoB5odt/fpr33QsDVu
 poJelBJLcUaioRZzUXEiAD2Ugp9TAwAA
X-CMS-MailID: 20220516165421eucas1p2515446ac290987bdb9af24ffb835b287
X-Msg-Generator: CA
X-RootMTR: 20220516165421eucas1p2515446ac290987bdb9af24ffb835b287
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220516165421eucas1p2515446ac290987bdb9af24ffb835b287
References: <20220516165416.171196-1-p.raghav@samsung.com>
 <CGME20220516165421eucas1p2515446ac290987bdb9af24ffb835b287@eucas1p2.samsung.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: [dm-devel] [PATCH v4 02/13] block: allow blk-zoned devices to have
 non-power-of-2 zone size
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
 Luis Chamberlain <mcgrof@kernel.org>, linux-fsdevel@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Checking if a given sector is aligned to a zone is a common
operation that is performed for zoned devices. Add
blk_queue_is_zone_start helper to check for this instead of opencoding it
everywhere.

Convert the calculations on zone size to be generic instead of relying on
power_of_2 based logic in the block layer using the helpers wherever
possible.

The only hot path affected by this change for power_of_2 zoned devices
is in blk_check_zone_append() but blk_queue_is_zone_start() helper is
used to optimize the calculation for po2 zone sizes. Note that the append
path cannot be accessed by direct raw access to the block device but only
through a filesystem abstraction.

Finally, allow non power of 2 zoned devices provided that their zone
capacity and zone size are equal. The main motivation to allow non
power_of_2 zoned device is to remove the unmapped LBA between zcap and
zsze for devices that cannot have a power_of_2 zcap.

Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
---
 block/blk-core.c       |  3 +--
 block/blk-zoned.c      | 27 +++++++++++++++++++++------
 include/linux/blkdev.h | 22 ++++++++++++++++++++++
 3 files changed, 44 insertions(+), 8 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index f305cb66c..b7051b7ea 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -634,8 +634,7 @@ static inline blk_status_t blk_check_zone_append(struct request_queue *q,
 		return BLK_STS_NOTSUPP;
 
 	/* The bio sector must point to the start of a sequential zone */
-	if (pos & (blk_queue_zone_sectors(q) - 1) ||
-	    !blk_queue_zone_is_seq(q, pos))
+	if (!blk_queue_is_zone_start(q, pos) || !blk_queue_zone_is_seq(q, pos))
 		return BLK_STS_IOERR;
 
 	/*
diff --git a/block/blk-zoned.c b/block/blk-zoned.c
index 140230134..cfc2fb804 100644
--- a/block/blk-zoned.c
+++ b/block/blk-zoned.c
@@ -289,10 +289,10 @@ int blkdev_zone_mgmt(struct block_device *bdev, enum req_opf op,
 		return -EINVAL;
 
 	/* Check alignment (handle eventual smaller last zone) */
-	if (sector & (zone_sectors - 1))
+	if (!blk_queue_is_zone_start(q, sector))
 		return -EINVAL;
 
-	if ((nr_sectors & (zone_sectors - 1)) && end_sector != capacity)
+	if (!blk_queue_is_zone_start(q, nr_sectors) && end_sector != capacity)
 		return -EINVAL;
 
 	/*
@@ -490,14 +490,29 @@ static int blk_revalidate_zone_cb(struct blk_zone *zone, unsigned int idx,
 	 * smaller last zone.
 	 */
 	if (zone->start == 0) {
-		if (zone->len == 0 || !is_power_of_2(zone->len)) {
-			pr_warn("%s: Invalid zoned device with non power of two zone size (%llu)\n",
-				disk->disk_name, zone->len);
+		if (zone->len == 0) {
+			pr_warn("%s: Invalid zone size",
+				disk->disk_name);
+			return -ENODEV;
+		}
+
+		/*
+		 * Don't allow zoned device with non power_of_2 zone size with
+		 * zone capacity less than zone size.
+		 */
+		if (!is_power_of_2(zone->len) &&
+		    zone->capacity < zone->len) {
+			pr_warn("%s: Invalid zoned size with non power of 2 zone size and zone capacity < zone size",
+				disk->disk_name);
 			return -ENODEV;
 		}
 
 		args->zone_sectors = zone->len;
-		args->nr_zones = (capacity + zone->len - 1) >> ilog2(zone->len);
+		/*
+		 * Division is used to calculate nr_zones for both power_of_2
+		 * and non power_of_2 zone sizes as it is not in the hot path.
+		 */
+		args->nr_zones = div64_u64(capacity + zone->len - 1, zone->len);
 	} else if (zone->start + args->zone_sectors < capacity) {
 		if (zone->len != args->zone_sectors) {
 			pr_warn("%s: Invalid zoned device with non constant zone size\n",
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 22fe512ee..32d7bd7b1 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -686,6 +686,22 @@ static inline unsigned int blk_queue_zone_no(struct request_queue *q,
 	return div64_u64(sector, zone_sectors);
 }
 
+static inline bool blk_queue_is_zone_start(struct request_queue *q, sector_t sec)
+{
+	sector_t zone_sectors = blk_queue_zone_sectors(q);
+	u64 remainder = 0;
+
+	if (!blk_queue_is_zoned(q))
+		return false;
+
+	if (is_power_of_2(zone_sectors))
+		return IS_ALIGNED(sec, zone_sectors);
+
+	div64_u64_rem(sec, zone_sectors, &remainder);
+	/* if there is a remainder, then the sector is not aligned */
+	return remainder == 0;
+}
+
 static inline bool blk_queue_zone_is_seq(struct request_queue *q,
 					 sector_t sector)
 {
@@ -732,6 +748,12 @@ static inline unsigned int blk_queue_zone_no(struct request_queue *q,
 {
 	return 0;
 }
+
+static inline bool blk_queue_is_zone_start(struct request_queue *q, sector_t sec)
+{
+	return false;
+}
+
 static inline unsigned int queue_max_open_zones(const struct request_queue *q)
 {
 	return 0;
-- 
2.25.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

