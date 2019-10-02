Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE03C4B22
	for <lists+dm-devel@lfdr.de>; Wed,  2 Oct 2019 12:11:13 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5880088307;
	Wed,  2 Oct 2019 10:11:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C9AFC5D9D3;
	Wed,  2 Oct 2019 10:11:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 862C118089C8;
	Wed,  2 Oct 2019 10:10:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x92AAYR3022132 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 2 Oct 2019 06:10:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5BC9060619; Wed,  2 Oct 2019 10:10:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D03F60605;
	Wed,  2 Oct 2019 10:10:29 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id x92AASOm003363; Wed, 2 Oct 2019 06:10:28 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id x92AASO9003359; Wed, 2 Oct 2019 06:10:28 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Wed, 2 Oct 2019 06:10:28 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Nikos Tsironis <ntsironis@arrikto.com>
In-Reply-To: <20191001115747.4473-1-ntsironis@arrikto.com>
Message-ID: <alpine.LRH.2.02.1910020608490.973@file01.intranet.prod.int.rdu2.redhat.com>
References: <20191001115747.4473-1-ntsironis@arrikto.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, agk@redhat.com, snitzer@redhat.com, guru2018@gmail.com
Subject: Re: [dm-devel] [PATCH 0/1] dm snapshot: Fix bug in COW throttling
 mechanism causing deadlocks
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Wed, 02 Oct 2019 10:11:11 +0000 (UTC)



On Tue, 1 Oct 2019, Nikos Tsironis wrote:

> Hello,
> 
> This patch fixes the deadlock issue reported in this thread:
> https://www.redhat.com/archives/dm-devel/2019-September/msg00168.html.
> 
> Although I have been really careful preparing this patch, in order to
> avoid any further issues, any extra review would be greatly appreciated.
> 
> Thanks,
> Nikos
> 
> Nikos Tsironis (1):
>   dm snapshot: Fix bug in COW throttling mechanism causing deadlocks
> 
>  drivers/md/dm-snap.c | 99 +++++++++++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 90 insertions(+), 9 deletions(-)

Hi

I think a better solution would be to drop all locks while waiting for 
some kcopyd job. I'll send patches for that.

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
