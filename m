Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 960C71BC94E
	for <lists+dm-devel@lfdr.de>; Tue, 28 Apr 2020 20:41:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588099287;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yJdlwrk8Q2do5YRLrZtBtHbiurNAs84PHjxxfQml2Go=;
	b=eEdM3RvIDteH4GO3NusRMPv/A6hr0bqlE5E1ZhAIjmdFi6H/NU6eCDPE1lxgHL7gyIl0YP
	sd47n0+qrhEUr4Kc3r9h96Xd7iy9DA3baGVM8KkIo6rePfvPRRTw1TWQQ9iJt92GAKC5Iz
	iUPWqoZuvykvQoGhazDJYnUvLgRcNpU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-eChTymowMj-A0Lu4RoTXtw-1; Tue, 28 Apr 2020 14:41:24 -0400
X-MC-Unique: eChTymowMj-A0Lu4RoTXtw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D20580B719;
	Tue, 28 Apr 2020 18:41:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F146282C9;
	Tue, 28 Apr 2020 18:41:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C6EAC1809542;
	Tue, 28 Apr 2020 18:41:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03SIeqX7030179 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 28 Apr 2020 14:40:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1A21927CDD; Tue, 28 Apr 2020 18:40:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D80941C950;
	Tue, 28 Apr 2020 18:40:48 +0000 (UTC)
Date: Tue, 28 Apr 2020 14:40:47 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200428184047.GB17609@redhat.com>
References: <20200425075336.721021-1-hch@lst.de>
	<20200425075336.721021-4-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200425075336.721021-4-hch@lst.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, linux-bcache@vger.kernel.org
Subject: Re: [dm-devel] [PATCH 3/3] block: bypass ->make_request_fn for
	blk-mq drivers
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sat, Apr 25 2020 at  3:53am -0400,
Christoph Hellwig <hch@lst.de> wrote:

> Call blk_mq_make_request when no ->make_request_fn is set.  This is
> safe now that blk_alloc_queue always sets up the pointer for make_request
> based drivers.  This avoids an indirect call in the blk-mq driver I/O
> fast path, which is rather expensive due to spectre mitigations.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Makes me cringe thinking about all the indirect calls sprinkled
throughout DM...

Acked-by: Mike Snitzer <snitzer@redhat.com>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

