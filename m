Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 3018662D03
	for <lists+dm-devel@lfdr.de>; Tue,  9 Jul 2019 02:17:56 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 47CF73092649;
	Tue,  9 Jul 2019 00:17:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 01C225B77E;
	Tue,  9 Jul 2019 00:17:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CCBAE18005C7;
	Tue,  9 Jul 2019 00:16:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x690FXVR011879 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 8 Jul 2019 20:15:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2028738E30; Tue,  9 Jul 2019 00:15:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 873905BBC2;
	Tue,  9 Jul 2019 00:15:30 +0000 (UTC)
Date: Mon, 8 Jul 2019 20:15:29 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Junxiao Bi <junxiao.bi@oracle.com>
Message-ID: <20190709001529.GA10643@redhat.com>
References: <20190702231456.19121-1-junxiao.bi@oracle.com>
	<20190703162106.GA13984@redhat.com>
	<1aa51708-1c1b-bd12-72ed-ecbae39043f7@oracle.com>
	<460d932b-e801-e2f8-9d0d-d3c96e1bb1ce@oracle.com>
	<20190708141427.GA8414@redhat.com>
	<8a971872-ca3e-303d-02cd-cf5990bb6ab0@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8a971872-ca3e-303d-02cd-cf5990bb6ab0@oracle.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: honglei.wang@oracle.com, dm-devel@redhat.com, mpatocka@redhat.com,
	agk@redhat.com
Subject: Re: [dm-devel] dm bufio: fix deadlock issue with loop device
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Tue, 09 Jul 2019 00:17:54 +0000 (UTC)

On Mon, Jul 08 2019 at  7:54pm -0400,
Junxiao Bi <junxiao.bi@oracle.com> wrote:

> On 7/8/19 7:14 AM, Mike Snitzer wrote:
> 
> >On Fri, Jul 05 2019 at  4:24pm -0400,
> >Junxiao Bi <junxiao.bi@oracle.com> wrote:
> >
> >>Hi Mike,
> >>
> >>Do i make sense on this?
> >No, you haven't made your chase for this change.  Sorry.
> >
> >Please refine the patch header to _not_ get into context you have from
> >a vendor kernel.  I know you say this is hard to reproduce, etc.
> Thanks, I will refine it in v2.
> >But
> >you don't even get into ther usecase where the issue was seen.  Was this
> >DM thinp?  DM cache?  Something else?
> it's thin-provision target. Customer is using docker.

OK, with loop files? (really hackish and poor performing but loopback
enabled the ability to not reinstall, or plan ahead, caused a lot of
people to use it... that is until overlayfs arrived)

> >Please be as concise and precise as possible.  Saying that shrinker is
> >the same context as loop doesn't imply a whole lot to me (relative to
> >why this is prone to deadlock).
> >
> >To restate my concern: if __GFP_FS isn't set then why does your patch
> >help at all?  If __GFP_FS is set, then that changes things..
> 
> If __GFP_FS isn't set, the behavior is the same with w/o this patch.

Yes.

> If it is set and the mutex was already hold by others, shrinker
> stop, deadlock avoid.

Fine, please explain how that happens in the context of existing
upstream code.  Please make the case for fixing upstream.

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
