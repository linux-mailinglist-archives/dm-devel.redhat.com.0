Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id BEF12241C23
	for <lists+dm-devel@lfdr.de>; Tue, 11 Aug 2020 16:12:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597155163;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GRtBDkGPPwUp4g1ue+VGxMBaabh4xCZmNZvG7OCOLzg=;
	b=bsQE8xbUlmAN51oyWAkYC4NhJcHIUvTV+3dupelAfNp24N6PgRximda/QEVgaMxbqQb8bm
	K11ii6nX0p7HLyuA8cYTa+Ek4dZ/uehZ/1ui+Imk8kUoYHw18tEsS6iOWVvCt+ko+y8nez
	y3qUUwePkzys1nB25TuTjD+0h+XtNRc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-H-ota2D8P-GArRfJY5Hgow-1; Tue, 11 Aug 2020 10:12:41 -0400
X-MC-Unique: H-ota2D8P-GArRfJY5Hgow-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B7F61DE5;
	Tue, 11 Aug 2020 14:12:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6217171922;
	Tue, 11 Aug 2020 14:12:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1C08C180954D;
	Tue, 11 Aug 2020 14:12:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07BECGbP015105 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 11 Aug 2020 10:12:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 60A5865C9B; Tue, 11 Aug 2020 14:12:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7447B65C6F;
	Tue, 11 Aug 2020 14:12:10 +0000 (UTC)
Date: Tue, 11 Aug 2020 10:12:09 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Chao Leng <lengchao@huawei.com>
Message-ID: <20200811141209.GA25261@redhat.com>
References: <6B826235-C504-4621-B8F7-34475B200979@netapp.com>
	<20200807000755.GA28957@redhat.com>
	<510f5aff-0437-b1ce-f7ab-c812edbea880@grimberg.me>
	<20200807045015.GA29737@redhat.com>
	<fec745aa-0091-ee1f-cb0f-da9e18cf0aa2@grimberg.me>
	<20200810143620.GA19127@redhat.com>
	<20200810172209.GA19535@redhat.com>
	<7f99724a-a1eb-6bec-f8ae-f9a4601b0487@huawei.com>
	<20200811042000.GA22692@redhat.com>
	<07bd0219-b39b-dcec-35f0-edc22df0d2ae@huawei.com>
MIME-Version: 1.0
In-Reply-To: <07bd0219-b39b-dcec-35f0-edc22df0d2ae@huawei.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Sagi Grimberg <sagi@grimberg.me>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	Christoph Hellwig <hch@infradead.org>, dm-devel@redhat.com,
	Ewan Milne <emilne@redhat.com>, Keith Busch <kbusch@kernel.org>,
	"Meneghini, John" <John.Meneghini@netapp.com>
Subject: Re: [dm-devel] nvme: explicitly use normal NVMe error handling when
	appropriate
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Aug 11 2020 at  2:17am -0400,
Chao Leng <lengchao@huawei.com> wrote:

