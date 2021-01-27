Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8B0AC3061F2
	for <lists+dm-devel@lfdr.de>; Wed, 27 Jan 2021 18:27:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611768459;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=X4WrTukjIDqKlYMS52neDCnC5lfLd8zUSBSo9zn1/zE=;
	b=Ab5uS0NuoQGvqSUhHHH2/L7tNe8aCnX98BXWBIAkAAaA7tgSRLZVidfsXuUB0OD3IPKliW
	T8brJ4OHPT0CdSQg8FKJdjPJUu3cpWVTtNBgFhrWHTynTRZ2ti0XfKLRLO2uWDUzgBzC2c
	1UDD7/QCf/s3y/u4/oXz2BWzf1xIU3A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-ognbHlH9OMqvePXbfkMwJw-1; Wed, 27 Jan 2021 12:27:36 -0500
X-MC-Unique: ognbHlH9OMqvePXbfkMwJw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A3E41005504;
	Wed, 27 Jan 2021 17:27:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 86616614F0;
	Wed, 27 Jan 2021 17:27:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 714CB4BB7B;
	Wed, 27 Jan 2021 17:27:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10RHDP7Y015256 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 27 Jan 2021 12:13:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0B7C660854; Wed, 27 Jan 2021 17:13:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BDBB660873;
	Wed, 27 Jan 2021 17:13:21 +0000 (UTC)
Date: Wed, 27 Jan 2021 12:13:21 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
Message-ID: <20210127171320.GA11535@redhat.com>
References: <20210125121340.70459-1-jefflexu@linux.alibaba.com>
	<20210125121340.70459-6-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20210125121340.70459-6-jefflexu@linux.alibaba.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, joseph.qi@linux.alibaba.com,
	dm-devel@redhat.com, io-uring@vger.kernel.org
Subject: Re: [dm-devel] [PATCH v2 5/6] block: add QUEUE_FLAG_POLL_CAP flag
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 25 2021 at  7:13am -0500,
Jeffle Xu <jefflexu@linux.alibaba.com> wrote:

> Introduce QUEUE_FLAG_POLL_CAP flag representing if the request queue
> capable of polling or not.
> 
> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>

Why are you adding QUEUE_FLAG_POLL_CAP?  Doesn't seem as though DM or
anything else actually needs it.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

