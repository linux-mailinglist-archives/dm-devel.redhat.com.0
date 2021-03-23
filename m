Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E6C39345CCB
	for <lists+dm-devel@lfdr.de>; Tue, 23 Mar 2021 12:28:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616498919;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Z+lKovKQ3sm3kq8gEVGZgEviqOonr1Vjb/KX/E7/CN8=;
	b=AdBh9Ka7QQ/Q3LdSJz2lKLIqdh8fTzgdfr7IACIK67We0x6iy9IRrdvDIt4xdSKMD6gln+
	cxSHD9N12XrgnzRAizX84Sv8WRipT3cyWowHQ3FNdiDIifujUvM+/aWuqnpPw2zNFCh+7P
	BD1Mn0yHzDqBG+ddkpMdjwbb1Q4Rvi0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-qYxVvnR1PzmvnVPfRf9_rg-1; Tue, 23 Mar 2021 07:28:36 -0400
X-MC-Unique: qYxVvnR1PzmvnVPfRf9_rg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3AD6B835B8F;
	Tue, 23 Mar 2021 11:28:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ACB4070951;
	Tue, 23 Mar 2021 11:28:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D647A1809C82;
	Tue, 23 Mar 2021 11:28:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12NBQpJE023884 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 23 Mar 2021 07:26:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D9F2E6A8E5; Tue, 23 Mar 2021 11:26:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-13-171.pek2.redhat.com [10.72.13.171])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8AC8563622;
	Tue, 23 Mar 2021 11:26:38 +0000 (UTC)
Date: Tue, 23 Mar 2021 19:26:33 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <YFnQaXoyOhSMlAYY@T590>
References: <20210318164827.1481133-1-ming.lei@redhat.com>
	<20210318164827.1481133-6-ming.lei@redhat.com>
	<20210319173813.GC9938@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210319173813.GC9938@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Jeffle Xu <jefflexu@linux.alibaba.com>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [RFC PATCH V2 05/13] block: add req flag of REQ_TAG
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 19, 2021 at 01:38:13PM -0400, Mike Snitzer wrote:
> On Thu, Mar 18 2021 at 12:48pm -0400,
> Ming Lei <ming.lei@redhat.com> wrote:
> 
> > Add one req flag REQ_TAG which will be used in the following patch for
> > supporting bio based IO polling.
> 
> "REQ_TAG" is so generic yet is used in such a specific way (to mark an
> FS bio as having polling context)
> 
> I don't have a great suggestion for a better name, just seems "REQ_TAG"
> is lacking... (especially given the potential for confusion due to
> blk-mq's notion of "tag").
> 
> REQ_FS? REQ_FS_CTX? REQ_POLL? REQ_POLL_CTX? REQ_NAMING_IS_HARD :)
> 

Maybe REQ_POLL_CTX is better, it is just for marking bios:

1) which need to be polled in this context

2) which can be polled in this context

-- 
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

