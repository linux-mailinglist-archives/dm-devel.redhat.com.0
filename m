Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 97999514417
	for <lists+dm-devel@lfdr.de>; Fri, 29 Apr 2022 10:24:03 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-w0ayTaNrPCq1UTZhDidaUA-1; Fri, 29 Apr 2022 04:23:50 -0400
X-MC-Unique: w0ayTaNrPCq1UTZhDidaUA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99DA32811825;
	Fri, 29 Apr 2022 08:23:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 27489C15D40;
	Fri, 29 Apr 2022 08:23:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4DDD91947078;
	Fri, 29 Apr 2022 08:23:42 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 42CF21947041
 for <dm-devel@listman.corp.redhat.com>; Wed, 27 Apr 2022 16:11:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1F6C0463E02; Wed, 27 Apr 2022 16:11:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1AB1C416146
 for <dm-devel@redhat.com>; Wed, 27 Apr 2022 16:11:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02D663832184
 for <dm-devel@redhat.com>; Wed, 27 Apr 2022 16:11:59 +0000 (UTC)
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-Pr945xTpMaOsFVG7lTxOOg-1; Wed, 27 Apr 2022 12:11:49 -0400
X-MC-Unique: Pr945xTpMaOsFVG7lTxOOg-1
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20220427160311euoutp024827f73ab86f2151f95d93139fd552cc~pzFIJcodk1441914419euoutp029
 for <dm-devel@redhat.com>; Wed, 27 Apr 2022 16:03:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20220427160311euoutp024827f73ab86f2151f95d93139fd552cc~pzFIJcodk1441914419euoutp029
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220427160309eucas1p25764fd1df9f26db4844fda3c1f148051~pzFGlnhYj1589415894eucas1p2P;
 Wed, 27 Apr 2022 16:03:09 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 8E.0A.10260.D3969626; Wed, 27
 Apr 2022 17:03:09 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220427160309eucas1p2f677c8db581616f994473f17c4a5bd44~pzFGL5Kmx2335223352eucas1p2d;
 Wed, 27 Apr 2022 16:03:09 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220427160308eusmtrp18af0ed37110fa9c75771e3484c9f838a~pzFGJpnvr2142221422eusmtrp1F;
 Wed, 27 Apr 2022 16:03:08 +0000 (GMT)
X-AuditID: cbfec7f5-bf3ff70000002814-99-6269693d1883
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 87.A7.09404.C3969626; Wed, 27
 Apr 2022 17:03:08 +0100 (BST)
Received: from localhost (unknown [106.210.248.162]) by eusmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20220427160308eusmtip112cb60e69e75f4067509f9e1ad8af9ac~pzFFx3uD50884308843eusmtip1k;
 Wed, 27 Apr 2022 16:03:08 +0000 (GMT)
From: Pankaj Raghav <p.raghav@samsung.com>
To: jaegeuk@kernel.org, axboe@kernel.dk, snitzer@kernel.org, hch@lst.de,
 mcgrof@kernel.org, naohiro.aota@wdc.com, sagi@grimberg.me,
 damien.lemoal@opensource.wdc.com, dsterba@suse.com,
 johannes.thumshirn@wdc.com
