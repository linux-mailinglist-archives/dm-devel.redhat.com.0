Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D76704B44C9
	for <lists+dm-devel@lfdr.de>; Mon, 14 Feb 2022 09:48:27 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-227-GpFNkHr6M5C7SyFcM5VJqg-1; Mon, 14 Feb 2022 03:48:25 -0500
X-MC-Unique: GpFNkHr6M5C7SyFcM5VJqg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7374C2F4F;
	Mon, 14 Feb 2022 08:48:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A394106F95E;
	Mon, 14 Feb 2022 08:48:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DA5DA4A7C9;
	Mon, 14 Feb 2022 08:48:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21E8Zew2009219 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 14 Feb 2022 03:35:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 579C32026D65; Mon, 14 Feb 2022 08:35:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 51F6C2026D60
	for <dm-devel@redhat.com>; Mon, 14 Feb 2022 08:35:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB7043803504
	for <dm-devel@redhat.com>; Mon, 14 Feb 2022 08:35:36 +0000 (UTC)
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-53-ULfqF-c5NTqUNfablDvZxQ-1; Mon, 14 Feb 2022 03:35:32 -0500
X-MC-Unique: ULfqF-c5NTqUNfablDvZxQ-1
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id
	20220214083529epoutp02d6e136aa7429ff0b0a8a0ed3613ef704~TmhrkvpxX1820318203epoutp023;
	Mon, 14 Feb 2022 08:35:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
	20220214083529epoutp02d6e136aa7429ff0b0a8a0ed3613ef704~TmhrkvpxX1820318203epoutp023
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTP id
	20220214083528epcas5p3105dbe18e923ff93842fa3be100ba12e~TmhrGbIC40862708627epcas5p36;
	Mon, 14 Feb 2022 08:35:28 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.180]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4JxyGL6J9dz4x9QC;
	Mon, 14 Feb 2022 08:35:22 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
	epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	89.C6.06423.8441A026; Mon, 14 Feb 2022 17:35:20 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20220214080605epcas5p16868dae515a6355cf9fecf22df4f3c3d~TmIBV6EUB3178831788epcas5p1f;
	Mon, 14 Feb 2022 08:06:05 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20220214080605epsmtrp2264952eef19bcd049835c1054d6f7113~TmIBTUD1r2568925689epsmtrp2C;
	Mon, 14 Feb 2022 08:06:05 +0000 (GMT)
