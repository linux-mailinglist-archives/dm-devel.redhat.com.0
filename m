Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E5F7A76F5
	for <lists+dm-devel@lfdr.de>; Wed, 20 Sep 2023 11:12:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695201178;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qY6FJAtr3vDT5ksa8dn2/xUAmyAzkbiLLbzsDKgws1k=;
	b=f3FdnsUV0cGRKPxCSv7EC705azyDg50shCIaCvfNQLBumltlM3kXWN81rqM3pa1VJwmtKp
	KobNYbdmHxvUATDMS4U5XKzMsN1LqZOTehhK8oNdXP/B88pVOec4uFpAC9yAOI8d2TEMLi
	pUwstNZTbm+QxzEbutI2WWyVd5v/u2c=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-246-9jAu6ir9PgaQZY4o7OLHCw-1; Wed, 20 Sep 2023 05:12:56 -0400
X-MC-Unique: 9jAu6ir9PgaQZY4o7OLHCw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF25F2999B24;
	Wed, 20 Sep 2023 09:12:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D84E721B2414;
	Wed, 20 Sep 2023 09:12:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 93B0A19465BC;
	Wed, 20 Sep 2023 09:12:51 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 38AAC194658D
 for <dm-devel@listman.corp.redhat.com>; Wed, 20 Sep 2023 08:58:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2945740C2070; Wed, 20 Sep 2023 08:58:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 211E240C2064
 for <dm-devel@redhat.com>; Wed, 20 Sep 2023 08:58:26 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-inbound-delivery-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F05EC85A5BA
 for <dm-devel@redhat.com>; Wed, 20 Sep 2023 08:58:25 +0000 (UTC)
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-KhZxDKMfOAeV_x5fHIF0RQ-1; Wed, 20 Sep 2023 04:58:24 -0400
X-MC-Unique: KhZxDKMfOAeV_x5fHIF0RQ-1
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20230920085820epoutp0463aeb55781050554acb97665d96b7ecd~Gj7ErOy_41440014400epoutp04P
 for <dm-devel@redhat.com>; Wed, 20 Sep 2023 08:58:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20230920085820epoutp0463aeb55781050554acb97665d96b7ecd~Gj7ErOy_41440014400epoutp04P
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTP id
 20230920085820epcas5p4fa78683738f322ddb817f1df58b6982a~Gj7D79qxP3151231512epcas5p4f;
 Wed, 20 Sep 2023 08:58:20 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.176]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4RrC9j6QMHz4x9Pt; Wed, 20 Sep
 2023 08:58:17 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
 epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 FC.DA.09638.924BA056; Wed, 20 Sep 2023 17:58:17 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20230920081447epcas5p144e631c5b8c72acf64d38b04d6c2c925~GjVDAC7nW0572005720epcas5p1p;
 Wed, 20 Sep 2023 08:14:47 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230920081447epsmtrp1c88fd41277906975f032cebc403bc6ca~GjVC_bZb12167621676epsmtrp1c;
 Wed, 20 Sep 2023 08:14:47 +0000 (GMT)