Date: Wed, 27 Apr 2022 18:02:51 +0200
Message-Id: <20220427160255.300418-13-p.raghav@samsung.com>
In-Reply-To: <20220427160255.300418-1-p.raghav@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUxTZxTGfe+93F5IipfCyjuqYVTRoBuMiMu7bDhxW7zBZX5szkX+0Fav
 pcqHttRNtswiHQgoFJQyqk7ZwFUclkJlVD5knYKIIAIdBSbEjRphE0QgiJ2yllsz/3vOOb/n
 fc5JXgoXVJBBlDwphVUkSRLEpA9R0zzb8Ua0XC5909AqRMabzTi6eDePRLpHszhqK2zHUEHe
 dzzkbL+No4axU16o80kahvqaLBi6cPE6hoaNehwda3pEoGfZg66e5h6O/r0XiQqsvwPksOkx
 1NC/EnX9ZeChrh/Wo/qGVgJ1XzlNorPnHTykzZjGkV3rACi/pdoLTZZpeOjS3+MEutEvWruY
 6e7ZwDy/8TPJ5KeP8ZjbgyaC6W5XMVXlWSRToi7EmerSw0zduUmMqetTk8zx9DGSsXw75MWM
 N9pIJtdcDhij2UYw2mqT1ybBdp93d7MJ8oOsImLNTp/49PJ/yP336S8nat5Tg1l+NvCmIB0F
 NYXXcbcW0AYAK+a2ZgMfl54CcLDtGskVkwC2Fp7kvXDU/9aNcYOfAGxIb8e5YgTAvqZxV0FR
 JL0CpmXx3P0A2g5gfmXlvAOnR3HYae7F3JA/HQOPlkW7XyXoUHi/qIhwaz79DryT00FwacGw
 uGuG58a9XX3t4885xA+2Fg/PI7gLSb98an4HSJf4wJ4H3wPO+wHsz0rDOe0PR1vMngsWwbYT
 xzzvfwUddqfHrAEwz2Ik3WHQFZZ7K8EtcToMGq9EcHgMnMhUewhfaH/ox63gCwtqinCuzYdH
 MwQcLYaW2WFPKITdR057QhlY1FFKakGI/qVj9C8do/8/9xzAy0Egq1ImyljlqiT2i3ClJFGp
 SpKF70pOrAKuH932vGW6FhhGJ8KtAKOAFUAKFwfwp+ripQL+bsmhVFaRvEOhSmCVViCiCHEg
 f5e8UiKgZZIUdh/L7mcVL6YY5R2kxj6ubTyv013uXKsTLog4/Oee1IXY3IlPVmqOxP7R03gL
 d9ZXnZE5Oj7rH3qQea136vEye3Kl0OkMeCb5aJ1261Lt09DmHm1mYByVv11V7rfv6+KUgj7z
 zIBYGF4ijKsDEn/zYt3qHxXbQt6WLpnpH4kJ2+z4xpTDXBo4+PqOkYqre9r3vuq7USpaZ82J
 XLBq5xPbL28FzJhu5lZlqCzSzLLekNX1w5scS0qTo02G1I32k9ne24LiRQf4ZVtMaw5saD4e
 FLslxNjz/sCH02EPbXPWZYt0wcv3Bj4lhi7ULp1ukJapY0dLKj49czV4QLRckHvntdComrtW
 x6GFcXHSV3SNll9lUWJCGS+JXIErlJL/AEwJqMJABAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDKsWRmVeSWpSXmKPExsVy+t/xu7o2mZlJBj+PmVqsP3WM2WL13X42
 i2kffjJbnJ56lsliUv8MdovfZ88zW+x9N5vV4sKPRiaLmwd2MlmsXH2UyeLJ+lnMFj0HPrBY
 /O26BxRrechs8eehocWkQ9cYLZ5encVksfeWtsWlxyvYLS4tcrfYs/cki8XlXXPYLOYve8pu
 MaHtK7PFjQlPGS0mHt/MavF5aQu7xbrX71ksTtySdpD1uHzF2+PfiTVsHhOb37F7nL+3kcXj
 8tlSj02rOtk8FjZMZfbYvKTeY/eCz0weu282sHn0Nr9j89jZep/V4/2+q2wefVtWMXqs33KV
 xWPC5o2sAUJRejZF+aUlqQoZ+cUltkrRhhZGeoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF
 +nYJehnNq96wFTwTqPi4zb6B8SdvFyMnh4SAicSew5eZuhi5OIQEljJK7Nt7mAUiISFxe2ET
 I4QtLPHnWhcbiC0k8JxR4uNLoDgHB5uAlkRjJztIr4jAE0aJ+z8fs4A4zAINLBK3Ju5iAikS
 FnCU6FhqC9LLIqAq8Wz6dLD5vALWEhe7z0HtkpeYeek7O0g5J1B8wqcIiFVWEt2LbrFClAtK
 nJz5BKycGai8eets5gmMArOQpGYhSS1gZFrFKJJaWpybnltspFecmFtcmpeul5yfu4kRmEy2
 Hfu5ZQfjylcf9Q4xMnEwHmKU4GBWEuH9sjsjSYg3JbGyKrUoP76oNCe1+BCjKdDZE5mlRJPz
 geksryTe0MzA1NDEzNLA1NLMWEmc17OgI1FIID2xJDU7NbUgtQimj4mDU6qBaWvX6h/VB5V7
 5eY/rLiV/P7JtPAHBbKcUZ3X5YPKl7NcbomwXDEnh/3DulwGff9HC1fc9v0i8KNSrEv48T5D
 lrAnCtX2Tdb+5fz+tz/c2bYh77rEjkqBoh0fJgUfDNHu83fy51hj/6Rbk+/y7Nb67ul7Evy/
 XIxd+E7mqd3ixDWmHr8tL1+drv9m32S/HTs2db3R5N1jUXcjtPyaNkuDXNj0vgC51GO+YXOm
 CSqxJfF9cG8I7XZTVFXas1pt3bZZv2KvTbduYl0b8yjkvZFWeco7WYXwiS9/SlxJ9E3dn5L9
 o+3Vi6zk3RycSt/c5pt0b6ifMb2Mx2LmjCrdh44dsaVycybU+2RZLfO2EfZWYinOSDTUYi4q
 TgQABxgFrq8DAAA=