X-AuditID: b6c32a49-b01ff70000001917-e4-620a1448fcce
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	CC.C1.29871.D6D0A026; Mon, 14 Feb 2022 17:06:05 +0900 (KST)
Received: from test-zns.sa.corp.samsungelectronics.net (unknown
	[107.110.206.5]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20220214080600epsmtip2f599380620ecf7167a64c45a95d05894~TmH8yHySr2250822508epsmtip2r;
	Mon, 14 Feb 2022 08:06:00 +0000 (GMT)
From: Nitesh Shetty <nj.shetty@samsung.com>
To: 
Date: Mon, 14 Feb 2022 13:29:52 +0530
Message-Id: <20220214080002.18381-3-nj.shetty@samsung.com>
In-Reply-To: <20220214080002.18381-1-nj.shetty@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02TezBcdxTH53fv3btLylxL2h9JJ7omHZGQ3YTtT0TTEe3cNGaq0kmHtvSG
	W9Ram92VViedYks9Kl7VsMRKZIJICfFmE4+iXiWjktKKGEsN45FIg7Gi2E2a/87r8/uec35z
	eDj/LteGFypVsnIpIxGQpkRN2z57R9rK9IywIdMOlXd34KhpeImDSkdTSfTz4iqOFlomOCgj
	NZuLBnXmSDufy0EDKzEYmqjcwFDTlQwMlZS2Y+ifokKAGi8/wlBizwCG9OMi1L4xR6KM1nsA
	TQ6pMaQd2Y+atF0EGmzII5Hm2iQXJd+vI9HtWS2OijqfYeh3tZ5EdboYgGrWNDhqezBEoLLZ
	BQLNrnSRKL7iX4Diflzlov71Ts47dvTgHydp9VgfSaer5rl0vXqUS/c/qCBoVcHfBD3YF0lX
	Xk8k6VtXv6Mz/ywCdONwNEnH9rbjdPbjJySdopon6UeTIwS9cHuI9H7VL+xoCMsEsXJbVhoY
	ERQqDXYXnDwVcDzARSwUOYpc0VsCWykTzroLPL28Hd8LlWwuUWB7jpFEboa8GYVCcPDto/KI
	SCVrGxKhULoLWFmQROYsc1Iw4YpIabCTlFUeEQmFh1w2Cz8PC+mYWuXKLn729f2RHBANaj9I
	AiY8SDnDiZlaMgmY8vhUI4CanhmuwXkM4FBlLcfgPAVwNV/DeY6sVWUThoQWwN7iTiMfh8Ef
	SorxJMDjkdR+2LPB2wKsKAKWLC9vAziVz4Uld/RgK2FJ+cCNn/KJLZug9sKOynx8yzajjsBL
	iWuYQc0OXh5v2VY2odxg82yRscYCduXotlmc2gNV1bn4lgCkYk1hlv4i1wB7Qt2VIdJgW8KZ
	zipj3AYuzWtJA5AM4ErvGGZwsgFUpamMxDF4t2kd2xoHp/bB8oaDhvDrMKu7DDMom8OUNZ2x
	UzNYl6970fWN8gLjM9bw3nKM0aZh5+C0cV0XAKyY7gZpwFb90kTqlyZS/y9dAPDrwJqVKcKD
	WYWLTCRlv3rx0YER4ZVg+7YcTtSB0YeLTq0A44FWAHm4wMrMv8/kDN8siIn6hpVHBMgjJayi
	Fbhsrjwdt9kZGLF5nFJlgMjZVegsFoudXQ+LRYLXzHqCbzJ8KphRsmEsK2PlzzmMZ2ITjR1/
	6js/mQth/Fnf9DH74Y/nRydjl3Y2ya2nBuqb9TtWbnncaGh+kuPV0PW9+kBf5qfZebhzVL32
	WkXn++dSWW5Fdc15r8JTH/rf+fJSkL2r2+mCXTaHoqZ9kru1IxlTKn3dAnOsdtdC268F017x
	XsWHmz0eul7wJCyrlcll39b3B7rcfONsqZhetDjRL0nzH3jzF/7eOI+Pyjyvmujhs3e5eabV
	/rN/ERr5bt8E6UpJlWtItF9epOdg2NHdCdW/RY/7ua15BZZ9ITAvmguVJATt2SiNLrM/UC/U
	AFGhTlh6+hOL8xvlS69UZDklT7rwm9drbBxaxovqTXYwPvEpc2LZAl9AKEIYkQMuVzD/ATSM
	zYHkBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUwTdxyH87u73l1ruhwF9NA5khqNhdlJXLavzi0sanZzWSTLEhPJxDpu
	SNYCa6XCHIJ2GN5Gx8sUygBBQ6EqSJnABkWpUugYgwwKA8WNUOxIGRUF5UVglmaJ/32S58nz
	14fGJd8KNtKxcSd5dZxCKSVFROMdafAOlVh0fOdkoQzqfrXh0Dr8RABXR/UkXHi0gIOnfVwA
	+foiCvqdr4BlukQAffNnMRg3r2LQWpmPQc3VDgxcxssIWipmMMjs7sPg+VgYdKz+S0K+dRDB
	hMOAgWUkFFotdgL6f/mRhPKqCQqyh5pJaHNbcDB2rmDwu+E5Cc3Oswgal8pxuPPAQUCt20OA
	e95Owvn6OQTpOQsU9C53CsK3cP0DH3GGv3pILk83TXE/G0YprvdBPcHpLt0nuP6eRM5syiS5
	hiupXMGfRsS1DKeR3LnfOnCu6PEsyX2nmya5mYkRgvO0OciI9UdEe6N5ZayWV7/x3jHRCdvD
	BSrh4mdJQyPFKA01HcpCQppl3mSXfioispCIljAtiL1weZrygSC2avku7tv+bM2Ki/JJOox1
	jdW9ADRNMqFs9yrtdQIYgq159mwthDNdFOspv0Z5HX8mgp27Feh1CGYrazOXrTXFzB62NHMJ
	8/W3sBVj7QLvFjLvsLfdxjVH8sIpclgpn+/H2oudhHfjTDCru1mCf48Yw0vI8BK6hDATCuIT
	NKoYlSYsISyOPyXXKFSaxLgY+efxKjNaO0qIrBk1mR7JrQijkRWxNC4NEB/tER6XiKMVyV/z
	6vgodaKS11jRJpqQbhD3ZdmjJEyM4iT/Jc8n8Or/KUYLN6Zhr0fvfpKy3/j0k9F/qFpTdF7l
	jXjZweHcP/x22a47c4pf2xF7TNhV2rA81ZAS2n14cVNGgAyL2h2SI0gTHrmX2tWtLZsKMgde
	e5jeGN6X+8PUHuXTv79quLi/QB4YfC73bv16t2n29oGJ+V3bzB9XFiulGClq15cu6t4OqL2f
	fXp83cwh8enqK2e4zcJ1g/aalMn3bfIyz05tOkVnOCo1FMomD2y4ldx5ODIqaSC8sCO0jljZ
	+2nnu/FD2raBueTqQb/8D2a+uSk583h2smrf1rdcr1ruERXVTQe3uQrOO/ct6wu7pk71uv2/
	SE/dHllSfSNPH2He3pok4zcvajPIyKTVD6WE5oQiLARXaxT/AWTOCwmXAwAA
X-CMS-MailID: 20220214080605epcas5p16868dae515a6355cf9fecf22df4f3c3d
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220214080605epcas5p16868dae515a6355cf9fecf22df4f3c3d
References: <20220214080002.18381-1-nj.shetty@samsung.com>
	<CGME20220214080605epcas5p16868dae515a6355cf9fecf22df4f3c3d@epcas5p1.samsung.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 21E8Zew2009219
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 14 Feb 2022 03:47:51 -0500
Cc: Sagi, Nitesh, Mike Snitzer <snitzer@redhat.com>, djwong@kernel.org,
	linux-nvme@lists.infradead.org, clm@fb.com, dm-devel@redhat.com,
	Chaitanya Kulkarni <kch@nvidia.com>, osandov@fb.com,
	Alasdair Kergon <agk@redhat.com>, javier@javigon.com,
	bvanassche@acm.org, linux-scsi@vger.kernel.org,
	nitheshshetty@gmail.com, James Smart <james.smart@broadcom.com>,
	hch@lst.de, Shetty <nj.shetty@samsung.com>,
	chaitanyak@nvidia.com, SelvaKumar S <selvakuma.s1@samsung.com>,
	msnitzer@redhat.com, josef@toxicpanda.com,
	linux-block@vger.kernel.org, dsterba@suse.com, kbusch@kernel.org,
	Frederick.Knight@netapp.com, Grimberg <sagi@grimberg.me>,
	axboe@kernel.dk, tytso@mit.edu, joshi.k@samsung.com,
	martin.petersen@oracle.com, linux-kernel@vger.kernel.org,
	arnav.dawn@samsung.com, jack@suse.com,
	linux-fsdevel@vger.kernel.org, lsf-pc@lists.linux-foundation.org,
	Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [dm-devel] [PATCH v3 02/10] block: Introduce queue limits for
 copy-offload support
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add device limits as sysfs entries,
        - copy_offload (RW)
        - copy_max_bytes (RW)
        - copy_max_hw_bytes (RO)
        - copy_max_range_bytes (RW)
        - copy_max_range_hw_bytes (RO)
        - copy_max_nr_ranges (RW)
        - copy_max_nr_ranges_hw (RO)

Above limits help to split the copy payload in block layer.
copy_offload, used for setting copy offload(1) or emulation(0).
copy_max_bytes: maximum total length of copy in single payload.
copy_max_range_bytes: maximum length in a single entry.
copy_max_nr_ranges: maximum number of entries in a payload.
copy_max_*_hw_*: Reflects the device supported maximum limits.

Signed-off-by: Nitesh Shetty <nj.shetty@samsung.com>
Signed-off-by: SelvaKumar S <selvakuma.s1@samsung.com>
Signed-off-by: Kanchan Joshi <joshi.k@samsung.com>
---
 block/blk-settings.c   |  59 ++++++++++++++++++
 block/blk-sysfs.c      | 138 +++++++++++++++++++++++++++++++++++++++++
 include/linux/blkdev.h |  13 ++++
 3 files changed, 210 insertions(+)

diff --git a/block/blk-settings.c b/block/blk-settings.c
index b880c70e22e4..4baccc93a294 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -57,6 +57,12 @@ void blk_set_default_limits(struct queue_limits *lim)
 	lim->misaligned = 0;
 	lim->zoned = BLK_ZONED_NONE;
 	lim->zone_write_granularity = 0;
+	lim->max_hw_copy_sectors = 0;
+	lim->max_copy_sectors = 0;
+	lim->max_hw_copy_nr_ranges = 0;
+	lim->max_copy_nr_ranges = 0;
+	lim->max_hw_copy_range_sectors = 0;
+	lim->max_copy_range_sectors = 0;
 }
 EXPORT_SYMBOL(blk_set_default_limits);
 
