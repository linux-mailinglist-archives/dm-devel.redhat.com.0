Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id DD6FE218AB7
	for <lists+dm-devel@lfdr.de>; Wed,  8 Jul 2020 17:04:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594220696;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=c7Wy1A6QWgo+RF9ls89YslDBTAVKcCfIGzDGKkcfkpQ=;
	b=JkcLHVIXewfArIA6+ubKoCVgoNHhJbgztzo28sAJp33+zmMeZqCywic04xNp3jlYi6k0wy
	Hu0O/FBaCjTCYEr3IrAW9TVdb6BJ/QhX2uaJIhxuFZiNHKqqu5fX+ndc0WaeOMZ8lqsuls
	XZau8waIeFc3ReBJkTuvwCQhFUUQD9w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-H-gXC63RMMeQL6iA4AIqKA-1; Wed, 08 Jul 2020 11:04:54 -0400
X-MC-Unique: H-gXC63RMMeQL6iA4AIqKA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 042A41800D42;
	Wed,  8 Jul 2020 15:04:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 385BE7980A;
	Wed,  8 Jul 2020 15:04:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4EFC41809547;
	Wed,  8 Jul 2020 15:04:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 068F4IbY027230 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 8 Jul 2020 11:04:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 446361001B07; Wed,  8 Jul 2020 15:04:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DC18910013D7;
	Wed,  8 Jul 2020 15:04:14 +0000 (UTC)
Date: Wed, 8 Jul 2020 10:02:54 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200708140254.GA7539@redhat.com>
References: <20200627073159.2447325-1-hch@lst.de>
	<20200627073159.2447325-2-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200627073159.2447325-2-hch@lst.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Dennis Zhou <dennis@kernel.org>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-mm@kvack.org, dm-devel@redhat.com, Li Zefan <lizefan@huawei.com>,
	Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
	cgroups@vger.kernel.org
Subject: Re: [dm-devel] [PATCH 01/14] dm: use bio_uninit instead of
	bio_disassociate_blkg
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sat, Jun 27 2020 at  3:31am -0400,
Christoph Hellwig <hch@lst.de> wrote:

> bio_uninit is the proper API to clean up a BIO that has been allocated
> on stack or inside a structure that doesn't come from the BIO allocator.
> Switch dm to use that instead of bio_disassociate_blkg, which really is
> an implementation detail.  Note that the bio_uninit calls are also moved
> to the two callers of __send_empty_flush, so that they better pair with
> the bio_init calls used to initialize them.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

I've picked this up as a fix for 5.8

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

