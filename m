Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F8E5116AC
	for <lists+dm-devel@lfdr.de>; Wed, 27 Apr 2022 14:22:29 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-153-cYyn0vS6M5CZgYNBAXTGTA-1; Wed, 27 Apr 2022 08:22:27 -0400
X-MC-Unique: cYyn0vS6M5CZgYNBAXTGTA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 88E7F86B8A5;
	Wed, 27 Apr 2022 12:22:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6EE2B463EF2;
	Wed, 27 Apr 2022 12:22:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id F387E194704C;
	Wed, 27 Apr 2022 12:22:23 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6B4431947BBF
 for <dm-devel@listman.corp.redhat.com>; Tue, 26 Apr 2022 12:24:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3A26B468A71; Tue, 26 Apr 2022 12:24:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 35AD0463BDA
 for <dm-devel@redhat.com>; Tue, 26 Apr 2022 12:24:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 156748038E3
 for <dm-devel@redhat.com>; Tue, 26 Apr 2022 12:24:38 +0000 (UTC)
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-wcIUMeJgP9WQISllGcCbcg-1; Tue, 26 Apr 2022 08:24:29 -0400
X-MC-Unique: wcIUMeJgP9WQISllGcCbcg-1
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20220426121535epoutp01f445d46f6fac83110438845dcfac2b73~pcVH-rpsw2297022970epoutp01L;
 Tue, 26 Apr 2022 12:15:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20220426121535epoutp01f445d46f6fac83110438845dcfac2b73~pcVH-rpsw2297022970epoutp01L
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTP id
 20220426121534epcas5p4f91b136b8273a078b94d6e6397047bb3~pcVG_qzuU0731307313epcas5p49;
 Tue, 26 Apr 2022 12:15:34 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.177]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4KngnZ1pb4z4x9Pq; Tue, 26 Apr
 2022 12:15:30 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
 epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 1F.4F.09827.262E7626; Tue, 26 Apr 2022 21:15:30 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
 20220426102017epcas5p295d3b62eaa250765e48c767962cbf08b~pawdE0gpe0348903489epcas5p2B;
 Tue, 26 Apr 2022 10:20:17 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220426102017epsmtrp2684d85a9e0b164e167a5582c0c5870bc~pawdDUMgq1443314433epsmtrp2E;
 Tue, 26 Apr 2022 10:20:17 +0000 (GMT)