> 
> 
> On 2020/8/11 12:20, Mike Snitzer wrote:
> >On Mon, Aug 10 2020 at 11:32pm -0400,
> >Chao Leng <lengchao@huawei.com> wrote:
> >
> >>
> >>
> >>On 2020/8/11 1:22, Mike Snitzer wrote:
> >>>On Mon, Aug 10 2020 at 10:36am -0400,
> >>>Mike Snitzer <snitzer@redhat.com> wrote:
> >>>
> >>>>On Fri, Aug 07 2020 at  7:35pm -0400,
> >>>>Sagi Grimberg <sagi@grimberg.me> wrote:
> >>>>
> >>>>>
> >>>>>>>Hey Mike,
> >>>...
> >>>>>>I think NVMe can easily fix this by having an earlier stage of checking,
> >>>>>>e.g. nvme_local_retry_req(), that shortcircuits ever getting to
> >>>>>>higher-level multipathing consideration (be it native NVMe or DM
> >>>>>>multipathing) for cases like NVME_SC_CMD_INTERRUPTED.
> >>>>>>To be clear: the "default" case of nvme_failover_req() that returns
> >>>>>>false to fallback to NVMe's "local" normal NVMe error handling -- that
> >>>>>>can stay.. but a more explicit handling of cases like
> >>>>>>NVME_SC_CMD_INTERRUPTED should be added to a nvme_local_retry_req()
> >>>>>>check that happens before nvme_failover_req() in nvme_complete_rq().
> >>>>>
> >>>>>I don't necessarily agree with having a dedicated nvme_local_retry_req().
> >>>>>a request that isn't failed over, goes to local error handling (retry or
> >>>>>not). I actually think that just adding the condition to
> >>>>>nvme_complete_req and having nvme_failover_req reject it would work.
> >>>>>
> >>>>>Keith?
> >>>>
> >>>>I think that is basically what I'm thinking too.
> >>>
> >>>From: Mike Snitzer <snitzer@redhat.com>
> >>>Subject: nvme: explicitly use normal NVMe error handling when appropriate
> >>>
> >>>Commit 764e9332098c0 ("nvme-multipath: do not reset on unknown
> >>>status"), among other things, fixed NVME_SC_CMD_INTERRUPTED error
> >>>handling by changing multipathing's nvme_failover_req() to short-circuit
> >>>path failover and then fallback to NVMe's normal error handling (which
> >>>takes care of NVME_SC_CMD_INTERRUPTED).
> >>>
> >>>This detour through native NVMe multipathing code is unwelcome because
> >>>it prevents NVMe core from handling NVME_SC_CMD_INTERRUPTED independent
> >>>of any multipathing concerns.
> >>>
> >>>Introduce nvme_status_needs_local_error_handling() to prioritize
> >>>non-failover retry, when appropriate, in terms of normal NVMe error
> >>>handling.  nvme_status_needs_local_error_handling() will naturely evolve
> >>>to include handling of any other errors that normal error handling must
> >>>be used for.
> >>>
> >>>nvme_failover_req()'s ability to fallback to normal NVMe error handling
> >>>has been preserved because it may be useful for future NVME_SC that
> >>>nvme_status_needs_local_error_handling() hasn't yet been trained for.
> >>>
> >>>Signed-off-by: Mike Snitzer <snitzer@redhat.com>
> >>>---
> >>>  drivers/nvme/host/core.c | 16 ++++++++++++++--
> >>>  1 file changed, 14 insertions(+), 2 deletions(-)
> >>>
> >>>diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
> >>>index 88cff309d8e4..be749b690af7 100644
> >>>--- a/drivers/nvme/host/core.c
> >>>+++ b/drivers/nvme/host/core.c
> >>>@@ -252,6 +252,16 @@ static inline bool nvme_req_needs_retry(struct request *req)
> >>>  	return true;
> >>>  }
> >>>+static inline bool nvme_status_needs_local_error_handling(u16 status)
> >>>+{
> >>>+	switch (status & 0x7ff) {
> >>>+	case NVME_SC_CMD_INTERRUPTED:
> >>>+		return true;
> >>>+	default:
> >>>+		return false;
> >>>+	}
> >>>+}
> >>>+
> >>>  static void nvme_retry_req(struct request *req)
> >>>  {
> >>>  	struct nvme_ns *ns = req->q->queuedata;
> >>>@@ -270,7 +280,8 @@ static void nvme_retry_req(struct request *req)
> >>>  void nvme_complete_rq(struct request *req)
> >>>  {
> >>>-	blk_status_t status = nvme_error_status(nvme_req(req)->status);
> >>>+	u16 nvme_status = nvme_req(req)->status;
> >>>+	blk_status_t status = nvme_error_status(nvme_status);
> >>>  	trace_nvme_complete_rq(req);
> >>>@@ -280,7 +291,8 @@ void nvme_complete_rq(struct request *req)
> >>>  		nvme_req(req)->ctrl->comp_seen = true;
> >>>  	if (unlikely(status != BLK_STS_OK && nvme_req_needs_retry(req))) {
> >>>-		if ((req->cmd_flags & REQ_NVME_MPATH) && nvme_failover_req(req))
> >>>+		if (!nvme_status_needs_local_error_handling(nvme_status) &&
> >>>+		    (req->cmd_flags & REQ_NVME_MPATH) && nvme_failover_req(req))
> >>
> >>This looks no affect. if work with nvme multipath, now is already retry local.
> >
> >Not if NVMe is built without multipathing configured.
>
> If without nvme multipathing configured, now is also retry local, do not need
> !nvme_status_needs_local_error_handling(nvme_status).

True, REQ_NVME_MPATH won't be set, so it'll fall through.

The real benefit of my patch is that there is a cleaner code flow for
handling errors with normal NVMe retry (without bouncing into failover
code and then falling back to normal retry -- code that your patch does
remove).

SO my change is an obvious yet small improvement that makes the NVMe
core error handling clearer -- yet preserves that fallback from
failover_retry to help future-proof NVMe from new NVME_SC: which John
M. is very clear about needing.

> >>If work with dm-multipath, still return error.
> >
> >Yes, I'm aware.  Use of REQ_FAILFAST_TRANSPORT isn't something that is
> >needed for NVMe, so why are you proposing hacks in NVMe to deal with it?
> I just describe the possible scenarios:1.nvme multipathing configured.
> 2.without any multipath.3. with dm-multipath.

I understand.

> >
> >>>  			return;
> >>>  		if (!blk_queue_dying(req->q)) {
> >>>
> >>
> >>Suggest:
> >>REQ_FAILFAST_TRANSPORT may be designed for scsi, because scsi protocol
> >>do not difine the local retry mechanism. SCSI implements a fuzzy local
> >>retry mechanism, so need the REQ_FAILFAST_TRANSPORT for multipath
> >>software, multipath software retry according error code is expected.
> >>nvme is different with scsi about this. It define local retry mechanism
> >>and path error code, so nvme should not care REQ_FAILFAST_TRANSPORT.
> >
> >Exactly.  Except by "nvme should not care REQ_FAILFAST_TRANSPORT." your
> >patch says you mean "nvme shouldn't disallow retry if
> >REQ_FAILFAST_TRANSPORT is it".  I'm saying: don't try to get such
> >changes into NVMe.
>
> no. the patch just mean: if path error, fail over to retry by multipath
> (nvme multipath or dm-multipath). Other need local retry local, retry
> after a defined time according to status(CRD) and CRDT. Now nvme multipath
> is already do like this, the patch make dm-multipath work like nvme multipath.

I appreciate your enthusiasm for making native NVMe multipathing and
dm-multipath coexist.

But I think you're naive about the willingness to make that a reality.

As such, any change that only benefits dm-multipath is dead on arrival.
Your patch is mixed with various changes like that.  I'd be stunned if
Christoph accepted it.

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

