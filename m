Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id E0AEE240BD8
	for <lists+dm-devel@lfdr.de>; Mon, 10 Aug 2020 19:22:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597080158;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9SSwfQ90yXGo8JcQFXfeRFLBpRl7Dh3XOEq6dYHVoos=;
	b=dzeOM2+Uqh2aWLpUIQKC3/gMZUOF5qYEt69gBVDC3JITGK/2IGERLqCW000CCmR/67Zqdi
	7nOzmWqEN55/4fx6dceIxJGYD2wFhsGE+vCbnlevh/ZjV8wkH6nhGGHQfzK9iK9DUOqSTW
	jFe9JHazZLmiDH0vRoo4ZKrvdTf+LYs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-pLJ9mzkOMya4qJHmi8_APA-1; Mon, 10 Aug 2020 13:22:35 -0400
X-MC-Unique: pLJ9mzkOMya4qJHmi8_APA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBBD5100AA21;
	Mon, 10 Aug 2020 17:22:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4ECC890E9D;
	Mon, 10 Aug 2020 17:22:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 334C71809554;
	Mon, 10 Aug 2020 17:22:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07AHMDU5026602 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 10 Aug 2020 13:22:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A4BC44149; Mon, 10 Aug 2020 17:22:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DF366111F;
	Mon, 10 Aug 2020 17:22:10 +0000 (UTC)
Date: Mon, 10 Aug 2020 13:22:09 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Sagi Grimberg <sagi@grimberg.me>
Message-ID: <20200810172209.GA19535@redhat.com>
References: <729820BC-5F38-4E22-A83A-862E57BAE201@netapp.com>
	<E3390A8E-D582-47BA-A085-21663D883365@netapp.com>
	<20200806184057.GA27858@redhat.com>
	<20200806191943.GA27868@redhat.com>
	<6B826235-C504-4621-B8F7-34475B200979@netapp.com>
	<20200807000755.GA28957@redhat.com>
	<510f5aff-0437-b1ce-f7ab-c812edbea880@grimberg.me>
	<20200807045015.GA29737@redhat.com>
	<fec745aa-0091-ee1f-cb0f-da9e18cf0aa2@grimberg.me>
	<20200810143620.GA19127@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200810143620.GA19127@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	Christoph Hellwig <hch@infradead.org>, dm-devel@redhat.com,
	Ewan Milne <emilne@redhat.com>, Chao Leng <lengchao@huawei.com>,
	Keith Busch <kbusch@kernel.org>, "Meneghini,
	John" <John.Meneghini@netapp.com>
Subject: [dm-devel] [PATCH] nvme: explicitly use normal NVMe error handling
 when appropriate
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Aug 10 2020 at 10:36am -0400,
Mike Snitzer <snitzer@redhat.com> wrote:

> On Fri, Aug 07 2020 at  7:35pm -0400,
> Sagi Grimberg <sagi@grimberg.me> wrote:
> 
> > 
> > >>Hey Mike,
...
> > >I think NVMe can easily fix this by having an earlier stage of checking,
> > >e.g. nvme_local_retry_req(), that shortcircuits ever getting to
> > >higher-level multipathing consideration (be it native NVMe or DM
> > >multipathing) for cases like NVME_SC_CMD_INTERRUPTED.
> > >To be clear: the "default" case of nvme_failover_req() that returns
> > >false to fallback to NVMe's "local" normal NVMe error handling -- that
> > >can stay.. but a more explicit handling of cases like
> > >NVME_SC_CMD_INTERRUPTED should be added to a nvme_local_retry_req()
> > >check that happens before nvme_failover_req() in nvme_complete_rq().
> > 
> > I don't necessarily agree with having a dedicated nvme_local_retry_req().
> > a request that isn't failed over, goes to local error handling (retry or
> > not). I actually think that just adding the condition to
> > nvme_complete_req and having nvme_failover_req reject it would work.
> > 
> > Keith?
> 
> I think that is basically what I'm thinking too.

From: Mike Snitzer <snitzer@redhat.com>
Subject: nvme: explicitly use normal NVMe error handling when appropriate

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
nvme_status_needs_local_error_handling() hasn't yet been trained for.

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

