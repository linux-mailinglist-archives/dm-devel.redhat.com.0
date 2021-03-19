Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 63F7D342393
	for <lists+dm-devel@lfdr.de>; Fri, 19 Mar 2021 18:44:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616175889;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Y6OlTgHyR02bC1BePYguE9uGjHga8nMjgi8aTFYsHqM=;
	b=UvESLmwAlNvI6I+f+vRvjXY7LbB//Xf75mA1ZVJSbisE+xDlHMxZT/FUYrvkvYC7AmXhgV
	8yaUpPmf71GAUxIhBw3ahgzI1uMxO8jemaaDpB94M1MNC6T/9ZOpNZoOeDKGz8YjtValUr
	Yk4xHxXvh/n4j01JVHWzYaXtKzmBaeU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-kzuxW2znP-6rN7eRlVHpOA-1; Fri, 19 Mar 2021 13:44:47 -0400
X-MC-Unique: kzuxW2znP-6rN7eRlVHpOA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC2911083E80;
	Fri, 19 Mar 2021 17:44:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 28099708E2;
	Fri, 19 Mar 2021 17:44:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 00D2C4BB7C;
	Fri, 19 Mar 2021 17:44:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12JHiTaY020256 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Mar 2021 13:44:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D0FD419D9D; Fri, 19 Mar 2021 17:44:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 766C019C79;
	Fri, 19 Mar 2021 17:44:23 +0000 (UTC)
Date: Fri, 19 Mar 2021 13:44:22 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Ming Lei <ming.lei@redhat.com>
Message-ID: <20210319174422.GD9938@redhat.com>
References: <20210318164827.1481133-1-ming.lei@redhat.com>
	<20210318164827.1481133-7-ming.lei@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210318164827.1481133-7-ming.lei@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Jeffle Xu <jefflexu@linux.alibaba.com>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [RFC PATCH V2 06/13] block: add new field into
	'struct bvec_iter'
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

On Thu, Mar 18 2021 at 12:48pm -0400,
Ming Lei <ming.lei@redhat.com> wrote:

> There is a hole at the end of 'struct bvec_iter', so put a new field
> here and we can save cookie returned from submit_bio() here for
> supporting bio based polling.
> 
> This way can avoid to extend bio unnecessarily.
> 
> Signed-off-by: Ming Lei <ming.lei@redhat.com>
> ---
>  include/linux/bvec.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/include/linux/bvec.h b/include/linux/bvec.h
> index ff832e698efb..61c0f55f7165 100644
> --- a/include/linux/bvec.h
> +++ b/include/linux/bvec.h
> @@ -43,6 +43,15 @@ struct bvec_iter {
>  
>  	unsigned int            bi_bvec_done;	/* number of bytes completed in
>  						   current bvec */
> +
> +	/*
> +	 * There is a hole at the end of bvec_iter, define one filed to

s/filed/field/

> +	 * hold something which isn't relate with 'bvec_iter', so that we can

s/relate/related/
or
s/isn't relate with/doesn't relate to/

> +	 * avoid to extend bio. So far this new field is used for bio based

s/to extend/extending/

> +	 * pooling, we will store returning value of underlying queue's

s/pooling/polling/

> +	 * submit_bio() here.
> +	 */
> +	unsigned int		bi_private_data;
>  };
>  
>  struct bvec_iter_all {
> -- 
> 2.29.2
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

