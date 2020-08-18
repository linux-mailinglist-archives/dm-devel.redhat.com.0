Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 62D252489A0
	for <lists+dm-devel@lfdr.de>; Tue, 18 Aug 2020 17:23:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597764193;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+EU5FbgjkrFyWgTsOakgStTw8TjjuxRXmCsDYecmV/8=;
	b=ZRd6RB1d42Bi1iIlossE6gFVcV8oXYQ0ILYgue42GhJgSSWrEf6YeyGL7SN7BULEHfcD9P
	TU+2NKM39aI2ydqszle82RH8aWX5mAJoLGvUbU9Nsx3UHXtSlPSMu4D/INdvbjcJZmjGJ6
	Hsi+k0gszgIAhFrwFpptc2OEh4ZeUqk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-113-4opz4UdvP567HiECItns5A-1; Tue, 18 Aug 2020 11:23:09 -0400
X-MC-Unique: 4opz4UdvP567HiECItns5A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 822AF81F01B;
	Tue, 18 Aug 2020 15:23:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D76FB5C1DC;
	Tue, 18 Aug 2020 15:22:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 58A1C6036A;
	Tue, 18 Aug 2020 15:22:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07IFKT6u005774 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 18 Aug 2020 11:20:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7F7F539A75; Tue, 18 Aug 2020 15:20:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9379D7C0AC;
	Tue, 18 Aug 2020 15:20:23 +0000 (UTC)
Date: Tue, 18 Aug 2020 11:20:22 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Jens Axboe <axboe@kernel.dk>, Ming Lei <ming.lei@redhat.com>
Message-ID: <20200818152022.GB6842@redhat.com>
References: <20200818090728.2696802-1-ming.lei@redhat.com>
	<92162ee6-0fa0-dafd-69b1-af285ee61044@kernel.dk>
MIME-Version: 1.0
In-Reply-To: <92162ee6-0fa0-dafd-69b1-af285ee61044@kernel.dk>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	Christoph Hellwig <hch@lst.de>, Bart Van Assche <bvanassche@acm.org>
Subject: Re: [dm-devel] [PATCH RESEND] blk-mq: insert request not through
 ->queue_rq into sw/scheduler queue
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Aug 18 2020 at 10:50am -0400,
Jens Axboe <axboe@kernel.dk> wrote:

> On 8/18/20 2:07 AM, Ming Lei wrote:
> > c616cbee97ae ("blk-mq: punt failed direct issue to dispatch list") supposed
> > to add request which has been through ->queue_rq() to the hw queue dispatch
> > list, however it adds request running out of budget or driver tag to hw queue
> > too. This way basically bypasses request merge, and causes too many request
> > dispatched to LLD, and system% is unnecessary increased.
> > 
> > Fixes this issue by adding request not through ->queue_rq into sw/scheduler
> > queue, and this way is safe because no ->queue_rq is called on this request
> > yet.
> > 
> > High %system can be observed on Azure storvsc device, and even soft lock
> > is observed. This patch reduces %system during heavy sequential IO,
> > meantime decreases soft lockup risk.
> 
> Applied, thanks Ming.

Hmm, strikes me as strange that this is occurring given the direct
insertion into blk-mq queue (bypassing scheduler) is meant to avoid 2
layers of IO merging when dm-mulipath is stacked on blk-mq path(s).  The
dm-mpath IO scheduler does all merging and underlying paths' blk-mq
request_queues are meant to just dispatch the top-level's requests.

So this change concerns me.  Feels like this design has broken down.

Could be that some other entry point was added for the
__blk_mq_try_issue_directly() code?  And it needs to be untangled away
from the dm-multipath use-case?

Apologies for not responding to this patch until now.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

