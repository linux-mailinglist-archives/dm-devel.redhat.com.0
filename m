Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id E977723E4F5
	for <lists+dm-devel@lfdr.de>; Fri,  7 Aug 2020 02:10:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596759014;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3Z4dN4TwY4sZ0HfnaZoNpRaJA0TkOkPvtZ6L+nLDgmQ=;
	b=XNQVCNyBN00CBxlQZYysOQEYi+/98gAmKLQOGBittBZIyea+pSnnOCpB6A96DGnBJ9B0JQ
	ladDLa+KleFcZtWocDPWFskWMsWoFacgmd3KNBRgxiOTRczKxJyUBCHmBhsVRnwyMTWf9J
	ys4iX7mEzoxapXjSAByQQReuH5SSQJw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-PctYiHPNMH-RYf9iuc-U1w-1; Thu, 06 Aug 2020 20:10:11 -0400
X-MC-Unique: PctYiHPNMH-RYf9iuc-U1w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5D151005504;
	Fri,  7 Aug 2020 00:10:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CC806111F;
	Fri,  7 Aug 2020 00:10:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4750496921;
	Fri,  7 Aug 2020 00:09:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07707x2j019884 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 6 Aug 2020 20:07:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E42447C0F6; Fri,  7 Aug 2020 00:07:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 78AD579CE3;
	Fri,  7 Aug 2020 00:07:56 +0000 (UTC)
Date: Thu, 6 Aug 2020 20:07:55 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: "Meneghini, John" <John.Meneghini@netapp.com>
Message-ID: <20200807000755.GA28957@redhat.com>
References: <43e5dee8-1a91-4d8b-fdb5-91f9679ddeb3@huawei.com>
	<8d01b123-478f-f057-1598-8283dd099b03@huawei.com>
	<20200805152905.GB1982647@dhcp-10-100-145-180.wdl.wdc.com>
	<255d55e3-f824-a968-e478-3efeda095696@huawei.com>
	<20200806142625.GA3075319@dhcp-10-100-145-180.wdl.wdc.com>
	<729820BC-5F38-4E22-A83A-862E57BAE201@netapp.com>
	<E3390A8E-D582-47BA-A085-21663D883365@netapp.com>
	<20200806184057.GA27858@redhat.com>
	<20200806191943.GA27868@redhat.com>
	<6B826235-C504-4621-B8F7-34475B200979@netapp.com>
MIME-Version: 1.0
In-Reply-To: <6B826235-C504-4621-B8F7-34475B200979@netapp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Ewan Milne <emilne@redhat.com>, Christoph Hellwig <hch@infradead.org>,
	dm-devel@redhat.com,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	Chao Leng <lengchao@huawei.com>, Keith Busch <kbusch@kernel.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Aug 06 2020 at  6:42pm -0400,
Meneghini, John <John.Meneghini@netapp.com> wrote:

> On 8/6/20, 3:20 PM, "Mike Snitzer" <snitzer@redhat.com> wrote:
> 
>     From: Mike Snitzer <snitzer@redhat.com>
>     Date: Thu, 2 Jul 2020 01:43:27 -0400
>     Subject: [PATCH] nvme: restore use of blk_path_error() in nvme_complete_rq()
> 
>     Commit 764e9332098c0 ("nvme-multipath: do not reset on unknown
>     status") removed NVMe's use blk_path_error() -- presummably because
>     nvme_failover_req() was modified to return whether a command should be
>     retried or not.
> 
> Yes, that was a major part of this patch.  nvme_failover_req() was completely 
> reworked and fixed because it was badly broken. 

Sure, and I didn't change any of that.  Still all in place.

>     By not using blk_path_error() there is serious potential for
>     regression for how upper layers (e.g. DM multipath) respond to NVMe's
>     error conditions.  This has played out now due to commit 35038bffa87
>     ("nvme: Translate more status codes to blk_status_t").  Had NVMe
>     continued to use blk_path_error() it too would not have retried an
>     NVMe command that got NVME_SC_CMD_INTERRUPTED.
> 
> I'm not sure others would consider it broken.  The idea was to get the blk_path_error()
> logic out of the core nvme driver completion routine. 
> 
>     Fix this potential for NVMe error handling regression, possibly
>     outside NVMe, by restoring NVMe's use of blk_path_error().
> 
> The point is: blk_path_error() has nothing to do with NVMe errors.
> This is dm-multipath logic stuck in the middle of the NVMe error 
> handling code.

No, it is a means to have multiple subsystems (to this point both SCSI
and NVMe) doing the correct thing when translating subsystem specific
error codes to BLK_STS codes.

If you, or others you name drop below, understood the point we wouldn't
be having this conversation.  You'd accept the point of blk_path_error()
to be valid and required codification of what constitutes a retryable
path error for the Linux block layer.

Any BLK_STS mapping of NVMe specific error codes would need to not screw
up by categorizing a retryable error as non-retryable (and vice-versa).

Again, assuming proper testing, commit 35038bffa87 wouldn't have made it
upstream if NVMe still used blk_path_error().

> C symbol: blk_path_error
> 
>   File        Function             Line
> 0 dm-mpath.c  multipath_end_io     1606 if (error && blk_path_error(error)) {
> 1 dm-mpath.c  multipath_end_io_bio 1646 if (!*error || !blk_path_error(*error))
> 2 blk_types.h blk_path_error        118 static inline bool blk_path_error(blk_status_t error)

Yes, your commit 764e9332098c0 needlessly removed NVMe's use of
blk_path_error().  If you're saying it wasn't needless please explain
why.

>     Fixes: 764e9332098c0 ("nvme-multipath: do not reset on unknown status")
>     Cc: stable@vger.kerneel.org
>     Signed-off-by: Mike Snitzer <snitzer@redhat.com>
>     ---
>     drivers/nvme/host/core.c | 9 +++++++--
>     1 file changed, 7 insertions(+), 2 deletions(-)
> 
>     diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
>     index 6585d57112ad..072f629da4d8 100644
>     --- a/drivers/nvme/host/core.c
>     +++ b/drivers/nvme/host/core.c
>     @@ -290,8 +290,13 @@ void nvme_complete_rq(struct request *req)
>                     nvme_req(req)->ctrl->comp_seen = true;
> 
>             if (unlikely(status != BLK_STS_OK && nvme_req_needs_retry(req))) {
>     -               if ((req->cmd_flags & REQ_NVME_MPATH) && nvme_failover_req(req))
>     -                       return;
>     +               if (blk_path_error(status)) {
>     +                       if (req->cmd_flags & REQ_NVME_MPATH) {
>     +                               if (nvme_failover_req(req))
>     +                                       return;
>     +                               /* fallthru to normal error handling */
>     +                       }
>     +               }
> 
> This would basically undo the patch Hannes, Christoph, and I put together in
> commit 764e9332098c0.  This patch greatly simplified and improved the
> whole nvme_complete_rq() code path, and I don't support undoing that change.

Please elaborate on how I've undone anything?

The only thing I may have done is forced NVMe to take more care about
properly translating its NVME_SC to BLK_STS in nvme_error_status().
Which is a good thing.

> If you want blk_path_error() to handle any new NVMe error status differently,  I would suggest creating a new 
> BLK_STS code to translate that NVMe status and add it to the one place in nvme_complete_rq() designed to
> do the NVMe status to BLK_STS translation:  nvme_error_status().  Then you can change  your application specific 
> error handling code to handle the new BLK_STS code appropriately, further up the stack.  Don't stick your
> application specific error handling logic into the middle of the nvme driver's nvme_complete_rq routine.

Removing NVMe as a primary user of blk_path_error() was a pretty serious
mistake.  One you clearly aren't willing to own.  Yet the associated
breakage still exists as well as the potential for further regressions.

This really isn't some vantage point holy war.  Please don't continue to
make this something it isn't.  Would be cool if you could see what a
disservice this hostility is causing.  Otherwise you'll continue to
taint and/or avoid fixing NVMe with misplaced anti-DM-multipath
tribalism.

Maybe (re?)read these commit headers:

e96fef2c3fa3 nvme: Add more command status translation
908e45643d64 nvme/multipath: Consult blk_status_t for failover
9111e5686c8c block: Provide blk_status_t decoding for path errors
e1f425e770d2 nvme/multipath: Use blk_path_error
a1275677f8cd dm mpath: Use blk_path_error

with: git log e96fef2c3fa3^..a1275677f8cd

Anyway, no new BLK_STS is needed at this point.  More discipline with
how NVMe's error handling is changed is.  If NVMe wants to ensure its
interface isn't broken regularly it _should_ use blk_path_error() to
validate future nvme_error_status() changes.  Miscategorizing NVMe
errors to upper layers is a bug -- not open for debate.  Nor should be
using block core infrastructure we put in place to help stabilize how
Linux block drivers convey retryable errors.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

