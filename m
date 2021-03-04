Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 71E0B32D07C
	for <lists+dm-devel@lfdr.de>; Thu,  4 Mar 2021 11:14:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614852890;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LfSAU6RTRt9uLMpV4v4QHwzGQUKt9Ws2ofGuuMq2QLk=;
	b=XlmZY6WtuLYrpbfJrpZtfHZGmZ1ZHJKnvP+f4LZMvXppNz2QXfH24Hh3sStwj40uLXYWFZ
	aiAyji9Bjk6wKbg/nKiTIMG8HMIVv4tYcCvdOGgz29zc7ciYmK519CZav2GHhGzCAy6nED
	CwtZvLSW5ySxSkeNwUFujp0rkgXgV10=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-2xVYSMA9OsSi4HvbMQ6zZQ-1; Thu, 04 Mar 2021 05:14:48 -0500
X-MC-Unique: 2xVYSMA9OsSi4HvbMQ6zZQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B001F87504E;
	Thu,  4 Mar 2021 10:14:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C43EF629DA;
	Thu,  4 Mar 2021 10:14:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CFD003CAB;
	Thu,  4 Mar 2021 10:14:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 124AEI6C014058 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 4 Mar 2021 05:14:18 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D502C18AAF; Thu,  4 Mar 2021 10:14:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A700639A73;
	Thu,  4 Mar 2021 10:14:15 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 124AEFOQ008051; Thu, 4 Mar 2021 05:14:15 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 124AEFO1008046; Thu, 4 Mar 2021 05:14:15 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Thu, 4 Mar 2021 05:14:15 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <8424036e-fba9-227e-4173-8f6d05562ee3@kernel.dk>
Message-ID: <alpine.LRH.2.02.2103040511050.7400@file01.intranet.prod.int.rdu2.redhat.com>
References: <20210302190551.473015400@debian-a64.vm>
	<8424036e-fba9-227e-4173-8f6d05562ee3@kernel.dk>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <msnitzer@redhat.com>, Heinz Mauelshagen <heinzm@redhat.com>,
	caspar@linux.alibaba.com, hch@lst.de,
	linux-block@vger.kernel.org, joseph.qi@linux.alibaba.com,
	dm-devel@redhat.com, JeffleXu <jefflexu@linux.alibaba.com>,
	io-uring@vger.kernel.org
Subject: Re: [dm-devel] [PATCH 1/4] block: introduce a function
 submit_bio_noacct_mq_direct
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Wed, 3 Mar 2021, Jens Axboe wrote:

> On 3/2/21 12:05 PM, Mikulas Patocka wrote:
> 
> There seems to be something wrong with how this series is being sent
> out. I have 1/4 and 3/4, but both are just attachments.
> 
> -- 
> Jens Axboe

I used quilt to send it. I don't know what's wrong with it - if you look 
at archives at 
https://listman.redhat.com/archives/dm-devel/2021-March/thread.html , it 
seems normal.

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