X-CMS-MailID: 20220427160309eucas1p2f677c8db581616f994473f17c4a5bd44
X-Msg-Generator: CA
X-RootMTR: 20220427160309eucas1p2f677c8db581616f994473f17c4a5bd44
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220427160309eucas1p2f677c8db581616f994473f17c4a5bd44
References: <20220427160255.300418-1-p.raghav@samsung.com>
 <CGME20220427160309eucas1p2f677c8db581616f994473f17c4a5bd44@eucas1p2.samsung.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Mailman-Approved-At: Fri, 29 Apr 2022 08:23:40 +0000
Subject: [dm-devel] [PATCH 12/16] zonefs: allow non power of 2 zoned devices
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
Cc: jiangbo.365@bytedance.com, Pankaj Raghav <p.raghav@samsung.com>,
 kch@nvidia.com, bvanassche@acm.org, matias.bjorling@wdc.com,
 gost.dev@samsung.com, chao@kernel.org, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, clm@fb.com, dm-devel@redhat.com, agk@redhat.com,
 jonathan.derrick@linux.dev, kbusch@kernel.org, linux-fsdevel@vger.kernel.org,
 josef@toxicpanda.com, linux-btrfs@vger.kernel.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The zone size shift variable is useful only if the zone sizes are known
to be power of 2. Remove that variable and use generic helpers from
block layer to calculate zone index in zonefs

Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
---
 fs/zonefs/super.c  | 6 ++----
 fs/zonefs/zonefs.h | 1 -
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/fs/zonefs/super.c b/fs/zonefs/super.c
index 3614c7834007..5422be2ca570 100644
--- a/fs/zonefs/super.c
+++ b/fs/zonefs/super.c
@@ -401,10 +401,9 @@ static void __zonefs_io_error(struct inode *inode, bool write)
 {
 	struct zonefs_inode_info *zi = ZONEFS_I(inode);
 	struct super_block *sb = inode->i_sb;
-	struct zonefs_sb_info *sbi = ZONEFS_SB(sb);
 	unsigned int noio_flag;
 	unsigned int nr_zones =
-		zi->i_zone_size >> (sbi->s_zone_sectors_shift + SECTOR_SHIFT);
+		bdev_zone_no(sb->s_bdev, zi->i_zone_size >> SECTOR_SHIFT);
 	struct zonefs_ioerr_data err = {
 		.inode = inode,
 		.write = write,
@@ -1300,7 +1299,7 @@ static void zonefs_init_file_inode(struct inode *inode, struct blk_zone *zone,
 	struct zonefs_sb_info *sbi = ZONEFS_SB(sb);
 	struct zonefs_inode_info *zi = ZONEFS_I(inode);
 
-	inode->i_ino = zone->start >> sbi->s_zone_sectors_shift;
+	inode->i_ino = bdev_zone_no(sb->s_bdev, zone->start);
 	inode->i_mode = S_IFREG | sbi->s_perm;
 
 	zi->i_ztype = type;
@@ -1647,7 +1646,6 @@ static int zonefs_fill_super(struct super_block *sb, void *data, int silent)
 	 * interface constraints.
 	 */
 	sb_set_blocksize(sb, bdev_zone_write_granularity(sb->s_bdev));
-	sbi->s_zone_sectors_shift = ilog2(bdev_zone_sectors(sb->s_bdev));
 	sbi->s_uid = GLOBAL_ROOT_UID;
 	sbi->s_gid = GLOBAL_ROOT_GID;
 	sbi->s_perm = 0640;
diff --git a/fs/zonefs/zonefs.h b/fs/zonefs/zonefs.h
index 7b147907c328..2d5ea3be3a8e 100644
--- a/fs/zonefs/zonefs.h
+++ b/fs/zonefs/zonefs.h
@@ -175,7 +175,6 @@ struct zonefs_sb_info {
 	kgid_t			s_gid;
 	umode_t			s_perm;
 	uuid_t			s_uuid;
-	unsigned int		s_zone_sectors_shift;
 
 	unsigned int		s_nr_files[ZONEFS_ZTYPE_MAX];
 
-- 
2.25.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

