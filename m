Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 832332B6AF9
	for <lists+dm-devel@lfdr.de>; Tue, 17 Nov 2020 18:03:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605632601;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ue3zC7T8fmQuCaDXGubGJRGPv3cmkNzMcgCnlGDArDU=;
	b=O12YFMUARcNGs5WkoS5xgZDchb3qGTGY3eT9clcYC5k36xQ0JWa/5lZRiiaORLavyoKoee
	fH4YKGOX3JdHD6/w7u+oYJQMV2TcOGeZOqzBf1j1ApAmm/GttP+PToFBjMw2zemlwI397c
	sKeduOaD6XllcntMZCwE2wvMFepbWWI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-7M_ZxaFGOg-zgFGNfQCkMg-1; Tue, 17 Nov 2020 12:03:09 -0500
X-MC-Unique: 7M_ZxaFGOg-zgFGNfQCkMg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3262F11CC805;
	Tue, 17 Nov 2020 17:02:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A4576FEEB;
	Tue, 17 Nov 2020 17:02:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3AD8D1832FFB;
	Tue, 17 Nov 2020 17:02:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AHGB3N3028114 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 17 Nov 2020 11:11:03 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6B83C10013BD; Tue, 17 Nov 2020 16:11:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 01E091001901;
	Tue, 17 Nov 2020 16:10:59 +0000 (UTC)
Date: Tue, 17 Nov 2020 11:10:59 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20201117161059.GA27209@redhat.com>
References: <20201116212020.1099154-1-hch@lst.de>
	<20201116212020.1099154-6-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20201116212020.1099154-6-hch@lst.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Minchan Kim <minchan@kernel.org>,
	dm-devel@redhat.com, linux-block@vger.kernel.org
Subject: Re: [dm-devel] [PATCH 5/6] dm: simplify flush_bio initialization in
 __send_empty_flush
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

On Mon, Nov 16 2020 at  4:20pm -0500,
Christoph Hellwig <hch@lst.de> wrote:

> We don't really need the struct block_device to initialize a bio.  So
> switch from using bio_set_dev to manually setting up bi_disk (bi_partno
> will always be zero and has been cleared by bio_init already).
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Mike Snitzer <snitzer@redhat.com>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

