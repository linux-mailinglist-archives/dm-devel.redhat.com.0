Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8AEE23E506A
	for <lists+dm-devel@lfdr.de>; Tue, 10 Aug 2021 02:41:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1628556100;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LRYIaCyKW3F3HWRTAHBdG1aIeXOyXDLuoUR4J+daKwo=;
	b=N3nug5MSgU8FG5mQnngH3+nwspbf17W2gQ5Q/IY/+cBn5ecGcLhPTP2wWea5OsJ3d3jlW6
	IBizKvoEDaUUu57EOZJzlWdeEBWyU91xOHLYPj/O4X0oJlVU9VNxGl86nF7ofYPABaBIUc
	t49xS2EFyNOL0Od3R0ryAGBkfagDVu0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-MzN1vuduNr6JAK3wnoTR3g-1; Mon, 09 Aug 2021 20:41:39 -0400
X-MC-Unique: MzN1vuduNr6JAK3wnoTR3g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 272F7190B2A2;
	Tue, 10 Aug 2021 00:41:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 250E75D6B1;
	Tue, 10 Aug 2021 00:41:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9166C4BB7C;
	Tue, 10 Aug 2021 00:41:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17A0aI6v006092 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 9 Aug 2021 20:36:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C724D19D9D; Tue, 10 Aug 2021 00:36:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from agk-cloud1.hosts.prod.upshift.rdu2.redhat.com
	(agk-cloud1.hosts.prod.upshift.rdu2.redhat.com [10.0.13.154])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3E5F819D9B;
	Tue, 10 Aug 2021 00:36:08 +0000 (UTC)
Received: by agk-cloud1.hosts.prod.upshift.rdu2.redhat.com (Postfix,
	from userid 3883)
	id BD08742C4190; Tue, 10 Aug 2021 01:36:08 +0100 (BST)
Date: Tue, 10 Aug 2021 01:36:08 +0100
From: Alasdair G Kergon <agk@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20210810003608.GB101579@agk-cloud1.hosts.prod.upshift.rdu2.redhat.com>
Mail-Followup-To: Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@redhat.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com
References: <20210804094147.459763-1-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20210804094147.459763-1-hch@lst.de>
Organization: Red Hat UK Ltd. Registered in England and Wales, number
	03798903. Registered Office: Amberley Place, 107-111 Peascod Street,
	Windsor, Berkshire, SL4 1TE.
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] use regular gendisk registration in device mapper v2
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

On Wed, Aug 04, 2021 at 11:41:39AM +0200, Christoph Hellwig wrote:
> allows device mapper to use the normal scheme
> of calling add_disk when it is ready to accept I/O.

For clarity, even after this patchset, the device is not ready to accept
I/O when add_disk is called.  It is ready to accept I/O later if a 
'resume' happens triggering the 'change' uevent that userspace reacts
to by setting up the /dev entries for it.
 
Alasdair

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

