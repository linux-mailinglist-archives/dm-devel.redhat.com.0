Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB9D6E8AD3
	for <lists+dm-devel@lfdr.de>; Thu, 20 Apr 2023 08:58:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681973890;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=a02Fxo9NJFZvaQlTOPqm9W08eD2LG0ytT4AkXODYXmg=;
	b=C5+aV8WaG/1ldV/tGvNEjWKswxs1Mh3xW5oxA2ikEaDvu0kK+ZD3xPxQaUuXSPNKp+uh1i
	y/ha2xl0fzVU2vTY5CBAUVokRu/o2tvQhcciZ+rk3qr/aHBuaEgX9D5Ju70/LmqMSPUHid
	rv2gFeINBRG2GE3rvy4nWJmGZrUe1hU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-Y_K_zz_3Oey8akklgkD3fg-1; Thu, 20 Apr 2023 02:57:24 -0400
X-MC-Unique: Y_K_zz_3Oey8akklgkD3fg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8BFD310113C7;
	Thu, 20 Apr 2023 06:57:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 76CF71121315;
	Thu, 20 Apr 2023 06:57:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1261919472DA;
	Thu, 20 Apr 2023 06:57:11 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 918D219465A0
 for <dm-devel@listman.corp.redhat.com>; Wed, 19 Apr 2023 11:54:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7687140C201F; Wed, 19 Apr 2023 11:54:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E8A440C2064
 for <dm-devel@redhat.com>; Wed, 19 Apr 2023 11:54:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F0F9185A794
 for <dm-devel@redhat.com>; Wed, 19 Apr 2023 11:54:29 +0000 (UTC)
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-363-XURsMY90Oh-euHPcCZl0FQ-1; Wed, 19 Apr 2023 07:54:27 -0400
X-MC-Unique: XURsMY90Oh-euHPcCZl0FQ-1
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20230419115424epoutp036e8871096f85169d496c1762c1591ef3~XU_1OOx-b1441414414epoutp03X
 for <dm-devel@redhat.com>; Wed, 19 Apr 2023 11:54:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20230419115424epoutp036e8871096f85169d496c1762c1591ef3~XU_1OOx-b1441414414epoutp03X
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTP id
 20230419115423epcas5p3d11042d1fddaa2d996a66cf0e54c249c~XU_0omp3r1237612376epcas5p3k;
 Wed, 19 Apr 2023 11:54:23 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.176]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4Q1fMx6y6nz4x9Pp; Wed, 19 Apr
 2023 11:54:21 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 08.04.09987.D66DF346; Wed, 19 Apr 2023 20:54:21 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20230419114656epcas5p404001300c41f5bbd02362edd45d3ff45~XU4Tyt2ZZ2617926179epcas5p4l;
 Wed, 19 Apr 2023 11:46:56 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230419114656epsmtrp1771dce5179207bae5b16d284e5fb97f7~XU4Tw9-Ct1675116751epsmtrp1k;
 Wed, 19 Apr 2023 11:46:56 +0000 (GMT)
