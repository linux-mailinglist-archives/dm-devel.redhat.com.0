Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F257511696
	for <lists+dm-devel@lfdr.de>; Wed, 27 Apr 2022 14:15:33 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-542-XlXHPN63NrGvvVGA2s77Fg-1; Wed, 27 Apr 2022 08:15:30 -0400
X-MC-Unique: XlXHPN63NrGvvVGA2s77Fg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9791B811E9B;
	Wed, 27 Apr 2022 12:15:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 79FE940EC004;
	Wed, 27 Apr 2022 12:15:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 24F70194704F;
	Wed, 27 Apr 2022 12:15:18 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 884281947BBE
 for <dm-devel@listman.corp.redhat.com>; Tue, 26 Apr 2022 12:24:36 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3A46A463E05; Tue, 26 Apr 2022 12:24:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 35D4B463E15
 for <dm-devel@redhat.com>; Tue, 26 Apr 2022 12:24:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8332980352D
 for <dm-devel@redhat.com>; Tue, 26 Apr 2022 12:24:30 +0000 (UTC)
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-ENLr62UOPyS1NS2IT_S9SQ-1; Tue, 26 Apr 2022 08:24:28 -0400
X-MC-Unique: ENLr62UOPyS1NS2IT_S9SQ-1
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20220426121454epoutp03822085a2a850d758d8c4358a8dba87fc~pcUhynVE31888718887epoutp035;
 Tue, 26 Apr 2022 12:14:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20220426121454epoutp03822085a2a850d758d8c4358a8dba87fc~pcUhynVE31888718887epoutp035
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20220426121453epcas5p2d52c6695014c9969d7b79bfaab7aef46~pcUhW689V3067830678epcas5p20;
 Tue, 26 Apr 2022 12:14:53 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.178]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4Kngmp1FwZz4x9Pw; Tue, 26 Apr
 2022 12:14:50 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
 epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 56.3F.09827.A32E7626; Tue, 26 Apr 2022 21:14:50 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20220426101910epcas5p4fd64f83c6da9bbd891107d158a2743b5~pave0_0R70865008650epcas5p4F;
 Tue, 26 Apr 2022 10:19:10 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220426101910epsmtrp148b5805b8c074921e462188833d374ad~paveyax752263822638epsmtrp1R;
 Tue, 26 Apr 2022 10:19:10 +0000 (GMT)