@@ -82,6 +88,12 @@ void blk_set_stacking_limits(struct queue_limits *lim)
 	lim->max_write_same_sectors = UINT_MAX;
 	lim->max_write_zeroes_sectors = UINT_MAX;
 	lim->max_zone_append_sectors = UINT_MAX;
+	lim->max_hw_copy_sectors = ULONG_MAX;
+	lim->max_copy_sectors = ULONG_MAX;
+	lim->max_hw_copy_range_sectors = UINT_MAX;
+	lim->max_copy_range_sectors = UINT_MAX;
+	lim->max_hw_copy_nr_ranges = USHRT_MAX;
+	lim->max_copy_nr_ranges = USHRT_MAX;
 }
 EXPORT_SYMBOL(blk_set_stacking_limits);
 
@@ -178,6 +190,45 @@ void blk_queue_max_discard_sectors(struct request_queue *q,
 }
 EXPORT_SYMBOL(blk_queue_max_discard_sectors);
 
+/**
+ * blk_queue_max_copy_sectors - set max sectors for a single copy payload
+ * @q:  the request queue for the device
+ * @max_copy_sectors: maximum number of sectors to copy
+ **/
+void blk_queue_max_copy_sectors(struct request_queue *q,
+		unsigned int max_copy_sectors)
+{
+	q->limits.max_hw_copy_sectors = max_copy_sectors;
+	q->limits.max_copy_sectors = max_copy_sectors;
+}
+EXPORT_SYMBOL(blk_queue_max_copy_sectors);
+
+/**
+ * blk_queue_max_copy_range_sectors - set max sectors for a single range, in a copy payload
+ * @q:  the request queue for the device
+ * @max_copy_range_sectors: maximum number of sectors to copy in a single range
+ **/
+void blk_queue_max_copy_range_sectors(struct request_queue *q,
+		unsigned int max_copy_range_sectors)
+{
+	q->limits.max_hw_copy_range_sectors = max_copy_range_sectors;
+	q->limits.max_copy_range_sectors = max_copy_range_sectors;
+}
+EXPORT_SYMBOL(blk_queue_max_copy_range_sectors);
+
+/**
+ * blk_queue_max_copy_nr_ranges - set max number of ranges, in a copy payload
+ * @q:  the request queue for the device
+ * @max_copy_nr_ranges: maximum number of ranges
+ **/
+void blk_queue_max_copy_nr_ranges(struct request_queue *q,
+		unsigned int max_copy_nr_ranges)
+{
+	q->limits.max_hw_copy_nr_ranges = max_copy_nr_ranges;
+	q->limits.max_copy_nr_ranges = max_copy_nr_ranges;
+}
+EXPORT_SYMBOL(blk_queue_max_copy_nr_ranges);
+
 /**
  * blk_queue_max_write_same_sectors - set max sectors for a single write same
  * @q:  the request queue for the device
@@ -541,6 +592,14 @@ int blk_stack_limits(struct queue_limits *t, struct queue_limits *b,
 	t->max_segment_size = min_not_zero(t->max_segment_size,
 					   b->max_segment_size);
 
+	t->max_copy_sectors = min(t->max_copy_sectors, b->max_copy_sectors);
+	t->max_hw_copy_sectors = min(t->max_hw_copy_sectors, b->max_hw_copy_sectors);
+	t->max_copy_range_sectors = min(t->max_copy_range_sectors, b->max_copy_range_sectors);
+	t->max_hw_copy_range_sectors = min(t->max_hw_copy_range_sectors,
+						b->max_hw_copy_range_sectors);
+	t->max_copy_nr_ranges = min(t->max_copy_nr_ranges, b->max_copy_nr_ranges);
+	t->max_hw_copy_nr_ranges = min(t->max_hw_copy_nr_ranges, b->max_hw_copy_nr_ranges);
+
 	t->misaligned |= b->misaligned;
 
 	alignment = queue_limit_alignment_offset(b, start);
diff --git a/block/blk-sysfs.c b/block/blk-sysfs.c
index 9f32882ceb2f..9ddd07f142d9 100644
--- a/block/blk-sysfs.c
+++ b/block/blk-sysfs.c
@@ -212,6 +212,129 @@ static ssize_t queue_discard_zeroes_data_show(struct request_queue *q, char *pag
 	return queue_var_show(0, page);
 }
 
+static ssize_t queue_copy_offload_show(struct request_queue *q, char *page)
+{
+	return queue_var_show(blk_queue_copy(q), page);
+}
+
+static ssize_t queue_copy_offload_store(struct request_queue *q,
+				       const char *page, size_t count)
+{
+	unsigned long copy_offload;
+	ssize_t ret = queue_var_store(&copy_offload, page, count);
+
+	if (ret < 0)
+		return ret;
+
+	if (copy_offload && !q->limits.max_hw_copy_sectors)
+		return -EINVAL;
+
+	if (copy_offload)
+		blk_queue_flag_set(QUEUE_FLAG_COPY, q);
+	else
+		blk_queue_flag_clear(QUEUE_FLAG_COPY, q);
+
+	return ret;
+}
+
+static ssize_t queue_copy_max_hw_show(struct request_queue *q, char *page)
+{
+	return sprintf(page, "%llu\n",
+		(unsigned long long)q->limits.max_hw_copy_sectors << 9);
+}
+
+static ssize_t queue_copy_max_show(struct request_queue *q, char *page)
+{
+	return sprintf(page, "%llu\n",
+		(unsigned long long)q->limits.max_copy_sectors << 9);
+}
+
+static ssize_t queue_copy_max_store(struct request_queue *q,
+				       const char *page, size_t count)
+{
+	unsigned long max_copy;
+	ssize_t ret = queue_var_store(&max_copy, page, count);
+
+	if (ret < 0)
+		return ret;
+
+	if (max_copy & (queue_logical_block_size(q) - 1))
+		return -EINVAL;
+
+	max_copy >>= 9;
+	if (max_copy > q->limits.max_hw_copy_sectors)
+		max_copy = q->limits.max_hw_copy_sectors;
+
+	q->limits.max_copy_sectors = max_copy;
+	return ret;
+}
+
+static ssize_t queue_copy_range_max_hw_show(struct request_queue *q, char *page)
+{
+	return sprintf(page, "%llu\n",
+		(unsigned long long)q->limits.max_hw_copy_range_sectors << 9);
+}
+
+static ssize_t queue_copy_range_max_show(struct request_queue *q,
+		char *page)
+{
+	return sprintf(page, "%llu\n",
+		(unsigned long long)q->limits.max_copy_range_sectors << 9);
+}
+
+static ssize_t queue_copy_range_max_store(struct request_queue *q,
+				       const char *page, size_t count)
+{
+	unsigned long max_copy;
+	ssize_t ret = queue_var_store(&max_copy, page, count);
+
+	if (ret < 0)
+		return ret;
+
+	if (max_copy & (queue_logical_block_size(q) - 1))
+		return -EINVAL;
+
+	max_copy >>= 9;
+	if (max_copy > UINT_MAX)
+		return -EINVAL;
+
+	if (max_copy > q->limits.max_hw_copy_range_sectors)
+		max_copy = q->limits.max_hw_copy_range_sectors;
+
+	q->limits.max_copy_range_sectors = max_copy;
+	return ret;
+}
+
+static ssize_t queue_copy_nr_ranges_max_hw_show(struct request_queue *q, char *page)
+{
+	return queue_var_show(q->limits.max_hw_copy_nr_ranges, page);
+}
+
+static ssize_t queue_copy_nr_ranges_max_show(struct request_queue *q,
+		char *page)
+{
+	return queue_var_show(q->limits.max_copy_nr_ranges, page);
+}
+
+static ssize_t queue_copy_nr_ranges_max_store(struct request_queue *q,
+				       const char *page, size_t count)
+{
+	unsigned long max_nr;
+	ssize_t ret = queue_var_store(&max_nr, page, count);
+
+	if (ret < 0)
+		return ret;
+
+	if (max_nr > USHRT_MAX)
+		return -EINVAL;
+
+	if (max_nr > q->limits.max_hw_copy_nr_ranges)
+		max_nr = q->limits.max_hw_copy_nr_ranges;
+
+	q->limits.max_copy_nr_ranges = max_nr;
+	return ret;
+}
+
 static ssize_t queue_write_same_max_show(struct request_queue *q, char *page)
 {
 	return sprintf(page, "%llu\n",
@@ -597,6 +720,14 @@ QUEUE_RO_ENTRY(queue_nr_zones, "nr_zones");
 QUEUE_RO_ENTRY(queue_max_open_zones, "max_open_zones");
 QUEUE_RO_ENTRY(queue_max_active_zones, "max_active_zones");
 
+QUEUE_RW_ENTRY(queue_copy_offload, "copy_offload");
+QUEUE_RO_ENTRY(queue_copy_max_hw, "copy_max_hw_bytes");
+QUEUE_RW_ENTRY(queue_copy_max, "copy_max_bytes");
+QUEUE_RO_ENTRY(queue_copy_range_max_hw, "copy_max_range_hw_bytes");
+QUEUE_RW_ENTRY(queue_copy_range_max, "copy_max_range_bytes");
+QUEUE_RO_ENTRY(queue_copy_nr_ranges_max_hw, "copy_max_nr_ranges_hw");
+QUEUE_RW_ENTRY(queue_copy_nr_ranges_max, "copy_max_nr_ranges");
+
 QUEUE_RW_ENTRY(queue_nomerges, "nomerges");
 QUEUE_RW_ENTRY(queue_rq_affinity, "rq_affinity");
 QUEUE_RW_ENTRY(queue_poll, "io_poll");
@@ -643,6 +774,13 @@ static struct attribute *queue_attrs[] = {
 	&queue_discard_max_entry.attr,
 	&queue_discard_max_hw_entry.attr,
 	&queue_discard_zeroes_data_entry.attr,
+	&queue_copy_offload_entry.attr,
+	&queue_copy_max_hw_entry.attr,
+	&queue_copy_max_entry.attr,
+	&queue_copy_range_max_hw_entry.attr,
+	&queue_copy_range_max_entry.attr,
+	&queue_copy_nr_ranges_max_hw_entry.attr,
+	&queue_copy_nr_ranges_max_entry.attr,
 	&queue_write_same_max_entry.attr,
 	&queue_write_zeroes_max_entry.attr,
 	&queue_zone_append_max_entry.attr,
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index efed3820cbf7..792e6d556589 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -254,6 +254,13 @@ struct queue_limits {
 	unsigned int		discard_alignment;
 	unsigned int		zone_write_granularity;
 
+	unsigned long		max_hw_copy_sectors;
+	unsigned long		max_copy_sectors;
+	unsigned int		max_hw_copy_range_sectors;
+	unsigned int		max_copy_range_sectors;
+	unsigned short		max_hw_copy_nr_ranges;
+	unsigned short		max_copy_nr_ranges;
+
 	unsigned short		max_segments;
 	unsigned short		max_integrity_segments;
 	unsigned short		max_discard_segments;
@@ -562,6 +569,7 @@ struct request_queue {
 #define QUEUE_FLAG_RQ_ALLOC_TIME 27	/* record rq->alloc_time_ns */
 #define QUEUE_FLAG_HCTX_ACTIVE	28	/* at least one blk-mq hctx is active */
 #define QUEUE_FLAG_NOWAIT       29	/* device supports NOWAIT */