X-AuditID: b6c32a4b-a67fd70000002703-02-643fd66d3513
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 84.83.08609.0B4DF346; Wed, 19 Apr 2023 20:46:56 +0900 (KST)
Received: from green245.sa.corp.samsungelectronics.net (unknown
 [107.99.41.245]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230419114652epsmtip18947edad37a475338f9d05db3d5bb2ea~XU4QiJJVw2332323323epsmtip1Y;
 Wed, 19 Apr 2023 11:46:52 +0000 (GMT)
From: Nitesh Shetty <nj.shetty@samsung.com>
To: Jens Axboe <axboe@kernel.dk>, Alasdair Kergon <agk@redhat.com>, Mike
 Snitzer <snitzer@kernel.org>, dm-devel@redhat.com, Keith Busch
 <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg
 <sagi@grimberg.me>, James Smart <james.smart@broadcom.com>, Chaitanya
 Kulkarni <kch@nvidia.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>
Date: Wed, 19 Apr 2023 17:13:06 +0530
Message-Id: <20230419114320.13674-2-nj.shetty@samsung.com>
In-Reply-To: <20230419114320.13674-1-nj.shetty@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Te0xTVxzHPfeW28JSd3mYHTFutYsoEKCFUg7Iy4nkbswM45gLumFDb4BQ
 2qYtVHAZINMoKmWiPAoDHRsqgsTyCK/iVgZSHiHCxMGCuAUYIBSEiQPHHKVl87/P75vv7/we
 Jz8W7pDNdGYlSFW0QiqScAk7RkO7q5tH0lCImFc1LUQ13Z04Op27hqPboxoCPW1fBCh/YQVH
 T+6FIL2p2AYN/9CEodZvL2Po1u0ODLVcf4ahjldzBLpsGAJo4qEWQ/oRd9SqNzLQYHMJgcoq
 JpjIkJeFocbxTIAaXpbh6M7TeQbqGtmB+tfu24RCavDnCEo71kdQTdpRJtX/+C6DGuxLpnSV
 5wmq9rt0qmU4g6AuZZkIar7tIUHl1FUCqrbnFLWke5vSjc9hkVujEwPjaZGYVnBoaaxMnCCN
 C+JGHIk5EOMr5PE9+P7Ij8uRipLoIG7Yh5Ee4QmS9Q1wOSkiSfK6FClSKrlewYEKWbKK5sTL
 lKogLi0XS+QCuadSlKRMlsZ5SmlVAJ/H8/ZdN55IjJ/46VeG/J+PTtaXVuAZoOJANrBlQVIA
 n+fX49nAjuVAtgCoHx0AlmARwNVvjNZgCcCxmSmwmbLU1840swPZDOCFB4cspjMYXLqywsgG
 LBZBusOeVyyz7kSexeGzifMMc4CTAxj8u24eN5scycOwoc3W/BCD3A2NNQWEWWaTATBjOcqM
 kPSCmjF7s8OW3AdvtOXhZmaT9tBYNM4wM06+A7PqizcmgGS5LbyZW8uw9BkGB3pnCQs7wpn7
 dUwLO8NpzVkrq+GtKzcJS/JXAGofaa1DhsAz3ZqNNnHSFdY0e1nknfBq9x3MUngrvPRyHLPo
 bNhYusnvwqqaa9a62+HQi0wrU3B68px1oTkAlk/Wg1zA0b42kPa1gbT/l74G8EqwnZYrk+Jo
 pa/cR0qr//vkWFmSDmwchVtEI/j9yYKnAWAsYACQhXOd2L0HA8QObLEoNY1WyGIUyRJaaQC+
 6/v+GnfeFitbvyqpKoYv8OcJhEKhwN9HyOe+xd4TZIx1IONEKjqRpuW0YjMPY9k6Z2Dw6AfK
 kh9HBabqmi7183S7LaH95YHfF3+ZMulC37u4u2P5xbaIzjdXo0rpczfozvo3/prtGz0SXlVm
 Uh89wEyJKNDuUv8yQ7435bJXvwZ+a36/5zCxay5NsSMq3hCWp15w9z75mfiYX93+Tx+stf4J
 jfoLTQEDRe681WN1A49Cy3p8gneash+f9ujlVEe7cw6mmSQ2nNmoVJAuLtyrcLIp92jV9KiH
 0cyprkJdoUZRsPJJjumLHPXixauex8NEATBwdSIzt9bbMdq0Zc/8xw37F6qv77OJ8Z4qHqGV
 xbp+/9T8xM95kj+KvGFwSfjxQp591PLdaD9XlxPhkkOTmcVz6VyGMl7Ed8MVStG/Hza31Z0E
 AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02Ra0hTYRjHfc85Ox7NyWlJvWUqzRY1m3aj3tQy6cIhCUsoKCIdenCWznGm
 3aXVsGh2sUyjKdnVy4pmM0Pz2tR0mRg5i1xzRq6bNS1NE1NrWtC33/P8/n+eDw+FCx4Tc6gE
 eQrLyaWJQtKdeFgv9JWUmMPilliHeUj/9AmOTmSO4eiO9TyJeuu/A5TTP4Kj7towVO3I5aHX
 dRUYqrpxEUPFdxoxVHn9G4YaJ76S6KLxJUD2Di2GqjsDUFW1iUDtj/JIlF9gd0XGLDWGynuO
 A/RwNB9H93r7CNTc6Y3axpp46yDTbo5gtLZWkqnQWl2Ztq77BNPemsoYdKdJpvTWMabytYpk
 zqodJNNX00Ey5x7oAFPacoQZMPgyhp6v2FbPXe6hcWxiwn6WC1ob4y6zN1gIxXjkwbKrBbgK
 FKzXADcK0ivgQGu9qwa4UwK6HMCRTzZySsyGBWMN+BTPgMXjH/6G1BgczqjANICiSDoAtkxQ
 zr0XnYnDFzYV6RxwuhuDbR8Gec72DDoSvnpTN8kELYIm/WXSWebTwVA1tN2JkA6C523TnQk3
 OgQW1mRN3hX8SZwxjgMn8+np0HSlh3AyTvtBdVkunglo7X9K+5+6BjAdmM0qlEnxScqlimVy
 9kCgUpqkTJXHB8YmJxnA5JfF4nJQpesPNAKMAkYAKVzoxX+2MThOwI+THjrMcsnRXGoiqzQC
 b4oQzuI/15iiBXS8NIXdx7IKlvtnMcptjgorlK2MGlpw05DReGrfyFDtoCn7TLYPx48Q+Rbp
 FV2l8/sWea7p59I0tVhT5ar6cEP0xiJC/z71pLalWeKxYq5IXWpefYURF4fHmshtsm0u8nCX
 wCBevuhA1x6/vjYrlxjT+EuUvGPTPL8NrWHbbSHv4lfvWVJnjtmc4xvuKbj74MimZDJz56jZ
 Mo260PDj7JvcUQ9Xo49lt9U/5ZKj5Pno59Cbu0oaFt7o/NLxSHnwWhr3rgjlJfhdL7y6ZRYf
 s3j07n6L63GtS9RPWZZ/pdRut0j2fmTrlqdHHDKI02PW6BzdRGTUzMhQk6TM3y645cgb7824
 3Xy0mxhYLDk9USsklDLpUjHOKaW/AY/X4BpUAwAA
X-CMS-MailID: 20230419114656epcas5p404001300c41f5bbd02362edd45d3ff45
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230419114656epcas5p404001300c41f5bbd02362edd45d3ff45
References: <20230419114320.13674-1-nj.shetty@samsung.com>
 <CGME20230419114656epcas5p404001300c41f5bbd02362edd45d3ff45@epcas5p4.samsung.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mailman-Approved-At: Thu, 20 Apr 2023 06:57:04 +0000
Subject: [dm-devel] [PATCH v10 1/9] block: Introduce queue limits for
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
Cc: bvanassche@acm.org, joshi.k@samsung.com, gost.dev@samsung.com,
 anuj20.g@samsung.com, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, ming.lei@redhat.com,
 linux-block@vger.kernel.org, dlemoal@kernel.org,
 Nitesh Shetty <nj.shetty@samsung.com>, linux-fsdevel@vger.kernel.org,
 nitheshshetty@gmail.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add device limits as sysfs entries,
        - copy_offload (RW)
        - copy_max_bytes (RW)
        - copy_max_bytes_hw (RO)

Above limits help to split the copy payload in block layer.
copy_offload: used for setting copy offload(1) or emulation(0).
copy_max_bytes: maximum total length of copy in single payload.
copy_max_bytes_hw: Reflects the device supported maximum limit.

Reviewed-by: Hannes Reinecke <hare@suse.de>
Signed-off-by: Nitesh Shetty <nj.shetty@samsung.com>
Signed-off-by: Kanchan Joshi <joshi.k@samsung.com>
Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
---
 Documentation/ABI/stable/sysfs-block | 33 ++++++++++++++
 block/blk-settings.c                 | 24 +++++++++++
 block/blk-sysfs.c                    | 64 ++++++++++++++++++++++++++++
 include/linux/blkdev.h               | 12 ++++++
 include/uapi/linux/fs.h              |  3 ++
 5 files changed, 136 insertions(+)

diff --git a/Documentation/ABI/stable/sysfs-block b/Documentation/ABI/stable/sysfs-block
index c57e5b7cb532..e4d31132f77c 100644
--- a/Documentation/ABI/stable/sysfs-block
+++ b/Documentation/ABI/stable/sysfs-block
@@ -155,6 +155,39 @@ Description:
 		last zone of the device which may be smaller.
 
 
+What:		/sys/block/<disk>/queue/copy_offload
+Date:		April 2023
+Contact:	linux-block@vger.kernel.org
+Description:
+		[RW] When read, this file shows whether offloading copy to a
+		device is enabled (1) or disabled (0). Writing '0' to this
+		file will disable offloading copies for this device.
+		Writing any '1' value will enable this feature. If the device
+		does not support offloading, then writing 1, will result in
+		error.
+
+
+What:		/sys/block/<disk>/queue/copy_max_bytes
+Date:		April 2023
+Contact:	linux-block@vger.kernel.org
+Description:
+		[RW] This is the maximum number of bytes, that the block layer
+		will allow for copy request. This will be smaller or equal to
+		the maximum size allowed by the hardware, indicated by
+		'copy_max_bytes_hw'. Attempt to set value higher than
+		'copy_max_bytes_hw' will truncate this to 'copy_max_bytes_hw'.
+
+
+What:		/sys/block/<disk>/queue/copy_max_bytes_hw
+Date:		April 2023
+Contact:	linux-block@vger.kernel.org
+Description:
+		[RO] This is the maximum number of bytes, that the hardware
+		will allow in a single data copy request.
+		A value of 0 means that the device does not support
+		copy offload.
+
+
 What:		/sys/block/<disk>/queue/crypto/
 Date:		February 2022
 Contact:	linux-block@vger.kernel.org
diff --git a/block/blk-settings.c b/block/blk-settings.c
index 896b4654ab00..23aff2d4dcba 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -59,6 +59,8 @@ void blk_set_default_limits(struct queue_limits *lim)
 	lim->zoned = BLK_ZONED_NONE;
 	lim->zone_write_granularity = 0;
 	lim->dma_alignment = 511;
+	lim->max_copy_sectors_hw = 0;
+	lim->max_copy_sectors = 0;
 }
 
 /**
@@ -82,6 +84,8 @@ void blk_set_stacking_limits(struct queue_limits *lim)
 	lim->max_dev_sectors = UINT_MAX;
 	lim->max_write_zeroes_sectors = UINT_MAX;
 	lim->max_zone_append_sectors = UINT_MAX;
+	lim->max_copy_sectors_hw = ULONG_MAX;
+	lim->max_copy_sectors = ULONG_MAX;
 }
 EXPORT_SYMBOL(blk_set_stacking_limits);
 
@@ -183,6 +187,22 @@ void blk_queue_max_discard_sectors(struct request_queue *q,
 }
 EXPORT_SYMBOL(blk_queue_max_discard_sectors);
 
+/**
+ * blk_queue_max_copy_sectors_hw - set max sectors for a single copy payload
+ * @q:  the request queue for the device
+ * @max_copy_sectors: maximum number of sectors to copy
+ **/
+void blk_queue_max_copy_sectors_hw(struct request_queue *q,
+		unsigned int max_copy_sectors)
+{
+	if (max_copy_sectors > (COPY_MAX_BYTES >> SECTOR_SHIFT))
+		max_copy_sectors = COPY_MAX_BYTES >> SECTOR_SHIFT;
+
+	q->limits.max_copy_sectors_hw = max_copy_sectors;
+	q->limits.max_copy_sectors = max_copy_sectors;
+}
+EXPORT_SYMBOL_GPL(blk_queue_max_copy_sectors_hw);
+
 /**
  * blk_queue_max_secure_erase_sectors - set max sectors for a secure erase
  * @q:  the request queue for the device
@@ -578,6 +598,10 @@ int blk_stack_limits(struct queue_limits *t, struct queue_limits *b,
 	t->max_segment_size = min_not_zero(t->max_segment_size,
 					   b->max_segment_size);
 
+	t->max_copy_sectors = min(t->max_copy_sectors, b->max_copy_sectors);
+	t->max_copy_sectors_hw = min(t->max_copy_sectors_hw,
+						b->max_copy_sectors_hw);
+
 	t->misaligned |= b->misaligned;
 
 	alignment = queue_limit_alignment_offset(b, start);
diff --git a/block/blk-sysfs.c b/block/blk-sysfs.c
index a64208583853..826ab29beba3 100644
--- a/block/blk-sysfs.c
+++ b/block/blk-sysfs.c
@@ -212,6 +212,63 @@ static ssize_t queue_discard_zeroes_data_show(struct request_queue *q, char *pag
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
+	s64 copy_offload;
+	ssize_t ret = queue_var_store64(&copy_offload, page);
+
+	if (ret < 0)
+		return ret;
+
+	if (copy_offload && !q->limits.max_copy_sectors_hw)
+		return -EINVAL;
+
+	if (copy_offload)
+		blk_queue_flag_set(QUEUE_FLAG_COPY, q);
+	else
+		blk_queue_flag_clear(QUEUE_FLAG_COPY, q);
+
+	return count;
+}
+
+static ssize_t queue_copy_max_hw_show(struct request_queue *q, char *page)
+{
+	return sprintf(page, "%llu\n", (unsigned long long)
+			q->limits.max_copy_sectors_hw << SECTOR_SHIFT);
+}
+
+static ssize_t queue_copy_max_show(struct request_queue *q, char *page)
+{
+	return sprintf(page, "%llu\n", (unsigned long long)
+			q->limits.max_copy_sectors << SECTOR_SHIFT);
+}
+
+static ssize_t queue_copy_max_store(struct request_queue *q,
+				       const char *page, size_t count)
+{
+	s64 max_copy;
+	ssize_t ret = queue_var_store64(&max_copy, page);
+
+	if (ret < 0)
+		return ret;
+
+	if (max_copy & (queue_logical_block_size(q) - 1))
+		return -EINVAL;
+
+	max_copy >>= SECTOR_SHIFT;
+	if (max_copy > q->limits.max_copy_sectors_hw)
+		max_copy = q->limits.max_copy_sectors_hw;
+
+	q->limits.max_copy_sectors = max_copy;
+	return count;
+}
+
 static ssize_t queue_write_same_max_show(struct request_queue *q, char *page)
 {
 	return queue_var_show(0, page);
@@ -590,6 +647,10 @@ QUEUE_RO_ENTRY(queue_nr_zones, "nr_zones");
 QUEUE_RO_ENTRY(queue_max_open_zones, "max_open_zones");
 QUEUE_RO_ENTRY(queue_max_active_zones, "max_active_zones");
 
+QUEUE_RW_ENTRY(queue_copy_offload, "copy_offload");
+QUEUE_RO_ENTRY(queue_copy_max_hw, "copy_max_bytes_hw");
+QUEUE_RW_ENTRY(queue_copy_max, "copy_max_bytes");
+
 QUEUE_RW_ENTRY(queue_nomerges, "nomerges");
 QUEUE_RW_ENTRY(queue_rq_affinity, "rq_affinity");
 QUEUE_RW_ENTRY(queue_poll, "io_poll");
@@ -637,6 +698,9 @@ static struct attribute *queue_attrs[] = {
 	&queue_discard_max_entry.attr,
 	&queue_discard_max_hw_entry.attr,
 	&queue_discard_zeroes_data_entry.attr,
+	&queue_copy_offload_entry.attr,
+	&queue_copy_max_hw_entry.attr,
+	&queue_copy_max_entry.attr,
 	&queue_write_same_max_entry.attr,
 	&queue_write_zeroes_max_entry.attr,
 	&queue_zone_append_max_entry.attr,
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index e3242e67a8e3..200338f2ec2e 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -298,6 +298,9 @@ struct queue_limits {
 	unsigned int		discard_alignment;
 	unsigned int		zone_write_granularity;
 
+	unsigned long		max_copy_sectors_hw;
+	unsigned long		max_copy_sectors;
+
 	unsigned short		max_segments;
 	unsigned short		max_integrity_segments;
 	unsigned short		max_discard_segments;
@@ -564,6 +567,7 @@ struct request_queue {
 #define QUEUE_FLAG_NOWAIT       29	/* device supports NOWAIT */
 #define QUEUE_FLAG_SQ_SCHED     30	/* single queue style io dispatch */
 #define QUEUE_FLAG_SKIP_TAGSET_QUIESCE	31 /* quiesce_tagset skip the queue*/
