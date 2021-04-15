Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 039323615DF
	for <lists+dm-devel@lfdr.de>; Fri, 16 Apr 2021 01:12:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618528336;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MUPL2ADP/vDd8fmxwKvnv7TpXVelOVwU3+Z5Th5SO3c=;
	b=Khub2e6AwdEDan07ODRYyNzKEpI4VYGIfvSNqOkr0fgoNXTHmAm6zzd2e5McqvPx0eTBtk
	l+AwPtII/k4GTd5pfVsFunwwzjlPg43qhHt2Fb5TL3Ho4AE4w6k41R3P8S0x0E+24x7M9L
	IAEMW4ZwCtaWfvgSaLx2koJxCLe+8bE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-fLO6lbobMIuewSDNg54Cwg-1; Thu, 15 Apr 2021 19:12:13 -0400
X-MC-Unique: fLO6lbobMIuewSDNg54Cwg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E3778030CA;
	Thu, 15 Apr 2021 23:12:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 12F4A694CD;
	Thu, 15 Apr 2021 23:12:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E03ED44A5E;
	Thu, 15 Apr 2021 23:12:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13FNBwgY010822 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 15 Apr 2021 19:11:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 50ADC19C93; Thu, 15 Apr 2021 23:11:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (thegoat.4a2m.lab.eng.bos.redhat.com [10.16.209.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C13DB50C0D;
	Thu, 15 Apr 2021 23:11:51 +0000 (UTC)
From: Mike Snitzer <snitzer@redhat.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Date: Thu, 15 Apr 2021 19:11:26 -0400
Message-Id: <20210415231126.8746-4-snitzer@redhat.com>
In-Reply-To: <20210415231126.8746-1-snitzer@redhat.com>
References: <20210415231126.8746-1-snitzer@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	linux-nvme@lists.infradead.org
Subject: [dm-devel] nvme: allow retry for requests with
	REQ_FAILFAST_TRANSPORT set
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

BZ: 1948690
Upstream Status: RHEL-only

Signed-off-by: Mike Snitzer <snitzer@redhat.com>

rhel-8.git commit 7dadadb072515f243868e6fe2f7e9c97fd3516c9
Author: Mike Snitzer <snitzer@redhat.com>
Date:   Tue Aug 25 21:52:48 2020 -0400

    [nvme] nvme: allow retry for requests with REQ_FAILFAST_TRANSPORT set
    
    Message-id: <20200825215248.2291-11-snitzer@redhat.com>
    Patchwork-id: 325180
    Patchwork-instance: patchwork
    O-Subject: [RHEL8.3 PATCH 10/10] nvme: allow retry for requests with REQ_FAILFAST_TRANSPORT set
    Bugzilla: 1843515
    RH-Acked-by: David Milburn <dmilburn@redhat.com>
    RH-Acked-by: Gopal Tiwari <gtiwari@redhat.com>
    RH-Acked-by: Ewan Milne <emilne@redhat.com>
    
    BZ: 1843515
    Upstream Status: RHEL-only
    
    Based on patch that was proposed upstream but ultimately rejected, see:
    https://www.spinics.net/lists/linux-block/msg57490.html
    
    I'd have made this change even if this wasn't already posted obviously,
    but I figured I'd give proper attribution due to their public post with
    the same code change.
    
    Author: Chao Leng <lengchao@huawei.com>
    Date:   Wed Aug 12 16:18:55 2020 +0800
    
        nvme: allow retry for requests with REQ_FAILFAST_TRANSPORT set
    
        REQ_FAILFAST_TRANSPORT may be designed for SCSI, because SCSI protocol
        does not define the local retry mechanism. SCSI implements a fuzzy
        local retry mechanism, so REQ_FAILFAST_TRANSPORT is needed to allow
        higher-level multipathing software to perform failover/retry.
    
        NVMe is different with SCSI about this. It defines a local retry
        mechanism and path error codes, so NVMe should retry local for non
        path error.  If path related error, whether to retry and how to retry
        is still determined by higher-level multipathing's failover.
    
        Unlike SCSI, NVMe shouldn't prevent retry if REQ_FAILFAST_TRANSPORT
        because NVMe's local retry is needed -- as is NVMe specific logic to
        categorize whether an error is path related.
    
        In this way, the mechanism of NVMe multipath or other multipath are
        now equivalent.  The mechanism is: non path related error will be
        retry local, path related error is handled by multipath.
    
        Signed-off-by: Chao Leng <lengchao@huawei.com>
        [snitzer: edited header for grammar and to make clearer]
        Signed-off-by: Mike Snitzer <snitzer@redhat.com>
    
    Signed-off-by: Mike Snitzer <snitzer@redhat.com>
    Signed-off-by: Frantisek Hrbata <fhrbata@redhat.com>

---
 drivers/nvme/host/core.c |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

Index: linux-rhel9/drivers/nvme/host/core.c
===================================================================
--- linux-rhel9.orig/drivers/nvme/host/core.c
+++ linux-rhel9/drivers/nvme/host/core.c
@@ -306,7 +306,14 @@ static inline enum nvme_disposition nvme
 	if (likely(nvme_req(req)->status == 0))
 		return COMPLETE;
 
-	if (blk_noretry_request(req) ||
+	/*
+	 * REQ_FAILFAST_TRANSPORT is set by upper layer software that
+	 * handles multipathing. Unlike SCSI, NVMe's error handling was
+	 * specifically designed to handle local retry for non-path errors.
+	 * As such, allow NVMe's local retry mechanism to be used for
+	 * requests marked with REQ_FAILFAST_TRANSPORT.
+	 */
+	if ((req->cmd_flags & (REQ_FAILFAST_DEV | REQ_FAILFAST_DRIVER)) ||
 	    (nvme_req(req)->status & NVME_SC_DNR) ||
 	    nvme_req(req)->retries >= nvme_max_retries)
 		return COMPLETE;

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