+#define QUEUE_FLAG_COPY		30	/* supports copy offload */
 
 #define QUEUE_FLAG_MQ_DEFAULT	((1 << QUEUE_FLAG_IO_STAT) |		\
 				 (1 << QUEUE_FLAG_SAME_COMP) |		\
@@ -585,6 +593,7 @@ bool blk_queue_flag_test_and_set(unsigned int flag, struct request_queue *q);
 #define blk_queue_io_stat(q)	test_bit(QUEUE_FLAG_IO_STAT, &(q)->queue_flags)
 #define blk_queue_add_random(q)	test_bit(QUEUE_FLAG_ADD_RANDOM, &(q)->queue_flags)
 #define blk_queue_discard(q)	test_bit(QUEUE_FLAG_DISCARD, &(q)->queue_flags)
+#define blk_queue_copy(q)	test_bit(QUEUE_FLAG_COPY, &(q)->queue_flags)
 #define blk_queue_zone_resetall(q)	\
 	test_bit(QUEUE_FLAG_ZONE_RESETALL, &(q)->queue_flags)
 #define blk_queue_secure_erase(q) \
@@ -958,6 +967,10 @@ extern void blk_queue_max_discard_segments(struct request_queue *,
 extern void blk_queue_max_segment_size(struct request_queue *, unsigned int);
 extern void blk_queue_max_discard_sectors(struct request_queue *q,
 		unsigned int max_discard_sectors);
+extern void blk_queue_max_copy_sectors(struct request_queue *q, unsigned int max_copy_sectors);
+extern void blk_queue_max_copy_range_sectors(struct request_queue *q,
+		unsigned int max_copy_range_sectors);
+extern void blk_queue_max_copy_nr_ranges(struct request_queue *q, unsigned int max_copy_nr_ranges);
 extern void blk_queue_max_write_same_sectors(struct request_queue *q,
 		unsigned int max_write_same_sectors);
 extern void blk_queue_max_write_zeroes_sectors(struct request_queue *q,
-- 
2.30.0-rc0


--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

