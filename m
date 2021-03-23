Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id C115C345CCE
	for <lists+dm-devel@lfdr.de>; Tue, 23 Mar 2021 12:29:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616498992;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=j20bSJeCuRY06xbZL8AH0biSHusV1VJXu8D/JwRFzVQ=;
	b=DqeLz1FrmcHjiFPCdO572xrXX8HXGjN2R7JoGSBLDrZHf2KV2CvCEv+VtE5h+HR9/Oo4TJ
	Fs/hS0wH0tOB9ztId6LtXA7Fz0cpM8JGJr0MnCL7qWt3hW/yCuajrauyo5e70itLY1tNy3
	k2Vhj8jOPFF7z0kTOzar/r5t/xESbGo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-DM7XSnkHOROXqcTvo8T8qA-1; Tue, 23 Mar 2021 07:29:50 -0400
X-MC-Unique: DM7XSnkHOROXqcTvo8T8qA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B18881425A;
	Tue, 23 Mar 2021 11:29:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E5ADB5886A;
	Tue, 23 Mar 2021 11:29:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 06ADF4BB7C;
	Tue, 23 Mar 2021 11:29:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12NBTZ18023992 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 23 Mar 2021 07:29:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 70EAF60C0F; Tue, 23 Mar 2021 11:29:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-13-171.pek2.redhat.com [10.72.13.171])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 19B9A5FCBE;
	Tue, 23 Mar 2021 11:29:23 +0000 (UTC)
Date: Tue, 23 Mar 2021 19:29:18 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <YFnRDm5XZaQAO83Q@T590>
References: <20210318164827.1481133-1-ming.lei@redhat.com>
	<20210318164827.1481133-7-ming.lei@redhat.com>
	<20210319174422.GD9938@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210319174422.GD9938@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 19, 2021 at 01:44:22PM -0400, Mike Snitzer wrote:
> On Thu, Mar 18 2021 at 12:48pm -0400,
> Ming Lei <ming.lei@redhat.com> wrote:
> 
> > There is a hole at the end of 'struct bvec_iter', so put a new field
> > here and we can save cookie returned from submit_bio() here for
> > supporting bio based polling.
> > 
> > This way can avoid to extend bio unnecessarily.
> > 
> > Signed-off-by: Ming Lei <ming.lei@redhat.com>
> > ---
> >  include/linux/bvec.h | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/include/linux/bvec.h b/include/linux/bvec.h
> > index ff832e698efb..61c0f55f7165 100644
> > --- a/include/linux/bvec.h
> > +++ b/include/linux/bvec.h
> > @@ -43,6 +43,15 @@ struct bvec_iter {
> >  
> >  	unsigned int            bi_bvec_done;	/* number of bytes completed in
> >  						   current bvec */
> > +
> > +	/*
> > +	 * There is a hole at the end of bvec_iter, define one filed to
> 
> s/filed/field/
> 
> > +	 * hold something which isn't relate with 'bvec_iter', so that we can
> 
> s/relate/related/
> or
> s/isn't relate with/doesn't relate to/
> 
> > +	 * avoid to extend bio. So far this new field is used for bio based
> 
> s/to extend/extending/
> 
> > +	 * pooling, we will store returning value of underlying queue's
> 
> s/pooling/polling/
> 

Good catch, will fix all in V3.

-- 
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