+#define QUEUE_FLAG_COPY		32	/* supports copy offload */
 
 #define QUEUE_FLAG_MQ_DEFAULT	((1UL << QUEUE_FLAG_IO_STAT) |		\
 				 (1UL << QUEUE_FLAG_SAME_COMP) |	\
@@ -584,6 +588,7 @@ bool blk_queue_flag_test_and_set(unsigned int flag, struct request_queue *q);
 	test_bit(QUEUE_FLAG_STABLE_WRITES, &(q)->queue_flags)
 #define blk_queue_io_stat(q)	test_bit(QUEUE_FLAG_IO_STAT, &(q)->queue_flags)
 #define blk_queue_add_random(q)	test_bit(QUEUE_FLAG_ADD_RANDOM, &(q)->queue_flags)
+#define blk_queue_copy(q)	test_bit(QUEUE_FLAG_COPY, &(q)->queue_flags)
 #define blk_queue_zone_resetall(q)	\
 	test_bit(QUEUE_FLAG_ZONE_RESETALL, &(q)->queue_flags)
 #define blk_queue_dax(q)	test_bit(QUEUE_FLAG_DAX, &(q)->queue_flags)
@@ -902,6 +907,8 @@ extern void blk_queue_chunk_sectors(struct request_queue *, unsigned int);
 extern void blk_queue_max_segments(struct request_queue *, unsigned short);
 extern void blk_queue_max_discard_segments(struct request_queue *,
 		unsigned short);
