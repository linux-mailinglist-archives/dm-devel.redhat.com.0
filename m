Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id D3BFC3E5052
	for <lists+dm-devel@lfdr.de>; Tue, 10 Aug 2021 02:17:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1628554664;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rNeZBN0K45wwS185rN2/6CuMO5t5b0pkBPMcjx9o5Dc=;
	b=YYPYY6dU6+N2/kf/3xflJFrEbehdU1v4j6KELJiskzzXO7PhG3M5Eg4RYvtpmIiPFfM4lA
	FUkTHEp8lroqGwLhHk9Smq2KN7FJ3Jw6UsBba80UcdZoj0AV6y1Dmjb8YxnyG3zDCIjuIj
	JEkaFDzpvxI2iOlhPFKYhcHx/BuV5w8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-DuG4H7VFNW2NuWbNo8-iQg-1; Mon, 09 Aug 2021 20:17:42 -0400
X-MC-Unique: DuG4H7VFNW2NuWbNo8-iQg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53646100CA88;
	Tue, 10 Aug 2021 00:17:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 74CBD60C81;
	Tue, 10 Aug 2021 00:17:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1876A180BAB1;
	Tue, 10 Aug 2021 00:17:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17A0HJBY002713 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 9 Aug 2021 20:17:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2A3EC5D6A8; Tue, 10 Aug 2021 00:17:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from agk-cloud1.hosts.prod.upshift.rdu2.redhat.com
	(agk-cloud1.hosts.prod.upshift.rdu2.redhat.com [10.0.13.154])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C307366FFF;
	Tue, 10 Aug 2021 00:17:08 +0000 (UTC)
Received: by agk-cloud1.hosts.prod.upshift.rdu2.redhat.com (Postfix,
	from userid 3883)
	id C86B642C4190; Tue, 10 Aug 2021 01:17:09 +0100 (BST)
Date: Tue, 10 Aug 2021 01:17:09 +0100
From: Alasdair G Kergon <agk@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20210810001709.GA101579@agk-cloud1.hosts.prod.upshift.rdu2.redhat.com>
Mail-Followup-To: Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@redhat.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	prajnoha@redhat.com
References: <20210804094147.459763-8-hch@lst.de>
	<20210809233143.GA101480@agk-cloud1.hosts.prod.upshift.rdu2.redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210809233143.GA101480@agk-cloud1.hosts.prod.upshift.rdu2.redhat.com>
Organization: Red Hat UK Ltd. Registered in England and Wales, number
	03798903. Registered Office: Amberley Place, 107-111 Peascod Street,
	Windsor, Berkshire, SL4 1TE.
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, prajnoha@redhat.com, Mike Snitzer <snitzer@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Aug 10, 2021 at 12:31:43AM +0100, Alasdair G Kergon wrote:
> When loading tables, our tools also always refer to devices using
> the 'major:minor' format, which isn't affected, rather than using
                            ^^^^^^^^^^^^^^^^^^^^
Wrong - that is also affected.

So there is a new general constraint that a table must be loaded into a
device before another device's table can reference that device.  (The
stacked device handling in lvm2 as supported by libdevmapper should
always be doing this.)

(The original implementation had to be a bit loose to accommodate
multipath device paths that were essentially placeholders at the point
they got set up.)

Alasdair

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

