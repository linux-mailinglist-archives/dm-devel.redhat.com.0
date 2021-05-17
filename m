Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7330F382525
	for <lists+dm-devel@lfdr.de>; Mon, 17 May 2021 09:14:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621235695;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nTv03BA+XBl0/8YhghINdSn363J06HmgHJRTiFD4JR8=;
	b=cQfNZJ7jRoJ3piRRhe07v50tvmJt/qBpgas9pt5nk6BUp0ZRrgz0LIkPxCdASDwtVjDDU3
	zvkKdYTaeS4e2GwhEtDgk2UlF4GabGE0qJlsWx72CCzR40f0rUpPm4AA3cT2gHSP3XcMUa
	vLi1uGHtfP16oX1W4bZ1oNJ8IZN6LU4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-2YqkUBdWM26OSsbnPr-MUg-1; Mon, 17 May 2021 03:14:52 -0400
X-MC-Unique: 2YqkUBdWM26OSsbnPr-MUg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 768B3803621;
	Mon, 17 May 2021 07:14:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 520B862460;
	Mon, 17 May 2021 07:14:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7404555347;
	Mon, 17 May 2021 07:14:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14H7DmAI018845 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 May 2021 03:13:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 38E81BA63; Mon, 17 May 2021 07:13:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-13-194.pek2.redhat.com [10.72.13.194])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C917970591;
	Mon, 17 May 2021 07:13:34 +0000 (UTC)
Date: Mon, 17 May 2021 15:13:29 +0800
From: Ming Lei <ming.lei@redhat.com>
To: JeffleXu <jefflexu@linux.alibaba.com>
Message-ID: <YKIXmRTmLlAgO3AK@T590>
References: <20210422122038.2192933-1-ming.lei@redhat.com>
	<630a63ef-f9e0-6ad6-d6be-ec7a46e5ec45@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <630a63ef-f9e0-6ad6-d6be-ec7a46e5ec45@linux.alibaba.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] [PATCH V6 00/12] block: support bio based io polling
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi JeffleXu,

On Mon, May 17, 2021 at 02:16:39PM +0800, JeffleXu wrote:
> Hi all,
> 
> What's the latest progress of this bio-based polling feature?
> 
> I've noticed that hch has also sent a patch set on this [1]. But as far
> as I know, hch's patch set only refactors the interface of polling in
> the block layer. It indeed helps bio-based polling for some kind of
> bio-based driver, but for DM/MD where one bio could be mapped to several
> split bios, more work is obviously needed, just like Lei Ming's
> io_context related code in this patch set.
> 
> hch may have better idea, after all [1] is just a preparation patch set.

Yeah, we have to rebase V6 against Christoph's patchset anyway.

Looks there is at least two approaches left for us:

1) keep the generic approach in V6, just rebase after Christoph's patch
is finalized

2) support io polling simply in bio driver, since bio->bi_cookie is
assigned for underlying bio, and it shouldn't be very difficult to
support that in DM/MD. I have been thinking of it a while, but not
coding it yet. BTW, all underlying bios can be linked to DM
bio->bi_next, and we can add one new callback of .io_poll for polling
DM/MD's bio.


Thanks,
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

