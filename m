Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2E2BA27653F
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 02:39:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600907985;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lXaLew6nMX5Y5CgaFLwYaB0UfGo3wH40JsH+FpfTtyw=;
	b=USld9Qdnwrcl8xWAbwSWgHq9egBYVOHZrQVGsx+Mw3LUl/h+6hDl736YtEsi+4abz+5I6l
	Ro5KL79ryDgJmB0+ldEnLMdikX0jEu+Eq+2Iw8k5OZ1uaPJej4IVU1g38rpInjJCTxvya/
	WmjlJUK/RXi/pBQi38eJLKTFvUbrvSQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-ztzs-DrqOtOqaKYM3Dkdiw-1; Wed, 23 Sep 2020 20:39:42 -0400
X-MC-Unique: ztzs-DrqOtOqaKYM3Dkdiw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3171186DD39;
	Thu, 24 Sep 2020 00:39:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FB9F5D990;
	Thu, 24 Sep 2020 00:39:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 05F75183D040;
	Thu, 24 Sep 2020 00:39:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08O0d7ic029997 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 23 Sep 2020 20:39:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9F45A55778; Thu, 24 Sep 2020 00:39:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E6C45576A;
	Thu, 24 Sep 2020 00:39:03 +0000 (UTC)
Date: Wed, 23 Sep 2020 20:39:02 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Message-ID: <20200924003902.GA10500@redhat.com>
References: <20200625113122.7540-1-willy@infradead.org>
	<20200625113122.7540-7-willy@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200625113122.7540-7-willy@infradead.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org,
	linux-xfs@vger.kernel.org, linux-mm@kvack.org,
	dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [dm-devel] [PATCH 6/6] mm: Add memalloc_nowait
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jun 25 2020 at  7:31am -0400,
Matthew Wilcox (Oracle) <willy@infradead.org> wrote:

> Similar to memalloc_noio() and memalloc_nofs(), memalloc_nowait()
> guarantees we will not sleep to reclaim memory.  Use it to simplify
> dm-bufio's allocations.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  drivers/md/dm-bufio.c    | 30 ++++++++----------------------
>  include/linux/sched.h    |  1 +
>  include/linux/sched/mm.h | 12 ++++++++----
>  3 files changed, 17 insertions(+), 26 deletions(-)


Hi,

Curious on the state of this patchset?  Not seeing it in next-20200923

The dm-bufio cleanup looks desirable.

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