X-AuditID: b6c32a4a-b51ff70000002663-ec-6267e23a98e5
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 22.49.08853.E17C7626; Tue, 26 Apr 2022 19:19:10 +0900 (KST)
Received: from test-zns.sa.corp.samsungelectronics.net (unknown
 [107.110.206.5]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20220426101903epsmtip1ddd1407d9c85bbbf445ca97418c7cbaf~pavYpuX6P0426404264epsmtip1k;
 Tue, 26 Apr 2022 10:19:03 +0000 (GMT)
From: Nitesh Shetty <nj.shetty@samsung.com>
To: 
Date: Tue, 26 Apr 2022 15:42:29 +0530
Message-Id: <20220426101241.30100-2-nj.shetty@samsung.com>
In-Reply-To: <20220426101241.30100-1-nj.shetty@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Te1BUZRTvu/fu3YUJu4CMn5TDusUMSjyWFvxAsAapbkHF4Awmg8ICt8UB
 dtd9RGIjIODwkHcwuigvTRQYQAwFYakgIhYJneUhGCCCOcC4qKhovGK5UP73O79zfr/znfPN
 4eEWg1xr3mGpilFIxdEC0pS41r7DzsHjviTMea6PQLW633HUMjTHQVUj2SQqfPwKR7O/TnBQ
 XvZpLlro6cWRfnIT0hqKOOjWy0QMTdSvYGjolyYMtZTnYehyVQeGHlacB6i57AmGFseFqGPl
 EYnGnw0TKK9tAKAH/RoMaYftUYu2i0D6G2dJVHLxARdlDDaSqHVGi6OKzmUM/alZJFFu51UO
 apxMBOjaQgmO2kf7CVQzM0ugP4bfRimnXnFR71In5yNbWt/nS2vGekg6N8nApZs0I1y6d/QK
 Qet71HR9ZRpJX70QT+ffqQB081ACSZ+42YHTp58+I+nMJANJN6WMcegnD4YJera1n/TfEhTl
 GcmIIxgFn5GGyyIOSyVeAt99IXtDXN2chQ5Cd7RLwJeKYxgvgY+fv8Mnh6NXtyngfyuOVq9S
 /mKlUuC0x1MhU6sYfqRMqfISMPKIaLlI7qgUxyjVUomjlFF5CJ2dXVxXC0OjIjtby0n5SNx3
 Kb9lkAmgTpIOTHiQEsHZhy/JdGDKs6CaAVzUFRJs8BTAEn0yxgYvALz48xi+IfnL0LAu0QKY
 ZDi3HqRgcDD7n1U9j0dS9rB7hWcUbKYIeHl+fs0Wpwp4cCCtGBgTllQA7J+5u+ZKULawt6GF
 Y8RmlAfMm76JG30g5QSzx8yNtAm1G/7YYcDYEnPYdWaSMGKcsoFJDUW40R9SWaaw+1I+wWp9
 YFlVMPtoSzjd+ROXxdZwKvvkOo6F10+WYqw2GcB0nY5gEx/C2y1LmNEHp3bA2htOLL0NFuhq
 MLbvJpi5MImxvBlsLN7A78Lq2lKSxVvhwHziOqZhadk5nN1VFoD3FmtADuBrXptH89o8mv9b
 lwK8Emxl5MoYCaN0lbtImdj/fjlcFlMP1i5s5+eNYPzeY8c2gPFAG4A8XLDZrMD2mzALswjx
 0ThGIQtRqKMZZRtwXd13Lm5tFS5bPVGpKkQocncWubm5idw/cBMKtph1S+rEFpRErGKiGEbO
 KDZ0GM/EOgE7VvEso330voAKH7j0XK1f+jvZvDhVeCTzetGTo/EZrtMg9fwBxXCvMHdqe+BK
 mtZdLbqwu/h43Z5QYJsT7Hhon5053r5/P8+9p7Gfk9BgG6B/Y7kyvKn69sSoffDUmdlytW3s
 1+8ULu77OM2XX3G39axvofAL4Vsq+s6IU9vTfFPvXYKAgYISG9AVqHKXXjF86Rmk0/RderNQ
 5LX3mJ/8VnrkEW5dXU1cYHV8NXoY4OLTf9/GzzI15VZoysH3CXPmUV5mUMV7STNWTVrZZ4Mn
 ppa+fz6+fHCXN7/mxYHCOf/S7TnlLf6fhtllxfrQkuNAl1QT0Nw08VUl91DoNqvOH/q8BYQy
 UizciSuU4n8B5/fKD+oEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sf1CTdQDG7/313cvuZi8T5Qt0FLujBM/BOv74Bh1h59Xb1ZK78Ai70qEv
 w5ON3cYAxQglrkJqMU+loTd1CA0sZYhtjC1F5kT55c0ZYEDIODFoCGpAA6lJ3fnfc8/nc89f
 D00Iq6hIeo+ygFMrZXkiwCcvXRVFb4p2y7MTfUeE6PyNawRqH3xEoaZhHUDHHi4SaObKOIX0
 uhoeCvT0EcjjW4Mc/loK9S8cxNG4ZQVHg5dtOGo/o8eRucmFo/sNJgzZT8/iaGlMglwrfwI0
 9niIRPqOOxia8Bpw5BjaiNodXSTytJ0AyFg/wUOHf7UC5JxyEKjB/RRHvYYlgKrdLRSy+g5i
 6FLASKCrI14S/TQ1Q6LrQ1GoomqRh/qW3VRaLOu5/R5rGO0BbHW5n8faDMM8tm+kmWQ9PVrW
 0vg1YFvqPmePDDRgrH2wDLCHul0EWzP3GLDflPsBa6sYpdjZiSGSnXF6QXr4dv4bu7m8PYWc
 OiF1Jz/X7TwDVMP7iys6D4My7IK8EguhIZMEf/O3gkqMTwsZOwb1FhuxCiJg/XLnf3ktND+9
 z1uVynG4MG+gKjGaBsxGeHOFDjphDAnN8/Nk0CGYX2jomg6AIFjLpMN6Vx0ZzCQTC/ta26lg
 FjDJUP9HNxHcgUwC1I2GBusQJgWedfnxYC38VxkIFK/aobDre9+zFYJ5CZa31hLfYYzhOWR4
 Dp3C8EYsglNpFHKFRqKSKLkisUam0GiVcvGufIUFe3aY+Dgr9nPjQ3EHhtNYBwZpQhQmOBqb
 ky0U7Jbt28+p83eotXmcpgOLoklRuKC/smuHkJHLCri9HKfi1P9TnA6JLMOTpNkuvNC+7tab
 L1h2TeZoYs52WQXJueu1VmlKhqnhqM60rzfhQNXs3bsxJYmvK0ubX+2PKKoq5SflSzPFF+3c
 ayDnxLQ7RbE5NOneUrRI9cHxzC/XFM05H105NHlq+q0X3w83jWyovbc3LP5yjdS0pS3qVmaW
 mXfj062f2Z2+tMQn3t7bWWHn5qjxDZ+sz9Bayj78qyX1wEAy/47xQTH4uyRz5cL1Be27FdcG
 lkt422zd0q9eNoOsZn1c5+astBF9ncP7dqrxHW/n77rQ7TGL5xq1Tcb6L+gMCRZXqKw+eX7L
 pGP84kdtYvhDYN23x6bGnsyXaiP9nn7oeVDwY/orypsfi0hNrkwST6g1sn8AmlHhSZ8DAAA=
X-CMS-MailID: 20220426101910epcas5p4fd64f83c6da9bbd891107d158a2743b5
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220426101910epcas5p4fd64f83c6da9bbd891107d158a2743b5
References: <20220426101241.30100-1-nj.shetty@samsung.com>
 <CGME20220426101910epcas5p4fd64f83c6da9bbd891107d158a2743b5@epcas5p4.samsung.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Mailman-Approved-At: Wed, 27 Apr 2022 12:14:17 +0000
Subject: [dm-devel] [PATCH v4 01/10] block: Introduce queue limits for
 copy-offload support
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
 Johannes Thumshirn <jth@kernel.org>, tytso@mit.edu,
 Kanchan Joshi <joshi.k@samsung.com>, martin.petersen@oracle.com,
 linux-kernel@vger.kernel.org, Arnav Dawn <arnav.dawn@samsung.com>,
 jack@suse.com, linux-fsdevel@vger.kernel.org,
 lsf-pc@lists.linux-foundation.org,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
Signed-off-by: Kanchan Joshi <joshi.k@samsung.com>
Signed-off-by: Arnav Dawn <arnav.dawn@samsung.com>
---
 Documentation/ABI/stable/sysfs-block |  83 ++++++++++++++++
 block/blk-settings.c                 |  59 ++++++++++++
 block/blk-sysfs.c                    | 138 +++++++++++++++++++++++++++
 include/linux/blkdev.h               |  13 +++
 4 files changed, 293 insertions(+)

diff --git a/Documentation/ABI/stable/sysfs-block b/Documentation/ABI/stable/sysfs-block
index e8797cd09aff..65e64b5a0105 100644
--- a/Documentation/ABI/stable/sysfs-block
+++ b/Documentation/ABI/stable/sysfs-block
@@ -155,6 +155,89 @@ Description:
 		last zone of the device which may be smaller.
 
 
+What:		/sys/block/<disk>/queue/copy_offload
+Date:		April 2022
+Contact:	linux-block@vger.kernel.org
+Description:
+		[RW] When read, this file shows whether offloading copy to
+		device is enabled (1) or disabled (0). Writing '0' to this
+		file will disable offloading copies for this device.
+		Writing any '1' value will enable this feature.
+
+
+What:		/sys/block/<disk>/queue/copy_max_bytes
+Date:		April 2022
+Contact:	linux-block@vger.kernel.org
+Description:
+		[RW] While 'copy_max_hw_bytes' is the hardware limit for the
+		device, 'copy_max_bytes' setting is the software limit.
+		Setting this value lower will make Linux issue smaller size
+		copies.
+
+
+What:		/sys/block/<disk>/queue/copy_max_hw_bytes
+Date:		April 2022
+Contact:	linux-block@vger.kernel.org
+Description:
+		[RO] Devices that support offloading copy functionality may have
+		internal limits on the number of bytes that can be offloaded
+		in a single operation. The `copy_max_hw_bytes`
+		parameter is set by the device driver to the maximum number of
+		bytes that can be copied in a single operation. Copy
+		requests issued to the device must not exceed this limit.
+		A value of 0 means that the device does not
+		support copy offload.
+
+
+What:		/sys/block/<disk>/queue/copy_max_nr_ranges
+Date:		April 2022
+Contact:	linux-block@vger.kernel.org
+Description:
+		[RW] While 'copy_max_nr_ranges_hw' is the hardware limit for the
+		device, 'copy_max_nr_ranges' setting is the software limit.
+
+
+What:		/sys/block/<disk>/queue/copy_max_nr_ranges_hw
+Date:		April 2022
+Contact:	linux-block@vger.kernel.org
+Description:
+		[RO] Devices that support offloading copy functionality may have
+		internal limits on the number of ranges in single copy operation
+		that can be offloaded in a single operation.
+		A range is tuple of source, destination and length of data
+		to be copied. The `copy_max_nr_ranges_hw` parameter is set by
+		the device driver to the maximum number of ranges that can be
+		copied in a single operation. Copy requests issued to the device
+		must not exceed this limit. A value of 0 means that the device
+		does not support copy offload.
+
+
+What:		/sys/block/<disk>/queue/copy_max_range_bytes
+Date:		April 2022
+Contact:	linux-block@vger.kernel.org
+Description:
+		[RW] While 'copy_max_range_hw_bytes' is the hardware limit for
+		the device, 'copy_max_range_bytes' setting is the software
+		limit.
+
+
+What:		/sys/block/<disk>/queue/copy_max_range_hw_bytes
+Date:		April 2022
+Contact:	linux-block@vger.kernel.org
+Description:
+		[RO] Devices that support offloading copy functionality may have
+		internal limits on the size of data, that can be copied in a
+		single range within a single copy operation.
+		A range is tuple of source, destination and length of data to be
+		copied. The `copy_max_range_hw_bytes` parameter is set by the
+		device driver to set the maximum length in bytes of a range
+		that can be copied in an operation.
+		Copy requests issued to the device must not exceed this limit.
+		Sum of sizes of all ranges in a single opeartion should not
+		exceed 'copy_max_hw_bytes'. A value of 0 means that the device
+		does not support copy offload.
+
+
 What:		/sys/block/<disk>/queue/crypto/
 Date:		February 2022
 Contact:	linux-block@vger.kernel.org
diff --git a/block/blk-settings.c b/block/blk-settings.c
index 6ccceb421ed2..70167aee3bf7 100644
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
 
@@ -81,6 +87,12 @@ void blk_set_stacking_limits(struct queue_limits *lim)
 	lim->max_dev_sectors = UINT_MAX;
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
 
@@ -177,6 +189,45 @@ void blk_queue_max_discard_sectors(struct request_queue *q,
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
+EXPORT_SYMBOL_GPL(blk_queue_max_copy_sectors);
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
+EXPORT_SYMBOL_GPL(blk_queue_max_copy_range_sectors);
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
+EXPORT_SYMBOL_GPL(blk_queue_max_copy_nr_ranges);
+
 /**
  * blk_queue_max_secure_erase_sectors - set max sectors for a secure erase
  * @q:  the request queue for the device
@@ -572,6 +623,14 @@ int blk_stack_limits(struct queue_limits *t, struct queue_limits *b,
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
index 88bd41d4cb59..bae987c10f7f 100644
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
 	return queue_var_show(0, page);
@@ -596,6 +719,14 @@ QUEUE_RO_ENTRY(queue_nr_zones, "nr_zones");
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
@@ -642,6 +773,13 @@ static struct attribute *queue_attrs[] = {
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
index 1b24c1fb3bb1..3596fd37fae7 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -270,6 +270,13 @@ struct queue_limits {
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
@@ -574,6 +581,7 @@ struct request_queue {
 #define QUEUE_FLAG_RQ_ALLOC_TIME 27	/* record rq->alloc_time_ns */
 #define QUEUE_FLAG_HCTX_ACTIVE	28	/* at least one blk-mq hctx is active */
 #define QUEUE_FLAG_NOWAIT       29	/* device supports NOWAIT */
+#define QUEUE_FLAG_COPY		30	/* supports copy offload */
 
 #define QUEUE_FLAG_MQ_DEFAULT	((1 << QUEUE_FLAG_IO_STAT) |		\
 				 (1 << QUEUE_FLAG_SAME_COMP) |		\
@@ -596,6 +604,7 @@ bool blk_queue_flag_test_and_set(unsigned int flag, struct request_queue *q);
 	test_bit(QUEUE_FLAG_STABLE_WRITES, &(q)->queue_flags)
 #define blk_queue_io_stat(q)	test_bit(QUEUE_FLAG_IO_STAT, &(q)->queue_flags)
 #define blk_queue_add_random(q)	test_bit(QUEUE_FLAG_ADD_RANDOM, &(q)->queue_flags)
+#define blk_queue_copy(q)	test_bit(QUEUE_FLAG_COPY, &(q)->queue_flags)
 #define blk_queue_zone_resetall(q)	\
 	test_bit(QUEUE_FLAG_ZONE_RESETALL, &(q)->queue_flags)
 #define blk_queue_dax(q)	test_bit(QUEUE_FLAG_DAX, &(q)->queue_flags)
@@ -960,6 +969,10 @@ extern void blk_queue_chunk_sectors(struct request_queue *, unsigned int);
 extern void blk_queue_max_segments(struct request_queue *, unsigned short);
 extern void blk_queue_max_discard_segments(struct request_queue *,
 		unsigned short);
+extern void blk_queue_max_copy_sectors(struct request_queue *q, unsigned int max_copy_sectors);
+extern void blk_queue_max_copy_range_sectors(struct request_queue *q,
+		unsigned int max_copy_range_sectors);
+extern void blk_queue_max_copy_nr_ranges(struct request_queue *q, unsigned int max_copy_nr_ranges);
 void blk_queue_max_secure_erase_sectors(struct request_queue *q,
 		unsigned int max_sectors);
 extern void blk_queue_max_segment_size(struct request_queue *, unsigned int);
-- 
2.35.1.500.gb896f729e2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