X-AuditID: b6c32a4a-b3bff70000002663-4e-6267e262a37d
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 A6.CA.08924.167C7626; Tue, 26 Apr 2022 19:20:17 +0900 (KST)
Received: from test-zns.sa.corp.samsungelectronics.net (unknown
 [107.110.206.5]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20220426102012epsmtip10e289375d6f4abef2fb525b51597dead~pawYWoSgA0427604276epsmtip19;
 Tue, 26 Apr 2022 10:20:12 +0000 (GMT)
From: Nitesh Shetty <nj.shetty@samsung.com>
To: 
Date: Tue, 26 Apr 2022 15:42:35 +0530
Message-Id: <20220426101241.30100-8-nj.shetty@samsung.com>
In-Reply-To: <20220426101241.30100-1-nj.shetty@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01TaVBTVxTuW/KSOOI8lsKFKtBYOiLDEg30QgHbEZnX4kLF0cHR0gd5LAWS
 mIC2Tp1CgbaCrIKD0SnQCgi0hKUIYZel7FCHRaQishWFFmRxIkVMEwKt/875zvedc75z53Iw
 g262GSdEFMFIRXQYj9iG32m23mPrPxHk76Ac5UBF528YLBpNJuC1Z6sYXLg7yYJpyZlsuNbT
 h8H+qR2wbv4GC/7+IhqFk2VqFD5oVKKw9sc0FBYUtaJwJv8nBNbkLKLw5Tgfjq+M4DCtaQiB
 04NyFNaN2MDaug4c9lffJGBW3jQbJtyvImD9XB0G89teobBX/pKAqW3lLFg1FY3AO2tZGGx+
 NIjD4rkFHLaPvAXjrqyyYd96G+uD3VT/gBclH+shqNSYeTallI+yqb5HpTjV3xNJlRVeJqjy
 W19TV4fzEarmQRRBfdPdilGZSysElRgzT1DKuDEWtTg9glML9YOEt8npUNdghhYyUktGFCAW
 hoiC3HhePn4H/RydHPi2fGf4Hs9SRIczbjyPw962niFhmhvyLM/TYZEayJuWyXj27q5ScWQE
 YxkslkW48RiJMEwikNjJ6HBZpCjITsREuPAdHPY5aoifhQY3zi6zJfU7v2hTt+JRyC2TeITL
 AaQAdGfEofHINo4BWYOAkvRZli5ZQkDK2NPNyjICrqmS8C1JSmHWJqsaAddjKwhdEoeChPa7
 mgqHQ5A2oEvN0QqMSBwUqFS4loORHWwQo/wH1RYMyffBixUVWxvjpBUoba3cmKBHuoCbuX+j
 2j6AtAfJY/pamKuh57bOozqKPui4PrVBx0gLEFNxA9P2B+QrLphrHmfrNvUALRVTmC42BLNt
 v27iZmB5vo7QxRdA5bfZqE4ci4D4zs5NmwfAvdr1jSUw0hooqu118C6Q0VmM6gbvAIlrU6gO
 1wNVP2zFu8HPiuzN/qZgSBVN6LxQYC7BWwsbkEkImK33TkEs5a/Zkb9mR/7/4GwEK0RMGYks
 PIiROUr2iZgL/z1ygDi8DNn4Vns/rkLGHz+za0JQDtKEAA7GM9LLsAr0N9AT0l9eZKRiP2lk
 GCNrQhw1507FzN4MEGv+pSjCjy9wdhA4OTkJnPc78Xkmel1BJbQBGURHMKEMI2GkWzqUwzWL
 QiU1pPvx8vRRU8/mhj1YqEDmm/W2h/nt82fG9QcOiWpUI97oZPNITMOliXdKFMNc/vYlrvDp
 8Yy8owq1vqtroLFPwffuoh7DFCtWpcXJe38cK9hPpySaH0n7So9yPVC5/Pi5rUp5cMK8pfpV
 uqz6097nZy0u3SeKzmV6dZ9tX756ZlfxzDFjqGyMOhXevDPh3Xmu0fByzuKc8HJup6BsrfDJ
 RexzZ7VPF7069aH/CSZn4OQRlrWpWLU+8YQR5MkJz4e+aUmnYYVb+XbpX7/4SIYaTmDnxDO9
 Vz5qiX4YGIrj6irfU7Hq0jbYIFAg7X8eLfnOONjG5XCT8PYnitqxN1ptebgsmObvxaQy+l+5
 AHPB3wQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02SX0xTZxjG851zes4pCjsWZj8VXFLCTTtBCIYv4gpmWzgicbsgajSCVY/F
 SUvTA86xP5QxL9rpEBBlhaWKCLYoRpwK0lag1ooKJfJHZANGpGMZGYiQFFekoyVLvPvleX7v
 c/XSuKhYsJ4+ps7ntGpFroQMIe44JBs3KVzKQ5v9be+hG48f4qhxpJRE51+9wdFMx0sBKi+t
 opCv242jvokwZJuuFqDehWIMvWz2Y+hFeyuGrLXlGDI3OjE02XAZoLZLsxhaHI9H4/PDBCrv
 HATIM2DEkG1Yhqy2LgL13ashkaneQ6Efn7eQyD5lw1GDawlDPcZFEpW5bglQy0QxQHd8Jhw5
 RgcI1DQ1Q6BHwxvQqdNvKOR+6xKkRrN9/TtZ41g3yZaVTFNsq3GEYt2jNwm2r7uAbbboSfZW
 XRFbMdQA2LYXOpL9/qkTZ6tez5PsmZJpkm09NSZgZz3DBDtjHyA/F+8L2XaEyz12gtPGyQ+G
 5LT/PUdp7JEnXX4noQN1YgMQ0pBJhGctJkGARUwLgE33wEq+Dta/fYCvcDg0L01SBhCy7JRg
 cPHuJGYANE0yMvjETwecCIaAZq+XCDg4M0vBX+wLwdFwJhkuzHupABNMDLzpvEsEOJTZCmuu
 /BPcgUwcLB1bE4iFy/oV53QwFi0rQ76TK/Ya2PXzRPASZz6AJber8bOAMb5TGd+pLgLMAtZx
 Gl6lVPHxmgQ192Usr1DxBWpl7OE8VTMIfolU2gKsllexnQCjQSeANC6JCK2MOXpIFHpE8VUh
 p83L1hbkcnwn2EATEnFor6ErW8QoFfnccY7TcNr/W4wWrtdhxyfLUqSvh2Bb7x6J7UKkJe1X
 z47GytUWaY+8ntOJIyQHePYMWSTdZNJ8XJ7veyI08R2+RKlAt9Y4nivZuzEq+tzvO6Iof2ZU
 Rnhyv7pan56V6DCTes8nNUcHk0eSrXtkcnfV7rXFMWl5lipvxzNHZebjuYz0urCipf0/Dci2
 /JmVsN1fmXE1KSEpu3a7+uuEP5La3x83mCrcf60Ced+kp58bqmjaZZpJS7WrT1yLPLi/lhm9
 Oqj3bvt3Vxy8uNnzQ0pPqvm7B4Udp8XXn97/9iO9PGN3TXth/9ZGu3JWHi3iVgtzFLKwyJ3c
 +bkPHc8ffWZNWTWVqfn0t6wGVZPmCwnB5yjipbiWV/wHTxSdjJQDAAA=
X-CMS-MailID: 20220426102017epcas5p295d3b62eaa250765e48c767962cbf08b
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220426102017epcas5p295d3b62eaa250765e48c767962cbf08b
References: <20220426101241.30100-1-nj.shetty@samsung.com>
 <CGME20220426102017epcas5p295d3b62eaa250765e48c767962cbf08b@epcas5p2.samsung.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-Mailman-Approved-At: Wed, 27 Apr 2022 12:14:17 +0000
Subject: [dm-devel] [PATCH v4 07/10] dm: Add support for copy offload.
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
 James Smart <james.smart@broadcom.com>, hch@lst.de,
 Nitesh Shetty <nj.shetty@samsung.com>, chaitanyak@nvidia.com,
 Chaitanya Kulkarni <kch@nvidia.com>, Mike Snitzer <snitzer@kernel.org>,
 josef@toxicpanda.com, linux-block@vger.kernel.org, dsterba@suse.com,
 kbusch@kernel.org, Frederick.Knight@netapp.com,
 Sagi Grimberg <sagi@grimberg.me>, axboe@kernel.dk,
 Johannes Thumshirn <jth@kernel.org>, tytso@mit.edu, martin.petersen@oracle.com,
 linux-kernel@vger.kernel.org, jack@suse.com, linux-fsdevel@vger.kernel.org,
 lsf-pc@lists.linux-foundation.org,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Before enabling copy for dm target, check if underlying devices and
dm target support copy. Avoid split happening inside dm target.
Fail early if the request needs split, currently splitting copy
request is not supported.

Signed-off-by: Nitesh Shetty <nj.shetty@samsung.com>
---
 drivers/md/dm-table.c         | 45 +++++++++++++++++++++++++++++++++++
 drivers/md/dm.c               |  6 +++++
 include/linux/device-mapper.h |  5 ++++
 3 files changed, 56 insertions(+)

diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index a37c7b763643..b7574f179ed6 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -1893,6 +1893,38 @@ static bool dm_table_supports_nowait(struct dm_table *t)
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
+	for (i = 0; i < dm_table_get_num_targets(t); i++) {
+		ti = dm_table_get_target(t, i);
+
+		if (!ti->copy_offload_supported)
+			return false;
+
+		/*
+		 * target provides copy support (as implied by setting 'copy_offload_supported')
+		 * and it relies on _all_ data devices having copy support.
+		 */
+		if (ti->copy_offload_supported &&
+		    (!ti->type->iterate_devices ||
+		     ti->type->iterate_devices(ti, device_not_copy_capable, NULL)))
+			return false;
+	}
+
+	return true;
+}
+
 static int device_not_discard_capable(struct dm_target *ti, struct dm_dev *dev,
 				      sector_t start, sector_t len, void *data)
 {
@@ -1981,6 +2013,19 @@ int dm_table_set_restrictions(struct dm_table *t, struct request_queue *q,
 		q->limits.discard_misaligned = 0;
 	}
 
+	if (!dm_table_supports_copy(t)) {
+		blk_queue_flag_clear(QUEUE_FLAG_COPY, q);
+		/* Must also clear copy limits... */
+		q->limits.max_copy_sectors = 0;
+		q->limits.max_hw_copy_sectors = 0;
+		q->limits.max_copy_range_sectors = 0;
+		q->limits.max_hw_copy_range_sectors = 0;
+		q->limits.max_copy_nr_ranges = 0;
+		q->limits.max_hw_copy_nr_ranges = 0;
+	} else {
+		blk_queue_flag_set(QUEUE_FLAG_COPY, q);
+	}
+
 	if (!dm_table_supports_secure_erase(t))
 		q->limits.max_secure_erase_sectors = 0;
 
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 7e3b5bdcf520..b995de127093 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1595,6 +1595,12 @@ static blk_status_t __split_and_process_bio(struct clone_info *ci)
 	else if (unlikely(ci->is_abnormal_io))
 		return __process_abnormal_io(ci, ti);
 
+	if ((unlikely(op_is_copy(ci->bio->bi_opf)) &&
+				max_io_len(ti, ci->sector) < ci->sector_count)) {
+		DMERR("%s: Error IO size(%u) is greater than maximum target size(%llu)\n",
+				__func__, ci->sector_count, max_io_len(ti, ci->sector));
+		return -EIO;
+	}
 	/*
 	 * Only support bio polling for normal IO, and the target io is
 	 * exactly inside the dm_io instance (verified in dm_poll_dm_io)
diff --git a/include/linux/device-mapper.h b/include/linux/device-mapper.h
index c2a3758c4aaa..9304e640c9b9 100644
--- a/include/linux/device-mapper.h
+++ b/include/linux/device-mapper.h
@@ -362,6 +362,11 @@ struct dm_target {
 	 * after returning DM_MAPIO_SUBMITTED from its map function.
 	 */
 	bool accounts_remapped_io:1;
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

