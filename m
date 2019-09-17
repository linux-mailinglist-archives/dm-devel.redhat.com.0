Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6D9B56B2
	for <lists+dm-devel@lfdr.de>; Tue, 17 Sep 2019 22:09:05 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DFE2C859FF;
	Tue, 17 Sep 2019 20:09:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE34A19C6A;
	Tue, 17 Sep 2019 20:08:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5D4FD4EDA6;
	Tue, 17 Sep 2019 20:08:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8HK8btD001397 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 17 Sep 2019 16:08:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BA2E85D9DC; Tue, 17 Sep 2019 20:08:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D3065D9D5;
	Tue, 17 Sep 2019 20:08:28 +0000 (UTC)
Date: Tue, 17 Sep 2019 16:08:28 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: John Dorminy <jdorminy@redhat.com>
Message-ID: <20190917200827.GA5042@redhat.com>
References: <alpine.LRH.2.02.1909160553360.11421@file01.intranet.prod.int.rdu2.redhat.com>
	<20190916180107.GA725@infradead.org>
	<127b8c4e-a6dc-6d5e-caff-fe1a0ca3a5bb@gmail.com>
	<CAMeeMh9t4LBwJn_CPQgFNa_Tyj22fJYHK-4qAnyn0RXm9RzCnw@mail.gmail.com>
	<20190917140632.GA3728@redhat.com>
	<alpine.LRH.2.02.1909171133100.1876@file01.intranet.prod.int.rdu2.redhat.com>
	<CAMeeMh_cq=F3JRZQrLbXA8=DkrvWD7qWNrNyBZdLarWWKcZXAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMeeMh_cq=F3JRZQrLbXA8=DkrvWD7qWNrNyBZdLarWWKcZXAQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: lvm-devel@redhat.com, Christoph Hellwig <hch@infradead.org>,
	device-mapper development <dm-devel@redhat.com>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Zdenek Kabelac <zkabelac@redhat.com>, Milan Broz <gmazyland@gmail.com>
Subject: Re: [dm-devel] dm: introduce DM_GET_TARGET_VERSION
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Tue, 17 Sep 2019 20:09:03 +0000 (UTC)

On Tue, Sep 17 2019 at 11:44am -0400,
John Dorminy <jdorminy@redhat.com> wrote:

>    Makes sense, sorry I missed that detail.
> 
>    Might it be better to just extend 'dmsetup targets' to take an optional
>    target-name parameter? When I saw this change, I thought 'dmsetup targets
>    <name>' surely worked already for the purpose, and was somewhat surprised
>    when experiment disagreed. Then list_versions() has much the same code
>    change as in this change, there's a little change in validate_params(),
>    and it seems less surprising (to me) to extend the existing
>    target-information-printing dmsetup command than to add another one.

No, I don't think it better to extend 'dmsetup targets'.  There is
little to be gained in doing so.

The DM_GET_TARGET_VERSION ioctl's implementation happens to be shared
with the DM_LIST_VERSIONS ioctl (used by 'dmsetup targets') but that
doesn't imply DM_LIST_VERSIONS should be extended instead.

This is a simple change that enables userspace to accomplish a specific
goal without altering an established DM ioctl.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
