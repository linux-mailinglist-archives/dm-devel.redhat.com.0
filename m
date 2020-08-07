Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8A5C723F0DB
	for <lists+dm-devel@lfdr.de>; Fri,  7 Aug 2020 18:21:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596817260;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NMm6FEEVOYxFecegWEPqmrBtIOzLjCpe8yvPCav8ahA=;
	b=GE6Q0IcsFh1EnDAUcJLmW6l25MIx95lH1Lmc4rZVHmJb3tt5XeCvtX2bSZJmjxaVvXbPpN
	jJuNPsL0CQloqbTImRxB2waIcPxuA7KuBZBpixDsGjLZE2RDuJ82z8uKsTBlnWbKtHBQaK
	ZpLNxymdIp9JIQwVFhSwNX0lRSxiQDw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-60B63iHpOh6aXuh9vTvSsQ-1; Fri, 07 Aug 2020 12:20:57 -0400
X-MC-Unique: 60B63iHpOh6aXuh9vTvSsQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39E6D80046C;
	Fri,  7 Aug 2020 16:20:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E612060BE2;
	Fri,  7 Aug 2020 16:20:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D494CA5526;
	Fri,  7 Aug 2020 16:20:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 077GKU40003615 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 7 Aug 2020 12:20:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B1D6F100238C; Fri,  7 Aug 2020 16:20:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C9D321002382;
	Fri,  7 Aug 2020 16:20:21 +0000 (UTC)
Date: Fri, 7 Aug 2020 12:20:21 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20200807162021.GA1065@redhat.com>
References: <20200807160327.GA977@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200807160327.GA977@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: JeongHyeon Lee <jhs2.lee@samsung.com>,
	Damien Le Moal <damien.lemoal@wdc.com>, John Dorminy <jdorminy@redhat.com>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	yangerkun <yangerkun@huawei.com>, Ming Lei <ming.lei@redhat.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Mikulas Patocka <mpatocka@redhat.com>,
	Ignat Korchagin <ignat@cloudflare.com>, Alasdair G Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [git pull] device mapper changes for 5.9
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

On Fri, Aug 07 2020 at 12:03pm -0400,
Mike Snitzer <snitzer@redhat.com> wrote:

> Hi Linus,
> 
> The following changes since commit 11ba468877bb23f28956a35e896356252d63c983:
> 
>   Linux 5.8-rc5 (2020-07-12 16:34:50 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git tags/for-5.9/dm-changes
> 
> for you to fetch changes up to a9cb9f4148ef6bb8fabbdaa85c42b2171fbd5a0d:
> 
>   dm: don't call report zones for more than the user requested (2020-08-04 16:31:12 -0400)
> 
> Please pull, thanks!
> Mike
> 
> ----------------------------------------------------------------
> - DM multipath locking fixes around m->flags tests and improvements to
>   bio-based code so that it follows patterns established by
>   request-based code.
> 
> - Request-based DM core improvement to eliminate unnecessary call to
>   blk_mq_queue_stopped().
> 
> - Add "panic_on_corruption" error handling mode to DM verity target.
> 
> - DM bufio fix to to perform buffer cleanup from a workqueue rather
>   than wait for IO in reclaim context from shrinker.
> 
> - DM crypt improvement to optionally avoid async processing via
>   workqueues for reads and/or writes -- via "no_read_workqueue" and
>   "no_write_workqueue" features.  This more direct IO processing
>   improves latency and throughput with faster storage.  Avoiding
>   workqueue IO submission for writes (DM_CRYPT_NO_WRITE_WORKQUEUE) is
>   a requirement for adding zoned block device support to DM crypt.

I forgot to note that you'll get a trivial merge conflict in dm-crypt.c
due to commit ed00aabd5eb9f (" block: rename generic_make_request to
submit_bio_noacct").

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