+extern void blk_queue_max_copy_sectors_hw(struct request_queue *q,
+		unsigned int max_copy_sectors);
 void blk_queue_max_secure_erase_sectors(struct request_queue *q,
 		unsigned int max_sectors);
 extern void blk_queue_max_segment_size(struct request_queue *, unsigned int);
@@ -1221,6 +1228,11 @@ static inline unsigned int bdev_discard_granularity(struct block_device *bdev)
 	return bdev_get_queue(bdev)->limits.discard_granularity;
 }
 
+static inline unsigned int bdev_max_copy_sectors(struct block_device *bdev)
+{
+	return bdev_get_queue(bdev)->limits.max_copy_sectors;
+}
+
 static inline unsigned int
 bdev_max_secure_erase_sectors(struct block_device *bdev)
 {
diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
index b7b56871029c..8879567791fa 100644
--- a/include/uapi/linux/fs.h
+++ b/include/uapi/linux/fs.h
@@ -64,6 +64,9 @@ struct fstrim_range {
 	__u64 minlen;
 };
 
+/* maximum total copy length */
+#define COPY_MAX_BYTES	(1 << 27)
+
 /* extent-same (dedupe) ioctls; these MUST match the btrfs ioctl definitions */
 #define FILE_DEDUPE_RANGE_SAME		0
 #define FILE_DEDUPE_RANGE_DIFFERS	1
-- 
2.35.1.500.gb896f729e2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