X-AuditID: b6c32a4a-92df9700000025a6-6e-650ab429a537
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 83.6C.08649.7F9AA056; Wed, 20 Sep 2023 17:14:47 +0900 (KST)
Received: from green245.sa.corp.samsungelectronics.net (unknown
 [107.99.41.245]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230920081444epsmtip1f712aa7ebd7aae27f666e8b72f0a70fe~GjU-ubyeY0186201862epsmtip1H;
 Wed, 20 Sep 2023 08:14:44 +0000 (GMT)
From: Nitesh Shetty <nj.shetty@samsung.com>
To: Jens Axboe <axboe@kernel.dk>, Jonathan Corbet <corbet@lwn.net>, Alasdair
 Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 dm-devel@redhat.com, Keith Busch <kbusch@kernel.org>, Christoph Hellwig
 <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni
 <kch@nvidia.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian
 Brauner <brauner@kernel.org>
Date: Wed, 20 Sep 2023 13:37:40 +0530
Message-Id: <20230920080756.11919-4-nj.shetty@samsung.com>
In-Reply-To: <20230920080756.11919-1-nj.shetty@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Te1BUVRzHO/fu3t2lAS4P84AT4HWygHgssnhAUFHKOz0ZGvujrGWDG9Au
 u9veXUGaCiEoIAE1HFgIDYh4GBAPZ2EBBZINhNEGgUBRZHZT4pUQWoNIuyyU/33O9/f+nfnx
 cceTPFd+glzNqOQSGUXYcC70eHr5eDbbMP5LVUJU39+Lo/vLKxyUlr+Ko9qJPALN9CwCZLz0
 JUAd88VcNHapFUPtZacwVF17GUOnukcAMg1rMdQx7o2+y6zgoPaOPg4aaish0NlKEw/ljOoI
 9IPhMYZ+yzcBpDMeB+jCylkc1c0scNAv49vQ1VUDd78L3aqd4NFXb/3EoYcGNXRjTRZBN1V8
 TuvHUgm6PPc0lz6RPk/Q903jHHqhc5igc5trAN105RN6qdGNbjTOYZF270hD4xlJLKPyYOQx
 itgEeVwY9epb4oNiUZC/0EcYjHZTHnJJIhNGRbwW6fNygsy8CMrjqESmMUuREpal/PaGqhQa
 NeMRr2DVYRSjjJUpA5W+rCSR1cjjfOWMOkTo7x8gMjtGS+Oz6w4pb+9LbhrRgVQwtSsbCPiQ
 DITTxh6uhR1JPYBj7W7ZwMbMiwC26yeB9fEAwN6Gu9hmxMzXuYTV0AFgweOODa8MDKbPmnjZ
 gM8nSG94ZY1v0Z3JVBw26MvXnXCyFIdNU4b1VE5kCGybXlkvziGfg+f/nuNZ2NasZy2nAUsi
 SPrBvNsOFllA7oFLFaMbLg6wr8jIsTBOusP0lmLckh+SxQJYvVzHtbYaAW/0b7btBP8wNPOs
 7Aqn8zI3OAlWf1NFWIO/AFA7qgVWwz6Y0Z+HW5rASU9Y3+ZnlZ+FBf11mLWwHTyxYtzIbwt1
 pZu8A56vP0dY2QWOPDy+wTQczPgZty47F8CqNbd84KF9Yh7tE/No/698DuA1wIVRsolxDCtS
 BsiZpP8+OUaR2AjWb8PrFR24M/mnbzfA+KAbQD5OOdsm7rRhHG1jJcdSGJVCrNLIGLYbiMz7
 Pom7bolRmI9LrhYLA4P9A4OCggKDdwUJqa22MxnfxjqScRI1I2UYJaPajMP4AtdUzLn3DbvC
 l3CuYVCruznQ0leirCTsDlAthwuZ1rLDAVL6+QdpLyQbBkwT0U9562ZM28cXimb3Hxn7eLZV
 2pXm7n5TwcTUhrcMdQ13OvV/JZIllHEpwtPebudHC7PhAW5bZ/U1Y1PlGrVojbHPzhrKXXz/
 s/zySKctH0Qse9knsfnvRvUuvP1Mq/o6W/I0OR7/3sXSqgNR934UnKls2/Ni6D3uX9tDi/0S
 xDGuv2apRB9eji7sPBaylsUcPJpMnE55M0cebl9kKiX2wt15Odfn6i42iHd03SpYTY/+586N
 lNfv+n1vmnyERWUe+VRAZTx0+H3u0fyS6JrUIa2hSj+6bSB1+hrFYeMlQi9cxUr+BW8EKCWk
 BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02Re0hTYRjG+c45nh2Xi+MU/MxYNbuIljYs+Miu0OUrgqLCQEJbelLTzXE2
 S43KNro4y2tEbsa6iOEsLTXZNC1my9JCw7IUUqyJ1VBTG0XLVdOC/nt4fr/3+edlSHE7NY9J
 VWo4XilPl9JCqrFNKlnxrUrIrdT1SlBtxxMSTbjcFNIWTZOo+l0hjZxtkwA5Hp0DqGXM6IP6
 HlkJ9OBGCYGqqu0EKrH1AjT82kCglv4IdP1sBYUetDyjUE9TOY1MlcMClP/GQqNb7R4CvS0a
 BsjiOA1Qo9tEohrnOIWe9oegrul2n43B2Gp4J8BdA/co3PMiE9eZ82hcX3EKN/fl0vhmQakP
 vqgbo/HEcD+Fx1tf07igwQxwfedxPFUnwXWOUWL33Djh2iQuPfUox0etPyhM0ddsUw1uyKrv
 tYBc8D5aD3wZyK6CzgsFtB4IGTHbDODEpbc+syAYVk4/JmdzAKzyjAhmJR0Bf3ZPEnrAMDQb
 ATt/Md4+kNWTMM86RnkPSPY2CRuuirw5gF0Dmz65Z0Ypdgm8/X1U4M2iP32eSwu8O5CNgoWD
 /t7al42BUxVvZhTxH6Wz2/RX94fPyhx/5xdA3X0jWQRYw3/I8B+6BggzCOZUakWyIlGmkim5
 Y5FquUKdqUyOTMxQ1IGZX4eHWcCAyRNpAwQDbAAypDRQpFgq5MSiJHl2DsdnJPCZ6ZzaBkIY
 Shokkl0xJonZZLmGS+M4Fcf/owTjOy+XKNmkXWBuOOTU7T+xOt70qepkRvn8WhOzVVwQ88KY
 s1kk7pkT1vUjxq/tln9KWIdn15eoVoOxVZtduiNoIRs9pGvuupwpEfdZs0K2R2/U5o+fANER
 UvA9qeMjjH0+EDvfFbQXF8ske9yLXrZc31Ws1djLz6PEQFZkKnx4wBVq78Ej/k2+ZSFrD59y
 8tzPOyMa14Rn4Toy4f6XnSOjCc2LlYWqpx9C7/L2scp0gdUTEFTstJ4sffixNzk+li0/GmVz
 Tx1vnHIsw34bnFrwypKmW2rOIJfn24/wfkMaghsP2/eKuXqmLxQbcvDolbmLur9+jiizC7fE
 rS/V8tVSSp0il4WTvFr+G73wPy1aAwAA
X-CMS-MailID: 20230920081447epcas5p144e631c5b8c72acf64d38b04d6c2c925
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230920081447epcas5p144e631c5b8c72acf64d38b04d6c2c925
References: <20230920080756.11919-1-nj.shetty@samsung.com>
 <CGME20230920081447epcas5p144e631c5b8c72acf64d38b04d6c2c925@epcas5p1.samsung.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [dm-devel] [PATCH v16 03/12] block: add copy offload support
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
Cc: Anuj Gupta <anuj20.g@samsung.com>, anuj1072538@gmail.com,
 martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
 linux-doc@vger.kernel.org, gost.dev@samsung.com, nitheshshetty@gmail.com,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-block@vger.kernel.org, mcgrof@kernel.org, linux-fsdevel@vger.kernel.org,
 Nitesh Shetty <nj.shetty@samsung.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Introduce blkdev_copy_offload to perform copy offload.
Issue REQ_OP_COPY_SRC with source info along with taking a plug.
This flows till request layer and waits for dst bio to arrive.
Issue REQ_OP_COPY_DST with destination info and this bio reaches request
layer and merges with src request.
For any reason, if a request comes to the driver with only one of src/dst
bio, we fail the copy offload.

Larger copy will be divided, based on max_copy_sectors limit.

Reviewed-by: Hannes Reinecke <hare@suse.de>
Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
Signed-off-by: Nitesh Shetty <nj.shetty@samsung.com>
---
 block/blk-lib.c        | 201 +++++++++++++++++++++++++++++++++++++++++
 include/linux/blkdev.h |   4 +
 2 files changed, 205 insertions(+)

diff --git a/block/blk-lib.c b/block/blk-lib.c
index e59c3069e835..50d10fa3c4c5 100644
--- a/block/blk-lib.c
+++ b/block/blk-lib.c
@@ -10,6 +10,22 @@
 
 #include "blk.h"
 
+/* Keeps track of all outstanding copy IO */
+struct blkdev_copy_io {
+	atomic_t refcount;
+	ssize_t copied;
+	int status;
+	struct task_struct *waiter;
+	void (*endio)(void *private, int status, ssize_t copied);
+	void *private;
+};
+
+/* Keeps track of single outstanding copy offload IO */
+struct blkdev_copy_offload_io {
+	struct blkdev_copy_io *cio;
+	loff_t offset;
+};
+
 static sector_t bio_discard_limit(struct block_device *bdev, sector_t sector)
 {
 	unsigned int discard_granularity = bdev_discard_granularity(bdev);
@@ -115,6 +131,191 @@ int blkdev_issue_discard(struct block_device *bdev, sector_t sector,
 }
 EXPORT_SYMBOL(blkdev_issue_discard);
 
+static inline ssize_t blkdev_copy_sanity_check(struct block_device *bdev_in,
+					       loff_t pos_in,
+					       struct block_device *bdev_out,
+					       loff_t pos_out, size_t len)
+{
+	unsigned int align = max(bdev_logical_block_size(bdev_out),
+				 bdev_logical_block_size(bdev_in)) - 1;
+
+	if ((pos_in & align) || (pos_out & align) || (len & align) || !len ||
+	    len >= BLK_COPY_MAX_BYTES)
+		return -EINVAL;
+
+	return 0;
+}
+
+static inline void blkdev_copy_endio(struct blkdev_copy_io *cio)
+{
+	if (cio->endio) {
+		cio->endio(cio->private, cio->status, cio->copied);
+		kfree(cio);
+	} else {
+		struct task_struct *waiter = cio->waiter;
+
+		WRITE_ONCE(cio->waiter, NULL);
+		blk_wake_io_task(waiter);
+	}
+}
+
+/*
+ * This must only be called once all bios have been issued so that the refcount
+ * can only decrease. This just waits for all bios to complete.
+ * Returns the length of bytes copied or error
+ */
+static ssize_t blkdev_copy_wait_io_completion(struct blkdev_copy_io *cio)
+{
+	ssize_t ret;
+
+	for (;;) {
+		__set_current_state(TASK_UNINTERRUPTIBLE);
+		if (!READ_ONCE(cio->waiter))
+			break;
+		blk_io_schedule();
+	}
+	__set_current_state(TASK_RUNNING);
+	ret = cio->copied;
+	kfree(cio);
+
+	return ret;
+}
+
+static void blkdev_copy_offload_dst_endio(struct bio *bio)
+{
+	struct blkdev_copy_offload_io *offload_io = bio->bi_private;
+	struct blkdev_copy_io *cio = offload_io->cio;
+
+	if (bio->bi_status) {
+		cio->copied = min_t(ssize_t, offload_io->offset, cio->copied);
+		if (!cio->status)
+			cio->status = blk_status_to_errno(bio->bi_status);
+	}
+	bio_put(bio);
+
+	if (atomic_dec_and_test(&cio->refcount))
+		blkdev_copy_endio(cio);
+}
+
+/*
+ * @bdev:	block device
+ * @pos_in:	source offset
+ * @pos_out:	destination offset
+ * @len:	length in bytes to be copied
+ * @endio:	endio function to be called on completion of copy operation,
+ *		for synchronous operation this should be NULL
+ * @private:	endio function will be called with this private data,
+ *		for synchronous operation this should be NULL
+ * @gfp_mask:	memory allocation flags (for bio_alloc)
+ *
+ * For synchronous operation returns the length of bytes copied or error
+ * For asynchronous operation returns -EIOCBQUEUED or error
+ *
+ * Description:
+ *	Copy source offset to destination offset within block device, using
+ *	device's native copy offload feature.
+ *	We perform copy operation using 2 bio's.
+ *	1. We take a plug and send a REQ_OP_COPY_SRC bio along with source
+ *	sector and length. Once this bio reaches request layer, we form a
+ *	request and wait for dst bio to arrive.
+ *	2. We issue REQ_OP_COPY_DST bio along with destination sector, length.
+ *	Once this bio reaches request layer and find a request with previously
+ *	sent source info we merge the destination bio and return.
+ *	3. Release the plug and request is sent to driver
+ *	This design works only for drivers with request queue.
+ */
+ssize_t blkdev_copy_offload(struct block_device *bdev, loff_t pos_in,
+			    loff_t pos_out, size_t len,
+			    void (*endio)(void *, int, ssize_t),
+			    void *private, gfp_t gfp)
+{
+	struct blkdev_copy_io *cio;
+	struct blkdev_copy_offload_io *offload_io;
+	struct bio *src_bio, *dst_bio;
+	ssize_t rem, chunk, ret;
+	ssize_t max_copy_bytes = bdev_max_copy_sectors(bdev) << SECTOR_SHIFT;
+	struct blk_plug plug;
+
+	if (!max_copy_bytes)
+		return -EOPNOTSUPP;
+
+	ret = blkdev_copy_sanity_check(bdev, pos_in, bdev, pos_out, len);
+	if (ret)
+		return ret;
+
+	cio = kzalloc(sizeof(*cio), GFP_KERNEL);
+	if (!cio)
+		return -ENOMEM;
+	atomic_set(&cio->refcount, 1);
+	cio->waiter = current;
+	cio->endio = endio;
+	cio->private = private;
+
+	/*
+	 * If there is a error, copied will be set to least successfully
+	 * completed copied length
+	 */
+	cio->copied = len;
+	for (rem = len; rem > 0; rem -= chunk) {
+		chunk = min(rem, max_copy_bytes);
+
+		offload_io = kzalloc(sizeof(*offload_io), GFP_KERNEL);
+		if (!offload_io)
+			goto err_free_cio;
+		offload_io->cio = cio;
+		/*
+		 * For partial completion, we use offload_io->offset to truncate
+		 * successful copy length
+		 */
+		offload_io->offset = len - rem;
+
+		src_bio = bio_alloc(bdev, 0, REQ_OP_COPY_SRC, gfp);
+		if (!src_bio)
+			goto err_free_offload_io;
+		src_bio->bi_iter.bi_size = chunk;
+		src_bio->bi_iter.bi_sector = pos_in >> SECTOR_SHIFT;
+
+		blk_start_plug(&plug);
+		dst_bio = blk_next_bio(src_bio, bdev, 0, REQ_OP_COPY_DST, gfp);
+		if (!dst_bio)
+			goto err_free_src_bio;
+		dst_bio->bi_iter.bi_size = chunk;
+		dst_bio->bi_iter.bi_sector = pos_out >> SECTOR_SHIFT;
+		dst_bio->bi_end_io = blkdev_copy_offload_dst_endio;
+		dst_bio->bi_private = offload_io;
+
+		atomic_inc(&cio->refcount);
+		submit_bio(dst_bio);
+		blk_finish_plug(&plug);
+		pos_in += chunk;
+		pos_out += chunk;
+	}
+
+	if (atomic_dec_and_test(&cio->refcount))
+		blkdev_copy_endio(cio);
+	if (cio->endio)
+		return -EIOCBQUEUED;
+
+	return blkdev_copy_wait_io_completion(cio);
+
+err_free_src_bio:
+	bio_put(src_bio);
+err_free_offload_io:
+	kfree(offload_io);
+err_free_cio:
+	cio->copied = min_t(ssize_t, cio->copied, (len - rem));
+	cio->status = -ENOMEM;
+	if (rem == len) {
+		kfree(cio);
+		return cio->status;
+	}
+	if (cio->endio)
+		return cio->status;
+
+	return blkdev_copy_wait_io_completion(cio);
+}
+EXPORT_SYMBOL_GPL(blkdev_copy_offload);
+
 static int __blkdev_issue_write_zeroes(struct block_device *bdev,
 		sector_t sector, sector_t nr_sects, gfp_t gfp_mask,
 		struct bio **biop, unsigned flags)
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 7548f1685ee9..5405499bcf22 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1042,6 +1042,10 @@ int __blkdev_issue_discard(struct block_device *bdev, sector_t sector,
 		sector_t nr_sects, gfp_t gfp_mask, struct bio **biop);
 int blkdev_issue_secure_erase(struct block_device *bdev, sector_t sector,
 		sector_t nr_sects, gfp_t gfp);
+ssize_t blkdev_copy_offload(struct block_device *bdev, loff_t pos_in,
+			    loff_t pos_out, size_t len,
+			    void (*endio)(void *, int, ssize_t),
+			    void *private, gfp_t gfp_mask);
 
 #define BLKDEV_ZERO_NOUNMAP	(1 << 0)  /* do not free blocks */
 #define BLKDEV_ZERO_NOFALLBACK	(1 << 1)  /* don't write explicit zeroes */
-- 
2.35.1.500.gb896f729e2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

