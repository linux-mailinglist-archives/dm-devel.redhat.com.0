Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 470213B5BC0
	for <lists+dm-devel@lfdr.de>; Mon, 28 Jun 2021 11:53:14 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-fhg_RupLM3-9ahYNFieUwQ-1; Mon, 28 Jun 2021 05:53:10 -0400
X-MC-Unique: fhg_RupLM3-9ahYNFieUwQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1D715074B;
	Mon, 28 Jun 2021 09:53:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A6B71AC77;
	Mon, 28 Jun 2021 09:53:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 241B41801258;
	Mon, 28 Jun 2021 09:53:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15S9qoA0009225 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 28 Jun 2021 05:52:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1D0FA215CDD4; Mon, 28 Jun 2021 09:52:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1796C215CDD3
	for <dm-devel@redhat.com>; Mon, 28 Jun 2021 09:52:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3DD7F8007BB
	for <dm-devel@redhat.com>; Mon, 28 Jun 2021 09:52:47 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-371-N5tudrdBNlucfDWxpQGMWw-1; Mon, 28 Jun 2021 05:52:35 -0400
X-MC-Unique: N5tudrdBNlucfDWxpQGMWw-1
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128
	bits)) (No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4049720250;
	Mon, 28 Jun 2021 09:52:33 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
	by imap.suse.de (Postfix) with ESMTP id 9CEE911906;
	Mon, 28 Jun 2021 09:52:32 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
	id GAeyJOCb2WAqagAALh3uQQ
	(envelope-from <mwilck@suse.com>); Mon, 28 Jun 2021 09:52:32 +0000
From: mwilck@suse.com
To: Mike Snitzer <snitzer@redhat.com>, Alasdair G Kergon <agk@redhat.com>,
	Bart Van Assche <Bart.VanAssche@sandisk.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-scsi@vger.kernel.org, dm-devel@redhat.com,
	Hannes Reinecke <hare@suse.de>
Date: Mon, 28 Jun 2021 11:52:09 +0200
Message-Id: <20210628095210.26249-3-mwilck@suse.com>
In-Reply-To: <20210628095210.26249-1-mwilck@suse.com>
References: <20210628095210.26249-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 15S9qoA0009225
X-loop: dm-devel@redhat.com
Cc: Daniel Wagner <dwagner@suse.de>, emilne@redhat.com,
	Martin Wilck <mwilck@suse.com>, linux-block@vger.kernel.org,
	nkoenig@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
	Christoph Hellwig <hch@lst.de>
Subject: [dm-devel] [PATCH v4 2/3] scsi: scsi_ioctl: add
	sg_io_to_blk_status()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

This helper converts the SCSI result in a sg_io_hdr struct to a blk_status_t.
It will be used in the SG_IO code path for dm-multipath. Putting it into
scsi_ioctl.c avoids open-coding SCSI specific code in the dm layer.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 block/scsi_ioctl.c     | 20 ++++++++++++++++++++
 include/linux/blkdev.h |  1 +
 2 files changed, 21 insertions(+)

diff --git a/block/scsi_ioctl.c b/block/scsi_ioctl.c
index 19b63b64ecbc..f226cac02e88 100644
--- a/block/scsi_ioctl.c
+++ b/block/scsi_ioctl.c
@@ -929,6 +929,26 @@ blk_status_t __scsi_result_to_blk_status(int *cmd_result, int result)
 }
 EXPORT_SYMBOL(__scsi_result_to_blk_status);
 
+blk_status_t sg_io_to_blk_status(struct sg_io_hdr *hdr)
+{
+	int result;
+	blk_status_t sts;
+
+	if (!hdr->info & SG_INFO_CHECK)
+		return BLK_STS_OK;
+
+	result = hdr->status |
+		(hdr->msg_status << 8) |
+		(hdr->host_status << 16) |
+		(hdr->driver_status << 24);
+
+	sts = __scsi_result_to_blk_status(&result, result);
+	hdr->host_status = host_byte(result);
+
+	return sts;
+}
+EXPORT_SYMBOL(sg_io_to_blk_status);
+
 static int __init blk_scsi_ioctl_init(void)
 {
 	blk_set_cmd_filter_defaults(&blk_default_cmd_filter);
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 48497a77428d..5da03edf125c 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -2022,4 +2022,5 @@ int freeze_bdev(struct block_device *bdev);
 int thaw_bdev(struct block_device *bdev);
 
 blk_status_t __scsi_result_to_blk_status(int *cmd_result, int result);
+blk_status_t sg_io_to_blk_status(struct sg_io_hdr *hdr);
 #endif /* _LINUX_BLKDEV_H */
-- 
2.32.0


--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

