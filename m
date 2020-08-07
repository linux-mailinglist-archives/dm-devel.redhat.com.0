Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id E17B623E6DF
	for <lists+dm-devel@lfdr.de>; Fri,  7 Aug 2020 06:53:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596776034;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iqcLCjRcBLeM5YSS1UR/d23UjQZuigJcpZUy4cjb4bc=;
	b=HiR8fiJdqKUMPRskj8VDw/+4i5SXYKDBHaFbS/bc9V39Fg6EMc7lYYXmbjQuS7wjqEVxVe
	H12cuRQgarXROulkjaQstJYJSdZV2AkU1fybcO2tFFvsuPnTUZzKA4i/iuvWkGrg3v6TfI
	0SQu75d82IzKKbvo105tNiZZLxGTmO0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-4Uh5oZxUPRaDb0U5taOVzA-1; Fri, 07 Aug 2020 00:53:52 -0400
X-MC-Unique: 4Uh5oZxUPRaDb0U5taOVzA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4644800688;
	Fri,  7 Aug 2020 04:53:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A2B591002382;
	Fri,  7 Aug 2020 04:53:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 82C381809554;
	Fri,  7 Aug 2020 04:53:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0774oJxA030972 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 7 Aug 2020 00:50:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D4D2A65C8D; Fri,  7 Aug 2020 04:50:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6582F65C73;
	Fri,  7 Aug 2020 04:50:16 +0000 (UTC)
Date: Fri, 7 Aug 2020 00:50:15 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Sagi Grimberg <sagi@grimberg.me>
Message-ID: <20200807045015.GA29737@redhat.com>
References: <20200805152905.GB1982647@dhcp-10-100-145-180.wdl.wdc.com>
	<255d55e3-f824-a968-e478-3efeda095696@huawei.com>
	<20200806142625.GA3075319@dhcp-10-100-145-180.wdl.wdc.com>
	<729820BC-5F38-4E22-A83A-862E57BAE201@netapp.com>
	<E3390A8E-D582-47BA-A085-21663D883365@netapp.com>
	<20200806184057.GA27858@redhat.com>
	<20200806191943.GA27868@redhat.com>
	<6B826235-C504-4621-B8F7-34475B200979@netapp.com>
	<20200807000755.GA28957@redhat.com>
	<510f5aff-0437-b1ce-f7ab-c812edbea880@grimberg.me>
MIME-Version: 1.0
In-Reply-To: <510f5aff-0437-b1ce-f7ab-c812edbea880@grimberg.me>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	Christoph Hellwig <hch@infradead.org>, dm-devel@redhat.com,
	Ewan Milne <emilne@redhat.com>, Chao Leng <lengchao@huawei.com>,
	Keith Busch <kbusch@kernel.org>, "Meneghini,
	John" <John.Meneghini@netapp.com>
Subject: Re: [dm-devel] nvme: restore use of blk_path_error() in
	nvme_complete_rq()
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Aug 06 2020 at  9:21pm -0400,
Sagi Grimberg <sagi@grimberg.me> wrote:

> Hey Mike,
> 
> >>The point is: blk_path_error() has nothing to do with NVMe errors.
> >>This is dm-multipath logic stuck in the middle of the NVMe error
> >>handling code.
> >
> >No, it is a means to have multiple subsystems (to this point both SCSI
> >and NVMe) doing the correct thing when translating subsystem specific
> >error codes to BLK_STS codes.
> 
> Not exactly, don't find any use of this in scsi. The purpose is to make
> sure that nvme and dm speak the same language.

SCSI doesn't need to do additional work to train a multipath layer
because dm-multipath _is_ SCSI's multipathing in Linux.

So ensuring SCSI properly classifies its error codes happens as a
side-effect of ensuring continued multipath functionality.

Hannes introduced all these differentiated error codes in block core
because of SCSI.  NVMe is meant to build on the infrastructure that was
established.

> >If you, or others you name drop below, understood the point we wouldn't
> >be having this conversation.  You'd accept the point of blk_path_error()
> >to be valid and required codification of what constitutes a retryable
> >path error for the Linux block layer.
> 
> This incident is a case where the specific nvme status was designed
> to retry on the same path respecting the controller retry delay.
> And because nvme used blk_path_error at the time it caused us to use a
> non-retryable status to get around that. Granted, no one had
> dm-multipath in mind.
> 
> So in a sense, there is consensus on changing patch 35038bffa87da
> _because_ nvme no longer uses blk_path_error. Otherwise it would break.

"break" meaning it would do failover instead of the more optimal local
retry to the same controller.

I see.  Wish the header for commit 35038bffa87da touched on this even a
little bit ;)

But AFAICT the patch I provided doesn't compromise proper local retry --
as long as we first fix nvme_error_status() to return a retryable
BLK_STS for NVME_SC_CMD_INTERRUPTED -- which I assumed as a prereq.

Think of blk_path_error() as a more coarse-grained "is this retryable or
a hard failure?" check.  So for NVME_SC_CMD_INTERRUPTED,
nvme_error_status() _should_ respond with something retryable (I'd
prefer BLK_STS_RESOURCE to be honest).

And then nvme_failover_req() is finer-grained; by returning false it now
allows short-circuiting failover and reverting back to NVMe's normal
controller based error recovery -- which it does for
NVME_SC_CMD_INTERRUPTED due to "default" case in nvme_failover_req().

And then the previous nvme_error_status() classification of retryable
BLK_STS obviously never gets returned up the IO stack; it gets thrown
away.

> >Any BLK_STS mapping of NVMe specific error codes would need to not screw
> >up by categorizing a retryable error as non-retryable (and vice-versa).
> 
> But it is a special type of retryable. There is nothing that fits the
> semantics of the current behavior.

