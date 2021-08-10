Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1E5D03E7BBC
	for <lists+dm-devel@lfdr.de>; Tue, 10 Aug 2021 17:08:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1628608117;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=H4QLWsriFNKSAl8kyvw15NMRUma0cgaNXpo9eTWdtBw=;
	b=C903W1NBsrhNPh1Ewx+iLLEg1OTHuJ99ieWHLfF860YCX49DZyFSx5GrKwg6YyPBZCo8YI
	JWyfdv0iM4SwHw71PtRoi1G15qK7+ljRttGejL0J6p4Qa/nhrj/rXtXpCAgzImilMDoFS3
	RU5PvtyTxmJU80MYHtbp3NOcWdeA8g8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-_ECa6B8pMU6WU_X-igSGlw-1; Tue, 10 Aug 2021 11:08:35 -0400
X-MC-Unique: _ECa6B8pMU6WU_X-igSGlw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C4988799F0;
	Tue, 10 Aug 2021 15:08:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E77E4136F5;
	Tue, 10 Aug 2021 15:08:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0A3C5181A2A6;
	Tue, 10 Aug 2021 15:08:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17AF5QTk006396 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 10 Aug 2021 11:05:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 273C11A26A; Tue, 10 Aug 2021 15:05:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from agk-cloud1.hosts.prod.upshift.rdu2.redhat.com
	(agk-cloud1.hosts.prod.upshift.rdu2.redhat.com [10.0.13.154])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B0AE027CA4;
	Tue, 10 Aug 2021 15:05:11 +0000 (UTC)
Received: by agk-cloud1.hosts.prod.upshift.rdu2.redhat.com (Postfix,
	from userid 3883)
	id 9D0E541FBD38; Tue, 10 Aug 2021 16:05:12 +0100 (BST)
Date: Tue, 10 Aug 2021 16:05:12 +0100
From: Alasdair G Kergon <agk@redhat.com>
To: Peter Rajnoha <prajnoha@redhat.com>
Message-ID: <20210810150512.GA102700@agk-cloud1.hosts.prod.upshift.rdu2.redhat.com>
Mail-Followup-To: Peter Rajnoha <prajnoha@redhat.com>,
	Alasdair G Kergon <agk@redhat.com>, Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@redhat.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com
References: <20210804094147.459763-8-hch@lst.de>
	<20210809233143.GA101480@agk-cloud1.hosts.prod.upshift.rdu2.redhat.com>
	<20210810131227.ofgfi62agal64nqd@alatyr-rpi.brq.redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210810131227.ofgfi62agal64nqd@alatyr-rpi.brq.redhat.com>
Organization: Red Hat UK Ltd. Registered in England and Wales, number
	03798903. Registered Office: Amberley Place, 107-111 Peascod Street,
	Windsor, Berkshire, SL4 1TE.
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@redhat.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Christoph Hellwig <hch@lst.de>, Alasdair G Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH 7/8] dm: delay registering the gendisk
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Aug 10, 2021 at 03:12:27PM +0200, Peter Rajnoha wrote:
> (I'm not counting the very corner use case of
> 'dmsetup --addnodeoncreate --verifyudev' which now ends up with a dev node
> in /dev that logically returns -ENODEV when accessed instead of zero-sized
> device as it was before.)
 
Yes.  That facility was provided to assist people having to work with
old or incorrect code or misconfigured systems and breaking it in this
way shouldn't be a concern.  (We could possibly still patch it up to
continue to do the best thing after the patchset goes in.)

Alasdair

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

