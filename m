Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 088D73615E0
	for <lists+dm-devel@lfdr.de>; Fri, 16 Apr 2021 01:12:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618528339;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rZzKzyCgi21uC5qljCgxv5NbB6bxauL5zYA7wdHybRA=;
	b=JunyGp/xRjUktefA8bi5q3DbLReigCdYoG9oX3VkCv2SFEZk0GmOuwDrPZgR6cTA96wfHv
	3HwqyCLADFV9R82sOjPZyGz2iJOXANpP5egPKub2NFJsO2kBn/wjmyPMkUmN1vv4b6UswJ
	0DDoE+BqnDIfk4Bn/7xkSUiQrSmMIvw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-feIO60QqOkahUtMdMLenxQ-1; Thu, 15 Apr 2021 19:12:16 -0400
X-MC-Unique: feIO60QqOkahUtMdMLenxQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A063F801FCE;
	Thu, 15 Apr 2021 23:12:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8332D60855;
	Thu, 15 Apr 2021 23:12:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 183821806D15;
	Thu, 15 Apr 2021 23:12:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13FNBpih010810 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 15 Apr 2021 19:11:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 201DD3AC0; Thu, 15 Apr 2021 23:11:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (thegoat.4a2m.lab.eng.bos.redhat.com [10.16.209.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 026C25D71F;
	Thu, 15 Apr 2021 23:11:41 +0000 (UTC)
From: Mike Snitzer <snitzer@redhat.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Date: Thu, 15 Apr 2021 19:11:25 -0400
Message-Id: <20210415231126.8746-3-snitzer@redhat.com>
In-Reply-To: <20210415231126.8746-1-snitzer@redhat.com>
References: <20210415231126.8746-1-snitzer@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	linux-nvme@lists.infradead.org
Subject: [dm-devel] nvme: decouple basic ANA log page re-read support from
	native multipathing
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

rhel-8.git commit b904f4b8e0f90613bf1b2b9d9ccad3c015741daf
Author: Mike Snitzer <snitzer@redhat.com>
Date:   Tue Aug 25 21:52:47 2020 -0400

    [nvme] nvme: decouple basic ANA log page re-read support from native multipathing
    
    Message-id: <20200825215248.2291-10-snitzer@redhat.com>
    Patchwork-id: 325179
    Patchwork-instance: patchwork
    O-Subject: [RHEL8.3 PATCH 09/10] nvme: decouple basic ANA log page re-read support from native multipathing
    Bugzilla: 1843515
    RH-Acked-by: David Milburn <dmilburn@redhat.com>
    RH-Acked-by: Gopal Tiwari <gtiwari@redhat.com>
    RH-Acked-by: Ewan Milne <emilne@redhat.com>
    
    BZ: 1843515
    Upstream Status: RHEL-only
    
    Whether or not ANA is present is a choice of the target implementation;
    the host (and whether it supports multipathing) has _zero_ influence on
    this.  If the target declares a path as 'inaccessible' the path _is_
    inaccessible to the host.  As such, ANA support should be functional
    even if native multipathing is not.
    
    Introduce ability to always re-read ANA log page as required due to ANA
    error and make current ANA state available via sysfs -- even if native
    multipathing is disabled on the host (e.g. nvme_core.multipath=N).
    
    This affords userspace access to the current ANA state independent of
    which layer might be doing multipathing.  It also allows multipath-tools
    to rely on the NVMe driver for ANA support while dm-multipath takes care
    of multipathing.
    
    And as always, if embedded NVMe users do not want any performance
    overhead associated with ANA or native NVMe multipathing they can
    disable CONFIG_NVME_MULTIPATH.
    
    Signed-off-by: Mike Snitzer <snitzer@redhat.com>
    Signed-off-by: Frantisek Hrbata <fhrbata@redhat.com>

---
 drivers/nvme/host/core.c      |    2 ++
 drivers/nvme/host/multipath.c |   23 ++++++++++++++++++-----
 drivers/nvme/host/nvme.h      |    4 ++++
 3 files changed, 24 insertions(+), 5 deletions(-)

Index: linux-rhel9/drivers/nvme/host/core.c
===================================================================
--- linux-rhel9.orig/drivers/nvme/host/core.c
+++ linux-rhel9/drivers/nvme/host/core.c
@@ -347,6 +347,8 @@ static inline void nvme_end_req_with_fai
 	if (unlikely(nvme_status & NVME_SC_DNR))
 		goto out;
 
+	nvme_update_ana(req);
+
 	if (!blk_path_error(status)) {
 		pr_debug("Request meant for failover but blk_status_t (errno=%d) was not retryable.\n",
 			 blk_status_to_errno(status));
Index: linux-rhel9/drivers/nvme/host/multipath.c
===================================================================
--- linux-rhel9.orig/drivers/nvme/host/multipath.c
+++ linux-rhel9/drivers/nvme/host/multipath.c
@@ -65,10 +65,25 @@ void nvme_set_disk_name(char *disk_name,
 	}
 }
 
+static inline void __nvme_update_ana(struct nvme_ns *ns)
+{
+	if (!ns->ctrl->ana_log_buf)
+		return;
+
+	set_bit(NVME_NS_ANA_PENDING, &ns->flags);
+	queue_work(nvme_wq, &ns->ctrl->ana_work);
+}
+
+
+void nvme_update_ana(struct request *req)
+{
+	if (nvme_is_ana_error(nvme_req(req)->status))
+		__nvme_update_ana(req->q->queuedata);
+}
+
 void nvme_failover_req(struct request *req)
 {
 	struct nvme_ns *ns = req->q->queuedata;
-	u16 status = nvme_req(req)->status & 0x7ff;
 	unsigned long flags;
 
 	nvme_mpath_clear_current_path(ns);
@@ -78,10 +93,8 @@ void nvme_failover_req(struct request *r
 	 * ready to serve this namespace.  Kick of a re-read of the ANA
 	 * information page, and just try any other available path for now.
 	 */
-	if (nvme_is_ana_error(status) && ns->ctrl->ana_log_buf) {
-		set_bit(NVME_NS_ANA_PENDING, &ns->flags);
-		queue_work(nvme_wq, &ns->ctrl->ana_work);
-	}
+	if (nvme_is_ana_error(nvme_req(req)->status))
+		__nvme_update_ana(ns);
 
 	spin_lock_irqsave(&ns->head->requeue_lock, flags);
 	blk_steal_bios(&ns->head->requeue_list, req);
Index: linux-rhel9/drivers/nvme/host/nvme.h
===================================================================
--- linux-rhel9.orig/drivers/nvme/host/nvme.h
+++ linux-rhel9/drivers/nvme/host/nvme.h
@@ -664,6 +664,7 @@ void nvme_mpath_start_freeze(struct nvme
 void nvme_set_disk_name(char *disk_name, struct nvme_ns *ns,
 			struct nvme_ctrl *ctrl, int *flags);
 void nvme_failover_req(struct request *req);
+void nvme_update_ana(struct request *req);
 void nvme_kick_requeue_lists(struct nvme_ctrl *ctrl);
 int nvme_mpath_alloc_disk(struct nvme_ctrl *ctrl,struct nvme_ns_head *head);
 void nvme_mpath_add_disk(struct nvme_ns *ns, struct nvme_id_ns *id);
@@ -714,6 +715,9 @@ static inline void nvme_set_disk_name(ch
 static inline void nvme_failover_req(struct request *req)
 {
 }
+static inline void nvme_update_ana(struct request *req)
+{
+}
 static inline void nvme_kick_requeue_lists(struct nvme_ctrl *ctrl)
 {
 }

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

