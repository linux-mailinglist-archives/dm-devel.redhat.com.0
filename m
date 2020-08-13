Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 55F03243BE6
	for <lists+dm-devel@lfdr.de>; Thu, 13 Aug 2020 16:48:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597330137;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oxwWHioXqXkdOwu9ICh1He8Zwx8nDL1UWz1434OnbMM=;
	b=cUo/kPot8EugP/4P4I3/suh3UAqWYoSSPv8r0ee0SnCr9O/ZP+34OdqADknGdD2UK9jgzE
	4Sy6KsbPodRkSctjt/DXWEX+2Gdpwlz+NFomEwfxul2kBGNyhw84QAuzfH+QUv3/9FhcpK
	7hkLAfw4WKcENYER/Z1lbWF9BCBLg+M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-lss79PyOOP2roLLYQmuzCg-1; Thu, 13 Aug 2020 10:48:55 -0400
X-MC-Unique: lss79PyOOP2roLLYQmuzCg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1727E800683;
	Thu, 13 Aug 2020 14:48:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 728D360C0F;
	Thu, 13 Aug 2020 14:48:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 42A644EE16;
	Thu, 13 Aug 2020 14:48:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07DEmHwq022031 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 13 Aug 2020 10:48:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E5D03604CA; Thu, 13 Aug 2020 14:48:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FD68600C5;
	Thu, 13 Aug 2020 14:48:12 +0000 (UTC)
Date: Thu, 13 Aug 2020 10:48:11 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Sagi Grimberg <sagi@grimberg.me>
Message-ID: <20200813144811.GA5452@redhat.com>
References: <E3390A8E-D582-47BA-A085-21663D883365@netapp.com>
	<20200806184057.GA27858@redhat.com>
	<20200806191943.GA27868@redhat.com>
	<6B826235-C504-4621-B8F7-34475B200979@netapp.com>
	<20200807000755.GA28957@redhat.com>
	<510f5aff-0437-b1ce-f7ab-c812edbea880@grimberg.me>
	<20200807045015.GA29737@redhat.com>
	<fec745aa-0091-ee1f-cb0f-da9e18cf0aa2@grimberg.me>
	<20200810143620.GA19127@redhat.com>
	<20200810172209.GA19535@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200810172209.GA19535@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: linux-nvme@lists.infradead.org, Christoph Hellwig <hch@infradead.org>,
	dm-devel@redhat.com, Chao Leng <lengchao@huawei.com>,
	Keith Busch <kbusch@kernel.org>, "Meneghini,
	John" <John.Meneghini@netapp.com>, Ewan Milne <emilne@redhat.com>
Subject: [dm-devel] [RESEND PATCH] nvme: explicitly use normal NVMe error
 handling when appropriate
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Commit 764e9332098c0 ("nvme-multipath: do not reset on unknown
status"), among other things, fixed NVME_SC_CMD_INTERRUPTED error
handling by changing multipathing's nvme_failover_req() to short-circuit
path failover and then fallback to NVMe's normal error handling (which
takes care of NVME_SC_CMD_INTERRUPTED).

This detour through native NVMe multipathing code is unwelcome because
it prevents NVMe core from handling NVME_SC_CMD_INTERRUPTED independent
of any multipathing concerns.

Introduce nvme_status_needs_local_error_handling() to prioritize
non-failover retry, when appropriate, in terms of normal NVMe error
handling.  nvme_status_needs_local_error_handling() will naturely evolve
to include handling of any other errors that normal error handling must
be used for.

nvme_failover_req()'s ability to fallback to normal NVMe error handling
has been preserved because it may be useful for future NVME_SC that
nvme_status_needs_local_error_handling() hasn't been trained for yet.

Signed-off-by: Mike Snitzer <snitzer@redhat.com>
---
 drivers/nvme/host/core.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 88cff309d8e4..be749b690af7 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -252,6 +252,16 @@ static inline bool nvme_req_needs_retry(struct request *req)
 	return true;
 }
 
+static inline bool nvme_status_needs_local_error_handling(u16 status)
+{
+	switch (status & 0x7ff) {
+	case NVME_SC_CMD_INTERRUPTED:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static void nvme_retry_req(struct request *req)
 {
 	struct nvme_ns *ns = req->q->queuedata;
@@ -270,7 +280,8 @@ static void nvme_retry_req(struct request *req)
 
 void nvme_complete_rq(struct request *req)
 {
-	blk_status_t status = nvme_error_status(nvme_req(req)->status);
+	u16 nvme_status = nvme_req(req)->status;
+	blk_status_t status = nvme_error_status(nvme_status);
 
 	trace_nvme_complete_rq(req);
 
@@ -280,7 +291,8 @@ void nvme_complete_rq(struct request *req)
 		nvme_req(req)->ctrl->comp_seen = true;
 
 	if (unlikely(status != BLK_STS_OK && nvme_req_needs_retry(req))) {
-		if ((req->cmd_flags & REQ_NVME_MPATH) && nvme_failover_req(req))
+		if (!nvme_status_needs_local_error_handling(nvme_status) &&
+		    (req->cmd_flags & REQ_NVME_MPATH) && nvme_failover_req(req))
 			return;
 
 		if (!blk_queue_dying(req->q)) {
-- 
2.18.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

