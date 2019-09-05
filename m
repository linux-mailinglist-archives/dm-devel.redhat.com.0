Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C015EA9FE2
	for <lists+dm-devel@lfdr.de>; Thu,  5 Sep 2019 12:39:05 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B6E9430860A5;
	Thu,  5 Sep 2019 10:39:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9899F600F8;
	Thu,  5 Sep 2019 10:39:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B035D18089C8;
	Thu,  5 Sep 2019 10:38:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x85AcoJD028664 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 5 Sep 2019 06:38:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3C9B85D71C; Thu,  5 Sep 2019 10:38:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.33.36.32])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 99F165D712;
	Thu,  5 Sep 2019 10:38:44 +0000 (UTC)
Date: Thu, 5 Sep 2019 11:38:43 +0100
From: Joe Thornber <thornber@redhat.com>
To: jianchao wang <jianchao.wan9@gmail.com>
Message-ID: <20190905103843.xnakopha6s6oeuyd@reti>
Mail-Followup-To: jianchao wang <jianchao.wan9@gmail.com>, agk@redhat.com,
	snitzer@redhat.com, dm-devel@redhat.com
References: <CAC-DDmMQu38J6kCirxK=axwEguEpaN+H1JJVPbUsyqtxcx5KEw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAC-DDmMQu38J6kCirxK=axwEguEpaN+H1JJVPbUsyqtxcx5KEw@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, snitzer@redhat.com, agk@redhat.com
Subject: Re: [dm-devel] Why does dm-thin pool metadata space map use 4K page
 to carry index ?
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Thu, 05 Sep 2019 10:39:04 +0000 (UTC)

On Thu, Sep 05, 2019 at 02:43:28PM +0800, jianchao wang wrote:
> But why does it use this 4K page instead of btree as the disk sm ?
> 
> The brb mechanism seem be able to avoid the nested block allocation
> when do COW on the metadata sm btree.
> 
> Would anyone please help to tell why does it use this 4K page instead of a
> btree ?

It's a long time since I wrote this, so I can't remember the order that things
were written.  It may well be that brb mechanism for avoiding recursive allocations
came after the on disk formats were defined.  Irrespective of that the single page
pointing to index pages should perform better.

Is the 16G limit to the metadata device causing you issues?

- Joe

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
