Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 60E0E3061D2
	for <lists+dm-devel@lfdr.de>; Wed, 27 Jan 2021 18:21:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611768079;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YDxuUx1I83OaAVbdIbqRqa6b/4MjbGeRGTFRFol9/iY=;
	b=gQNrP5XY/lzxcoR/0gm4631oziDbhRVpTGaNNCtfeuexWXQAWaZPQZWIq5frQVX6lmZZax
	37EBPj/zlN8TiuD3vf/W4uRk/riAMx1ZHCvJQsnUiHAcE0jFR/TWPtXoIhAJ+MYzUpi8kJ
	TkZwmzsFAjvkROryHSUaJLBRjz7h8LM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-mnGD8iZuNTKq1E16RRB-Cw-1; Wed, 27 Jan 2021 12:21:13 -0500
X-MC-Unique: mnGD8iZuNTKq1E16RRB-Cw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FF6959;
	Wed, 27 Jan 2021 17:21:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C7E095C1C2;
	Wed, 27 Jan 2021 17:21:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EBAE34EA6C;
	Wed, 27 Jan 2021 17:21:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10RHKxZx016208 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 27 Jan 2021 12:20:59 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CF6AD197F9; Wed, 27 Jan 2021 17:20:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B5C351F0;
	Wed, 27 Jan 2021 17:20:56 +0000 (UTC)
Date: Wed, 27 Jan 2021 12:20:56 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
Message-ID: <20210127172055.GB11530@redhat.com>
References: <20210125121340.70459-1-jefflexu@linux.alibaba.com>
	<20210125121340.70459-3-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20210125121340.70459-3-jefflexu@linux.alibaba.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, joseph.qi@linux.alibaba.com,
	dm-devel@redhat.com, io-uring@vger.kernel.org
Subject: Re: [dm-devel] [PATCH v2 2/6] block: add queue_to_disk() to get
 gendisk from request_queue
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 25 2021 at  7:13am -0500,
Jeffle Xu <jefflexu@linux.alibaba.com> wrote:

> Sometimes we need to get the corresponding gendisk from request_queue.
> 
> It is preferred that block drivers store private data in
> gendisk->private_data rather than request_queue->queuedata, e.g. see:
> commit c4a59c4e5db3 ("dm: stop using ->queuedata").
> 
> So if only request_queue is given, we need to get its corresponding
> gendisk to get the private data stored in that gendisk.
> 
> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
> Review-by: Mike Snitzer <snitzer@redhat.com>

^typo

Reviewed-by: Mike Snitzer <snitzer@redhat.com>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

