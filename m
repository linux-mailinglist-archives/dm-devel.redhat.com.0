Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7A82E561
	for <lists+dm-devel@lfdr.de>; Wed, 29 May 2019 21:33:42 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0B1E730BBE69;
	Wed, 29 May 2019 19:32:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9CDDE60C4E;
	Wed, 29 May 2019 19:32:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BBB041806B14;
	Wed, 29 May 2019 19:31:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4TJUqb3010719 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 29 May 2019 15:30:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7FA1A1001E80; Wed, 29 May 2019 19:30:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 313FE1017E2E;
	Wed, 29 May 2019 19:30:49 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x4TJUl5K004359; 
	Wed, 29 May 2019 14:30:47 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x4TJUk6a004358;
	Wed, 29 May 2019 14:30:46 -0500
Date: Wed, 29 May 2019 14:30:45 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20190529193045.GF7630@octiron.msp.redhat.com>
References: <20190527125942.8366-1-mwilck@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190527125942.8366-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Xose Vazquez Perez <xose.vazquez@gmail.com>
Subject: Re: [dm-devel] [PATCH v2 0/9] speeding up mpathpersist
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Wed, 29 May 2019 19:33:41 +0000 (UTC)

On Mon, May 27, 2019 at 02:59:33PM +0200, Martin Wilck wrote:
> We've had reports that mpathpersist doesn't scale well in environments
> with lots of IO devices. This patch set tries to address this problem
> with a few optimizations:
> 
>  - instead of doing a full path discovery at startup, only look at
>    paths that are part of the maps being worked on
>  - allow multiple PR commands in a single run using "batch files",
>    without re-discovering everything between PR commands
>  - avoid looking at priorities
> 
> I've done some basic testing and it seems to work. It remains to be
> seen what the effect on performance really is, but the amount of system
> calls to be performed for a given set of mpathpersist actions should
> be substantially reduced in any case, especially when using batching.
> 
> ---
> v2:
>  - avoid memory leak with --batch-file (Ben Marzinski)
>  - add documentation to usage() output and mpathpersist man page
>  - integrate "mpathpersist.8: fix examples in man page" which I'd sent
>    separately before
> 

ACK for the set.

-Ben

> 
> Martin Wilck (9):
>   mpathpersist: call usage() just once on return
>   mpathpersist: add option --batch-file (-f)
>   mpathpersist: no need to treat error close() as fatal
>   libmpathpersist: updatepaths: deal with missing pp->udev
>   libmpathpersist: factor out initialization and teardown
>   mpathpersist: initialize data structures only once
>   libmpathpersist: don't bother with priorities
>   mpathpersist.8: fix examples in man page
>   mpathpersist.8: add documentation for --batch-file (-f)
> 
>  libmpathpersist/mpath_persist.c | 250 +++++++++++++++-----------------
>  libmpathpersist/mpath_persist.h |  40 +++++
>  mpathpersist/main.c             | 227 ++++++++++++++++++++++-------
>  mpathpersist/main.h             |   1 +
>  mpathpersist/mpathpersist.8     | 121 ++++++++++++++--
>  5 files changed, 440 insertions(+), 199 deletions(-)
> 
> -- 
> 2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