I agree.  But that's fine actually.

And this issue is the poster-child for why properly supporting a duality
of driver-level vs upper level multipathing capabilities is pretty much
impossible unless a clean design factors out the different error classes
-- and local error retry is handled before punting to higher level
failover retry.  Think if NVMe were to adopt a bit more disciplined
"local then failover" error handling it all gets easier.

This local retry _is_ NVMe specific.  NVMe should just own retrying on
the same controller no matter what (I'll hope that such retry has
awareness to not retry indefinitely though!).  And this has nothing to
do with multipathing, so the logic to handle it shouldn't be trapped in
nvme_failover_req().

I think NVMe can easily fix this by having an earlier stage of checking,
e.g. nvme_local_retry_req(), that shortcircuits ever getting to
higher-level multipathing consideration (be it native NVMe or DM
multipathing) for cases like NVME_SC_CMD_INTERRUPTED. 
To be clear: the "default" case of nvme_failover_req() that returns
false to fallback to NVMe's "local" normal NVMe error handling -- that
can stay.. but a more explicit handling of cases like
NVME_SC_CMD_INTERRUPTED should be added to a nvme_local_retry_req()
check that happens before nvme_failover_req() in nvme_complete_rq().

This is where a patch will speak a thousand words... maybe ;)

> >Again, assuming proper testing, commit 35038bffa87 wouldn't have made it
> >upstream if NVMe still used blk_path_error().
> 
> Agree.
> 
> >Yes, your commit 764e9332098c0 needlessly removed NVMe's use of
> >blk_path_error().  If you're saying it wasn't needless please explain
> >why.
> >
> >>     Fixes: 764e9332098c0 ("nvme-multipath: do not reset on unknown status")
> >>     Cc: stable@vger.kerneel.org
> >>     Signed-off-by: Mike Snitzer <snitzer@redhat.com>
> >>     ---
> >>     drivers/nvme/host/core.c | 9 +++++++--
> >>     1 file changed, 7 insertions(+), 2 deletions(-)
> >>
> >>     diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
> >>     index 6585d57112ad..072f629da4d8 100644
> >>     --- a/drivers/nvme/host/core.c
> >>     +++ b/drivers/nvme/host/core.c
> >>     @@ -290,8 +290,13 @@ void nvme_complete_rq(struct request *req)
> >>                     nvme_req(req)->ctrl->comp_seen = true;
> >>
> >>             if (unlikely(status != BLK_STS_OK && nvme_req_needs_retry(req))) {
> >>     -               if ((req->cmd_flags & REQ_NVME_MPATH) && nvme_failover_req(req))
> >>     -                       return;
> >>     +               if (blk_path_error(status)) {
> >>     +                       if (req->cmd_flags & REQ_NVME_MPATH) {
> >>     +                               if (nvme_failover_req(req))
> >>     +                                       return;
> >>     +                               /* fallthru to normal error handling */
> >>     +                       }
> >>     +               }
> >>
> >>This would basically undo the patch Hannes, Christoph, and I put together in
> >>commit 764e9332098c0.  This patch greatly simplified and improved the
> >>whole nvme_complete_rq() code path, and I don't support undoing that change.
> >
> >Please elaborate on how I've undone anything?
> 
> I think you're right, this hasn't undone the patch from John, but it
> breaks NVME_SC_CMD_INTERRUPTED error handling behavior.

Yes, again we'd need to first fix nvme_error_status() to return a
retryable BLK_STS for NVME_SC_CMD_INTERRUPTED -- which I assumed as a
prereq.

> >The only thing I may have done is forced NVMe to take more care about
> >properly translating its NVME_SC to BLK_STS in nvme_error_status().
> >Which is a good thing.
> 
> I don't think there is an issue here of mistakenly converting an nvme
> status code to a wrong block status code. This conversion is there
> because there is no block status that give us the semantics we need
> which is apparently specific to nvme.
> 
> I personally don't mind restoring blk_path_error to nvme, I don't
> particularly feel strong about it either. But for sure blk_path_error
> needs to first provide the semantics needed for NVME_SC_CMD_INTERRUPTED.

Hopefully it doesn't.  As I discuss above with my "I think NVMe can
easily fix".  NVMe should trap this class of "local" retryable error
_before_ going on to check if higher-level failover is needed.  If it
does that: problem solved for both NVMe and DM multipathing. (could be
missing something though, I'll try to craft a patch later today to shake
it out).

> ...
> 
> >Anyway, no new BLK_STS is needed at this point.  More discipline with
> >how NVMe's error handling is changed is.
> 
> Please read the above.

I agree we'd need a new BLK_STS only if NVMe cannot be made to trap
NVME_SC_CMD_INTERRUPTED for local retry _before_ considering path
failover.

> >If NVMe wants to ensure its
> >interface isn't broken regularly it _should_ use blk_path_error() to
> >validate future nvme_error_status() changes.  Miscategorizing NVMe
> >errors to upper layers is a bug -- not open for debate.
> 
> Again, don't agree is a Miscategorization nor a bug, its just something
> that is NVMe specific.

Right I understand.

Think it safe to assume these types of details are why Christoph wanted
to avoid the notion of native NVMe and DM multipathing having
compatible error handling.  There was some wisdom with that position
(especially with native NVMe goals in mind).  But if things are tweaked
slightly then both camps _can_ be made happy.

There just needs to be a willingness to work through the details,
defensiveness needs to be shed on both sides, so constructive
review/consideration of problems can happen.  Think that has already
happened here with our exchange.  I'm open to investing effort here if
others are up for humoring my attempt to explore fixing the issues in a
mutually beneficial way.  What's the worst that can happen?  My simple
patches might continue to be ignored? ;)

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

