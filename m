Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F931ADB93
	for <lists+dm-devel@lfdr.de>; Mon,  9 Sep 2019 16:57:58 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 674983090FEF;
	Mon,  9 Sep 2019 14:57:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E41F60A35;
	Mon,  9 Sep 2019 14:57:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9D32B2551C;
	Mon,  9 Sep 2019 14:57:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x89EvE6F022697 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 9 Sep 2019 10:57:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5E8CB61F22; Mon,  9 Sep 2019 14:57:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D6A295D6B2;
	Mon,  9 Sep 2019 14:57:04 +0000 (UTC)
Date: Mon, 9 Sep 2019 10:57:04 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Martijn Coenen <maco@android.com>, Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20190909145703.GA16249@redhat.com>
References: <20190906074526.169194-1-maco@android.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190906074526.169194-1-maco@android.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: dariofreni@google.com, jiyong@google.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, dm-devel@redhat.com,
	maco@google.com, ioffe@google.com, narayan@google.com,
	kernel-team@android.com, agk@redhat.com
Subject: Re: [dm-devel] dm-bufio: Allow clients to specify an upper bound on
	cache size.
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Mon, 09 Sep 2019 14:57:57 +0000 (UTC)

On Fri, Sep 06 2019 at  3:45am -0400,
Martijn Coenen <maco@android.com> wrote:

> The upper limit on the cache size of a client is currently determined by
> dividing the total cache size by the number of clients. However, in some
> cases it is beneficial to give one client a higher limit than others; an
> example is a device with many dm-verity targets, where one target has a
> very large hashtree, and all the others have a small hashtree. Giving
> the target with the large hashtree a higher limit will be beneficial.
> Another example is dm-verity-fec: FEC is only used in (rare) error
> conditions, yet for every dm-verity target with FEC, we create two FEC
> dm-bufio clients, which together have a higher cache limit than the
> dm-verity target itself.
> 
> This patchset allows a client to indicate a maximum cache size for its
> client; if that maximum is lower than the calculated per-client limit,
> that maximum will be used instead, and the freed up cache size will be
> allocated to other clients (that haven't set a maximum).
> 
> Note that this algorithm is not perfect; if we have 100MB with 3
> clients, where the first set a max of 1MB, the second set a max of 40MB,
> and the third set no maximumm, the ideal allocation would be 1:40:59,
> respectively. However, because the initial per-client limit is 100 / 3
> =~33MB, the requested max of 40MB is over the per-client limit, and
> instead the allocation will end up being ~ 1:40:49. This is still better
> than the original 33:33:33 allocation. An iterative algorithm could do
> better, but it also complicates the code significantly.

Definitely not very intuitive.. but yes I think it is a reasonable
tradeoff between your goals and further code complexity to be able to
achieve the "ideal".

Think the documented example can be made clearer by documenting that
dm_bufio_cache_size_per_client = 49.  And that _that_ is the reason why
the client that didn't set a maximum is bounded to 49.

Overall I think this patch looks reasonable, but I'd like Mikulas to
review this closer before I pick it up.

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
